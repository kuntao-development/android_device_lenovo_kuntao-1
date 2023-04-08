echo 'Starting to clone stuffs needed for your device'

echo 'Cloning kernel tree [1/15]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone https://github.com/kuntao-development/android_kernel_lenovo_msm8953 -b lineage-19.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/15]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b los-19.1 vendor/lenovo

echo 'Cloning frameworks base [3/15]'
# Frameworks
rm -rf frameworks/base && git clone --depth=1 https://github.com/Astridxx/android_frameworks_base-2 -b lineage-19.1 frameworks/base

echo 'Cloning system netd [4/15]'
# Netd
rm -rf system/netd && git clone https://github.com/Astridxx/android_system_netd -b lineage-19.1 system/netd

echo 'Cloning system bpf [5/15]'
# Bpf
rm -rf system/bpf && git clone https://github.com/Astridxx/android_system_bpf -b lineage-19.1 system/bpf

echo 'Cloning system libhidl [6/15]'
# Hidl
rm -rf system/libhidl && git clone https://github.com/Astridxx/android_system_libhidl -b lineage-19.1 system/libhidl

echo 'Cloning system sepolicy [7/15]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-19.1 system/sepolicy

echo 'Cloning system core [8/15]'
# Core
rm -rf system/core && git clone https://github.com/Astridxx/android_system_core -b lineage-19.1 system/core

echo 'Cloning frameworks native [9/15]'
# Native
rm -rf frameworks/native && git clone https://github.com/Astridxx/android_frameworks_native-2 -b lineage-19.1 frameworks/native

echo 'Cloning system logging [10/15]'
# Logging
rm -rf system/logging && git clone https://github.com/Astridxx/android_system_logging -b lineage-19.1 system/logging

echo 'Cloning deskclock [11/15]'
# DeskClock
rm -rf packages/apps/DeskClock && git clone https://github.com/Astridxx/android_packages_apps_DeskClock-1 -b lineage-19.1 packages/apps/DeskClock

echo 'Cloning settings [12/15]'
# Settings
rm -rf packages/apps/Settings && git clone https://github.com/Astridxx/android_packages_apps_Settings -b lineage-19.1 packages/apps/Settings

echo 'Cloning revamped fmradio [13/15]'
# Fm radio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Adding patch for Trebuchet [14/15]'
cd packages/apps/Trebuchet
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform/packages_apps_Trebuchet/0001-Trebuchet-Move-clear-all-button-to-actions-view.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_Trebuchet/0001-Trebuchet-Make-overview-scrim-transparent-again.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_Trebuchet/0002-Trebuchet-Kill-haptics-in-recents.patch
git apply *.patch

cd ../../..

echo 'Adding patch for DeskClock [15/15]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0001-DeskClock-Remove-night-mode.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0002-DeskClock-Adapt-digital-clocks-to-S-style.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0003-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
git apply *.patch

cd ../../..

echo 'Completed, proceeding to lunch'
