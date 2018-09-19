# Deodex ? := false
ODEX := true

ifeq ($(ODEX),true)
    WITH_DEXPREOPT := true
    DISABLE_DEXPREOPT := false
endif

include vendor/lite/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/lite/config/BoardConfigQcom.mk
endif

include vendor/lite/config/BoardConfigSoong.mk

# BROTLI
ANDROID_COMPILE_WITH_BROTLI := false
