#!/bin/bash
#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

INITIAL_COPYRIGHT_YEAR=2018

# Required!
DEVICE=sirius
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

BLISS_ROOT="${MY_DIR}/../../.."

HELPER="${BLISS_ROOT}/vendor/bliss/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper for sirius
setup_vendor "${DEVICE}" "${VENDOR}" "${BLISS_ROOT}" false

# Copyright headers and guards
write_headers

# The standard device blobs
write_makefiles "${MY_DIR}/../${DEVICE}/proprietary-files.txt" true

# Finish
write_footers
