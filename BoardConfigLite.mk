# Deodex ? := false
ODEX := true

ifeq ($(ODEX),true)
    WITH_DEXPREOPT := true
    DISABLE_DEXPREOPT := false
endif

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/lite/config/BoardConfigQcom.mk
endif
