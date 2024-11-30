#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from rothko device
$(call inherit-product, device/xiaomi/rothko/device.mk)

PRODUCT_DEVICE := rothko
PRODUCT_NAME := lineage_rothko
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 2407FPN8EG
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="missi-user 15 AP3A.240617.008 OS2.0.11.0.VNNEUXM release-keys"

BUILD_FINGERPRINT := Xiaomi/rothko_eea/rothko:14/UP1A.231005.007/OS2.0.11.0.VNNEUXM:user/release-keys
