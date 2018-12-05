# grouse variant with dual decoder (main + pip) and dolby ms12d
export LOCAL_CFG_PROFILE := dd.ms12d
export HW_HVD_REDUX      := y
export BDSP_MS12_SUPPORT := D
include device/broadcom/grouse/grouse.mk

PRODUCT_NAME                   := grouse_dd_ms12d
PRODUCT_MODEL                  := grouse
PRODUCT_BRAND                  := google
PRODUCT_DEVICE                 := grouse

