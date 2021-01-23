
.PHONY: all compile link clean rebuild $(MODULES)

DIR_PROJECT := $(realpath .)

DIR_BUILD_SUB := $(addprefix $(DIR_BUILD)/, $(MODULES))

MODULE_LIB := $(addsuffix .a, $(MODULES))
MODULE_LIB := $(addprefix $(DIR_BUILD)/, $(MODULE_LIB))

EXTERN_LIB := $(wildcard $(DIR_EXTERN_LIB)/*)
EXTERN_LIB := $(patsubst $(DIR_EXTERN_LIB)/%, $(DIR_BUILD)/%, $(EXTERN_LIB))

APP := $(addprefix $(DIR_BUILD)/, $(APP))

define makemodule
cd $(1) && \
		$(MAKE) all \
				DEBUG:=$(DEBUG) \
				DIR_BUILD:=$(addprefix $(DIR_PROJECT)/, $(DIR_BUILD)) \
				DIR_COMMON_INC:=$(addprefix $(DIR_PROJECT)/, $(DIR_COMMON_INC)) \
				DIR_LIBS_INC:=$(addprefix $(DIR_PROJECT)/, $(DIR_LIBS_INC)) \
				MOD_RULE:=$(addprefix $(DIR_PROJECT)/, $(MOD_RULE)) \
				MOD_CFG:=$(addprefix $(DIR_PROJECT)/, $(MOD_CFG)) \
				CMD_CFG:=$(addprefix $(DIR_PROJECT)/, $(CMD_CFG)) && \
		cd ..;
endef

all: compile $(APP)
	@echo "Success to build target => $(APP)"

compile: $(DIR_BUILD) $(DIR_BUILD_SUB)
	@echo "Begin to compile..."
	@set -e;\
	for dir in $(MODULES);\
	do\
		$(call makemodule, $$dir) \
	done
	@echo "Compile Success!!!" 

link $(APP): $(MODULE_LIB) $(EXTERN_LIB)
	@echo "Begin to link..."
	$(CC) -o $(APP) $(LFLAGS) -Xlinker "-(" $^ -Xlinker "-)"
	@echo "Link Success!!!"

$(DIR_BUILD)/%: $(DIR_EXTERN_LIB)/%
	$(CP) $^ $@

$(DIR_BUILD) $(DIR_BUILD_SUB):
	$(MKDIR) $@

clean:
	@echo "Begin to clean..."
	$(RM) $(DIR_BUILD)
	@echo "clean Success!!!"

rebuild: clean all

$(MODULES): $(DIR_BUILD) $(DIR_BUILD)/$(MAKECMDGOALS)
	@echo "Begin to compile $@"
	@set -e ;\
	$(call makemodule, $@)
	@echo "Compile $@ Success!!!"
