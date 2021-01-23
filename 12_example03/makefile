.PHONY : all clean rebuild
CC := gcc

SRC_TYPE := .c
INC_TYPE := .h
LNK_TYPE := .o
DEP_TYPE := .dep

BUILD_DIR := build
INCS_DIR := inc
SRCS_DIR := src
DEPS_DIR := deps
OBJS_DIR := $(BUILD_DIR)

CFLAGS += -I $(INCS_DIR)
LFLAGS :=

APP := $(BUILD_DIR)/app.out

SRCS := $(wildcard $(SRCS_DIR)/*$(SRC_TYPE))

OBJS := $(SRCS:$(SRC_TYPE)=$(LNK_TYPE))
OBJS := $(patsubst $(SRCS_DIR)/%, $(BUILD_DIR)/%, $(OBJS))

DEPS := $(SRCS:$(SRC_TYPE)=$(DEP_TYPE))
DEPS := $(patsubst $(SRCS_DIR)/%, $(DEPS_DIR)/%, $(DEPS))

DIRS := $(BUILD_DIR) $(DEPS_DIR)

MKDIR := mkdir
RM := rm -rf

vpath %$(SRC_TYPE) $(SRCS_DIR)
vpath %$(INC_TYPE) $(INCS_DIR)

all: $(BUILD_DIR) $(APP)
	@echo "success to build $(notdir $(APP))..."

ifeq ($(DEBUG),true)
CFLAGS += -g
endif

ifeq ($(MAKECMDGOALS),)
-include $(DEPS)
endif
ifeq ($(MAKECMDGOALS),all)
-include $(DEPS)
endif

$(APP): $(OBJS)
	$(CC) $(LFLAGS) -o $@ $^

ifeq ($(wildcard $(DEPS_DIR)),)
$(DEPS_DIR)/%$(DEP_TYPE): $(DEPS_DIR) %$(SRC_TYPE)
else
$(DEPS_DIR)/%$(DEP_TYPE): %$(SRC_TYPE)
endif
	@echo "Create dep => $@"
	@set -e;\
	$(CC) -MM -E $(CFLAGS) $(filter %$(SRC_TYPE), $^) | sed 's,\(.*\)$(LNK_TYPE)[: ]*\b,$(OBJS_DIR)\/\1$(LNK_TYPE) $@:,g' > $@

$(DIRS):
	$(MKDIR) $@

$(BUILD_DIR)/%$(LNK_TYPE) : %$(SRC_TYPE)
	$(CC) $(CFLAGS) -o $@ -c $(filter %$(SRC_TYPE), $^)

clean:
	$(RM) $(DIRS)

rebuild:
	$(MAKE) clean
	$(MAKE) all
