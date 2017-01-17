PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.setupwizard.rotation_locked=true \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

# Some permissions
PRODUCT_COPY_FILES += \
    vendor/lite/config/permissions/backup.xml:system/etc/sysconfig/backup.xml \
    vendor/lite/config/permissions/privapp-permissions-lite.xml:system/etc/permissions/privapp-permissions-lite.xml

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
	Launcher3

# Tethering - allow without requiring a provisioning app
# (for devices that check this)
PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.recorder.show_manufacturer_and_model=true

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
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.selinux=1

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
# RecueParty? No thanks.
PRODUCT_PROPERTY_OVERRIDES += persist.sys.enable_rescue=false
endif

# enable ADB authentication if not on eng build
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
endif

# LiteOS versioning system
AOSP_VERSION_CODENAME := 8.1.0
LITE_VERSION_CODENAME := OREO
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
LITE_MOD_VERSION := LiteOS-$(AOSP_VERSION_CODENAME)$(LITE_POSTFIX)-$(LITE_BUILD)-$(LITE_BUILD_TYPE)-$(LITE_VERSION_CODENAME)
else
LITE_MOD_VERSION := LiteOS-$(LITE_VERSION_CODENAME)-$(AOSP_VERSION_CODENAME)-$(LITE_BUILD)$(LITE_POSTFIX)
endif

# Build OTA official builds
ifeq ($(LITE_RELEASE),true)
PRODUCT_PACKAGES += OpenDelta
endif

# LiteOS
include LiteOS/apps/prebuilt/config.mk
include LiteOS/overlay/config.mk

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/lite/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/lite/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/lite/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif
