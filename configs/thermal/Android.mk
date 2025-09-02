#
# Copyright (C) 2024 OmniROM Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# Thermal info configuration for Android 15
include $(CLEAR_VARS)
LOCAL_MODULE := thermal_info_config.json
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := thermal_info_config.json
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

# Thermald devices configuration
include $(CLEAR_VARS)
LOCAL_MODULE := thermald-devices.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := thermald-devices.conf  
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)