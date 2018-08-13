# lite sprcific build properties
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.display.id=LiteOS-$(LITE_VERSION)-$(LITE_BUILD_TYPE)$(LITE_POSTFIX) \
    ro.lite.version=$(LITE_VERSION)

# Build official builds
ifeq ($(LITE_RELEASE),true)
ADDITIONAL_BUILD_PROPERTIES += \
    lite.ota.delta=$(LITE_MOD_VERSION) \
    ro.lite.device=$(LITE_BUILD)
endif
