PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
	vendor/lite/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.setupwizard.rotation_locked=true

# Mark as eligible for Google Assistant
PRODUCT_PROPERTY_OVERRIDES += ro.opa.eligible_device=true

# Google Dialer fix
PRODUCT_COPY_FILES +=  \
    vendor/lite/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Telephony packages
PRODUCT_PACKAGES += \
    CellBroadcastReceiver \
    Stk

# World APN list
PRODUCT_COPY_FILES += \
    vendor/lite/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    vendor/lite/prebuilt/common/etc/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Packages
PRODUCT_PACKAGES += \
    GBoard \
    RetroMusicPlayer \
	Clock \
	Launcher3 \
    GooglePhotos

ifeq ($(BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE),)
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/data/cache
else
  PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.device.cache_dir=/cache
endif

# Backup Tool &  Clean up packages cache
PRODUCT_COPY_FILES += \
    vendor/lite/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/lite/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/lite/prebuilt/common/bin/blacklist:system/addon.d/blacklist \
    vendor/lite/prebuilt/common/bin/whitelist:system/addon.d/whitelist \
    vendor/lite/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/lite/prebuilt/common/bin/otasigcheck.sh:install/bin/otasigcheck.sh

# init.d support
PRODUCT_COPY_FILES += \
    vendor/lite/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/lite/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/lite/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit

# Init file
PRODUCT_COPY_FILES += \
    vendor/lite/prebuilt/common/etc/init.local.rc:root/init.lite.rc

# Show SELinux preference in Settings->System->About phone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
# RecueParty? No thanks.
PRODUCT_PROPERTY_OVERRIDES += persist.sys.enable_rescue=false
endif

# LiteOS versioning system
AOSP_VERSION_CODENAME := O
LITE_VERSION_CODENAME := 8.1.23
ifndef LITE_BUILD_TYPE
ifeq ($(LITE_RELEASE),true)
    LITE_BUILD_TYPE := OFFICIAL
    LITE_POSTFIX := -$(shell date +"%Y%m%d")
else
    LITE_BUILD_TYPE := UNOFFICIAL
endif
endif

# Use LITE_BUILD_EXTRA as postfix if defined  (non-release/unofficial builds)
ifdef LITE_BUILD_EXTRA
    LITE_POSTFIX := -$(LITE_BUILD_EXTRA)
endif

# Append time if postfix not defined (non-release/unofficial builds)
ifndef LITE_POSTFIX
    LITE_POSTFIX := -$(shell date +"%Y%m%d-%H%M")
endif

# Output zip naming
LITE_VERSION := LiteOS-$(LITE_VERSION_CODENAME)-$(AOSP_VERSION_CODENAME)-$(LITE_BUILD_TYPE)$(LITE_POSTFIX)
ifeq ($(LITE_RELEASE),true)
LITE_MOD_VERSION := LiteOS-$(LITE_VERSION_CODENAME)-$(AOSP_VERSION_CODENAME)-$(LITE_BUILD)-$(LITE_BUILD_TYPE)$(LITE_POSTFIX)
else
LITE_MOD_VERSION := LiteOS-$(LITE_VERSION_CODENAME)-$(AOSP_VERSION_CODENAME)-$(LITE_BUILD)$(LITE_POSTFIX)
endif

# lite sprcific build properties
PRODUCT_PROPERTY_OVERRIDES += \
    lite.ota.version=$(LITE_MOD_VERSION) \
    ro.lite.device=$(LITE_BUILD) \
    ro.lite.version=$(LITE_VERSION_CODENAME) \
    ro.modversion=$(LITE_MOD_VERSION) \
    ro.lite.buildtype=$(LITE_BUILD_TYPE) \
    ro.build.display.id=$(AOSP_VERSION_CODENAME)-$(LITE_VERSION_CODENAME)-$(LITE_BUILD_TYPE)
    
# Check
#PRODUCT_PACKAGES += \
#    SettingsBlackTheme \
#    SettingsBlackThemeOverlay \
#    SystemBlackTheme \ 
#    SystemBlackThemeOverlay \
#    SysuiDarkTheme \
#    SysuiDarkThemeOverlay 
