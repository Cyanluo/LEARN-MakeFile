.PHONY: all clean

vpath %$(TYPE_SRC) $(DIR_SRC)
vpath %$(TYPE_HEAD) $(DIR_INC)
vpath %$(TYPE_HEAD) $(DIR_COMMON_INC)
vpath %$(TYPE_HEAD) $(DIR_LIBS_INC)

MODULE := $(realpath .)
MODULE := $(notdir $(MODULE))

DIR_OUTPUT := $(addprefix $(DIR_BUILD)/, $(MODULE))

SRCS := $(wildcard $(DIR_SRC)/*$(TYPE_SRC))
OBJS := $(SRCS:$(TYPE_SRC)=$(TYPE_OBJ))
OBJS := $(patsubst $(DIR_SRC)/%, $(DIR_OUTPUT)/%, $(OBJS))
DEPS := $(SRCS:$(TYPE_SRC)=$(TYPE_DEP))
DEPS := $(patsubst $(DIR_SRC)/%, $(DIR_OUTPUT)/%, $(DEPS))

OUTPUT := $(DIR_BUILD)/$(MODULE).a

all: $(OUTPUT)
	@echo "Success to create $(OUTPUT)..."

ifeq ($(MAKECMDGOALS),)
-include $(DEPS)
endif
ifeq ($(MAKECMDGOALS),all)
-include $(DEPS)
endif

$(OUTPUT): $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

$(DIR_OUTPUT)/%$(TYPE_OBJ): %$(TYPE_SRC)
	$(CC) $(CFLAGS) -o $@ -c $(filter %$(TYPE_SRC), $^)

$(DIR_OUTPUT)/%$(TYPE_DEP): %$(TYPE_SRC)
	@echo "Create dep => $@"
	@set -e; \
	$(CC) $(CFLAGS) -MM -E $^ | sed "s,\(.*\)$(TYPE_OBJ)[ :]*\b,$(DIR_OUTPUT)\/\1$(TYPE_OBJ) $@: ,g" > $@

clean:
	$(RM) $(DIR_OUTPUT)/* OUTPUT