#include <sys/desc_struct.h>

/*中断向量表条目数*/
#define IDTNUM 256

/*中断向量起始entry*/
#define IRQ_VECTOR 0x30

/*时钟中断号*/
#define IRQ_TIMER 0x0
/*硬盘中断号*/
#define IRQ_AT_HD	0xe

/*异常向量号*/
#define EXC_DIVIDE 0x0
#define EXC_SINGLE_STEP 0x1
#define EXC_NMI 0x2
#define EXC_BREAKPOINT 0x3
#define EXC_OVERFLOW 0x4
#define EXC_BOUNDS_CHECK 0x5
#define EXC_INVAL_OPCODE 0x6
#define EXC_COPR_NOT_AVAILABLE 0x7
#define EXC_DOUBLE_FAULT 0x8
#define EXC_COPR_SEG_OVERRUN 0x9
#define EXC_INVAL_TSS 0xa
#define EXC_SEGMENT_NOT_PRESENT 0xb
#define EXC_STACK 0xc
#define EXC_GENERAL_PROTECTION 0xd
#define EXC_PAGE_FAULT 0xe
#define EXC_COPR_ERROR 0xf
#define EXC_FLOAT_ERROR 0x10
#define EXC_ALIGNMENT_CHECK 0x11

/*系统调用*/
#define SYS_CALL_NUM 0x80

typedef struct desc_struct _idt_;
typedef struct desc_ptr	_idt_ptr_;

/*定义中断门的类型*/
#define GATE_INTERRUPT	0xE
#define GATE_EXCEPTION  0xF

/*函数声明*/
void load_idt(void);
inline void set_intr_gate(int IRQ, u32 *handler);
