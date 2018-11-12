# grouse variant with dual decoder (main + pip)
export HW_HVD_REDUX := y
include device/broadcom/grouse/grouse.mk

PRODUCT_NAME                   := grouse_dd
PRODUCT_MODEL                  := grouse
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := grouse

