#include "main.h"
#include "module_func.h"
#include "stcfunc.h"
#include "stdio.h"

int main()
{
	print_func(main_str, "main");
	
	module_func();
	printf("a+b=%d\n", add(2, 3));
	lib_name();

	return 0;
}
