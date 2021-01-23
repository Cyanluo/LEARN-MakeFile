CC := gcc

TARGET_DIR := target
OBJS_DIR := objs
DIRS := $(TARGET_DIR) $(OBJS_DIR)

TARGET := $(TARGET_DIR)/hello-makefile.out

RM = rm -rf
MKDIR = mkdir

SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)
OBJS := $(addprefix $(OBJS_DIR)/, $(OBJS))

.PHONY: all clean rebulid

$(TARGET): $(DIRS) $(OBJS)
	$(CC) -o $@ $(OBJS)

$(DIRS):
	$(MKDIR) $@

$(OBJS_DIR)/%.o: %.c
    ifeq ($(Debug),true)
		$(CC) -o $@ -g -c $^
    else
		$(CC) -o $@ -c $^
    endif

clean:
	$(RM) $(DIRS)

all: $(TARGET)

rebulid: clean all
