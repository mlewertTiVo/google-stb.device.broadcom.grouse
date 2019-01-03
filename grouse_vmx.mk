# Enable VMX MediaCas support
export ANDROID_SUPPORTS_MEDIACAS := y
export ANDROID_ENABLE_CAS_VMX    := y

include device/broadcom/grouse/grouse.mk

PRODUCT_NAME                    := grouse_vmx
PRODUCT_MODEL                   := grouse
PRODUCT_BRAND                   := google
PRODUCT_DEVICE                  := grouse

export LOCAL_DEVICE_SIGNING_PKG := grouse

# Common Verimatrix product definitions
include device/broadcom/common/cas/product_vmx.mk
