#
# Copyright (C) 2024 OmniROM Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# Sensor HAL configuration
include $(CLEAR_VARS)
LOCAL_MODULE := hals.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := hals.conf
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/sensors
include $(BUILD_PREBUILT)

# Sensor registry configuration
include $(CLEAR_VARS)
LOCAL_MODULE := sns_reg_config
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := sns_reg_config
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/sensors
include $(BUILD_PREBUILT)

# Qualcomm device sensor definitions
include $(CLEAR_VARS)
LOCAL_MODULE := sensor_def_qcomdev.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := sensor_def_qcomdev.conf
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/sensors
include $(BUILD_PREBUILT)