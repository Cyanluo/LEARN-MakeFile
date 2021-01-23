# 环境变量
# Makefile 中可以 直接使用 环境变量
#   1. 定义同名变量，环境变量将被覆盖
#	2. 运行make时指定 -e 选项，优先使用当前make时的环境变量值，
#      并且在此命令下调用的Makefile无论是否使用-e去调用其它Makefile，
#      都用第一次-e时的环境变量（即当前环境变量值）

# 变量在不同Makefile之间传递：
# 	1. 直接在外部定义环境变量
# 	2. 使用export定义变量进行传递（定义临时环境变量）
# 	3. 定义make命令行变量进行传递

PATH := /usr/bin/
var := var_test
export override var1 := var1_test

test:
	@echo "$(PATH)"
	@echo "$(var)"
	@echo ""
	$(MAKE) -f makefile.2
	@echo ""
	$(MAKE) -f makefile.2 -e
	@echo ""
	$(MAKE) -f makefile.2 var:=var_test2
	@echo ""
