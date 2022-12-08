# inventory - module containing Ansible inventory handling primitives
#
# Copyright (C) 2017-2020 Red Hat, Inc.
#
# SPDX-License-Identifier: GPL-2.0-or-later

import logging

from pathlib import Path

from lcitool import util, LcitoolError

log = logging.getLogger(__name__)


class InventoryError(LcitoolError):
    """Global exception type for the inventory module."""

    def __init__(self, message):
        super().__init__(message, "Inventory")


class Inventory():

    @property
    def ansible_inventory(self):
        if self._ansible_inventory is None:
            self._ansible_inventory = self._get_ansible_inventory()
        return self._ansible_inventory

    @property
    def host_facts(self):
        if self._host_facts is None:
            self._host_facts = self._load_host_facts()
        return self._host_facts

    @property
    def hosts(self):
        return list(self.host_facts.keys())

    def __init__(self, targets):
        self._targets = targets
        self._host_facts = None
        self._ansible_inventory = None

    def _get_ansible_inventory(self):
        from lcitool.ansible_wrapper import AnsibleWrapper, AnsibleWrapperError

        inventory_sources = []
        inventory_path = Path(util.get_config_dir(), "inventory")
        if inventory_path.exists():
            inventory_sources.append(inventory_path)

        log.debug("Querying libvirt for lcitool hosts")
        inventory_sources.append(self._get_libvirt_inventory())

        ansible_runner = AnsibleWrapper()
        ansible_runner.prepare_env(inventories=inventory_sources,
                                   group_vars=self._targets.target_facts)

        log.debug(f"Running ansible-inventory on '{inventory_sources}'")
        try:
            inventory = ansible_runner.get_inventory()
        except AnsibleWrapperError as ex:
            log.debug("Failed to load Ansible inventory")
            raise InventoryError(f"Failed to load Ansible inventory: {ex}")

        return inventory

    def _get_libvirt_inventory(self):
        from lcitool.libvirt_wrapper import LibvirtWrapper

        inventory = {"all": {"children": {}}}
        children = inventory["all"]["children"]

        for host, target in LibvirtWrapper().hosts.items():
            inventory_target = children.setdefault(target, {})
            inventory_hosts = inventory_target.setdefault("hosts", {})
            inventory_hosts.setdefault(host, {})

        return inventory

    def _load_host_facts(self):
        facts = {}
        groups = {}

        def _rec(inventory, group_name):
            for key, subinventory in inventory.items():
                if key == "hosts":
                    for host_name, host_facts in subinventory.items():
                        log.debug(f"Host '{host_name}' is in group '{group_name}'")

                        # Keep track of all the groups we've seen each host
                        # show up in so that we can perform some validation
                        # later
                        if host_name not in groups:
                            groups[host_name] = set()
                        groups[host_name].add(group_name)

                        # ansible-inventory only includes the full list of facts
                        # the first time a host shows up, no matter how deeply
                        # nested that happens to be, and all other times just uses
                        # an empty dictionary as a position marker
                        if host_name not in facts:
                            log.debug(f"Facts for host '{host_name}': {host_facts}")
                            facts[host_name] = host_facts

                # Recurse into the group's children to look for more hosts
                elif key == "children":
                    _rec(subinventory, group_name)
                else:
                    log.debug(f"Group '{key}' is a children of group '{group_name}'")
                    _rec(subinventory, key)

        _rec(self.ansible_inventory["all"], "all")

        targets = set(self._targets.targets)
        for host_name, host_groups in groups.items():
            host_targets = host_groups.intersection(targets)

            # Each host should have shown up in exactly one of the groups
            # that are defined based on the target OS
            if len(host_targets) == 0:
                raise InventoryError(
                    f"Host '{host_name}' not found in any target OS group"
                )
            elif len(host_targets) > 1:
                raise InventoryError(
                    f"Host '{host_name}' found in multiple target OS groups: {host_targets}"
                )

        return facts

    def expand_hosts(self, pattern):
        try:
            return util.expand_pattern(pattern, self.hosts, "hosts")
        except InventoryError as ex:
            raise ex
        except Exception as ex:
            log.debug(f"Failed to load expand '{pattern}'")
            raise InventoryError(f"Failed to expand '{pattern}': {ex}")
