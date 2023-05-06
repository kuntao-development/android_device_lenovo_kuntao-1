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

echo 'Cloning display hal [4/15]'
# Display
rm -rf hardware/qcom-caf/msm8996/display && git clone https://github.com/kuntao-development/android_hardware_qcom_display -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/display

echo 'Cloning revamped fmradio [5/15]'
# Fmradio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Adding patch to frameworks base for Kuntao [6/15]'
cd frameworks/base
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0001-Disable-magnifier-position-animation.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/framework_base/0002-Remove-GarbageMonitor-tile.patch
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
git apply *.patch

cd ../..

echo 'Adding patch to Trebuchet for Kuntao [7/15]'
cd packages/apps/Trebuchet
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0001-Trebuchet-Make-overview-scrim-transparent-again.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0002-Trebuchet-Kill-haptics-in-recents.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_Trebuchet/0003-Trebuchet-Move-clear-all-button-to-actions-view.patch
git apply *.patch

cd ../../..

echo 'Adding patch to frameworks native for Kuntao [8/15]'
cd frameworks/native
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0001-SurfaceFlinger-Dont-cleanup-resources-from-previous-frame-on-display.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0002-SF-Bring-back-support-for-disabling-backpressure-propagation.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_native/0003-Disable-gpu-service-for-bpf.patch
git apply *.patch

cd ../..

echo 'Adding patch to frameworks net for Kuntao [8/15]'
cd frameworks/libs/net
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/frameworks_libs_net/0001-Restore-back-the-behavior-of-isValid.patch
git apply *.patch

cd ../../..

echo 'Adding patch to system netd for Kuntao [9/15]'
cd system/netd
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_netd/0001-Revert-netd-make-BandwidthController-startup-failures-terminal.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_netd/0002-Dont-abort-in-case-of-cgroup-bpf-setup-fail.patch
git apply *.patch

cd ../..

echo 'Adding patch to system bpf for Kuntao [10/15]'
cd system/bpf
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_bpf/0001-Revert-detect-inability-to-write-to-index-of-bpf-map-array.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_bpf/0002-Support-no-bpf-usecase.patch
git apply *.patch

cd ../..

echo 'Adding patch to NetworkStack modules for Kuntao [11/15]'
cd packages/modules/NetworkStack
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_NetworkStack/0001-Revert-Enable-parsing-netlink-events-from-kernel-since-T.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_NetworkStack/0002-Opt-out-for-TCP-info-parsing-on-legacy-kernels.patch
git apply *.patch

cd ../../..

echo 'Adding patch to system core for Kuntao [12/15]'
cd system/core
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0001-Fix-support-for-devices-without-cgroupv2-support.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0002-init-reboot-to-recovery-on-panic-by-default-to-allow-reading-pstore.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0003-Camera-Add-feature-extensions.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0004-init-Disable-bootreceiver-tracing-instance-for-3-18-kernel.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/system_core/0005-init-Dont-enable-f2fs-iostat-by-default.patch
git apply *.patch

cd ../..

echo 'Adding patch to Connectivity modules for Kuntao [13/15]'
cd packages/modules/Connectivity
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0001-Allow-failing-to-load-bpf-programs-for-BPF-less-devices.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0002-BpfMap-implemented-new-checks-for-kernel-4-14.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_modules_Connectivity/0003-Dont-delete-UID-from-BpfMap-on-BPF-less-kernel.patch
git apply *.patch

cd ../../..

echo 'Adding patch for DeskClock [14/15]'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_DeskClock/0001-DeskClock-Ensure-ringtone-is-playing-when-starting-the-crescendo-effect.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_DeskClock/0002-DeskClock-Remove-night-mode.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_DeskClock/0003-DeskClock-Adapt-digital-clocks-to-S-style.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/packages_apps_DeskClock/0004-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
git apply *.patch

cd ../../..

echo 'Adding patch to vendor lineage for Kuntao [15/15]'
cd vendor/lineage
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0001-soong-Add-disable-postrender-cleanup-conditional-1.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0002-soong-Add-disable-postrender-cleanup-conditional-2.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0003-overlay-Drop-config-displayLightSensorType.patch
wget https://raw.githubusercontent.com/Astridxx/Patch-kuntao/lineage-20/vendor_lineage/0004-overlay-Add-google-OTA-to-global-disabledComponent.patch
git apply *.patch

cd ../..

echo 'Completed, proceeding to lunch'
