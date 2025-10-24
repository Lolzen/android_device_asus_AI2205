LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libnfc-nci.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := libnfc-nci.conf
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)