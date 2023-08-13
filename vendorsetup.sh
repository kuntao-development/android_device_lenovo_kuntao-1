echo 'Starting to clone stuffs needed for ur kuntao'

echo 'Cloning kernel tree [1/5]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/Astridxx/android_kernel_lenovo_msm8953 -b lineage-20 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/5]'
# Vendor
rm -rf vendor/lenovo && git clone --depth=1 https://github.com/Astridxx/proprietary_vendor_lenovo -b lineage-20 vendor/lenovo

echo 'Cloning system sepolicy [3/5]'
# Sepolicy
rm -rf system/sepolicy && git clone --depth=1 https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-20.0 system/sepolicy

echo 'Cloning system bpf [4/5]'
# Bpf
rm -rf system/bpf && git clone --depth=1 https://github.com/kuntao-development/android_system_bpf -b lineage-20.0 system/bpf

echo 'Cloning revamped fmradio [5/5]'
# Fmradio
git clone --depth=1 https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning process completed, Patching process started...'

echo 'Adding patch to Frameworks base [1/12]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0001-KernelCpuUidActiveTimeReader-Do-not-spam-log-with-negative-active-time.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0002-Reduce-log-verbosity-Dont-spam-logcat.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0003-Change-the-default-value-of-sync-mode-to-Normal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0004-Disable-vendor-mismatch-warning.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0005-hwui-reset-to-android-13-0-0-r13.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0006-Fix-the-logic-of-parsing-profilebootclasspath-flags.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0007-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0008-SettingsProvider-Handle-write-device-config-permission.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0009-BatteryStatsService-limit-logspam.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0010-Fix-error-com-google-android-gms-persistent.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0011-Privapp-permissions-Grant-missing-TelephonyProvider-perm.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0012-LightsService-Mute-an-annoying-error-message.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0013-Add-missing-interact-across-users-full-permission.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0014-NavigationModeController-Mute-debug-logging.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0015-Reduce-screenshot-dismiss-delay-to-2-seconds.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0016-Remove-old-app-target-SDK-dialog.patch
patch -p1 <0001-KernelCpuUidActiveTimeReader-Do-not-spam-log-with-negative-active-time.patch
patch -p1 <0002-Reduce-log-verbosity-Dont-spam-logcat.patch
patch -p1 <0003-Change-the-default-value-of-sync-mode-to-Normal.patch
patch -p1 <0004-Disable-vendor-mismatch-warning.patch
patch -p1 <0005-hwui-reset-to-android-13-0-0-r13.patch
patch -p1 <0006-Fix-the-logic-of-parsing-profilebootclasspath-flags.patch
patch -p1 <0007-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0008-SettingsProvider-Handle-write-device-config-permission.patch
patch -p1 <0009-BatteryStatsService-limit-logspam.patch
patch -p1 <0010-Fix-error-com-google-android-gms-persistent.patch
patch -p1 <0011-Privapp-permissions-Grant-missing-TelephonyProvider-perm.patch
patch -p1 <0012-LightsService-Mute-an-annoying-error-message.patch
patch -p1 <0013-Add-missing-interact-across-users-full-permission.patch
patch -p1 <0014-NavigationModeController-Mute-debug-logging.patch
patch -p1 <0015-Reduce-screenshot-dismiss-delay-to-2-seconds.patch
patch -p1 <0016-Remove-old-app-target-SDK-dialog.patch
cd ../..

echo 'Adding patch to Trebuchet [2/12]'
cd packages/apps/Trebuchet
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0001-Trebuchet-Make-overview-scrim-transparent-again.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0002-Trebuchet-Kill-haptics-in-recents.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0003-Trebuchet-Move-clear-all-button-to-actions-view.patch
patch -p1 <0001-Trebuchet-Make-overview-scrim-transparent-again.patch
patch -p1 <0002-Trebuchet-Kill-haptics-in-recents.patch
patch -p1 <0003-Trebuchet-Move-clear-all-button-to-actions-view.patch
cd ../../..

echo 'Adding patch to Frameworks native [3/12]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0002-SF-Bring-back-support-for-disabling-backpressure-propagation.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0003-Mark-accelerometer-input-as-sensor-exclusively-if-there-are-ABS-axis.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0004-Disable-gpu-service.patch
patch -p1 <0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
patch -p1 <0002-SF-Bring-back-support-for-disabling-backpressure-propagation.patch
patch -p1 <0003-Mark-accelerometer-input-as-sensor-exclusively-if-there-are-ABS-axis.patch
patch -p1 <0004-Disable-gpu-service.patch
cd ../..

echo 'Adding patch to Frameworks net [4/12]'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_libs_net/0001-Support-no-BPF-usecase.patch
patch -p1 <0001-Support-no-BPF-usecase.patch
cd ../../..

echo 'Adding patch to System netd [5/12]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_netd/0001-Add-no-BPF-usecase-support.patch
patch -p1 <0001-Add-no-BPF-usecase-support.patch
cd ../..

echo 'Adding patch to NetworkStack modules [6/12]'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_NetworkStack/0001-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_NetworkStack/0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
patch -p1 <0001-Revert-Enable-parsing-netlink-events-from-kernel-sin.patch
patch -p1 <0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
cd ../../..

echo 'Adding patch to System core [7/12]'
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

echo 'Adding patch to Connectivity modules [8/12]'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/001-Support-no-BPF-usecase.patch
patch -p1 <001-Support-no-BPF-usecase.patch
cd ../../..

echo 'Adding patch to Vendor lineage [9/12]'
cd vendor/lineage
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0001-soong-Add-disable-postrender-cleanup-conditional.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0002-overlay-Add-google-OTA-to-global-disabledComponent.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0003-Allow-gms-to-access-persistent-data-partition.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0004-Optimize-Settings-for-speed.patch
patch -p1 <0001-soong-Add-disable-postrender-cleanup-conditional.patch
patch -p1 <0002-overlay-Add-google-OTA-to-global-disabledComponent.patch
patch -p1 <0003-Allow-gms-to-access-persistent-data-partition.patch
patch -p1 <0004-Optimize-Settings-for-speed.patch
cd ../..

echo 'Adding patch to Settings [10/12]'
cd packages/apps/Settings
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Settings/0001-Add-navbar-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Settings/0002-Add-a-preference-to-battery-optimization-page.patch
patch -p1 <0001-Add-navbar-support.patch
patch -p1 <0002-Add-a-preference-to-battery-optimization-page.patch
cd ../../..

echo 'Adding patcht to DeskClock [11/12]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
patch -p1 <0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
cd ../../..

echo 'Adding patch to Power hal [12/12]'
cd vendor/qcom/opensource/power
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_qcom_opensource_power/0001-Cancel-the-previous-boost-after-calling-a-new-one.patch
patch -p1 <0001-Cancel-the-previous-boost-after-calling-a-new-one.patch
cd ../../../..

echo 'Patching process completed'

echo 'delete vendorsetup.sh from device tree once this is done'

