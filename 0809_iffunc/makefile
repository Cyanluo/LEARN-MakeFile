# 条件判断
# ifeq/ifneq ($(var1),$(var2))
# else
# endif
# ifdef/ifndef var
# else
# endif
# 注意：
# 1. 条件语句之前可以有空格，但不能有Tab字符（‘\t’）
# 2. 在条件语句中不要使用自动变量（$@, $^, $<）

# 自定义函数：
# makefile 中不支持真正意义上的自定义函数
# 自定义函数的本质时多行变量
# 预定义的 call 函数在调用时将参数传递给多行变量
# 自定义函数时 call 函数的实参，并在 call 中被执行

define func1
	@echo "My name is $(0)"
endef

define func2
	@echo "My name is $(0)"
	@echo "Param => $(1)"
endef

test: test2
    ifeq ($(TEST),1)
		$(call func1)
    else
		$(call func2, Cyan)
    endif

test2:
    ifdef TEST
		@echo "TEST is define"
    else
		@echo "TEST is not define"
    endif

# 预定义函数的调用
# var := $(func_name arg1, arg2, ...)

var := $(abspath ./)

test3:
	@echo "var => $(var)"
