# GNU Make project makefile autogenerated by Premake

ifndef config
  config=release_x86_64
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),release_x86_64)
  RESCOMP = windres
  TARGETDIR = x86_64_Release
  TARGET = $(TARGETDIR)/libktt.so
  OBJDIR = x86_64_Release/obj/x86_64/Release/ktt
  DEFINES += -DKTT_CONFIGURATION_RELEASE -DKTT_LIBRARY -DKTT_PLATFORM_NVIDIA -DKTT_PLATFORM_OPENCL -DKTT_PLATFORM_CUDA
  INCLUDES += -I../source -I"$(CUDA_PATH)/include" -I"$(CUDA_PATH)/extras/CUPTI/include"
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -fPIC
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -fPIC -std=c++14
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -lOpenCL -lcuda -L/usr/local/cuda-10.1/targets/x86_64-linux/lib -lnvrtc
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L"$(CUDA_PATH)/lib64" -L"$(CUDA_PATH)/extras/CUPTI/lib64" -L/usr/lib64 -m64 -shared -Wl,-soname=libktt.so -s
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x86_64)
  RESCOMP = windres
  TARGETDIR = x86_64_Debug
  TARGET = $(TARGETDIR)/libktt.so
  OBJDIR = x86_64_Debug/obj/x86_64/Debug/ktt
  DEFINES += -DKTT_CONFIGURATION_DEBUG -DKTT_LIBRARY -DKTT_PLATFORM_NVIDIA -DKTT_PLATFORM_OPENCL -DKTT_PLATFORM_CUDA
  INCLUDES += -I../source -I"$(CUDA_PATH)/include" -I"$(CUDA_PATH)/extras/CUPTI/include"
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -fPIC -g
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CPPFLAGS) -m64 -fPIC -g -std=c++14
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS += -lOpenCL -lcuda -lnvrtc
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L"$(CUDA_PATH)/lib64" -L"$(CUDA_PATH)/extras/CUPTI/lib64" -L/usr/lib64 -m64 -shared -Wl,-soname=libktt.so
  LINKCMD = $(CXX) -o "$@" $(OBJECTS) $(RESOURCES) $(ALL_LDFLAGS) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/Benchmark.o \
	$(OBJDIR)/computation_result.o \
	$(OBJDIR)/device_info.o \
	$(OBJDIR)/dimension_vector.o \
	$(OBJDIR)/kernel_profiling_counter.o \
	$(OBJDIR)/kernel_profiling_data.o \
	$(OBJDIR)/output_descriptor.o \
	$(OBJDIR)/parameter_pair.o \
	$(OBJDIR)/platform_info.o \
	$(OBJDIR)/tuning_manipulator.o \
	$(OBJDIR)/cuda_engine.o \
	$(OBJDIR)/cuda_utility.o \
	$(OBJDIR)/opencl_engine.o \
	$(OBJDIR)/opencl_utility.o \
	$(OBJDIR)/vulkan_engine.o \
	$(OBJDIR)/vulkan_utility.o \
	$(OBJDIR)/kernel_result.o \
	$(OBJDIR)/kernel_runtime_data.o \
	$(OBJDIR)/local_memory_modifier.o \
	$(OBJDIR)/kernel.o \
	$(OBJDIR)/kernel_composition.o \
	$(OBJDIR)/kernel_configuration.o \
	$(OBJDIR)/kernel_constraint.o \
	$(OBJDIR)/kernel_manager.o \
	$(OBJDIR)/kernel_parameter.o \
	$(OBJDIR)/kernel_parameter_pack.o \
	$(OBJDIR)/argument_manager.o \
	$(OBJDIR)/kernel_argument.o \
	$(OBJDIR)/tuner_api.o \
	$(OBJDIR)/tuner_core.o \
	$(OBJDIR)/configuration_manager.o \
	$(OBJDIR)/configuration_storage.o \
	$(OBJDIR)/kernel_runner.o \
	$(OBJDIR)/manipulator_interface_implementation.o \
	$(OBJDIR)/result_validator.o \
	$(OBJDIR)/tuning_runner.o \
	$(OBJDIR)/ktt_utility.o \
	$(OBJDIR)/logger.o \
	$(OBJDIR)/result_loader.o \
	$(OBJDIR)/result_printer.o \
	$(OBJDIR)/timer.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := posix
ifeq (.exe,$(findstring .exe,$(ComSpec)))
	SHELLTYPE := msdos
endif

$(TARGET): $(GCH) ${CUSTOMFILES} $(OBJECTS) $(LDDEPS) $(RESOURCES) | $(TARGETDIR)
	@echo Linking ktt
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(CUSTOMFILES): | $(OBJDIR)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning ktt
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH) | $(OBJDIR)
$(GCH): $(PCH) | $(OBJDIR)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
else
$(OBJECTS): | $(OBJDIR)
endif

$(OBJDIR)/Benchmark.o: ../source/Benchmark.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/computation_result.o: ../source/api/computation_result.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/device_info.o: ../source/api/device_info.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/dimension_vector.o: ../source/api/dimension_vector.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_profiling_counter.o: ../source/api/kernel_profiling_counter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_profiling_data.o: ../source/api/kernel_profiling_data.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/output_descriptor.o: ../source/api/output_descriptor.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/parameter_pair.o: ../source/api/parameter_pair.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/platform_info.o: ../source/api/platform_info.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tuning_manipulator.o: ../source/api/tuning_manipulator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/cuda_engine.o: ../source/compute_engine/cuda/cuda_engine.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/cuda_utility.o: ../source/compute_engine/cuda/cuda_utility.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/opencl_engine.o: ../source/compute_engine/opencl/opencl_engine.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/opencl_utility.o: ../source/compute_engine/opencl/opencl_utility.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/vulkan_engine.o: ../source/compute_engine/vulkan/vulkan_engine.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/vulkan_utility.o: ../source/compute_engine/vulkan/vulkan_utility.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_result.o: ../source/dto/kernel_result.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_runtime_data.o: ../source/dto/kernel_runtime_data.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/local_memory_modifier.o: ../source/dto/local_memory_modifier.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel.o: ../source/kernel/kernel.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_composition.o: ../source/kernel/kernel_composition.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_configuration.o: ../source/kernel/kernel_configuration.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_constraint.o: ../source/kernel/kernel_constraint.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_manager.o: ../source/kernel/kernel_manager.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_parameter.o: ../source/kernel/kernel_parameter.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_parameter_pack.o: ../source/kernel/kernel_parameter_pack.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/argument_manager.o: ../source/kernel_argument/argument_manager.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_argument.o: ../source/kernel_argument/kernel_argument.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tuner_api.o: ../source/tuner_api.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tuner_core.o: ../source/tuner_core.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/configuration_manager.o: ../source/tuning_runner/configuration_manager.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/configuration_storage.o: ../source/tuning_runner/configuration_storage.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/kernel_runner.o: ../source/tuning_runner/kernel_runner.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/manipulator_interface_implementation.o: ../source/tuning_runner/manipulator_interface_implementation.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/result_validator.o: ../source/tuning_runner/result_validator.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/tuning_runner.o: ../source/tuning_runner/tuning_runner.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/ktt_utility.o: ../source/utility/ktt_utility.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/logger.o: ../source/utility/logger.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/result_loader.o: ../source/utility/result_loader.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/result_printer.o: ../source/utility/result_printer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/timer.o: ../source/utility/timer.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
