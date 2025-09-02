#
# Copyright (C) 2024 OmniROM Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# Power hint configuration
include $(CLEAR_VARS)
LOCAL_MODULE := powerhint.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := powerhint.xml
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

# Thermal engine configuration
include $(CLEAR_VARS)
LOCAL_MODULE := thermal-engine.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := thermal-engine.conf
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)