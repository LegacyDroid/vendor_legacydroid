LOCAL_PATH := $(call my-dir)

# SimpMusic is a rolling release: the APK is fetched from GitHub at build
# time (simpmusic_fetch.sh only re-downloads when the release tag changed)
# and installed to /system/etc/simpmusic, then pm-installed as a regular
# user app at first boot (simpmusic_setup.rc) so it stays updatable.
SIMPMUSIC_FETCH := $(LOCAL_PATH)/simpmusic_fetch.sh
SIMPMUSIC_OUT := $(PRODUCT_OUT)/simpmusic
SIMPMUSIC_APK := $(SIMPMUSIC_OUT)/simpmusic.apk
SIMPMUSIC_STAMP := $(SIMPMUSIC_OUT)/.release-tag

$(SIMPMUSIC_APK):
	@bash $(SIMPMUSIC_FETCH) $(SIMPMUSIC_APK) $(SIMPMUSIC_STAMP)

include $(CLEAR_VARS)
LOCAL_MODULE := simpmusic_apk
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_STEM := simpmusic.apk
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/simpmusic
LOCAL_PREBUILT_MODULE_FILE := $(SIMPMUSIC_APK)
include $(BUILD_PREBUILT)
