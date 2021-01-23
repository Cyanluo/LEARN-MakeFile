CC := gcc
TARGET := hello.out

$(TARGET) : func.o main.o
	$(CC) -o $@ $^

func.o: func.c 
	$(CC) -o $@ -c $^

main.o: main.c
	$(CC) -o $@ -c $^

.PHONY:clean rebuild all

rebuild: clean all

all : $(TARGET)

clean:
	$(RM) *.o $(TARGET)

# 变量的赋值
# ：= 简单赋值 ： 只针对当前语句的变量有关
# =   递归赋值 ： 所有与目标变量相关的其它变量都将受到影响
# ？= 条件赋值 ： 如果变量已经定义，赋值无效
# +=  追加赋值 ： 追加新值，原变量与新值之间用空格隔开
#
# 自动变量
# $@  当前规则中触发命令被执行的目标
# $^  当前规则中的所有依赖
# $<  当前规则中的第一个依赖
# 注意：
# “$”对于Makefile有特殊含义，输出是需要加上一个“$”进行转义 "$$"
# “$@”对于Bash Shell有特殊含义，输出时需要加上“\”进行转义 “\$$@”

# 特殊变量
# $(MAKE): 当前 make 解释器的文件名
# $(MAKECMDGOALS): 命令行中指定目标名（make的命令行参数）
# $(MAKEFILE_LIST):
#  1. make 所要处理的 Makefile 文件列表
#  2. 当前 Makefile 的文件名总是放在最后
#  3. 文件名之间以空格隔开
# $(MAKE_VERSION): 当前 make 解释器的版本
# $(CURDIR):当前 make 解释器的工作路径
# $(.VARIABLES):所有已经定义的变量列表（预定义和自定义变量）

test: first second
	@echo "$(MAKE)"
	@echo "$(MAKECMDGOALS)"
	@echo "$(MAKEFILE_LIST)"
	@echo "$(MAKE_VERSION)"
	@echo "$(CURDIR)"
	@echo "$(.VARIABLES)"

first:
second:
