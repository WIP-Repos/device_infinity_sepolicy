#
# This policy configuration will be used by all products that
# inherit from Lineage
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/infinity/sepolicy/common/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/infinity/sepolicy/common/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/infinity/sepolicy/common/dynamic \
    device/infinity/sepolicy/common/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/infinity/sepolicy/common/dynamic \
    device/infinity/sepolicy/common/vendor
endif

# Include atv rules on atv product
ifeq ($(PRODUCT_IS_ATV), true)
include device/infinity/sepolicy/atv/sepolicy.mk
endif
