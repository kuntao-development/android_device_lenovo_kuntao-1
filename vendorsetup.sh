echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree [1/4]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-20.0-test kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/4]'
# Vendor
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-20.0-test vendor/lenovo

echo 'Cloning system sepolicy [3/4]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-20.0 system/sepolicy

echo 'Cloning revamped fmradio [4/4]'
# Fmradio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to frameworks base for Kuntao [1/12]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0003-Revert-CachedAppOptimizer-use-new-cgroup-api-for-freezer.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0004-Revert-CachedAppOptimizer-remove-native-freezer-enabling-code.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0005-Revert-CachedAppOptimizer-dont-hardcode-freezer-path.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0006-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0007-KernelCpuUidActiveTimeReader-Do-not-spam-log-with-negative-active-time.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0008-Reduce-log-verbosity-Dont-spam-logcat.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0009-Change-the-default-value-of-sync-mode-to-Normal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0010-Disable-vendor-mismatch-warning.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0011-hwui-reset-to-android-13-0-0-r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0012-Fix-the-logic-of-parsing-profilebootclasspath-flags.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0013-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0014-SettingsProvider-Handle-write-device-config-permission.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0015-BatteryStatsService-limit-logspam.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0016-Fix-error-com-google-android-gms-persistent.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0017-Privapp-permissions-Grant-missing-TelephonyProvider-perm.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0018-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <0003-Revert-CachedAppOptimizer-use-new-cgroup-api-for-freezer.patch
patch -p1 <0004-Revert-CachedAppOptimizer-remove-native-freezer-enabling-code.patch
patch -p1 <0005-Revert-CachedAppOptimizer-dont-hardcode-freezer-path.patch
patch -p1 <0006-CachedAppOptimizer-revert-freezer-to-cgroups-v1.patch
patch -p1 <0007-KernelCpuUidActiveTimeReader-Do-not-spam-log-with-negative-active-time.patch
patch -p1 <0008-Reduce-log-verbosity-Dont-spam-logcat.patch
patch -p1 <0009-Change-the-default-value-of-sync-mode-to-Normal.patch
patch -p1 <0010-Disable-vendor-mismatch-warning.patch
patch -p1 <0011-hwui-reset-to-android-13-0-0-r13.patch
patch -p1 <0012-Fix-the-logic-of-parsing-profilebootclasspath-flags.patch
patch -p1 <0013-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0014-SettingsProvider-Handle-write-device-config-permission.patch
patch -p1 <0015-BatteryStatsService-limit-logspam.patch
patch -p1 <0016-Fix-error-com-google-android-gms-persistent.patch
patch -p1 <0017-Privapp-permissions-Grant-missing-TelephonyProvider-perm.patch
patch -p1 <0018-LightsService-Mute-an-annoying-error-message.patch
cd ../..

echo 'Adding patch to Trebuchet for Kuntao [2/12]'
cd packages/apps/Trebuchet
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0001-Trebuchet-Make-overview-scrim-transparent-again.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0002-Trebuchet-Kill-haptics-in-recents.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0003-Trebuchet-Move-clear-all-button-to-actions-view.patch
patch -p1 <0001-Trebuchet-Make-overview-scrim-transparent-again.patch
patch -p1 <0002-Trebuchet-Kill-haptics-in-recents.patch
patch -p1 <0003-Trebuchet-Move-clear-all-button-to-actions-view.patch
cd ../../..

echo 'Adding patch to frameworks native for Kuntao [3/12]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0002-SF-Bring-back-support-for-disabling-backpressure-propagation.patch
wget https://github.com/TrebleDroid/platform_frameworks_native/commit/fb096fb86cfae6f34646e641cbc3e9b47f900d8e.patch
patch -p1 <0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
patch -p1 <0002-SF-Bring-back-support-for-disabling-backpressure-propagation.patch
patch -p1 <fb096fb86cfae6f34646e641cbc3e9b47f900d8e.patch
cd ../..

echo 'Adding patch to frameworks net for Kuntao [4/12]'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_libs_net/0001-Restore-back-the-behavior-of-isValid.patch
patch -p1 <0001-Restore-back-the-behavior-of-isValid.patch
cd ../../..

echo 'Adding patch to system netd for Kuntao [5/12]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_netd/0001-Revert-netd-make-BandwidthController-startup-failures-terminal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_netd/0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
patch -p1 <0001-Revert-netd-make-BandwidthController-startup-failures-terminal.patch
patch -p1 <0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
cd ../..

echo 'Adding patch to system bpf for Kuntao [6/12]'
cd system/bpf
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_bpf/0001-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_bpf/0002-Support-no-bpf-usecase.patch
patch -p1 <0001-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
patch -p1 <0002-Support-no-bpf-usecase.patch
cd ../..

echo 'Adding patch to NetworkStack modules for Kuntao [7/12]'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_NetworkStack/0001-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_NetworkStack/0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
patch -p1 <0001-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
patch -p1 <0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
cd ../../..

echo 'Adding patch to system core for Kuntao [8/12]'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0002-init-reboot-to-recovery-on-panic-by-default-to-allow-reading-pstore.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0003-Camera-Add-feature-extensions.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0004-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0005-init-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0001-Fix-support-for-devices-without-cgroupv2-support.patch
patch -p1 <0002-init-reboot-to-recovery-on-panic-by-default-to-allow-reading-pstore.patch
patch -p1 <0003-Camera-Add-feature-extensions.patch
patch -p1 <0004-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
patch -p1 <0005-init-Dont-enable-f2fs-iostat-by-default.patch
cd ../..

echo 'Adding patch to Connectivity modules for Kuntao [9/12]'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0002-BpfMap-implemented-new-checks-for-kernel-4-14.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0003-Dont-delete-UID-from-BpfMap-on-BPF-less-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0004-Disable-TrafficStats-debugging.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0005-Bring-back-traffic-indicators-for-legacy-devices.patch
patch -p1 <0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
patch -p1 <0002-BpfMap-implemented-new-checks-for-kernel-4-14.patch
patch -p1 <0003-Dont-delete-UID-from-BpfMap-on-BPF-less-kernel.patch
patch -p1 <0004-Disable-TrafficStats-debugging.patch
patch -p1 <0005-Bring-back-traffic-indicators-for-legacy-devices.patch
cd ../../..

echo 'Adding patch to vendor lineage for Kuntao [10/12]'
cd vendor/lineage
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0001-soong-Add-disable-postrender-cleanup-conditional-1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0002-soong-Add-disable-postrender-cleanup-conditional-2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0004-overlay-Add-google-OTA-to-global-disabledComponent.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0005-Allow-gms-to-access-persistent-data-partition.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0006-Optimize-Settings-for-speed.patch
patch -p1 <0001-soong-Add-disable-postrender-cleanup-conditional-1.patch
patch -p1 <0002-soong-Add-disable-postrender-cleanup-conditional-2.patch
patch -p1 <0004-overlay-Add-google-OTA-to-global-disabledComponent.patch
patch -p1 <0005-Allow-gms-to-access-persistent-data-partition.patch
patch -p1 <0006-Optimize-Settings-for-speed.patch
cd ../..

echo 'Adding patch for DeskClock [11/12]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
cd ../../..

echo 'Adding patch for Power hal [12/12]'
cd vendor/qcom/opensource/power
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_qcom_opensource_power/0001-Cancel-the-previous-boost-after-calling-a-new-one.patch
patch -p1 <0001-Cancel-the-previous-boost-after-calling-a-new-one.patch
cd ../../../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'
