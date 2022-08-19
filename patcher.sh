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
