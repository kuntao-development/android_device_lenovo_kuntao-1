echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree [1/5]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-20.0-test kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/5]'
# Vendor
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-20.0-test vendor/lenovo

echo 'Cloning system sepolicy [3/5]'
# Sepolicy
rm -rf system/sepolicy && git clone --depth=1 https://github.com/Astridxx/android_system_sepolicy -b lineage-20.0 system/sepolicy

echo 'Cloning system bpf [4/5]'
# Bpf
rm -rf system/bpf && git clone --depth=1 https://github.com/kuntao-development/android_system_bpf -b lineage-20.0 system/bpf

echo 'Cloning revamped fmradio [5/5]'
# Fmradio
git clone --depth=1 https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to frameworks base for Kuntao [1/11]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0001-Revert-Do-not-crash-webview-if-its-group-creation-fails.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0002-Revert-Treat-process-group-creation-failure.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0003-Revert-Treat-failure-to-create-a-process-group-as-fatal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0004-Fixup-Revert-Treat-failure-to-create-a-process-group-as-fatal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0011-Add-missing-device-config-permissions-for-settings.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0012-SettingsProvider-Handle-write-device-config-permission.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0013-Revert-oom-Enable-proactive-kills-only-on-modern-kernels.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0014-Disable-vendor-mismatch-warning.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0015-hwui-reset-to-android-13-0-0-r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/framework_base/0016-LightsService-Mute-an-annoying-error-message.patch
wget https://github.com/Astridxx/android_frameworks_base/commit/95fa82bf1b0c3245172007ace89c78b9123a4d7c.patch
patch -p1 <0001-Revert-Do-not-crash-webview-if-its-group-creation-fails.patch
patch -p1 <0002-Revert-Treat-process-group-creation-failure.patch
patch -p1 <0003-Revert-Treat-failure-to-create-a-process-group-as-fatal.patch
patch -p1 <0004-Fixup-Revert-Treat-failure-to-create-a-process-group-as-fatal.patch
patch -p1 <0011-Add-missing-device-config-permissions-for-settings.patch
patch -p1 <0012-SettingsProvider-Handle-write-device-config-permission.patch
patch -p1 <0013-Revert-oom-Enable-proactive-kills-only-on-modern-kernels.patch
patch -p1 <0014-Disable-vendor-mismatch-warning.patch
patch -p1 <0015-hwui-reset-to-android-13-0-0-r13.patch
patch -p1 <0016-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <95fa82bf1b0c3245172007ace89c78b9123a4d7c.patch
cd ../..

echo 'Adding patch to frameworks native for Kuntao [2/11]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/frameworks_native/0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/frameworks_native/0002-Mark-accelerometer-input-as-sensor-exclusively-if-there-are-ABS-axis.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Disable-gpu-service.patch
patch -p1 <0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
patch -p1 <0002-Mark-accelerometer-input-as-sensor-exclusively-if-there-are-ABS-axis.patch
patch -p1 <0001-Disable-gpu-service.patch
cd ../..

echo 'Adding patch to frameworks net for Kuntao [3/11]'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Support-no-BPF-usecase.patch
patch -p1 <0001-Support-no-BPF-usecase.patch
cd ../../..

echo 'Adding patch to system netd for Kuntao [4/11]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Add-no-BPF-usecase-support.patch
patch -p1 <0001-Add-no-BPF-usecase-support.patch
cd ../..

echo 'Adding patch to NetworkStack modules for Kuntao [5/11]'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0001-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/packages_modules_NetworkStack/0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
patch -p1 <0001-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
patch -p1 <0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
cd ../../..

echo 'Adding patch to system core for Kuntao [6/11]'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
patch -p1 <0001-Fix-support-for-devices-without-cgroupv2-support.patch
cd ../..

echo 'Adding patch to Connectivity modules for Kuntao [7/11]'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20.0/0003-Support-no-BPF-usecase.patch
patch -p1 <0003-Support-no-BPF-usecase.patch
cd ../../..

echo 'Adding patch to vendor banana for Kuntao [8/11]'
cd vendor/banana
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/vendor_banana/0001-soong-Add-disable-postrender-cleanup-conditional-1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/vendor_banana/0002-soong-Add-disable-postrender-cleanup-conditional-2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/vendor_banana/0003-Cleanup-Gms-properties.patch
patch -p1 <0001-soong-Add-disable-postrender-cleanup-conditional-1.patch
patch -p1 <0002-soong-Add-disable-postrender-cleanup-conditional-2.patch
patch -p1 <0003-Cleanup-Gms-properties.patch
cd ../..

echo 'Adding patch for DeskClock [9/11]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
cd ../../..

echo 'Adding patch for Power hal [10/11]'
cd vendor/qcom/opensource/power
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/Banana-13/vendor_qcom_opensource_power/0001-Cancel-the-previous-boost-after-calling-a-new-one.patch
patch -p1 <0001-Cancel-the-previous-boost-after-calling-a-new-one.patch
cd ../../../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
