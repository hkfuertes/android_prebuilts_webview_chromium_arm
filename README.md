# CM12.1 ARM Chromium WebView prebuilt

A verified Android 5.1 / API 21 ARM (`armeabi-v7a`) WebView build input for
CM12.1-derived products.

## Contents

`prebuilt/arm/webview.apk` contains package `com.android.webview` version
`39 (24441a182c-arm)` (`versionCode` 300001) and its native
`lib/armeabi-v7a/libwebviewchromium.so` payload.

The APK is deliberately unsigned after the native library is embedded. It is
not directly installable or flashable. `Android.mk` follows the official CM13
prebuilt contract and makes the Android build sign it with
`DEFAULT_SYSTEM_DEV_CERTIFICATE`.

## CM12.1 integration contract

A full CM12.1 product must:

1. make this directory visible to the Android build;
2. set `PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes`;
3. package module `webview`.

The module declares `libwebviewchromium_loader` and
`libwebviewchromium_plat_support` as required. CM12.1 still builds those small
platform glue libraries. This payload is not for the framework-free minimal
product.

## Verification

Run `./verify.sh` after checkout. It verifies ZIP integrity, the complete APK
hash, and that the embedded native library matches the validated CM12.1 build
output.

## Provenance

The payload was extracted from the validated full Biscuit CM12.1 build at
`4964cb72567b367e66fe21e352dd8d07e1e56c06` in
`hkfuertes/amazon_device_biscuit`. See `manifest.json` for hashes, ABI,
runtime dependencies, and signing details.

Chromium and Android source licenses remain applicable to the derived build
output.
