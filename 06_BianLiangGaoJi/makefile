

# 变量的替换：使用指定字符（串）替换变量中的后缀字符（串）
# 语法：$(var:a=b) 或 ${var:a=b}
#     1. 替换表达式不能有任何空格
#	  2. make中支持使用${}对变量进行取值

src := a.cc b.cc c.cc
obj := $(src:cc=o)

test1:
	@echo "obj => ${obj}"


# 模式替换：使用%保留变量中的指定字符，替换其它字符
# 语法：$(var:a%b=x%y)或%{var:b%b=x%y}

src := a1b.c a2b.c a3b.c
obj := $(src:a%b.c=x%y)

test2:
	@echo "obj => $(obj)"

# 规则的模式替换
# 语法： targets : target-pattern : prereq-pattern
#			command1
#			command2
# 通过 target-pattern 从targets中匹配子目标；再通过prereq-pattern
# 从子目标生成依赖，进而构成完整规则
CC := gcc
TARGET := hello.out
OBJS := main.o func.o

all $(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(OBJS): %.o : %.c
	$(CC) -o $@ -c $^

.PHONY: clean

clean:
	$(RM) *.o $(TARGET)

# 命令行变量  make hm=cmd
# 命令行变量默认覆盖Makefile中定义的变量
# override 用于指示Makefile中定义的变量不能被覆盖
# 变量的定义和赋值都需要使用override
# 变量可以嵌套 $($(b))

# define 
# 定义多行变量
# endef结束 可以用override防止覆盖
# define定义的变量等价于=定义的变量

hm := cmd_test
override var := override_test
#override var := var2
define foo
hello world
endef

override define cmd
	echo "test_define"
	echo "endef"
endef

test3:
	echo "hm => $(hm)"
	echo "var => $(var)"
	$(cmd)
	echo "foo => $(foo)"
