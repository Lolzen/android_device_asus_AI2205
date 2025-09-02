LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),AI2205)

# Include all subdir makefiles
include $(call all-makefiles-under,$(LOCAL_PATH))

# Android 15 specific includes
include $(CLEAR_VARS)
LOCAL_MODULE := android15_compatibility
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_TAGS := optional
include $(BUILD_PHONY_PACKAGE)

endif