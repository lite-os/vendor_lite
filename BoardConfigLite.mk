# Deodex ? := false
ODEX := true

ifeq ($(ODEX),true)
    WITH_DEXPREOPT := true
    DISABLE_DEXPREOPT := false
endif
