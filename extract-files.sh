#!/bin/bash
#
# Copyright (C) 2024 The OmniRom Project
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=AI2205
VENDOR=asus

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

# Try different possible paths for extract_utils.sh
HELPER="${ANDROID_ROOT}/vendor/omni/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
    if [ ! -f "${HELPER}" ]; then
        HELPER="${ANDROID_ROOT}/vendor/lineage/build/tools/extract_utils.sh"
        if [ ! -f "${HELPER}" ]; then
            echo "Unable to find helper script at any known location"
            echo "Please ensure you have the extract_utils.sh in one of these locations:"
            echo "  - vendor/omni/build/tools/"
            echo "  - tools/extract-utils/"
            echo "  - vendor/lineage/build/tools/"
            exit 1
        fi
    fi
fi

source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        vendor/lib64/libqtikeymasterutils.so)
            "${PATCHELF}" --add-needed "libshim_keymaster.so" "${2}"
            ;;
        vendor/lib64/hw/camera.qcom.so)
            sed -i "s/\x73\x74\x5F\x6C\x69\x63\x65\x6E\x73\x65\x2E\x6C\x69\x63/\x63\x61\x6D\x65\x72\x61\x5F\x73\x68\x69\x6D\x2E\x73\x6F/g" "${2}"
            ;;
        vendor/etc/camera/*)
            sed -i "s/\x73\x74\x5F\x6C\x69\x63\x65\x6E\x73\x65\x2E\x6C\x69\x63/\x63\x61\x6D\x65\x72\x61\x5F\x73\x68\x69\x6D\x2E\x73\x6F/g" "${2}"
            ;;
    esac
}

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"