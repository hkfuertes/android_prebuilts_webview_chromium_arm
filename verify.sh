#!/bin/sh
set -eu

cd "$(dirname "$0")"
apk=prebuilt/arm/webview.apk
expected_apk=5cf0ce55a5bc2894f7d7fc47bd64fec52da545427123cc9b28af0453376ab9f0
expected_lib=fa964cd23aa36492d34f062f5b27aed28020aeb60bf5af859c7baa984624f961

unzip -tqq "$apk"
test "$(sha256sum "$apk" | awk '{print $1}')" = "$expected_apk"
test "$(unzip -p "$apk" lib/armeabi-v7a/libwebviewchromium.so | sha256sum | awk '{print $1}')" = "$expected_lib"
printf '%s: verified\n' "$apk"
