echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree [1/15]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-20.0 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/15]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-20.0 vendor/lenovo

echo 'Cloning system sepolicy [3/15]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-20.0 system/sepolicy

echo 'Cloning system bpf [4/15]'
# Bpf
rm -rf system/bpf && git clone https://github.com/kuntao-development/android_system_bpf -b lineage-20.0 system/bpf

echo 'Cloning deskclock [5/15]'
# DeskClock
rm -rf packages/apps/DeskClock && git clone https://github.com/Astridxx/android_packages_apps_DeskClock-1 -b lineage-20.0 packages/apps/DeskClock

echo 'Cloning display hal [6/15]'
# Display
rm -rf hardware/qcom-caf/msm8996/display && git clone https://github.com/kuntao-development/android_hardware_qcom_display -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/display

echo 'Cloning vendor lineage [7/15]'
# Lineage vendor
rm -rf vendor/lineage && git clone https://github.com/Astridxx/android_vendor_lineage -b lineage-20.0 vendor/lineage

echo 'Cloning revamped fmradio [8/15]'
# Fmradio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Adding patch to frameworks base for Kuntao [9/15]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0009-hwui-reset-to-android-13.0.0_r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0002-Disable-vendor-mismatch-warning.patch
git apply *.patch

cd ../..

echo 'Adding patch to frameworks native for Kuntao [10/15]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Disable-gpu-service.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0002-SurfaceFlinger-Don-t-cleanup-resources-from-previous.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0003-SurfaceFlinger-Don-t-cleanup-resources-from-previous.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0004-SurfaceFlinger-Don-t-cleanup-resources-from-previous.patch
git apply *.patch

cd ../..

echo 'Adding patch to frameworks net for Kuntao [11/15]'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Support-no-BPF-usecase.patch
git apply *.patch

cd ../../..

echo 'Adding patch to system netd for Kuntao [12/15]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Add-no-BPF-usecase-support.patch
git apply *.patch

cd ../..

echo 'Adding patch to NetworkStack modules for Kuntao [13/15]'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
git apply *.patch

cd ../../..

echo 'Adding patch to system core for Kuntao [14/15]'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0003-Add-no-BPF-usecase-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Camera-Add-feature-extensions.patch
git apply *.patch

cd ../..

echo 'Adding patch to Connectivity modules for Kuntao [15/15]'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0003-Support-no-BPF-usecase.patch
git apply *.patch

cd ../../..

echo 'Completed, proceeding to lunch'
