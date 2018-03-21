# Deodex ? := false
ODEX := true

ifeq ($(ODEX),true)
    WITH_DEXPREOPT := true
    DISABLE_DEXPREOPT := false
endif

# QCOM HW crypto
ifeq ($(TARGET_HW_DISK_ENCRYPTION),true)
    TARGET_CRYPTFS_HW_PATH ?= vendor/qcom/opensource/cryptfs_hw
endif
