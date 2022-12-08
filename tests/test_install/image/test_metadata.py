# test_image_metadata: test loading and validation of the image metadata
#
# Copyright (C) 2023 Red Hat, Inc.
#
# SPDX-License-Identifier: GPL-2.0-or-later

import pytest
import yaml

import lcitool.install.image as image
import test_utils.utils as test_utils

from pathlib import Path


@pytest.fixture
def valid_metadata():
    filepath = Path(test_utils.test_data_indir(__file__, "install/image"),
                    "valid.metadata")

    with open(filepath) as fd:
        metadata = yaml.safe_load(fd)
    return metadata


def test_metadata_load(assert_equal, valid_metadata):
    filepath = Path(test_utils.test_data_indir(__file__, "install/image"),
                    "valid.metadata")

    # Metadata is a UserDict subclass, hence we need '.data' for the comparison
    actual = image.Metadata().load(filepath).data
    assert_equal(actual, valid_metadata)


@pytest.mark.parametrize(
    "file,exception",
    [
        pytest.param("invalid_yaml.metadata", image.MetadataLoadError,
                     id="invalid_yaml"),
    ]
)
def test_metadata_load_invalid(file, exception):
    filepath = Path(test_utils.test_data_indir(__file__, "install/image"),
                    file)
    with pytest.raises(exception):
        image.Metadata().load(filepath)
