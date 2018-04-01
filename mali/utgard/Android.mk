ifneq ($(filter hikey, $(TARGET_DEVICE)),)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := END_USER_LICENCE_AGREEMENT.txt
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := $(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)
LOCAL_MULTILIB := 32
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libGLES_mali.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := lib/egl/$(LOCAL_MODULE)
LOCAL_SRC_FILES_arm64 := lib64/egl/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/egl/
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/egl/
LOCAL_MULTILIB := both
include $(BUILD_PREBUILT)

endif


