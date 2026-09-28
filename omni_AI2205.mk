#
# Copyright (C) 2024-2025 The OmniROM Project
#
# SPDX-License-Identifier: Apache-2.0
#

# 64-bit only zygote, 32-bit libraries for vendor blobs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# APN list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Common Qualcomm definitions
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# Common open source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Must be set before inheriting the OmniROM configuration
TARGET_BOOTANIMATION_SIZE := 1080p

# OmniROM configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Device configuration
$(call inherit-product, device/asus/AI2205/device.mk)

PRODUCT_DEVICE := AI2205
PRODUCT_NAME := omni_AI2205
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_AI2205
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_SYSTEM_DEVICE := ASUS_AI2205
PRODUCT_SYSTEM_NAME := WW_AI2205

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)
