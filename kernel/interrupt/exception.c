#include <type.h>
#include "../echo/display.h"

/*
void exception(int vec_num, u32 err_code, u32 eip, u32 cs, u32 eflags)
{
	for(;;);
}
*/

void exception_handler(int vec_num, char *func_name)
{
	dis_str ("EXCEPTION:", 0xa, 0, 0);
	dis_str (func_name, 0xa, 0, 10);
	for(;;);
}

void divide_error(void)
{
	exception_handler(0, "divide_error");
}

void single_step_exception(void)
{
	exception_handler(1, "single_step_exception");
}

void nmi(void)
{
	exception_handler(2, "nmi");
}

void breakpoint_exception(void)
{
	exception_handler(3, "breakpoint_exception");
}

void overflow(void)
{
	exception_handler(4, "overflow");
}

void bounds_check(void)
{
	exception_handler(5, "bounds_check");
}

void inval_opcode(void)
{
	exception_handler(6, "inval_opcode");
}

void copr_not_available(void)
{
	exception_handler(7, "copr_not_available");
}

void double_fault(void)
{
	exception_handler(8, "double_fault");
}

void copr_seg_overrun(void)
{
	exception_handler(9, "copr_seg_overrun");
}

void inval_tss(void)
{
	exception_handler(10, "inval_tss");
}

void segment_not_present(void)
{
	exception_handler(11, "segment_not_present");
}

void stack_exception(void)
{
	exception_handler(12, "stack_exception");
}

void general_protection(void)
{
	exception_handler(13, "general_protection");
}

void page_fault(void)
{
	exception_handler(14, "page_fault");
}

void copr_error(void)
{
	exception_handler(15, "copr_error");
}

void float_error(void)
{
	exception_handler(16, "float_error");
}

void alignment_check(void)
{
	exception_handler(17, "alignment_check");
}
