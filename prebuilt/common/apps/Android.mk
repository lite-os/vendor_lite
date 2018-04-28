LOCAL_PATH := $(call my-dir)

my_archs := arm arm64
my_src_arch := $(call get-prebuilt-src-arch, $(my_archs))

###############################################################################
# Google Keyboard 7.1.8.191763606

include $(CLEAR_VARS)
LOCAL_MODULE := GBoard
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := LatinIME
LOCAL_SRC_FILES := $(LOCAL_MODULE)/$(LOCAL_MODULE)_$(my_src_arch).apk
LOCAL_MODULE_TARGET_ARCH := $(my_src_arch)
LOCAL_MULTILIB := both
LOCAL_DEX_PREOPT := false
DONT_DEXPREOPT_PREBUILTS := true
include $(BUILD_PREBUILT)

###############################################################################
# Android Messages 3.0.040

include $(CLEAR_VARS)
LOCAL_MODULE := GMessaging
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE := false
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := messaging
LOCAL_SRC_FILES := $(LOCAL_MODULE)/$(LOCAL_MODULE)_$(my_src_arch).apk
LOCAL_MODULE_TARGET_ARCH := $(my_src_arch)
LOCAL_MULTILIB := both
LOCAL_DEX_PREOPT := false
DONT_DEXPREOPT_PREBUILTS := true
include $(BUILD_PREBUILT)

###############################################################################
# RetroMusicPlayer

include $(CLEAR_VARS)
LOCAL_MODULE := RetroMusicPlayer
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE := false
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := $(LOCAL_MODULE)/$(LOCAL_MODULE).apk
LOCAL_DEX_PREOPT := false
DONT_DEXPREOPT_PREBUILTS := true
LOCAL_OVERRIDES_PACKAGES := Music
include $(BUILD_PREBUILT)

###############################################################################
# Google Clock 5.2.1

include $(CLEAR_VARS)
LOCAL_MODULE := Clock
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_PRIVILEGED_MODULE := false
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := $(LOCAL_MODULE)/$(LOCAL_MODULE).apk
LOCAL_DEX_PREOPT := false
DONT_DEXPREOPT_PREBUILTS := true
LOCAL_OVERRIDES_PACKAGES := DeskClock
include $(BUILD_PREBUILT)
