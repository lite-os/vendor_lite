LOCAL_PATH := $(call my-dir)

my_archs := arm arm64
my_src_arch := $(call get-prebuilt-src-arch, $(my_archs))

###############################################################################
# GBoard 6.8.8.178714143-release

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
# Android Messages 2.8.040

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
