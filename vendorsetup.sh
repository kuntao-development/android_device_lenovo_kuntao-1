echo 'Starting to clone stuffs needed for your device'

echo 'Cloning kernel tree [1/15]'
# Kernel
rm -rf kernel/lenovo/msm8953 && git clone --depth=1 https://github.com/kuntao-development/android_kernel_lenovo_msm8953 -b lineage-19.1 kernel/lenovo/msm8953 

echo 'Cloning vendor tree [2/15]'
# Vendor
rm -rf vendor/lenovo && git clone https://github.com/Astridxx/proprietary_vendor_lenovo -b los-19.1 vendor/lenovo

echo 'Cloning frameworks base [3/15]'
# Frameworks
rm -rf frameworks/base && git clone --depth=1 https://github.com/kuntao-development/android_frameworks_base-1 -b 12.1 frameworks/base

echo 'Cloning system netd [4/15]'
# Netd
rm -rf system/netd && git clone https://github.com/kuntao-development/android_system_netd -b cr-12.1 system/netd

echo 'Cloning system bpf [5/15]'
# Bpf
rm -rf system/bpf && git clone https://github.com/Astridxx/android_system_bpf -b lineage-19.1 system/bpf

echo 'Cloning system libhidl [6/15]'
# Hidl
rm -rf system/libhidl && git clone https://github.com/Astridxx/android_system_libhidl -b lineage-19.1 system/libhidl

echo 'Cloning system lmkd [7/15]'
# Lmkd
rm -rf system/memory/lmkd && git clone https://github.com/crdroidandroid/android_system_memory_lmkd -b 12.0 system/memory/lmkd

echo 'Cloning system sepolicy [8/15]'
# Sepolicy
rm -rf system/sepolicy && git clone https://github.com/LineageOS-UL/android_system_sepolicy -b lineage-19.1 system/sepolicy

echo 'Cloning system core [9/15]'
# Core
rm -rf system/core && git clone https://github.com/kuntao-development/android_system_core -b 12.1 system/core

echo 'Cloning frameworks native [10/15]'
# Native
rm -rf frameworks/native && git clone https://github.com/kuntao-development/android_frameworks_native -b 12.1 frameworks/native

echo 'Cloning system logging [11/15]'
# Logging
rm -rf system/logging && git clone https://github.com/Astridxx/android_system_logging -b lineage-19.1 system/logging

echo 'Cloning settings [12/15]'
# Settings
rm -rf packages/apps/Settings && git clone https://github.com/kuntao-development/android_packages_apps_Settings -b 12.1 packages/apps/Settings

echo 'Cloning crDroidSettings [13/15]'
# crDroidSettings
rm -rf packages/apps/crDroidSettings && git clone https://github.com/kuntao-development/android_packages_apps_crDroidSettings -b 12.1 packages/apps/crDroidSettings

echo 'Cloning vendor lineage [14/15]'
# Lineage vendor
rm -rf vendor/lineage && git clone https://github.com/kuntao-development/android_vendor_crdroid -b 12.1 vendor/lineage

echo 'Cloning revamped fmradio [15/15]'
# Fm radio
git clone https://github.com/iusmac/RevampedFMRadio -b qcom packages/apps/RevampedFMRadio

echo 'Cloning process completed'

echo 'Merging 2023 May security patch...'
cd frameworks/base
wget https://github.com/LineageOS/android_frameworks_base/commit/da40a046caf74dfb789bb5cdd3b7d2847f9c956a.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/1645ad8ce3f70201f3e8315bbc329b1e09ff2b49.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/2e7af97f081b0985e14d63df2c50f948b6f9075d.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/54a73e2f6ca472fe66039ab2823fdc2a5ba26cf2.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/299efd901061ccc2a243df9d9b8059dffa9861ea.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/af52e36a81099ffc43e898f74f1e8f70ec1de2e3.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/6d2f7829dd6e3fdcc6ebff0c2d9e16c3a069ad9d.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/f64311b32d86df04746b885d4ed0111d588fd48b.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/2552ea758a9eb3c0b7f12426214a3c4c7fad0bca.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/8ef7fac04f4331e2c029002d8d99eb2246d74625.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/e026818a26445b2a67b55108e1e3e05ca01ccb7b.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/a0f0bd03a63c7a982209c0997637eb4797d0b3d9.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/84a1cc875280fd7a2b60642303a1755f5edcdfaa.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/79d93158979161d6d3a842ec9400a03c5074e06f.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/250579138c44374e207d60a71637490e797ef540.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/e82446502de5989274829c70b84bf43b2d217001.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/802dbc02ee70de1385060424e42497a22a6a0484.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/6f4c85a9fe2bd0f8f9408df001ea7651e9706dda.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/a71883f3081348371482d96d71dc119ef2f7d463.patch
wget https://github.com/LineageOS/android_frameworks_base/commit/0b338a6b51eb75b6673db99e7aa7a037bfcf6cc8.patch
wget https://github.com/Astridxx/android_frameworks_base-2/commit/8455b150f1b92567ed46199244c7bdc90af232ac.patch
patch -p1 <da40a046caf74dfb789bb5cdd3b7d2847f9c956a.patch
patch -p1 <1645ad8ce3f70201f3e8315bbc329b1e09ff2b49.patch
patch -p1 <2e7af97f081b0985e14d63df2c50f948b6f9075d.patch
patch -p1 <54a73e2f6ca472fe66039ab2823fdc2a5ba26cf2.patch
patch -p1 <299efd901061ccc2a243df9d9b8059dffa9861ea.patch
patch -p1 <af52e36a81099ffc43e898f74f1e8f70ec1de2e3.patch
patch -p1 <6d2f7829dd6e3fdcc6ebff0c2d9e16c3a069ad9d.patch
patch -p1 <f64311b32d86df04746b885d4ed0111d588fd48b.patch
patch -p1 <2552ea758a9eb3c0b7f12426214a3c4c7fad0bca.patch
patch -p1 <8ef7fac04f4331e2c029002d8d99eb2246d74625.patch
patch -p1 <e026818a26445b2a67b55108e1e3e05ca01ccb7b.patch
patch -p1 <a0f0bd03a63c7a982209c0997637eb4797d0b3d9.patch
patch -p1 <bf5e311a62402faec23ced81850ff265f0e80fbd.patch
patch -p1 <84a1cc875280fd7a2b60642303a1755f5edcdfaa.patch
patch -p1 <79d93158979161d6d3a842ec9400a03c5074e06f.patch
patch -p1 <250579138c44374e207d60a71637490e797ef540.patch
patch -p1 <e82446502de5989274829c70b84bf43b2d217001.patch
patch -p1 <802dbc02ee70de1385060424e42497a22a6a0484.patch
patch -p1 <6f4c85a9fe2bd0f8f9408df001ea7651e9706dda.patch
patch -p1 <a71883f3081348371482d96d71dc119ef2f7d463.patch
patch -p1 <0b338a6b51eb75b6673db99e7aa7a037bfcf6cc8.patch
patch -p1 <8455b150f1b92567ed46199244c7bdc90af232ac.patch
cd ../..

cd packages/apps/Settings
wget https://github.com/LineageOS/android_packages_apps_Settings/commit/5397fd5b3206e90113ac253917f0e9a039d79e22.patch
wget https://github.com/LineageOS/android_packages_apps_Settings/commit/d2ec1dfa7976d8660275a7b394618270c7ecebf6.patch
patch -p1 <5397fd5b3206e90113ac253917f0e9a039d79e22.patch
patch -p1 <d2ec1dfa7976d8660275a7b394618270c7ecebf6.patch
cd ../../..

cd frameworks/native
wget https://github.com/LineageOS/android_frameworks_native/commit/b36f1b4913ec000c1e4eb4afd790fe59363ffe40.patch
wget https://github.com/LineageOS/android_frameworks_native/commit/671e27eb25a5864a5efe2f66fba556287c90c5de.patch
wget https://github.com/LineageOS/android_frameworks_native/commit/3f2bcc16ccc2622b4d63fea633c104386f4a181e.patch
wget https://github.com/LineageOS/android_frameworks_native/commit/9a8850ce7273e66472c72f337840f70c41e50b6c.patch
patch -p1 <b36f1b4913ec000c1e4eb4afd790fe59363ffe40.patch
patch -p1 <671e27eb25a5864a5efe2f66fba556287c90c5de.patch
patch -p1 <3f2bcc16ccc2622b4d63fea633c104386f4a181e.patch
patch -p1 <9a8850ce7273e66472c72f337840f70c41e50b6c.patch
cd ../..

cd build/make
wget https://github.com/LineageOS/android_build/commit/9d5a7b605d51be9724c94c9b2902c6b5f1acacae.patch
wget https://github.com/LineageOS/android_build/commit/b01b2de858532b65ce1002026418ed014bd7c121.patch
patch -p1 <9d5a7b605d51be9724c94c9b2902c6b5f1acacae.patch
patch -p1 <b01b2de858532b65ce1002026418ed014bd7c121.patch
cd ../..

cd external/angle
wget https://github.com/LineageOS/android_external_angle/commit/86b7a6e8842f9defeabfb264839add5e792bd4c1.patch
patch -p1 <86b7a6e8842f9defeabfb264839add5e792bd4c1.patch
cd ../..

echo 'Security patch merged'

echo 'Adding patch to DeskClock...'
cd packages/apps/DeskClock
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0001-DeskClock-Remove-night-mode.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0002-DeskClock-Adapt-digital-clocks-to-S-style.patch
wget https://raw.githubusercontent.com/AndyCGYan/lineage_patches_unified/lineage-19.1/patches_platform_personal/packages_apps_DeskClock/0003-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
wget https://github.com/Astridxx/android_packages_apps_DeskClock-1/commit/954a41ced3250f0b1e39836d521037019b5ae7c7.patch
patch -p1 <0001-DeskClock-Remove-night-mode.patch
patch -p1 <0002-DeskClock-Adapt-digital-clocks-to-S-style.patch
patch -p1 <0003-DeskClock-Wallpaper-based-text-coloring-for-digital-.patch
patch -p1 <954a41ced3250f0b1e39836d521037019b5ae7c7.patch
cd ../../..

echo 'Patch added to DeskClock, proceeding to lunch'
