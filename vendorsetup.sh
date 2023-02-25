echo 'Starting to clone stuffs needed for your device'

echo 'Cloning kernel tree [1/12]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone https://github.com/kuntao-development/android_kernel_lenovo_msm8953 -b lineage-19.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/12]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b los-19.1 vendor/lenovo

echo 'Cloning frameworks base [3/12]'
# Frameworks
rm -rf frameworks/base && git clone --depth=1 https://github.com/Astridxx/android_frameworks_base-2 -b lineage-19.1 frameworks/base

echo 'Cloning system netd [4/12]'
# Netd
rm -rf system/netd && git clone https://github.com/Astridxx/android_system_netd -b lineage-19.1 system/netd

echo 'Cloning system bpf [5/12]'
# Bpf
rm -rf system/bpf && git clone https://github.com/Astridxx/android_system_bpf -b lineage-19.1 system/bpf

echo 'Cloning system libhidl [6/12]'
# Hidl
rm -rf system/libhidl && git clone https://github.com/Astridxx/android_system_libhidl -b lineage-19.1 system/libhidl

echo 'Cloning system sepolicy [7/12]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-19.1 system/sepolicy

echo 'Cloning system core [8/12]'
# Core
rm -rf system/core && git clone https://github.com/Astridxx/android_system_core -b lineage-19.1 system/core

echo 'Cloning frameworks native [9/12]'
# Native
rm -rf frameworks/native && git clone https://github.com/Astridxx/android_frameworks_native-2 -b lineage-19.1 frameworks/native

echo 'Cloning system logging [10/12]'
# Logging
rm -rf system/logging && git clone https://github.com/Astridxx/android_system_logging -b lineage-19.1 system/logging

echo 'Cloning deskclock [11/12]'
# DeskClock
rm -rf packages/apps/DeskClock && git clone https://github.com/Astridxx/android_packages_apps_DeskClock-1 -b lineage-19.1 packages/apps/DeskClock

echo 'Cloning revamped fmradio [12/12]'
# Fm radio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Completed, proceeding to lunch'
