GNSS_CFLAGS := \
    -Werror \
    -Wno-unused-parameter \
    -Wno-error=format \
    -Wno-error=macro-redefined \
    -Wno-error=reorder \
    -Wno-reorder-ctor \
    -Wno-error=missing-braces \
    -Wno-error=self-assign \
    -Wno-enum-conversion \
    -Wno-error=logical-op-parentheses \
    -Wno-error=null-arithmetic \
    -Wno-error=null-conversion \
    -Wno-error=parentheses-equality \
    -Wno-undefined-bool-conversion \
    -Wno-error=tautological-compare \
    -Wno-error=switch \
    -Wno-error=date-time

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libloc_pla_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/android
include $(BUILD_HEADER_LIBRARY)
