echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree [1/11]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-19.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/11]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-19.1 vendor/lenovo

echo 'Cloning system sepolicy [3/11]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-19.1 system/sepolicy

echo 'Cloning deskclock [4/11]'
# DeskClock
rm -rf packages/apps/DeskClock && git clone https://github.com/Astridxx/android_packages_apps_DeskClock-1 -b lineage-19.1 packages/apps/DeskClock

echo 'Cloning display hal [5/11]'
# Display
rm -rf hardware/qcom-caf/msm8996/display && git clone https://github.com/kuntao-development/android_hardware_qcom_display -b lineage-19.1-caf-msm8996 hardware/qcom-caf/msm8996/display

echo 'Cloning revamped fmradio [6/11]'
# Logging
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Disabling vendor mismatch warning [7/11]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-19.1/0002-Disable-vendor-mismatch-warning.patch
git apply *.patch

cd ../..

echo 'Dont cleanup resources from previous frame [8/11]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-19.1/0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-19.1/0002-SurfaceFlinger-Don-t-cleanup-resources-from-previous.patch
git apply *.patch

cd ../..

echo 'Adding Camera feature extensions [9/11]'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-19.1/0001-Camera-Add-feature-extensions.patch
git apply *.patch

cd ../..

echo 'Adding support for non bpf trafic monitoring [10/11]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-19.1/0001-Add-back-support-for-non-bpf-trafic-monitoring.patch
git apply *.patch

cd ../..

echo 'Ignoring bpf errors for 3.18 kernels [11/11]'
cd system/bpf
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-19.1/0001-Ignore-bpf-errors-for-4.9-kernels.patch
git apply *.patch

cd ../..

echo 'Completed, proceeding to lunch'
