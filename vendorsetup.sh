echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree [1/17]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-20.0 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/17]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-20.0 vendor/lenovo

echo 'Cloning system sepolicy [3/17]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-20.0 system/sepolicy

echo 'Cloning system bpf [4/17]'
# Bpf
rm -rf system/bpf && git clone https://github.com/kuntao-development/android_system_bpf -b lineage-20.0 system/bpf

echo 'Cloning deskclock [5/17]'
# DeskClock
rm -rf packages/apps/DeskClock && git clone https://github.com/Astridxx/android_packages_apps_DeskClock-1 -b lineage-20.0 packages/apps/DeskClock

echo 'Cloning display hal [6/17]'
# Display
rm -rf hardware/qcom-caf/msm8996/display && git clone https://github.com/kuntao-development/android_hardware_qcom_display -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/display

echo 'Cloning vendor lineage [7/17]'
# Lineage vendor
rm -rf vendor/lineage && git clone https://github.com/Astridxx/android_vendor_lineage -b lineage-20.0 vendor/lineage

echo 'Cloning revamped fmradio [8/17]'
# Fmradio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Adding patch to frameworks base for Kuntao [9/17]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0009-hwui-reset-to-android-13.0.0_r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0002-Disable-vendor-mismatch-warning.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-light/patches_platform/frameworks_base/0013-core-Remove-old-app-target-SDK-dialog.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-td/patches_treble_td/platform_frameworks_base/0020-Fix-Wakelock-issue.patch
git apply *.patch

cd ../..

echo 'Adding patch to Trebuchet for Kuntao [10/17]'
cd packages/apps/Trebuchet
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-light/patches_platform/packages_apps_Trebuchet/0001-Trebuchet-Move-clear-all-button-to-actions-view.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-light/patches_platform_personal/packages_apps_Trebuchet/0001-Trebuchet-Make-overview-scrim-transparent-again.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-light/patches_platform_personal/packages_apps_Trebuchet/0002-Trebuchet-Kill-haptics-in-recents.patch
git apply *.patch

cd ../../..

echo 'Adding patch to frameworks native for Kuntao [11/17]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Disable-gpu-service.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0002-SurfaceFlinger-Don-t-cleanup-resources-from-previous.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0003-SurfaceFlinger-Don-t-cleanup-resources-from-previous.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0004-SurfaceFlinger-Don-t-cleanup-resources-from-previous.patch
git apply *.patch

cd ../..

echo 'Adding patch to frameworks net for Kuntao [12/17]'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Support-no-BPF-usecase.patch
git apply *.patch

cd ../../..

echo 'Adding patch to system netd for Kuntao [13/17]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Add-no-BPF-usecase-support.patch
git apply *.patch

cd ../..

echo 'Adding patch to NetworkStack modules for Kuntao [14/17]'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
git apply *.patch

cd ../../..

echo 'Adding patch to system core for Kuntao [15/17]'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0003-Add-no-BPF-usecase-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Camera-Add-feature-extensions.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-td/patches_treble_td/platform_system_core/0006-Panic-into-recovery-rather-than-bootloader.patch
git apply *.patch

cd ../..

echo 'Adding patch to Connectivity modules for Kuntao [16/17]'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0003-Support-no-BPF-usecase.patch
git apply *.patch

cd ../../..

echo 'Adding patch for DeskClock [17/17]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-light/patches_platform_personal/packages_apps_DeskClock/0001-DeskClock-Remove-night-mode.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-light/patches_platform_personal/packages_apps_DeskClock/0002-DeskClock-Adapt-digital-clocks-to-S-style.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-20-light/patches_platform_personal/packages_apps_DeskClock/0003-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
git apply *.patch

cd ../../..

echo 'Completed, proceeding to lunch'
