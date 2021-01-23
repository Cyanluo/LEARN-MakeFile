hello.out : func.o main.o
	gcc -o hello.out main.o func.o

func.o: func.c 
	gcc -o func.o -c func.c

main.o: main.c
	gcc -o main.o -c main.c

###################################################
# 伪目标
# .PHONY 关键字声明一个伪目标 GNU make才支持
# 伪目标不对应实际文件
# 不管伪目标的依赖是否更新，命令总是执行

# 规则调用（函数调用）
# 当一个目标的依赖包含伪目标时，伪目标所定义的命令总是会被执行

# .PHONY:clean rebuild all

# rebuild: clean all

# all : hello.out

# clean:
# 	rm *.o hello.out
#####################################################

######################################################
# 绕开.PHONY关键字定义伪目标
# 原理：如果一个规则没有命令或者依赖，并且它的目标不是一个存在的
# 文件名， 在执行此规则时，目标会被认为是最新的。
clean: FORCE
	rm *.o hello.out

FORCE:
######################################################