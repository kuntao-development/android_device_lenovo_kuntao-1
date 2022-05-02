LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := GrapheneCamera
LOCAL_SRC_FILES := $(LOCAL_MODULE).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_OVERRIDES_PACKAGES := SnapdragonCamera Snap Camera2 Camera
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.camera.extensions.impl
include $(BUILD_PREBUILT)