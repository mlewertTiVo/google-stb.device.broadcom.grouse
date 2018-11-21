# grouse variant with dolby ms12d support.
export LOCAL_CFG_PROFILE       := ms12d
export BDSP_MS12_SUPPORT       := D
include device/broadcom/grouse/grouse.mk

PRODUCT_NAME                   := grouse_ms12d
PRODUCT_MODEL                  := grouse
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := grouse
