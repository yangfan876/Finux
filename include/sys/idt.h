#include <sys/desc_struct.h>


#define IDTNUM 256
#define IRQ_VECTOR 0x30
#define IRQ_TIMER 0x0
#define IRQ_REAL_TIMER 0x8
#define IRQ_AT_HD	0xe

typedef struct desc_struct _idt_;
typedef struct desc_ptr	_idt_ptr_;


/*定义中断门的类型*/
#define GATE_INTERRUPT	0xE

/*函数声明*/
void init_idt(void);
inline void set_intr_gate(int IRQ, u32 *handler);

