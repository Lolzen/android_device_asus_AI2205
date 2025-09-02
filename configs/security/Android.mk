#
# Copyright (C) 2024 OmniROM Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# Security configuration
include $(CLEAR_VARS)
LOCAL_MODULE := sec_config
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := sec_config
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/security
include $(BUILD_PREBUILT)

# KeyMint policy configuration
include $(CLEAR_VARS)
LOCAL_MODULE := keymint_policy.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := keymint_policy.xml
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/security
include $(BUILD_PREBUILT)