# CM12.1 ARM Chromium WebView prebuilt.
#
# webview.apk is intentionally unsigned after the native library is embedded.
# BUILD_PREBUILT signs it with the product's default system development key.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := webview
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 32
LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
LOCAL_DEX_PREOPT := false
LOCAL_REQUIRED_MODULES := \
    libwebviewchromium_loader \
    libwebviewchromium_plat_support
LOCAL_MODULE_TARGET_ARCH := arm
LOCAL_SRC_FILES := prebuilt/arm/webview.apk
LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libwebviewchromium.so
include $(BUILD_PREBUILT)
