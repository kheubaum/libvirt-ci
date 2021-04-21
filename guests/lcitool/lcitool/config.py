# config.py - module containing configuration file handling primitives
#
# Copyright (C) 2017-2020 Red Hat, Inc.
#
# SPDX-License-Identifier: GPL-2.0-or-later

import copy
import logging
import os
import yaml

from pathlib import Path
from pkg_resources import resource_filename

from lcitool.singleton import Singleton

log = logging.getLogger(__name__)


class ConfigError(Exception):
    """
    Global exception type for the config module.

    Contains a detailed message coming from one of its subclassed exception
    types. On the application level, this is the exception type you should be
    catching instead of the subclassed types.
    """

    def __str__(self):
        return f"Configuration error: {self.message}"


class LoadError(ConfigError):
    """Thrown when the configuration for lcitool could not be loaded."""

    def __init__(self, message):
        message_prefix = "Failed to load config: "
        self.message = message_prefix + message


class ValidationError(ConfigError):
    """Thrown when the configuration for lcitool could not be validated."""

    def __init__(self, message):
        message_prefix = "Failed to validate config: "
        self.message = message_prefix + message


class Config(metaclass=Singleton):

    @property
    def values(self):

        # lazy evaluation: most lcitool actions actually don't need the config
        if self._values is None:
            self._values = self._load_config()
            self._validate()
        return self._values

    def __init__(self):
        self._values = None

    def _load_config(self):
        # Load the template config containing the defaults first, this must
        # always succeed.
        default_config_path = resource_filename(__name__, "etc/config.yml")
        with open(default_config_path, "r") as fp:
            default_config = yaml.safe_load(fp)

        user_config_path = None
        for fname in ["config.yml", "config.yaml"]:
            user_config_path = Path(self._get_config_dir(), fname)

            if user_config_path.exists():
                break
        else:
            return

        user_config_path_str = user_config_path.as_posix()
        log.debug(f"Loading configuration from '{user_config_path_str}'")
        try:
            with open(user_config_path, "r") as fp:
                user_config = yaml.safe_load(fp)
        except Exception as e:
            raise LoadError(f"'{user_config_path.name}': {e}")

        if user_config is None:
            raise ValidationError(f"'{user_config_path.name}' is empty")

        # delete user params we don't recognize
        self._sanitize_values(user_config, default_config)

        # Override the default settings with user config
        values = self._merge_config(default_config, user_config)
        return values

    @staticmethod
    def _get_config_dir():
        try:
            config_dir = Path(os.environ["XDG_CONFIG_HOME"])
        except KeyError:
            config_dir = Path(os.environ["HOME"], ".config")

        return Path(config_dir, "lcitool")

    @staticmethod
    def _remove_unknown_keys(_dict, known_keys):
        keys = list(_dict.keys())

        for k in keys:
            if k not in known_keys:
                log.debug(f"Removing unknown key '{k}' from config")

                del _dict[k]

    @staticmethod
    def _merge_config(default_config, user_config):
        config = copy.deepcopy(default_config)
        for section in default_config.keys():
            if section in user_config:
                log.debug(f"Applying user values: '{user_config[section]}'")

                config[section].update(user_config[section])
        return config

    def _sanitize_values(self, user_config, default_config):
        # remove keys we don't recognize
        self._remove_unknown_keys(user_config, default_config.keys())
        for section in default_config.keys():
            if section in user_config:
                self._remove_unknown_keys(user_config[section],
                                          default_config[section].keys())

    def _validate_section(self, section, mandatory_keys):
        log.debug(f"Validating section='[{section}]' "
                  f"against keys='{mandatory_keys}'")

        # check that the mandatory keys are present and non-empty
        for key in mandatory_keys:
            if self._values.get(section).get(key) is None:
                raise ValidationError(
                    f"Missing or empty value for mandatory key "
                    f"'{section}.{key}'"
                )

        # check that all keys have values assigned and of the right type
        for key in self._values[section].keys():

            # mandatory keys were already checked, so this covers optional keys
            if self._values[section][key] is None:
                raise ValidationError(f"Missing value for '{section}.{key}'")

            if not isinstance(self._values[section][key], (str, int)):
                raise ValidationError(f"Invalid type for key '{section}.{key}'")

    def _validate(self):
        self._validate_section("install", ["root_password"])

        flavor = self._values["install"].get("flavor")
        if flavor not in ["test", "gitlab"]:
            raise ValidationError(
                f"Invalid value '{flavor}' for 'install.flavor'"
            )

        if flavor == "gitlab":
            self._validate_section("gitlab", ["runner_secret"])
