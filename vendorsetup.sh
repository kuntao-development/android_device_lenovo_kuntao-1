echo 'Starting to clone stuff needed for ur kuntao'

echo 'Cloning kernel tree [1/6]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-20.0 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/6]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-20.0 vendor/lenovo

echo 'Cloning system sepolicy [3/6]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/Astridxx/android_system_sepolicy -b lineage-20.0 system/sepolicy

echo 'Cloning system memory lmkd [4/6]'
# Lmkd
rm -rf system/memory/lmkd && git clone https://github.com/LineageOS/android_system_memory_lmkd -b lineage-20.0 system/memory/lmkd

echo 'Cloning display hal [5/6]'
# Display
rm -rf hardware/qcom-caf/msm8996/display && git clone https://github.com/kuntao-development/android_hardware_qcom_display -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/display

echo 'Cloning revamped fmradio [6/6]'
# Fmradio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to frameworks base for Kuntao [1/10]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/Revert-oom-Enable-proactive-kills-only-on-modern-kernels.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/Revert-Do-not-crash-webview-if-its-group-creation-fails-due-to-a-dead-process.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/Revert-Treat-process-group-creation-failure-due-to-a-dead-process-as-non-fatal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/Revert-Treat-failure-to-create-a-process-group-as-fatal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0001-Disable-magnifier-position-animation.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0010-Disable-vendor-mismatch-warning.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0011-hwui-reset-to-android-13-0-0-r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0014-SettingsProvider-Handle-write-device-config-permission.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0015-BatteryStatsService-limit-logspam.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0016-Fix-error-com-google-android-gms-persistent.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0017-Privapp-permissions-Grant-missing-TelephonyProvider-perm.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/framework_base/0018-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <Revert-oom-Enable-proactive-kills-only-on-modern-kernels.patch
patch -p1 <Revert-Do-not-crash-webview-if-its-group-creation-fails-due-to-a-dead-process.patch
patch -p1 <Revert-Treat-process-group-creation-failure-due-to-a-dead-process-as-non-fatal.patch
patch -p1 <Revert-Treat-failure-to-create-a-process-group-as-fatal.patch
patch -p1 <0001-Disable-magnifier-position-animation.patch
patch -p1 <0010-Disable-vendor-mismatch-warning.patch
patch -p1 <0011-hwui-reset-to-android-13-0-0-r13.patch
patch -p1 <0014-SettingsProvider-Handle-write-device-config-permission.patch
patch -p1 <0015-BatteryStatsService-limit-logspam.patch
patch -p1 <0016-Fix-error-com-google-android-gms-persistent.patch
patch -p1 <0017-Privapp-permissions-Grant-missing-TelephonyProvider-perm.patch
patch -p1 <0018-LightsService-Mute-an-annoying-error-message.patch
cd ../..

echo 'Adding patch to frameworks native for Kuntao [2/10]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/frameworks_native/0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
patch -p1 <0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
cd ../..

echo 'Adding patch to frameworks net for Kuntao [3/10]'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/frameworks_libs_net/0001-Restore-back-the-behavior-of-isValid.patch
patch -p1 <0001-Restore-back-the-behavior-of-isValid.patch
cd ../../..

echo 'Adding patch to system netd for Kuntao [4/10]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/system_netd/0001-Revert-netd-make-BandwidthController-startup-failures-terminal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/system_netd/0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
patch -p1 <0001-Revert-netd-make-BandwidthController-startup-failures-terminal.patch
patch -p1 <0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
cd ../..

echo 'Adding patch to system bpf for Kuntao [5/10]'
cd system/bpf
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/system_bpf/0001-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/system_bpf/0002-Support-no-bpf-usecase.patch
patch -p1 <0001-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
patch -p1 <0002-Support-no-bpf-usecase.patch
cd ../..

echo 'Adding patch to NetworkStack modules for Kuntao [6/10]'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/packages_modules_NetworkStack/0001-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/packages_modules_NetworkStack/0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
patch -p1 <0001-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
patch -p1 <0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
cd ../../..

echo 'Adding patch to system core for Kuntao [7/10]'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/system_core/0003-Camera-Add-feature-extensions.patch
patch -p1 <0001-Fix-support-for-devices-without-cgroupv2-support.patch
patch -p1 <0003-Camera-Add-feature-extensions.patch
cd ../..

echo 'Adding patch to Connectivity modules for Kuntao [8/10]'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/packages_modules_Connectivity/0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/packages_modules_Connectivity/0002-BpfMap-implemented-new-checks-for-kernel-4-14.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/packages_modules_Connectivity/0003-Dont-delete-UID-from-BpfMap-on-BPF-less-kernel.patch
patch -p1 <0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
patch -p1 <0002-BpfMap-implemented-new-checks-for-kernel-4-14.patch
patch -p1 <0003-Dont-delete-UID-from-BpfMap-on-BPF-less-kernel.patch
cd ../../..

echo 'Adding patch to vendor rising for Kuntao [9/10]'
cd vendor/lineage
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/vendor_lineage/0001-soong-Add-disable-postrender-cleanup-conditional-1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/vendor_lineage/0002-soong-Add-disable-postrender-cleanup-conditional-2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/vendor_lineage/0005-Inherit-several-Android-Go-configurations.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/vendor_lineage/0006-Minimize-debug-info.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/vendor_lineage/0007-Optimize-Launcher3-and-Settings-for-speed.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/vendor_lineage/0008-config-Cleanup-GMS-properties.patch
patch -p1 <0001-soong-Add-disable-postrender-cleanup-conditional-1.patch
patch -p1 <0002-soong-Add-disable-postrender-cleanup-conditional-2.patch
patch -p1 <0005-Inherit-several-Android-Go-configurations.patch
patch -p1 <0006-Minimize-debug-info.patch
patch -p1 <0007-Optimize-Launcher3-and-Settings-for-speed.patch
patch -p1 <0008-config-Cleanup-GMS-properties.patch
cd ../..

echo 'Adding patch to DeskClock [10/10]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/RisingOS-13/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
cd ../../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
