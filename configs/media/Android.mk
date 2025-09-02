LOCAL_PATH := $(call my-dir)

# Media configuration files
include $(CLEAR_VARS)
LOCAL_MODULE := media_codecs.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := media_codecs.xml
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := media_codecs_performance.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := media_codecs_performance.xml
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := media_profiles_V1_0.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := media_profiles_V1_0.xml
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := media_codecs_vendor.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := media_codecs_vendor.xml
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := asus_rog_media_features.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
LOCAL_SRC_FILES := asus_rog_media_features.xml
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)