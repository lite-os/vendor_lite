# lite sprcific build properties
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.display.id=$(LITE_BUILD_TYPE)$(LITE_POSTFIX) \
    ro.lite.version=$(LITE_VERSION_CODENAME)

# Build official builds
ifeq ($(LITE_RELEASE),true)
ADDITIONAL_BUILD_PROPERTIES += \
    lite.ota.delta=$(LITE_MOD_VERSION) \
    ro.lite.device=$(LITE_BUILD)
endif
