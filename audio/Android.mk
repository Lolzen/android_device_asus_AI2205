LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := audio_effects.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := audio_effects.xml
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := audio_platform_info.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := audio_platform_info.xml
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy_configuration.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := audio_policy_configuration.xml
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := mixer_paths.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_SRC_FILES := mixer_paths.xml
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR)/etc
include $(BUILD_PREBUILT)