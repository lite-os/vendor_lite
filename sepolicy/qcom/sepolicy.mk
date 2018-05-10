#
# This policy configuration will be used by all qcom products
# that inherit from Lineage
#

BOARD_PLAT_PRIVATE_SEPOLICY_DIR += \
    vendor/lite/sepolicy/qcom/private

BOARD_SEPOLICY_DIRS += \
    vendor/lite/sepolicy/qcom/common \
    vendor/lite/sepolicy/qcom/$(TARGET_BOARD_PLATFORM)
