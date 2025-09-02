#
# Copyright (C) 2024 OmniROM Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

# WPA Supplicant overlay
include $(CLEAR_VARS)
LOCAL_MODULE := wpa_supplicant_overlay.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := wpa_supplicant_overlay.conf
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/wifi
include $(BUILD_PREBUILT)

# P2P Supplicant overlay
include $(CLEAR_VARS)
LOCAL_MODULE := p2p_supplicant_overlay.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := p2p_supplicant_overlay.conf
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/wifi
include $(BUILD_PREBUILT)

# Qualcomm WiFi configuration
include $(CLEAR_VARS)
LOCAL_MODULE := WCNSS_qcom_cfg.ini
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := WCNSS_qcom_cfg.ini
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/wifi
include $(BUILD_PREBUILT)

# WiFi concurrency configuration
include $(CLEAR_VARS)
LOCAL_MODULE := wifi_concurrency_cfg.txt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := wifi_concurrency_cfg.txt
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/wifi
include $(BUILD_PREBUILT)