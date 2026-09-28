#
# Copyright (C) 2024-2025 The OmniROM Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),AI2205)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
