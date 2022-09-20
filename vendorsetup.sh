echo 'Starting to clone stuffs needed for your kuntao'

echo 'Cloning kernel tree [1/13]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-19.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/13]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-19.1 vendor/lenovo 

echo 'Cloning frameworks base [3/13]'
# frameworks base
rm -rf frameworks/base && git clone https://github.com/Astridxx/android_frameworks_base -b 12.1 frameworks/base

echo 'Cloning system netd [4/13]'
# Netd
rm -rf system/netd && git clone https://github.com/Astridxx/android_system_netd -b lineage-19.1 system/netd

echo 'Cloning system bpf [5/13]'
# Bpf
rm -rf system/bpf && git clone https://github.com/Astridxx/android_system_bpf -b lineage-19.1 system/bpf

echo 'Cloning system libhidl [6/13]'
# Hidl
rm -rf system/libhidl && git clone https://github.com/Astridxx/android_system_libhidl -b lineage-19.1 system/libhidl

echo 'Cloning system core [7/13]'
# Core
rm -rf system/core && git clone https://github.com/Astridxx/android_system_core -b 12.1 system/core

echo 'Cloning frameworks native [8/13]'
# Native
rm -rf frameworks/native && git clone https://github.com/Astridxx/android_frameworks_native -b 12.1 frameworks/native

echo 'Cloning hardware qcom wlan [9/13]'
# Wlan
rm -rf hardware/qcom-caf/wlan && git clone https://github.com/Astridxx/android_hardware_qcom_wlan -b lineage-19.1-caf hardware/qcom-caf/wlan 

echo 'Cloning system sepolicy [10/13]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS/android_system_sepolicy -b lineage-19.1 system/sepolicy

echo 'Cloning system bt [11/13]'
# BT
rm -rf system/bt && git clone https://github.com/Astridxx/system_bt -b twelve system/bt

echo 'Cloning system logging [12/13]'
# Logging
rm -rf system/logging && git clone https://github.com/Astridxx/android_system_logging -b lineage-19.1 system/logging

echo 'Cloning vendor awaken [13/13]'
# Awaken vendor
rm -rf vendor/awaken && git clone https://github.com/Astridxx/android_vendor_awaken -b 12.1 vendor/awaken

echo 'Completed, proceeding to lunch'
