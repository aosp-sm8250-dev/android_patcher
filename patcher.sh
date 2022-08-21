#!/bin/bash

ROOT="${PWD}"
REPOS=(
    'bionic'
    'bootable/recovery'
    'build/soong'
    'device/qcom/sepolicy'
    'device/qcom/sepolicy_vndr'
    'external/tinycompress'
    'frameworks/av'
    'frameworks/native'
    'hardware/libhardware'
    'hardware/qcom/display'
    'hardware/qcom/media'
    'hardware/qcom/wlan'
    'hardware/qcom-caf/wlan'
    'packages/apps/Nfc'
    'packages/modules/Wifi'
    'vendor/qcom/opensource/audio-hal/primary-hal'
    'vendor/qcom/opensource/core-utils'
    'vendor/qcom/opensource/data-ipa-cfg-mgr'
    'vendor/qcom/opensource/dataservices'
    'vendor/qcom/opensource/power'
    'vendor/qcom/opensource/usb'
    'vendor/qcom/opensource/vibrator'
)

ICONS=(
    'packages/providers/CalendarProvider'
    'packages/providers/ContactsProvider'
    'packages/apps/Dialer'
    'packages/apps/Messaging'
    'packages/apps/Camera2'
    'packages/apps/DeskClock'
    'packages/apps/Contacts'
    'packages/apps/DocumentsUI'
    'packages/apps/Gallery2'
    'packages/apps/Settings'
)

for repo in "${REPOS[@]}"; do
    cd "${ROOT}/${repo}"

    git am --keep-cr "${ROOT}/patcher/aosp/${repo}"/*

    cd "${ROOT}"
done

for icon in "${ICONS[@]}"; do
    cd "${ROOT}/${icon}"

    git am --keep-cr "${ROOT}/patcher/icons/${icon}"/*

    cd "${ROOT}"
done
