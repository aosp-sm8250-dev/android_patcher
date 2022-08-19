#!/bin/bash

ROOT="${PWD}"
REPOS=(
    'bionic'
    'bootable/recovery'
    'build/soong'
    'external/tinycompress'
    'frameworks/av'
    'frameworks/native'
    'hardware/libhardware'
    'hardware/qcom/display'
    'hardware/qcom/media'
    'hardware/qcom/wlan'
    'hardware/qcom-caf/wlan'
    'vendor/qcom/opensource/audio-hal/primary-hal'
    'vendor/qcom/opensource/data-ipa-cfg-mgr'
    'vendor/qcom/opensource/dataservices'
    'vendor/qcom/opensource/power'
    'vendor/qcom/opensource/usb'
    'vendor/qcom/opensource/vibrator'
)

for repo in "${REPOS[@]}"; do
    cd "${ROOT}/${repo}"

    git am --keep-cr "${ROOT}/patcher/aosp/${repo}"/*

    cd "${ROOT}"
done
