CC := gcc
RM := rm -rf
MKDIR := mkdir
CP := cp

LFLAGS :=
CFLAGS := -I$(DIR_INC) -I$(DIR_COMMON_INC) -I$(DIR_LIBS_INC)
ARFLAGS := rcs

ifeq ($(DEBUG),true)
CFLAGS += -g
endif