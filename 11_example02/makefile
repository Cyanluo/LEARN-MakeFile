CC := gcc

.PHONY: all clean rebuild

SRCS := $(wildcard *.c)
DEPS := $(SRCS:.c=.dep)
OBJS := $(SRCS:.c=.o)

DEP_DIR := deps
DEPS := $(addprefix $(DEP_DIR)/, $(DEPS))

OBJS_DIR := objs
OBJS := $(addprefix $(OBJS_DIR)/, $(OBJS))

EXE := hello-makefile.out
EXE_DIR := exe
EXE := $(addprefix $(EXE_DIR)/, $(EXE))

DIRS := $(DEP_DIR) $(OBJS_DIR) $(EXE_DIR)

MKDIR := mkdir
RM := rm -rf

all:  $(OBJS_DIR) $(EXE_DIR) $(EXE)

$(EXE): $(OBJS) 
	$(CC) -o $@ $^

ifeq ($(MAKECMDGOALS),)
-include $(DEPS)
endif
ifeq ($(MAKECMDGOALS),all)
-include $(DEPS)
endif

ifeq ($(wildcard $(DEP_DIR)),)
$(DEP_DIR)/%.dep : $(DEP_DIR) %.c
else
$(DEP_DIR)/%.dep :  %.c
endif
	@echo "Create dep => $@"
	@set -e;\
	$(CC) -MM -E $(filter %.c, $^) | sed 's,\(.*\)\.o[: ]*,$(OBJS_DIR)\/\1.o $@: ,g' > $@

$(OBJS_DIR)/%.o: %.c
	$(CC) -o $@ -c $(filter %.c, $^)

$(DIRS):
	$(MKDIR) $@

clean:
	$(RM) $(DIRS)

rebuild:
	$(MAKE) clean
	$(MAKE) all
