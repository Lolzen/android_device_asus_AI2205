LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := bt_vendor.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := bt_vendor.conf
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/bluetooth
include $(BUILD_PREBUILT)