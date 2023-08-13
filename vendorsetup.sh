echo 'Starting to clone stuffs needed for your device'

echo 'Cloning kernel tree [1/20]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/kuntao-development/android_kernel_lenovo_msm8953 -b lineage-19.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/20]'
# Vendor
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b los-19.1 vendor/lenovo

echo 'Cloning frameworks base [3/20]'
# Frameworks
rm -rf frameworks/base && git clone --depth=1 https://github.com/Astridxx/platform_frameworks_base -b arcadia-next frameworks/base

echo 'Cloning system netd [4/20]'
# Netd
rm -rf system/netd && git clone --depth=1 https://github.com/Astridxx/android_system_netd -b bliss-12 system/netd

echo 'Cloning system bpf [5/20]'
# Bpf
rm -rf system/bpf && git clone --depth=1 https://github.com/Astridxx/android_system_bpf -b lineage-19.1 system/bpf

echo 'Cloning system libhidl [6/20]'
# Hidl
rm -rf system/libhidl && git clone --depth=1 https://github.com/Astridxx/android_system_libhidl -b lineage-19.1 system/libhidl

echo 'Cloning system sepolicy [7/20]'
# Sepolicy
rm -rf system/sepolicy && git clone --depth=1 https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-19.1 system/sepolicy

echo 'Cloning system core [8/20]'
# Core
rm -rf system/core && git clone --depth=1 https://github.com/Astridxx/android_system_core -b arcadia-next system/core

echo 'Cloning system bt [9/20]'
# BT
rm -rf system/bt && git clone --depth=1 https://github.com/LineageOS/android_system_bt -b lineage-19.1 system/bt

echo 'Cloning frameworks native [10/20]'
# Native
rm -rf frameworks/native && git clone --depth=1 https://github.com/Astridxx/platform_frameworks_native -b arcadia-next frameworks/native

echo 'Cloning system logging [11/20]'
# Logging
rm -rf system/logging && git clone --depth=1 https://github.com/Astridxx/android_system_logging -b lineage-19.1 system/logging

echo 'Cloning deskclock [12/20]'
# DeskClock
rm -rf packages/apps/DeskClock && git clone --depth=1 https://github.com/Astridxx/android_packages_apps_DeskClock-1 -b lineage-19.1 packages/apps/DeskClock

echo 'Cloning settings [13/20]'
# Settings
rm -rf packages/apps/Settings && git clone --depth=1 https://github.com/Astridxx/platform_packages_apps_Settings -b arcadia-next packages/apps/Settings

echo 'Cloning launcher3 [14/20]'
# Launcher3
rm -rf packages/apps/Launcher3 && git clone --depth=1 https://github.com/Astridxx/platform_packages_apps_Launcher3 -b arcadia-next packages/apps/Launcher3

echo 'Cloning revamped fmradio [15/20]'
# Fm radio
git clone --depth=1 https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning build make [16/20]'
# Build make
rm -rf build/make && git clone --depth=1 https://github.com/Astridxx/platform_build_make -b arcadia-next build/make

echo 'Cloning build soong [17/20]'
# Build soong
rm -rf build/soong && git clone --depth=1 https://github.com/Astridxx/platform_build_soong -b arcadia-next build/soong

echo 'Cloning sepolicy legacy um [18/20]'
# Sepolicy-legacy-um
rm -rf device/qcom/sepolicy-legacy-um && git clone https://github.com/Astridxx/android_device_qcom_sepolicy -b bliss-legacy-um device/qcom/sepolicy-legacy-um

echo 'Cloning vendor bliss [19/20]'
# Bliss vendor
rm -rf vendor/bliss && git clone --depth=1 https://github.com/Astridxx/platform_vendor_bliss -b arcadia-next vendor/bliss

echo 'Adding patch for DeskClock [20/20]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0001-DeskClock-Remove-night-mode.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0002-DeskClock-Adapt-digital-clocks-to-S-style.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0003-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
git apply *.patch

cd ../../..

echo 'Completed, proceeding to lunch'
