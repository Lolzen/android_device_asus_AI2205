#
# Copyright (C) 2024 OmniROM Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# fstab configuration
include $(CLEAR_VARS)
LOCAL_MODULE := fstab.qcom
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := fstab.qcom
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

# Main init script
include $(CLEAR_VARS)
LOCAL_MODULE := init.qcom.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := init.qcom.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init/hw
include $(BUILD_PREBUILT)

# Target-specific init
include $(CLEAR_VARS)
LOCAL_MODULE := init.target.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := init.target.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init/hw
include $(BUILD_PREBUILT)

# ASUS-specific init  
include $(CLEAR_VARS)
LOCAL_MODULE := init.asus.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := init.asus.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init/hw
include $(BUILD_PREBUILT)

# Device node creation rules
include $(CLEAR_VARS)
LOCAL_MODULE := ueventd.qcom.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := ueventd.qcom.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

# USB configuration
include $(CLEAR_VARS)
LOCAL_MODULE := init.qcom.usb.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := init.qcom.usb.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/init/hw
include $(BUILD_PREBUILT)

# Recovery init script
include $(CLEAR_VARS)
LOCAL_MODULE := init.recovery.qcom.rc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := init.recovery.qcom.rc
LOCAL_MODULE_PATH := $(TARGET_OUT_RECOVERY)/root
include $(BUILD_PREBUILT)