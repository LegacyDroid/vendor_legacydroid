# Artifact path requirement is enforced for products that inherit it; list
# the files we install outside it.
# (PRODUCT_PACKAGES for the drop-zone modules lives in vendor/lineage/config/common.mk)
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/etc/termux/termux.apk \
    system/etc/termux/termux_setup.sh \
    product/etc/init/termux_setup.rc \
    system/etc/simpmusic/simpmusic.apk \
    system/etc/simpmusic/simpmusic_setup.sh \
    product/etc/init/simpmusic_setup.rc \
    system/etc/realsr/models-RealeSR-general-v3/x4.param \
    system/etc/realsr/models-RealeSR-general-v3/x4.bin \
    system/bin/realsr-ncnn \
    system/bin/realcugan-ncnn \
    system/bin/resize-ncnn \
    system/bin/srmd-ncnn \
    system/bin/waifu2x-ncnn \
    system/bin/anime4k-ncnn \
    system/lib64/libncnn.so \
    system/lib64/libomp.so
