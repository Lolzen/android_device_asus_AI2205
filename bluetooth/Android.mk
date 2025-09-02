LOCAL_PATH := $(call my-dir)

# Bluetooth configuration files
include $(CLEAR_VARS)
LOCAL_MODULE := bt_vendor.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/bluetooth
LOCAL_SRC_FILES := bt_vendor.conf
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := bt_stack.conf  
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc/bluetooth
LOCAL_SRC_FILES := bt_stack.conf
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

# Bluetooth build configuration header
include $(CLEAR_VARS)
LOCAL_MODULE := bdroid_buildcfg.h
LOCAL_MODULE_CLASS := HEADER
LOCAL_MODULE_PATH := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include
LOCAL_SRC_FILES := bdroid_buildcfg.h
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)