/*函数声明*/
void Init_8259A(void);
void enable_irq(int irq);
inline void EOI_master(void);
inline void EOI_slave(void);
void disable_irqs(void);

/*8259a.c中用到的宏*/
#define MASTER_8259A_IMR 0x21
#define SLAVE_8259A_IMR 0xa1
#define MASTER_8259A_CMD 0x20
#define SLAVE_8259A_CMD 0xa0
