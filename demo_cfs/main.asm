
main.elf：     文件格式 elf32-littleriscv


Disassembly of section .text:

00000000 <__crt0_entry>:
       0:	30005073          	csrw	mstatus,0

00000004 <__crt0_cpu_csr_init>:
       4:	00000097          	auipc	ra,0x0
       8:	13c08093          	add	ra,ra,316 # 140 <__crt0_trap_handler>
       c:	30509073          	csrw	mtvec,ra
      10:	30401073          	csrw	mie,zero

00000014 <__crt0_pointer_init>:
      14:	80005117          	auipc	sp,0x80005
      18:	fe810113          	add	sp,sp,-24 # 80004ffc <__crt0_stack_begin>
      1c:	80000197          	auipc	gp,0x80000
      20:	7e418193          	add	gp,gp,2020 # 80000800 <__global_pointer$>

00000024 <__crt0_reg_file_init>:
      24:	00000213          	li	tp,0
      28:	00000293          	li	t0,0
      2c:	00000313          	li	t1,0
      30:	00000393          	li	t2,0
      34:	00000413          	li	s0,0
      38:	00000493          	li	s1,0
      3c:	00000813          	li	a6,0
      40:	00000893          	li	a7,0
      44:	00000913          	li	s2,0
      48:	00000993          	li	s3,0
      4c:	00000a13          	li	s4,0
      50:	00000a93          	li	s5,0
      54:	00000b13          	li	s6,0
      58:	00000b93          	li	s7,0
      5c:	00000c13          	li	s8,0
      60:	00000c93          	li	s9,0
      64:	00000d13          	li	s10,0
      68:	00000d93          	li	s11,0
      6c:	00000e13          	li	t3,0
      70:	00000e93          	li	t4,0
      74:	00000f13          	li	t5,0
      78:	00000f93          	li	t6,0

0000007c <__crt0_copy_data>:
      7c:	00001597          	auipc	a1,0x1
      80:	64c58593          	add	a1,a1,1612 # 16c8 <__RODATA_END__>
      84:	80000617          	auipc	a2,0x80000
      88:	f7c60613          	add	a2,a2,-132 # 80000000 <cfs>
      8c:	80000697          	auipc	a3,0x80000
      90:	f7468693          	add	a3,a3,-140 # 80000000 <cfs>
      94:	00c58e63          	beq	a1,a2,b0 <__crt0_clear_bss>

00000098 <__crt0_copy_data_loop>:
      98:	00d65c63          	bge	a2,a3,b0 <__crt0_clear_bss>
      9c:	0005a703          	lw	a4,0(a1)
      a0:	00e62023          	sw	a4,0(a2)
      a4:	00458593          	add	a1,a1,4
      a8:	00460613          	add	a2,a2,4
      ac:	fedff06f          	j	98 <__crt0_copy_data_loop>

000000b0 <__crt0_clear_bss>:
      b0:	80000717          	auipc	a4,0x80000
      b4:	f5070713          	add	a4,a4,-176 # 80000000 <cfs>
      b8:	80001797          	auipc	a5,0x80001
      bc:	fbc78793          	add	a5,a5,-68 # 80001074 <__BSS_END__>

000000c0 <__crt0_clear_bss_loop>:
      c0:	00f75863          	bge	a4,a5,d0 <__crt0_call_constructors>
      c4:	00072023          	sw	zero,0(a4)
      c8:	00470713          	add	a4,a4,4
      cc:	ff5ff06f          	j	c0 <__crt0_clear_bss_loop>

000000d0 <__crt0_call_constructors>:
      d0:	00001417          	auipc	s0,0x1
      d4:	1bc40413          	add	s0,s0,444 # 128c <__etext>
      d8:	00001497          	auipc	s1,0x1
      dc:	1b448493          	add	s1,s1,436 # 128c <__etext>

000000e0 <__crt0_call_constructors_loop>:
      e0:	00945a63          	bge	s0,s1,f4 <__crt0_call_constructors_loop_end>
      e4:	00042083          	lw	ra,0(s0)
      e8:	000080e7          	jalr	ra
      ec:	00440413          	add	s0,s0,4
      f0:	ff1ff06f          	j	e0 <__crt0_call_constructors_loop>

000000f4 <__crt0_call_constructors_loop_end>:
      f4:	00000513          	li	a0,0
      f8:	00000593          	li	a1,0
      fc:	080000ef          	jal	17c <main>

00000100 <__crt0_main_exit>:
     100:	30401073          	csrw	mie,zero
     104:	34051073          	csrw	mscratch,a0

00000108 <__crt0_call_destructors>:
     108:	00001417          	auipc	s0,0x1
     10c:	18440413          	add	s0,s0,388 # 128c <__etext>
     110:	00001497          	auipc	s1,0x1
     114:	17c48493          	add	s1,s1,380 # 128c <__etext>

00000118 <__crt0_call_destructors_loop>:
     118:	00945a63          	bge	s0,s1,12c <__crt0_call_destructors_loop_end>
     11c:	00042083          	lw	ra,0(s0)
     120:	000080e7          	jalr	ra
     124:	00440413          	add	s0,s0,4
     128:	ff1ff06f          	j	118 <__crt0_call_destructors_loop>

0000012c <__crt0_call_destructors_loop_end>:
     12c:	00000093          	li	ra,0
     130:	00008463          	beqz	ra,138 <__crt0_main_aftermath_end>
     134:	000080e7          	jalr	ra

00000138 <__crt0_main_aftermath_end>:
     138:	10500073          	wfi
     13c:	ffdff06f          	j	138 <__crt0_main_aftermath_end>

00000140 <__crt0_trap_handler>:
     140:	34041073          	csrw	mscratch,s0
     144:	34202473          	csrr	s0,mcause
     148:	02044663          	bltz	s0,174 <__crt0_trap_handler_end>
     14c:	34102473          	csrr	s0,mepc
     150:	00240413          	add	s0,s0,2
     154:	34141073          	csrw	mepc,s0
     158:	34a02473          	csrr	s0,0x34a
     15c:	00347413          	and	s0,s0,3
     160:	ffd40413          	add	s0,s0,-3
     164:	00040863          	beqz	s0,174 <__crt0_trap_handler_end>
     168:	34102473          	csrr	s0,mepc
     16c:	00240413          	add	s0,s0,2
     170:	34141073          	csrw	mepc,s0

00000174 <__crt0_trap_handler_end>:
     174:	34002473          	csrr	s0,mscratch
     178:	30200073          	mret

0000017c <main>:
 * @note This program requires the CFS and UART0.
 *
 * @return 0 if execution was successful
 **************************************************************************/
int main() 
{
     17c:	fe010113          	add	sp,sp,-32
     180:	00112e23          	sw	ra,28(sp)
     184:	00812c23          	sw	s0,24(sp)
     188:	00912a23          	sw	s1,20(sp)
     18c:	01212823          	sw	s2,16(sp)
     190:	01312623          	sw	s3,12(sp)
     194:	01412423          	sw	s4,8(sp)
     198:	01512223          	sw	s5,4(sp)
     19c:	01612023          	sw	s6,0(sp)

  neorv32_rte_setup();
     1a0:	285000ef          	jal	c24 <neorv32_rte_setup>

  // setup UART at default baud rate, no interrupts
  neorv32_uart0_setup(BAUD_RATE, 0);
     1a4:	000055b7          	lui	a1,0x5
     1a8:	fffff537          	lui	a0,0xfffff
     1ac:	00000613          	li	a2,0
     1b0:	b0058593          	add	a1,a1,-1280 # 4b00 <__RODATA_END__+0x3438>
     1b4:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     1b8:	40d000ef          	jal	dc4 <neorv32_uart_setup>

  // setup UART at default baud rate, turn on interrupts
  neorv32_uart1_setup(115200, 1<<UART_CTRL_IRQ_RX_NEMPTY);
     1bc:	0001c5b7          	lui	a1,0x1c
     1c0:	fffff537          	lui	a0,0xfffff
     1c4:	00400637          	lui	a2,0x400
     1c8:	20058593          	add	a1,a1,512 # 1c200 <//__neorv32_ram_size+0x17200>
     1cc:	60050513          	add	a0,a0,1536 # fffff600 <__crt0_stack_begin+0x7fffa604>
     1d0:	3f5000ef          	jal	dc4 <neorv32_uart_setup>

  //check if CFS is implemented at all
  if (neorv32_cfs_available() == 0) {
     1d4:	2ac000ef          	jal	480 <neorv32_cfs_available>
     1d8:	04051263          	bnez	a0,21c <main+0xa0>
    neorv32_uart0_printf("Error! No CFS synthesized!\n");
     1dc:	000015b7          	lui	a1,0x1
     1e0:	fffff537          	lui	a0,0xfffff
     1e4:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     1e8:	29c58593          	add	a1,a1,668 # 129c <__etext+0x10>
     1ec:	705000ef          	jal	10f0 <neorv32_uart_printf>
    return 1;
     1f0:	00100513          	li	a0,1
    
    neorv32_cpu_delay_ms(100);
   
  }
  
}
     1f4:	01c12083          	lw	ra,28(sp)
     1f8:	01812403          	lw	s0,24(sp)
     1fc:	01412483          	lw	s1,20(sp)
     200:	01012903          	lw	s2,16(sp)
     204:	00c12983          	lw	s3,12(sp)
     208:	00812a03          	lw	s4,8(sp)
     20c:	00412a83          	lw	s5,4(sp)
     210:	00012b03          	lw	s6,0(sp)
     214:	02010113          	add	sp,sp,32
     218:	00008067          	ret
  if (neorv32_uart1_available() == 0) {
     21c:	fffff537          	lui	a0,0xfffff
     220:	60050513          	add	a0,a0,1536 # fffff600 <__crt0_stack_begin+0x7fffa604>
     224:	365000ef          	jal	d88 <neorv32_uart_available>
     228:	02051063          	bnez	a0,248 <main+0xcc>
    neorv32_uart0_printf("ERROR! uart1 module not implemented.");
     22c:	000015b7          	lui	a1,0x1
     230:	fffff537          	lui	a0,0xfffff
     234:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     238:	2b858593          	add	a1,a1,696 # 12b8 <__etext+0x2c>
     23c:	6b5000ef          	jal	10f0 <neorv32_uart_printf>
    return -1;
     240:	fff00513          	li	a0,-1
     244:	fb1ff06f          	j	1f4 <main+0x78>
  neorv32_rte_handler_install(UART1_RX_RTE_ID ,uart1_firq_handler);
     248:	2fc00593          	li	a1,764
     24c:	01100513          	li	a0,17
     250:	16d000ef          	jal	bbc <neorv32_rte_handler_install>
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_set(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;

  asm volatile ("csrs %[input_i], %[input_j]" :  : [input_i] "i" (csr_id), [input_j] "r" (csr_data));
     254:	001007b7          	lui	a5,0x100
     258:	3047a073          	csrs	mie,a5
     25c:	00800793          	li	a5,8
     260:	3007a073          	csrs	mstatus,a5
  neorv32_uart0_printf("<<< NEORV32 Custom Functions Subsystem (CFS) Demo Program >>>\n\n");
     264:	000015b7          	lui	a1,0x1
     268:	fffff537          	lui	a0,0xfffff
     26c:	2e058593          	add	a1,a1,736 # 12e0 <__etext+0x54>
     270:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     274:	67d000ef          	jal	10f0 <neorv32_uart_printf>
  neorv32_uart0_printf("NOTE: This program assumes the _default_ CFS hardware module, which implements\n"
     278:	000015b7          	lui	a1,0x1
     27c:	fffff537          	lui	a0,0xfffff
     280:	32058593          	add	a1,a1,800 # 1320 <__etext+0x94>
     284:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     288:	669000ef          	jal	10f0 <neorv32_uart_printf>
  clear_cfs_fifo();
     28c:	17c000ef          	jal	408 <clear_cfs_fifo>
  neorv32_cpu_delay_ms(50);
     290:	03200513          	li	a0,50
    neorv32_uart0_printf("read= %d \r\n", read_cfs_fifo(cfs));
     294:	fffff4b7          	lui	s1,0xfffff
  neorv32_cpu_delay_ms(50);
     298:	20c000ef          	jal	4a4 <neorv32_cpu_delay_ms>
    neorv32_uart0_printf("read= %d \r\n", read_cfs_fifo(cfs));
     29c:	80000937          	lui	s2,0x80000
     2a0:	000019b7          	lui	s3,0x1
     2a4:	50048493          	add	s1,s1,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     2a8:	00001a37          	lui	s4,0x1
      neorv32_uart0_printf("data= %d   addr= %d \r\n", cfs[i].data,cfs[i].addr);
     2ac:	00001ab7          	lui	s5,0x1
    write_cfs_fifo();
     2b0:	058000ef          	jal	308 <write_cfs_fifo>
    neorv32_uart0_printf("read= %d \r\n", read_cfs_fifo(cfs));
     2b4:	00090513          	mv	a0,s2
     2b8:	0b4000ef          	jal	36c <read_cfs_fifo>
     2bc:	00050613          	mv	a2,a0
     2c0:	3bc98593          	add	a1,s3,956 # 13bc <__etext+0x130>
     2c4:	00048513          	mv	a0,s1
     2c8:	00090413          	mv	s0,s2
     2cc:	625000ef          	jal	10f0 <neorv32_uart_printf>
    for(int i =0;i<1024;i++)
     2d0:	01440b33          	add	s6,s0,s4
      neorv32_uart0_printf("data= %d   addr= %d \r\n", cfs[i].data,cfs[i].addr);
     2d4:	00041683          	lh	a3,0(s0)
     2d8:	00241603          	lh	a2,2(s0)
     2dc:	3c8a8593          	add	a1,s5,968 # 13c8 <__etext+0x13c>
     2e0:	00048513          	mv	a0,s1
    for(int i =0;i<1024;i++)
     2e4:	00440413          	add	s0,s0,4
      neorv32_uart0_printf("data= %d   addr= %d \r\n", cfs[i].data,cfs[i].addr);
     2e8:	609000ef          	jal	10f0 <neorv32_uart_printf>
    for(int i =0;i<1024;i++)
     2ec:	ff6414e3          	bne	s0,s6,2d4 <main+0x158>
    neorv32_cpu_delay_ms(100);
     2f0:	06400513          	li	a0,100
     2f4:	1b0000ef          	jal	4a4 <neorv32_cpu_delay_ms>
    write_cfs_fifo();
     2f8:	fb9ff06f          	j	2b0 <main+0x134>

000002fc <uart1_firq_handler>:
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_clr(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;

  asm volatile ("csrc %[input_i], %[input_j]" :  : [input_i] "i" (csr_id), [input_j] "r" (csr_data));
     2fc:	001007b7          	lui	a5,0x100
     300:	3447b073          	csrc	mip,a5
  //   pass =0;
  // else if((uart1_rx_buff & 128) !=0)
  //   pass =1;
  neorv32_cpu_csr_clr(CSR_MIP, 1 << UART1_RX_FIRQ_PENDING); // clear UART1 interrupt flag

}
     304:	00008067          	ret

00000308 <write_cfs_fifo>:

void write_cfs_fifo(void)   //写入cfs的fifo，需操作（NEORV32->REG[0]的17bit为wrfull）、（16bit为wrreq）
{
     308:	ff010113          	add	sp,sp,-16
     30c:	00812423          	sw	s0,8(sp)
  NEORV32_CFS->REG[0] =0x10000; //将wrreq至为高，开启写入
     310:	fffff437          	lui	s0,0xfffff
{
     314:	00912223          	sw	s1,4(sp)
     318:	01212023          	sw	s2,0(sp)
     31c:	00112623          	sw	ra,12(sp)
  NEORV32_CFS->REG[0] =0x10000; //将wrreq至为高，开启写入
     320:	b0040413          	add	s0,s0,-1280 # ffffeb00 <__crt0_stack_begin+0x7fff9b04>
     324:	000107b7          	lui	a5,0x10
    int receive =0;
    receive =NEORV32_CFS->REG[0] ;   //获取fifo的状态
    if(receive & 0x20000)   //检测wrfull，如果为高，则fifo已满，停止写入
      break;

    neorv32_uart0_printf("command= %d \r\n", receive); 
     328:	fffff4b7          	lui	s1,0xfffff
  NEORV32_CFS->REG[0] =0x10000; //将wrreq至为高，开启写入
     32c:	00f42023          	sw	a5,0(s0)
    neorv32_uart0_printf("command= %d \r\n", receive); 
     330:	00001937          	lui	s2,0x1
     334:	50048493          	add	s1,s1,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
    receive =NEORV32_CFS->REG[0] ;   //获取fifo的状态
     338:	00042603          	lw	a2,0(s0)
    if(receive & 0x20000)   //检测wrfull，如果为高，则fifo已满，停止写入
     33c:	00e61793          	sll	a5,a2,0xe
     340:	0007ca63          	bltz	a5,354 <write_cfs_fifo+0x4c>
    neorv32_uart0_printf("command= %d \r\n", receive); 
     344:	28c90593          	add	a1,s2,652 # 128c <__etext>
     348:	00048513          	mv	a0,s1
     34c:	5a5000ef          	jal	10f0 <neorv32_uart_printf>
  {
     350:	fe9ff06f          	j	338 <write_cfs_fifo+0x30>
  }

}
     354:	00c12083          	lw	ra,12(sp)
     358:	00812403          	lw	s0,8(sp)
     35c:	00412483          	lw	s1,4(sp)
     360:	00012903          	lw	s2,0(sp)
     364:	01010113          	add	sp,sp,16
     368:	00008067          	ret

0000036c <read_cfs_fifo>:

int read_cfs_fifo(struct cfs_input *ps)  //读取cfs的fifo，需要操作（NEORV32->REG[0]的18bit为rdclk）、（19bit为rdreq）（20bit为读端口rdempty）
{
     36c:	ff010113          	add	sp,sp,-16
     370:	00912223          	sw	s1,4(sp)
  int receive =NEORV32_CFS->REG[0];
     374:	fffff4b7          	lui	s1,0xfffff
     378:	b0048493          	add	s1,s1,-1280 # ffffeb00 <__crt0_stack_begin+0x7fff9b04>
{
     37c:	01212023          	sw	s2,0(sp)
  int receive =NEORV32_CFS->REG[0];
     380:	0004a903          	lw	s2,0(s1)
{
     384:	00812423          	sw	s0,8(sp)
  neorv32_uart0_printf("command= %d \r\n", receive); 
     388:	000015b7          	lui	a1,0x1
{
     38c:	00050413          	mv	s0,a0
  neorv32_uart0_printf("command= %d \r\n", receive); 
     390:	fffff537          	lui	a0,0xfffff
     394:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     398:	00090613          	mv	a2,s2
     39c:	28c58593          	add	a1,a1,652 # 128c <__etext>
{
     3a0:	00112623          	sw	ra,12(sp)
  neorv32_uart0_printf("command= %d \r\n", receive); 
     3a4:	54d000ef          	jal	10f0 <neorv32_uart_printf>
  if(receive & 0x20000)   //检查wrfull是否满了，如果满了则进行读取，并返回1，否则直接返回0
     3a8:	00e91793          	sll	a5,s2,0xe
    }
    NEORV32_CFS->REG[0] =0;
    return 1;
  } 
  else
    return 0;
     3ac:	00000513          	li	a0,0
  if(receive & 0x20000)   //检查wrfull是否满了，如果满了则进行读取，并返回1，否则直接返回0
     3b0:	0407d063          	bgez	a5,3f0 <read_cfs_fifo+0x84>
     3b4:	00040513          	mv	a0,s0
    for(int i =0;i<1024;i++)
     3b8:	00000793          	li	a5,0
      NEORV32_CFS->REG[0] =0xc0000;
     3bc:	000c05b7          	lui	a1,0xc0
      NEORV32_CFS->REG[0] =0x80000;
     3c0:	000806b7          	lui	a3,0x80
    for(int i =0;i<1024;i++)
     3c4:	40000713          	li	a4,1024
      NEORV32_CFS->REG[0] =0xc0000;
     3c8:	00b4a023          	sw	a1,0(s1)
      ps[i].data =NEORV32_CFS->REG[0];
     3cc:	0004a603          	lw	a2,0(s1)
      ps[i].addr =i;
     3d0:	00f51023          	sh	a5,0(a0)
    for(int i =0;i<1024;i++)
     3d4:	00178793          	add	a5,a5,1 # 10001 <//__neorv32_ram_size+0xb001>
      ps[i].data =NEORV32_CFS->REG[0];
     3d8:	00c51123          	sh	a2,2(a0)
      NEORV32_CFS->REG[0] =0x80000;
     3dc:	00d4a023          	sw	a3,0(s1)
    for(int i =0;i<1024;i++)
     3e0:	00450513          	add	a0,a0,4
     3e4:	fee792e3          	bne	a5,a4,3c8 <read_cfs_fifo+0x5c>
    NEORV32_CFS->REG[0] =0;
     3e8:	0004a023          	sw	zero,0(s1)
     3ec:	00100513          	li	a0,1
  
}
     3f0:	00c12083          	lw	ra,12(sp)
     3f4:	00812403          	lw	s0,8(sp)
     3f8:	00412483          	lw	s1,4(sp)
     3fc:	00012903          	lw	s2,0(sp)
     400:	01010113          	add	sp,sp,16
     404:	00008067          	ret

00000408 <clear_cfs_fifo>:

int clear_cfs_fifo(void)    //cfs fifo的清除，需要操作（NEORV32->REG[0]的20bit为rdempty）
{
     408:	ff010113          	add	sp,sp,-16
     40c:	00812423          	sw	s0,8(sp)
  int receive =NEORV32_CFS->REG[0];   //获取NEORV32->REG[0]的状态
     410:	fffff437          	lui	s0,0xfffff
     414:	b0040413          	add	s0,s0,-1280 # ffffeb00 <__crt0_stack_begin+0x7fff9b04>
{
     418:	00912223          	sw	s1,4(sp)
  int receive =NEORV32_CFS->REG[0];   //获取NEORV32->REG[0]的状态
     41c:	00042483          	lw	s1,0(s0)
  neorv32_uart0_printf("command= %d \r\n", receive); // read from CFS memory-mapped register 1 s 
     420:	000015b7          	lui	a1,0x1
     424:	fffff537          	lui	a0,0xfffff
     428:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     42c:	00048613          	mv	a2,s1
     430:	28c58593          	add	a1,a1,652 # 128c <__etext>
{
     434:	00112623          	sw	ra,12(sp)
  neorv32_uart0_printf("command= %d \r\n", receive); // read from CFS memory-mapped register 1 s 
     438:	4b9000ef          	jal	10f0 <neorv32_uart_printf>
  
  if(receive & 0x100000)   //检查rdempty是否为空，如果不为空，则进入读取状态，但在读取时不将存储数据，已此来达到销毁数据的目的
     43c:	00b49793          	sll	a5,s1,0xb
     440:	00000513          	li	a0,0
     444:	0207c463          	bltz	a5,46c <clear_cfs_fifo+0x64>
     448:	40000793          	li	a5,1024
    return 0;
  else 
  {
    for(int i =0;i<1024;i++)
    {
      NEORV32_CFS->REG[0] =0xc0000;
     44c:	000c06b7          	lui	a3,0xc0
      NEORV32_CFS->REG[0] =0x80000;
     450:	00080737          	lui	a4,0x80
      NEORV32_CFS->REG[0] =0xc0000;
     454:	00d42023          	sw	a3,0(s0)
      NEORV32_CFS->REG[0] =0x80000;
     458:	00e42023          	sw	a4,0(s0)
    for(int i =0;i<1024;i++)
     45c:	fff78793          	add	a5,a5,-1
     460:	fe079ae3          	bnez	a5,454 <clear_cfs_fifo+0x4c>
    }
    NEORV32_CFS->REG[0] =0;
     464:	00042023          	sw	zero,0(s0)
     468:	00100513          	li	a0,1
    return 1;
  }  

     46c:	00c12083          	lw	ra,12(sp)
     470:	00812403          	lw	s0,8(sp)
     474:	00412483          	lw	s1,4(sp)
     478:	01010113          	add	sp,sp,16
     47c:	00008067          	ret

00000480 <neorv32_cfs_available>:
 *
 * @return 0 if CFS was not synthesized, 1 if CFS is available.
 **************************************************************************/
int neorv32_cfs_available(void) {

  if (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_CFS)) {
     480:	e0802503          	lw	a0,-504(zero) # fffffe08 <__crt0_stack_begin+0x7fffae0c>
     484:	01655513          	srl	a0,a0,0x16
    return 1;
  }
  else {
    return 0;
  }
}
     488:	00157513          	and	a0,a0,1
     48c:	00008067          	ret

00000490 <neorv32_cpu_get_cycle>:
 **************************************************************************/
inline uint32_t __attribute__ ((always_inline)) neorv32_cpu_csr_read(const int csr_id) {

  uint32_t csr_data;

  asm volatile ("csrr %[result], %[input_i]" : [result] "=r" (csr_data) : [input_i] "i" (csr_id));
     490:	c80027f3          	rdcycleh	a5
     494:	c0002573          	rdcycle	a0
     498:	c80025f3          	rdcycleh	a1
  uint32_t tmp1, tmp2, tmp3;
  while(1) {
    tmp1 = neorv32_cpu_csr_read(CSR_CYCLEH);
    tmp2 = neorv32_cpu_csr_read(CSR_CYCLE);
    tmp3 = neorv32_cpu_csr_read(CSR_CYCLEH);
    if (tmp1 == tmp3) {
     49c:	fef59ae3          	bne	a1,a5,490 <neorv32_cpu_get_cycle>

  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     4a0:	00008067          	ret

000004a4 <neorv32_cpu_delay_ms>:
 * the MTIME system timer is used if available. A simple loop is used as
 * alternative fall-back (imprecise!).
 *
 * @param[in] time_ms Time in ms to wait (unsigned 32-bit).
 **************************************************************************/
void neorv32_cpu_delay_ms(uint32_t time_ms) {
     4a4:	fe010113          	add	sp,sp,-32
     4a8:	00a12623          	sw	a0,12(sp)

  uint32_t clock = NEORV32_SYSINFO->CLK; // clock ticks per second
     4ac:	e0002503          	lw	a0,-512(zero) # fffffe00 <__crt0_stack_begin+0x7fffae04>
  clock = clock / 1000; // clock ticks per ms
     4b0:	3e800593          	li	a1,1000
void neorv32_cpu_delay_ms(uint32_t time_ms) {
     4b4:	00112e23          	sw	ra,28(sp)
     4b8:	00812c23          	sw	s0,24(sp)
     4bc:	00912a23          	sw	s1,20(sp)
  clock = clock / 1000; // clock ticks per ms
     4c0:	521000ef          	jal	11e0 <__hidden___udivsi3>
  uint64_t wait_cycles = ((uint64_t)clock) * ((uint64_t)time_ms);
     4c4:	00c12603          	lw	a2,12(sp)
     4c8:	00000693          	li	a3,0
     4cc:	00000593          	li	a1,0
     4d0:	47d000ef          	jal	114c <__muldi3>
     4d4:	00050413          	mv	s0,a0
     4d8:	00058493          	mv	s1,a1
     4dc:	fc0027f3          	csrr	a5,0xfc0
  uint64_t tmp = 0;

  // use CYCLE CSRs
  // -------------------------------------------
  if ( (neorv32_cpu_csr_read(CSR_MXISA) & (1<<CSR_MXISA_ZICNTR)) && // cycle counter available?
     4e0:	0807f793          	and	a5,a5,128
     4e4:	04078463          	beqz	a5,52c <neorv32_cpu_delay_ms+0x88>
     4e8:	320027f3          	csrr	a5,mcountinhibit
       ((neorv32_cpu_csr_read(CSR_MCOUNTINHIBIT) & (1<<CSR_MCOUNTINHIBIT_CY)) == 0) ) { // counter is running?
     4ec:	0017f793          	and	a5,a5,1
  if ( (neorv32_cpu_csr_read(CSR_MXISA) & (1<<CSR_MXISA_ZICNTR)) && // cycle counter available?
     4f0:	02079e63          	bnez	a5,52c <neorv32_cpu_delay_ms+0x88>

    tmp = neorv32_cpu_get_cycle() + wait_cycles;
     4f4:	f9dff0ef          	jal	490 <neorv32_cpu_get_cycle>
     4f8:	00850433          	add	s0,a0,s0
     4fc:	00a43533          	sltu	a0,s0,a0
     500:	009585b3          	add	a1,a1,s1
     504:	00b504b3          	add	s1,a0,a1
    while (neorv32_cpu_get_cycle() < tmp);
     508:	f89ff0ef          	jal	490 <neorv32_cpu_get_cycle>
     50c:	fe95eee3          	bltu	a1,s1,508 <neorv32_cpu_delay_ms+0x64>
     510:	00b49463          	bne	s1,a1,518 <neorv32_cpu_delay_ms+0x74>
     514:	fe856ae3          	bltu	a0,s0,508 <neorv32_cpu_delay_ms+0x64>
                  " nop                                              \n" // 2 cycles
                  " j    __neorv32_cpu_delay_ms_start                \n" // 6 cycles
                  " __neorv32_cpu_delay_ms_end: "
                  : [cnt_w] "=r" (iterations) : [cnt_r] "r" (iterations));
  }
}
     518:	01c12083          	lw	ra,28(sp)
     51c:	01812403          	lw	s0,24(sp)
     520:	01412483          	lw	s1,20(sp)
     524:	02010113          	add	sp,sp,32
     528:	00008067          	ret
  else if (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_MTIME)) { // MTIME timer available?
     52c:	e0802783          	lw	a5,-504(zero) # fffffe08 <__crt0_stack_begin+0x7fffae0c>
     530:	00f79713          	sll	a4,a5,0xf
     534:	02075663          	bgez	a4,560 <neorv32_cpu_delay_ms+0xbc>
    tmp = neorv32_mtime_get_time() + wait_cycles;
     538:	04c000ef          	jal	584 <neorv32_mtime_get_time>
     53c:	00850433          	add	s0,a0,s0
     540:	00a43533          	sltu	a0,s0,a0
     544:	009585b3          	add	a1,a1,s1
     548:	00b504b3          	add	s1,a0,a1
    while (neorv32_mtime_get_time() < tmp);
     54c:	038000ef          	jal	584 <neorv32_mtime_get_time>
     550:	fe95eee3          	bltu	a1,s1,54c <neorv32_cpu_delay_ms+0xa8>
     554:	fcb492e3          	bne	s1,a1,518 <neorv32_cpu_delay_ms+0x74>
     558:	fe856ae3          	bltu	a0,s0,54c <neorv32_cpu_delay_ms+0xa8>
     55c:	fbdff06f          	j	518 <neorv32_cpu_delay_ms+0x74>
    uint32_t iterations = (uint32_t)(wait_cycles / loop_cycles_c);
     560:	01c49493          	sll	s1,s1,0x1c
     564:	00445413          	srl	s0,s0,0x4
     568:	0084e433          	or	s0,s1,s0

0000056c <__neorv32_cpu_delay_ms_start>:
    asm volatile (" .balign 4                                        \n" // make sure this is 32-bit aligned
     56c:	00040a63          	beqz	s0,580 <__neorv32_cpu_delay_ms_end>
     570:	00040863          	beqz	s0,580 <__neorv32_cpu_delay_ms_end>
     574:	fff40413          	add	s0,s0,-1
     578:	00000013          	nop
     57c:	ff1ff06f          	j	56c <__neorv32_cpu_delay_ms_start>

00000580 <__neorv32_cpu_delay_ms_end>:
}
     580:	f99ff06f          	j	518 <neorv32_cpu_delay_ms+0x74>

00000584 <neorv32_mtime_get_time>:
    uint32_t uint32[sizeof(uint64_t)/sizeof(uint32_t)];
  } cycles;

  uint32_t tmp1, tmp2, tmp3;
  while(1) {
    tmp1 = NEORV32_MTIME->TIME_HI;
     584:	fffff7b7          	lui	a5,0xfffff
     588:	40078793          	add	a5,a5,1024 # fffff400 <__crt0_stack_begin+0x7fffa404>
     58c:	0047a583          	lw	a1,4(a5)
    tmp2 = NEORV32_MTIME->TIME_LO;
     590:	0007a503          	lw	a0,0(a5)
    tmp3 = NEORV32_MTIME->TIME_HI;
     594:	0047a703          	lw	a4,4(a5)
    if (tmp1 == tmp3) {
     598:	fee59ae3          	bne	a1,a4,58c <neorv32_mtime_get_time+0x8>

  cycles.uint32[0] = tmp2;
  cycles.uint32[1] = tmp3;

  return cycles.uint64;
}
     59c:	00008067          	ret

000005a0 <__neorv32_rte_core>:
 * This is the core of the NEORV32 RTE (first-level trap handler, executed in machine mode).
 **************************************************************************/
static void __attribute__((__naked__,aligned(4))) __neorv32_rte_core(void) {

  // save context
  asm volatile (
     5a0:	34011073          	csrw	mscratch,sp
     5a4:	f8010113          	add	sp,sp,-128
     5a8:	00012023          	sw	zero,0(sp)
     5ac:	00112223          	sw	ra,4(sp)
     5b0:	340110f3          	csrrw	ra,mscratch,sp
     5b4:	00112423          	sw	ra,8(sp)
     5b8:	00312623          	sw	gp,12(sp)
     5bc:	00412823          	sw	tp,16(sp)
     5c0:	00512a23          	sw	t0,20(sp)
     5c4:	00612c23          	sw	t1,24(sp)
     5c8:	00712e23          	sw	t2,28(sp)
     5cc:	02812023          	sw	s0,32(sp)
     5d0:	02912223          	sw	s1,36(sp)
     5d4:	02a12423          	sw	a0,40(sp)
     5d8:	02b12623          	sw	a1,44(sp)
     5dc:	02c12823          	sw	a2,48(sp)
     5e0:	02d12a23          	sw	a3,52(sp)
     5e4:	02e12c23          	sw	a4,56(sp)
     5e8:	02f12e23          	sw	a5,60(sp)
     5ec:	05012023          	sw	a6,64(sp)
     5f0:	05112223          	sw	a7,68(sp)
     5f4:	05212423          	sw	s2,72(sp)
     5f8:	05312623          	sw	s3,76(sp)
     5fc:	05412823          	sw	s4,80(sp)
     600:	05512a23          	sw	s5,84(sp)
     604:	05612c23          	sw	s6,88(sp)
     608:	05712e23          	sw	s7,92(sp)
     60c:	07812023          	sw	s8,96(sp)
     610:	07912223          	sw	s9,100(sp)
     614:	07a12423          	sw	s10,104(sp)
     618:	07b12623          	sw	s11,108(sp)
     61c:	07c12823          	sw	t3,112(sp)
     620:	07d12a23          	sw	t4,116(sp)
     624:	07e12c23          	sw	t5,120(sp)
     628:	07f12e23          	sw	t6,124(sp)
     62c:	342027f3          	csrr	a5,mcause
#endif
  );

  // find according trap handler base address
  uint32_t handler_base;
  switch (neorv32_cpu_csr_read(CSR_MCAUSE)) {
     630:	00b00713          	li	a4,11
     634:	02f76a63          	bltu	a4,a5,668 <__neorv32_rte_core+0xc8>
     638:	00001737          	lui	a4,0x1
     63c:	00279793          	sll	a5,a5,0x2
     640:	5c470713          	add	a4,a4,1476 # 15c4 <__etext+0x338>
     644:	00e787b3          	add	a5,a5,a4
     648:	0007a783          	lw	a5,0(a5)
     64c:	00078067          	jr	a5
     650:	00001737          	lui	a4,0x1
     654:	00279793          	sll	a5,a5,0x2
     658:	5f470713          	add	a4,a4,1524 # 15f4 <__etext+0x368>
     65c:	00e787b3          	add	a5,a5,a4
     660:	0007a783          	lw	a5,0(a5)
     664:	00078067          	jr	a5
     668:	80000737          	lui	a4,0x80000
     66c:	ffd70713          	add	a4,a4,-3 # 7ffffffd <//__neorv32_ram_size+0x7fffaffd>
     670:	00e787b3          	add	a5,a5,a4
     674:	01c00713          	li	a4,28
     678:	fcf77ce3          	bgeu	a4,a5,650 <__neorv32_rte_core+0xb0>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
    default:                     handler_base = (uint32_t)(&__neorv32_rte_debug_handler);        break;
     67c:	000017b7          	lui	a5,0x1
     680:	94878793          	add	a5,a5,-1720 # 948 <__neorv32_rte_debug_handler>
     684:	00c0006f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_I_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_MISALIGNED]; break;
     688:	800017b7          	lui	a5,0x80001
     68c:	0007a783          	lw	a5,0(a5) # 80001000 <__neorv32_rte_vector_lut>
  }

  // execute handler
  void (*handler_pnt)(void);
  handler_pnt = (void*)handler_base;
  (*handler_pnt)();
     690:	000780e7          	jalr	a5
     694:	342027f3          	csrr	a5,mcause

  // compute return address (for exceptions only)
  // do not alter return address if instruction access exception (fatal?)
  uint32_t cause = neorv32_cpu_csr_read(CSR_MCAUSE);
  if ((((int32_t)cause) >= 0) && (cause != TRAP_CODE_I_ACCESS)) {
     698:	0207cc63          	bltz	a5,6d0 <__neorv32_rte_core+0x130>
     69c:	00100713          	li	a4,1
     6a0:	02e78863          	beq	a5,a4,6d0 <__neorv32_rte_core+0x130>
     6a4:	341026f3          	csrr	a3,mepc

    uint32_t rte_mepc = neorv32_cpu_csr_read(CSR_MEPC);
    rte_mepc += 4; // default: faulting instruction is uncompressed
     6a8:	00468713          	add	a4,a3,4 # c0004 <//__neorv32_ram_size+0xbb004>
     6ac:	301027f3          	csrr	a5,misa

    // adjust return address if compressed instruction
    if (neorv32_cpu_csr_read(CSR_MISA) & (1 << CSR_MISA_C)) { // C extension implemented?
     6b0:	0047f793          	and	a5,a5,4
     6b4:	00078c63          	beqz	a5,6cc <__neorv32_rte_core+0x12c>
     6b8:	34a027f3          	csrr	a5,0x34a
      if ((neorv32_cpu_csr_read(CSR_MTINST) & 3) != 3) { // faulting instruction is compressed instruction
     6bc:	00300613          	li	a2,3
     6c0:	0037f793          	and	a5,a5,3
     6c4:	00c78463          	beq	a5,a2,6cc <__neorv32_rte_core+0x12c>
        rte_mepc -= 2;
     6c8:	00268713          	add	a4,a3,2
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_write(const int csr_id, uint32_t data) {

  uint32_t csr_data = data;

  asm volatile ("csrw %[input_i], %[input_j]" :  : [input_i] "i" (csr_id), [input_j] "r" (csr_data));
     6cc:	34171073          	csrw	mepc,a4
    // update return address
    neorv32_cpu_csr_write(CSR_MEPC, rte_mepc);
  }

  // restore context
  asm volatile (
     6d0:	00412083          	lw	ra,4(sp)
     6d4:	00c12183          	lw	gp,12(sp)
     6d8:	01012203          	lw	tp,16(sp)
     6dc:	01412283          	lw	t0,20(sp)
     6e0:	01812303          	lw	t1,24(sp)
     6e4:	01c12383          	lw	t2,28(sp)
     6e8:	02012403          	lw	s0,32(sp)
     6ec:	02412483          	lw	s1,36(sp)
     6f0:	02812503          	lw	a0,40(sp)
     6f4:	02c12583          	lw	a1,44(sp)
     6f8:	03012603          	lw	a2,48(sp)
     6fc:	03412683          	lw	a3,52(sp)
     700:	03812703          	lw	a4,56(sp)
     704:	03c12783          	lw	a5,60(sp)
     708:	04012803          	lw	a6,64(sp)
     70c:	04412883          	lw	a7,68(sp)
     710:	04812903          	lw	s2,72(sp)
     714:	04c12983          	lw	s3,76(sp)
     718:	05012a03          	lw	s4,80(sp)
     71c:	05412a83          	lw	s5,84(sp)
     720:	05812b03          	lw	s6,88(sp)
     724:	05c12b83          	lw	s7,92(sp)
     728:	06012c03          	lw	s8,96(sp)
     72c:	06412c83          	lw	s9,100(sp)
     730:	06812d03          	lw	s10,104(sp)
     734:	06c12d83          	lw	s11,108(sp)
     738:	07012e03          	lw	t3,112(sp)
     73c:	07412e83          	lw	t4,116(sp)
     740:	07812f03          	lw	t5,120(sp)
     744:	07c12f83          	lw	t6,124(sp)
     748:	00812103          	lw	sp,8(sp)
     74c:	30200073          	mret
    case TRAP_CODE_I_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ACCESS];     break;
     750:	800017b7          	lui	a5,0x80001
     754:	0047a783          	lw	a5,4(a5) # 80001004 <__neorv32_rte_vector_lut+0x4>
     758:	f39ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_I_ILLEGAL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_I_ILLEGAL];    break;
     75c:	800017b7          	lui	a5,0x80001
     760:	0087a783          	lw	a5,8(a5) # 80001008 <__neorv32_rte_vector_lut+0x8>
     764:	f2dff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_BREAKPOINT:   handler_base = __neorv32_rte_vector_lut[RTE_TRAP_BREAKPOINT];   break;
     768:	800017b7          	lui	a5,0x80001
     76c:	00c7a783          	lw	a5,12(a5) # 8000100c <__neorv32_rte_vector_lut+0xc>
     770:	f21ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_L_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_MISALIGNED]; break;
     774:	800017b7          	lui	a5,0x80001
     778:	0107a783          	lw	a5,16(a5) # 80001010 <__neorv32_rte_vector_lut+0x10>
     77c:	f15ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_L_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_L_ACCESS];     break;
     780:	800017b7          	lui	a5,0x80001
     784:	0147a783          	lw	a5,20(a5) # 80001014 <__neorv32_rte_vector_lut+0x14>
     788:	f09ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_S_MISALIGNED: handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_MISALIGNED]; break;
     78c:	800017b7          	lui	a5,0x80001
     790:	0187a783          	lw	a5,24(a5) # 80001018 <__neorv32_rte_vector_lut+0x18>
     794:	efdff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_S_ACCESS:     handler_base = __neorv32_rte_vector_lut[RTE_TRAP_S_ACCESS];     break;
     798:	800017b7          	lui	a5,0x80001
     79c:	01c7a783          	lw	a5,28(a5) # 8000101c <__neorv32_rte_vector_lut+0x1c>
     7a0:	ef1ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_UENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_UENV_CALL];    break;
     7a4:	800017b7          	lui	a5,0x80001
     7a8:	0207a783          	lw	a5,32(a5) # 80001020 <__neorv32_rte_vector_lut+0x20>
     7ac:	ee5ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_MENV_CALL:    handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MENV_CALL];    break;
     7b0:	800017b7          	lui	a5,0x80001
     7b4:	0247a783          	lw	a5,36(a5) # 80001024 <__neorv32_rte_vector_lut+0x24>
     7b8:	ed9ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_MSI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MSI];          break;
     7bc:	800017b7          	lui	a5,0x80001
     7c0:	0287a783          	lw	a5,40(a5) # 80001028 <__neorv32_rte_vector_lut+0x28>
     7c4:	ecdff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_MTI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MTI];          break;
     7c8:	800017b7          	lui	a5,0x80001
     7cc:	02c7a783          	lw	a5,44(a5) # 8000102c <__neorv32_rte_vector_lut+0x2c>
     7d0:	ec1ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_MEI:          handler_base = __neorv32_rte_vector_lut[RTE_TRAP_MEI];          break;
     7d4:	800017b7          	lui	a5,0x80001
     7d8:	0307a783          	lw	a5,48(a5) # 80001030 <__neorv32_rte_vector_lut+0x30>
     7dc:	eb5ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_0:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_0];       break;
     7e0:	800017b7          	lui	a5,0x80001
     7e4:	0347a783          	lw	a5,52(a5) # 80001034 <__neorv32_rte_vector_lut+0x34>
     7e8:	ea9ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_1:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_1];       break;
     7ec:	800017b7          	lui	a5,0x80001
     7f0:	0387a783          	lw	a5,56(a5) # 80001038 <__neorv32_rte_vector_lut+0x38>
     7f4:	e9dff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_2:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_2];       break;
     7f8:	800017b7          	lui	a5,0x80001
     7fc:	03c7a783          	lw	a5,60(a5) # 8000103c <__neorv32_rte_vector_lut+0x3c>
     800:	e91ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_3:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_3];       break;
     804:	800017b7          	lui	a5,0x80001
     808:	0407a783          	lw	a5,64(a5) # 80001040 <__neorv32_rte_vector_lut+0x40>
     80c:	e85ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_4:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_4];       break;
     810:	800017b7          	lui	a5,0x80001
     814:	0447a783          	lw	a5,68(a5) # 80001044 <__neorv32_rte_vector_lut+0x44>
     818:	e79ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_5:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_5];       break;
     81c:	800017b7          	lui	a5,0x80001
     820:	0487a783          	lw	a5,72(a5) # 80001048 <__neorv32_rte_vector_lut+0x48>
     824:	e6dff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_6:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_6];       break;
     828:	800017b7          	lui	a5,0x80001
     82c:	04c7a783          	lw	a5,76(a5) # 8000104c <__neorv32_rte_vector_lut+0x4c>
     830:	e61ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_7:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_7];       break;
     834:	800017b7          	lui	a5,0x80001
     838:	0507a783          	lw	a5,80(a5) # 80001050 <__neorv32_rte_vector_lut+0x50>
     83c:	e55ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_8:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_8];       break;
     840:	800017b7          	lui	a5,0x80001
     844:	0547a783          	lw	a5,84(a5) # 80001054 <__neorv32_rte_vector_lut+0x54>
     848:	e49ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_9:       handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_9];       break;
     84c:	800017b7          	lui	a5,0x80001
     850:	0587a783          	lw	a5,88(a5) # 80001058 <__neorv32_rte_vector_lut+0x58>
     854:	e3dff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_10:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_10];      break;
     858:	800017b7          	lui	a5,0x80001
     85c:	05c7a783          	lw	a5,92(a5) # 8000105c <__neorv32_rte_vector_lut+0x5c>
     860:	e31ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_11:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_11];      break;
     864:	800017b7          	lui	a5,0x80001
     868:	0607a783          	lw	a5,96(a5) # 80001060 <__neorv32_rte_vector_lut+0x60>
     86c:	e25ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_12:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_12];      break;
     870:	800017b7          	lui	a5,0x80001
     874:	0647a783          	lw	a5,100(a5) # 80001064 <__neorv32_rte_vector_lut+0x64>
     878:	e19ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_13:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_13];      break;
     87c:	800017b7          	lui	a5,0x80001
     880:	0687a783          	lw	a5,104(a5) # 80001068 <__neorv32_rte_vector_lut+0x68>
     884:	e0dff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_14:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_14];      break;
     888:	800017b7          	lui	a5,0x80001
     88c:	06c7a783          	lw	a5,108(a5) # 8000106c <__neorv32_rte_vector_lut+0x6c>
     890:	e01ff06f          	j	690 <__neorv32_rte_core+0xf0>
    case TRAP_CODE_FIRQ_15:      handler_base = __neorv32_rte_vector_lut[RTE_TRAP_FIRQ_15];      break;
     894:	800017b7          	lui	a5,0x80001
     898:	0707a783          	lw	a5,112(a5) # 80001070 <__neorv32_rte_vector_lut+0x70>
     89c:	df5ff06f          	j	690 <__neorv32_rte_core+0xf0>

000008a0 <__neorv32_rte_print_hex_word>:
 * NEORV32 runtime environment (RTE):
 * Private function to print 32-bit number as 8-digit hexadecimal value (with "0x" suffix).
 *
 * @param[in] num Number to print as hexadecimal via UART0.
 **************************************************************************/
void __neorv32_rte_print_hex_word(uint32_t num) {
     8a0:	fe010113          	add	sp,sp,-32
     8a4:	01312623          	sw	s3,12(sp)
     8a8:	00050993          	mv	s3,a0

  int i;
  static const char hex_symbols[16] = "0123456789ABCDEF";

  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
     8ac:	fffff537          	lui	a0,0xfffff
     8b0:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
void __neorv32_rte_print_hex_word(uint32_t num) {
     8b4:	00112e23          	sw	ra,28(sp)
     8b8:	00812c23          	sw	s0,24(sp)
     8bc:	00912a23          	sw	s1,20(sp)
     8c0:	01212823          	sw	s2,16(sp)
     8c4:	01412423          	sw	s4,8(sp)
  if (neorv32_uart0_available() != 0) { // cannot output anything if UART0 is not implemented
     8c8:	4c0000ef          	jal	d88 <neorv32_uart_available>
     8cc:	04050e63          	beqz	a0,928 <__neorv32_rte_print_hex_word+0x88>
    neorv32_uart0_putc('0');
     8d0:	fffff537          	lui	a0,0xfffff
     8d4:	03000593          	li	a1,48
     8d8:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     8dc:	584000ef          	jal	e60 <neorv32_uart_putc>
    neorv32_uart0_putc('x');
     8e0:	fffff537          	lui	a0,0xfffff
     8e4:	07800593          	li	a1,120
     8e8:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>

    for (i=0; i<8; i++) {
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
      neorv32_uart0_putc(hex_symbols[index]);
     8ec:	00001937          	lui	s2,0x1
     8f0:	fffff4b7          	lui	s1,0xfffff
    neorv32_uart0_putc('x');
     8f4:	56c000ef          	jal	e60 <neorv32_uart_putc>
     8f8:	01c00413          	li	s0,28
      neorv32_uart0_putc(hex_symbols[index]);
     8fc:	69890913          	add	s2,s2,1688 # 1698 <hex_symbols.0>
     900:	50048493          	add	s1,s1,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
    for (i=0; i<8; i++) {
     904:	ffc00a13          	li	s4,-4
      uint32_t index = (num >> (28 - 4*i)) & 0xF;
     908:	0089d7b3          	srl	a5,s3,s0
     90c:	00f7f793          	and	a5,a5,15
      neorv32_uart0_putc(hex_symbols[index]);
     910:	00f907b3          	add	a5,s2,a5
     914:	0007c583          	lbu	a1,0(a5)
     918:	00048513          	mv	a0,s1
    for (i=0; i<8; i++) {
     91c:	ffc40413          	add	s0,s0,-4
      neorv32_uart0_putc(hex_symbols[index]);
     920:	540000ef          	jal	e60 <neorv32_uart_putc>
    for (i=0; i<8; i++) {
     924:	ff4412e3          	bne	s0,s4,908 <__neorv32_rte_print_hex_word+0x68>
    }
  }
}
     928:	01c12083          	lw	ra,28(sp)
     92c:	01812403          	lw	s0,24(sp)
     930:	01412483          	lw	s1,20(sp)
     934:	01012903          	lw	s2,16(sp)
     938:	00c12983          	lw	s3,12(sp)
     93c:	00812a03          	lw	s4,8(sp)
     940:	02010113          	add	sp,sp,32
     944:	00008067          	ret

00000948 <__neorv32_rte_debug_handler>:
  if (neorv32_uart0_available() == 0) {
     948:	fffff537          	lui	a0,0xfffff
static void __neorv32_rte_debug_handler(void) {
     94c:	ff010113          	add	sp,sp,-16
  if (neorv32_uart0_available() == 0) {
     950:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
static void __neorv32_rte_debug_handler(void) {
     954:	00112623          	sw	ra,12(sp)
     958:	00812423          	sw	s0,8(sp)
     95c:	00912223          	sw	s1,4(sp)
  if (neorv32_uart0_available() == 0) {
     960:	428000ef          	jal	d88 <neorv32_uart_available>
     964:	24050263          	beqz	a0,ba8 <__neorv32_rte_debug_handler+0x260>
  neorv32_uart0_puts("<NEORV32-RTE> ");
     968:	000015b7          	lui	a1,0x1
     96c:	fffff537          	lui	a0,0xfffff
     970:	3e058593          	add	a1,a1,992 # 13e0 <__etext+0x154>
     974:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     978:	4fc000ef          	jal	e74 <neorv32_uart_puts>
  asm volatile ("csrr %[result], %[input_i]" : [result] "=r" (csr_data) : [input_i] "i" (csr_id));
     97c:	300027f3          	csrr	a5,mstatus
  if (neorv32_cpu_csr_read(CSR_MSTATUS) & (3 << CSR_MSTATUS_MPP_L)) {
     980:	00b7d713          	srl	a4,a5,0xb
     984:	00377713          	and	a4,a4,3
     988:	02070e63          	beqz	a4,9c4 <__neorv32_rte_debug_handler+0x7c>
    neorv32_uart0_puts("[M] "); // machine-mode
     98c:	000015b7          	lui	a1,0x1
     990:	3f058593          	add	a1,a1,1008 # 13f0 <__etext+0x164>
    neorv32_uart0_puts("[U] "); // user-mode
     994:	fffff537          	lui	a0,0xfffff
     998:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     99c:	4d8000ef          	jal	e74 <neorv32_uart_puts>
     9a0:	34202473          	csrr	s0,mcause
  switch (trap_cause) {
     9a4:	00b00793          	li	a5,11
     9a8:	0287e463          	bltu	a5,s0,9d0 <__neorv32_rte_debug_handler+0x88>
     9ac:	00001737          	lui	a4,0x1
     9b0:	00241793          	sll	a5,s0,0x2
     9b4:	66870713          	add	a4,a4,1640 # 1668 <__etext+0x3dc>
     9b8:	00e787b3          	add	a5,a5,a4
     9bc:	0007a783          	lw	a5,0(a5)
     9c0:	00078067          	jr	a5
    neorv32_uart0_puts("[U] "); // user-mode
     9c4:	000015b7          	lui	a1,0x1
     9c8:	3f858593          	add	a1,a1,1016 # 13f8 <__etext+0x16c>
     9cc:	fc9ff06f          	j	994 <__neorv32_rte_debug_handler+0x4c>
  switch (trap_cause) {
     9d0:	800007b7          	lui	a5,0x80000
     9d4:	00b78793          	add	a5,a5,11 # 8000000b <cfs+0xb>
     9d8:	1af40063          	beq	s0,a5,b78 <__neorv32_rte_debug_handler+0x230>
     9dc:	0287ee63          	bltu	a5,s0,a18 <__neorv32_rte_debug_handler+0xd0>
     9e0:	800007b7          	lui	a5,0x80000
     9e4:	00378793          	add	a5,a5,3 # 80000003 <cfs+0x3>
     9e8:	16f40c63          	beq	s0,a5,b60 <__neorv32_rte_debug_handler+0x218>
     9ec:	800007b7          	lui	a5,0x80000
     9f0:	00778793          	add	a5,a5,7 # 80000007 <cfs+0x7>
     9f4:	16f40c63          	beq	s0,a5,b6c <__neorv32_rte_debug_handler+0x224>
    default:                     neorv32_uart0_puts("Unknown trap cause "); __neorv32_rte_print_hex_word(trap_cause); break;
     9f8:	000015b7          	lui	a1,0x1
     9fc:	fffff537          	lui	a0,0xfffff
     a00:	54858593          	add	a1,a1,1352 # 1548 <__etext+0x2bc>
     a04:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     a08:	46c000ef          	jal	e74 <neorv32_uart_puts>
     a0c:	00040513          	mv	a0,s0
     a10:	e91ff0ef          	jal	8a0 <__neorv32_rte_print_hex_word>
  if ((trap_cause >= TRAP_CODE_FIRQ_0) && (trap_cause <= TRAP_CODE_FIRQ_15)) {
     a14:	0600006f          	j	a74 <__neorv32_rte_debug_handler+0x12c>
  switch (trap_cause) {
     a18:	800007b7          	lui	a5,0x80000
     a1c:	ff078793          	add	a5,a5,-16 # 7ffffff0 <//__neorv32_ram_size+0x7fffaff0>
     a20:	00f407b3          	add	a5,s0,a5
     a24:	00f00713          	li	a4,15
     a28:	fcf768e3          	bltu	a4,a5,9f8 <__neorv32_rte_debug_handler+0xb0>
    case TRAP_CODE_FIRQ_15:      neorv32_uart0_puts("Fast IRQ "); __neorv32_rte_print_hex_word(trap_cause & 0xf); break;
     a2c:	000015b7          	lui	a1,0x1
     a30:	fffff537          	lui	a0,0xfffff
     a34:	53c58593          	add	a1,a1,1340 # 153c <__etext+0x2b0>
     a38:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     a3c:	438000ef          	jal	e74 <neorv32_uart_puts>
     a40:	00f47493          	and	s1,s0,15
     a44:	00048513          	mv	a0,s1
     a48:	e59ff0ef          	jal	8a0 <__neorv32_rte_print_hex_word>
    neorv32_cpu_csr_clr(CSR_MIP, 1 << (CSR_MIP_FIRQ0P + (trap_cause & 0xf))); // clear pending FIRQ
     a4c:	01048493          	add	s1,s1,16
     a50:	00100793          	li	a5,1
     a54:	009797b3          	sll	a5,a5,s1
 **************************************************************************/
inline void __attribute__ ((always_inline)) neorv32_cpu_csr_clr(const int csr_id, uint32_t mask) {

  uint32_t csr_data = mask;

  asm volatile ("csrc %[input_i], %[input_j]" :  : [input_i] "i" (csr_id), [input_j] "r" (csr_data));
     a58:	3447b073          	csrc	mip,a5
}
     a5c:	0180006f          	j	a74 <__neorv32_rte_debug_handler+0x12c>
    case TRAP_CODE_I_MISALIGNED: neorv32_uart0_puts("Instruction address misaligned"); break;
     a60:	000015b7          	lui	a1,0x1
     a64:	40058593          	add	a1,a1,1024 # 1400 <__etext+0x174>
    case TRAP_CODE_MEI:          neorv32_uart0_puts("Machine external IRQ"); break;
     a68:	fffff537          	lui	a0,0xfffff
     a6c:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     a70:	404000ef          	jal	e74 <neorv32_uart_puts>
  neorv32_uart0_puts(" @ PC=");
     a74:	000015b7          	lui	a1,0x1
     a78:	fffff537          	lui	a0,0xfffff
     a7c:	55c58593          	add	a1,a1,1372 # 155c <__etext+0x2d0>
     a80:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     a84:	3f0000ef          	jal	e74 <neorv32_uart_puts>
  asm volatile ("csrr %[result], %[input_i]" : [result] "=r" (csr_data) : [input_i] "i" (csr_id));
     a88:	34102573          	csrr	a0,mepc
  __neorv32_rte_print_hex_word(neorv32_cpu_csr_read(CSR_MEPC));
     a8c:	e15ff0ef          	jal	8a0 <__neorv32_rte_print_hex_word>
  neorv32_uart0_puts(", MTINST=");
     a90:	000015b7          	lui	a1,0x1
     a94:	fffff537          	lui	a0,0xfffff
     a98:	56458593          	add	a1,a1,1380 # 1564 <__etext+0x2d8>
     a9c:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     aa0:	3d4000ef          	jal	e74 <neorv32_uart_puts>
     aa4:	34a02573          	csrr	a0,0x34a
  __neorv32_rte_print_hex_word(neorv32_cpu_csr_read(CSR_MTINST));
     aa8:	df9ff0ef          	jal	8a0 <__neorv32_rte_print_hex_word>
  neorv32_uart0_puts(", MTVAL=");
     aac:	000015b7          	lui	a1,0x1
     ab0:	fffff537          	lui	a0,0xfffff
     ab4:	57058593          	add	a1,a1,1392 # 1570 <__etext+0x2e4>
     ab8:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     abc:	3b8000ef          	jal	e74 <neorv32_uart_puts>
     ac0:	34302573          	csrr	a0,mtval
  __neorv32_rte_print_hex_word(neorv32_cpu_csr_read(CSR_MTVAL));
     ac4:	dddff0ef          	jal	8a0 <__neorv32_rte_print_hex_word>
  if ((trap_cause == TRAP_CODE_I_ACCESS) || (trap_cause == TRAP_CODE_I_MISALIGNED)) {
     ac8:	00100793          	li	a5,1
     acc:	0a87ec63          	bltu	a5,s0,b84 <__neorv32_rte_debug_handler+0x23c>
    neorv32_uart0_puts(" !!FATAL EXCEPTION!! Halting CPU. </NEORV32-RTE>\n");
     ad0:	000015b7          	lui	a1,0x1
     ad4:	fffff537          	lui	a0,0xfffff
     ad8:	57c58593          	add	a1,a1,1404 # 157c <__etext+0x2f0>
     adc:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
     ae0:	394000ef          	jal	e74 <neorv32_uart_puts>
  asm volatile ("csrw %[input_i], %[input_j]" :  : [input_i] "i" (csr_id), [input_j] "r" (csr_data));
     ae4:	00000793          	li	a5,0
     ae8:	30479073          	csrw	mie,a5
      asm volatile ("wfi");
     aec:	10500073          	wfi
    while(1) {
     af0:	ffdff06f          	j	aec <__neorv32_rte_debug_handler+0x1a4>
    case TRAP_CODE_I_ACCESS:     neorv32_uart0_puts("Instruction access fault"); break;
     af4:	000015b7          	lui	a1,0x1
     af8:	42058593          	add	a1,a1,1056 # 1420 <__etext+0x194>
     afc:	f6dff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_I_ILLEGAL:    neorv32_uart0_puts("Illegal instruction"); break;
     b00:	000015b7          	lui	a1,0x1
     b04:	43c58593          	add	a1,a1,1084 # 143c <__etext+0x1b0>
     b08:	f61ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_BREAKPOINT:   neorv32_uart0_puts("Breakpoint"); break;
     b0c:	000015b7          	lui	a1,0x1
     b10:	45058593          	add	a1,a1,1104 # 1450 <__etext+0x1c4>
     b14:	f55ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_L_MISALIGNED: neorv32_uart0_puts("Load address misaligned"); break;
     b18:	000015b7          	lui	a1,0x1
     b1c:	45c58593          	add	a1,a1,1116 # 145c <__etext+0x1d0>
     b20:	f49ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_L_ACCESS:     neorv32_uart0_puts("Load access fault"); break;
     b24:	000015b7          	lui	a1,0x1
     b28:	47458593          	add	a1,a1,1140 # 1474 <__etext+0x1e8>
     b2c:	f3dff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_S_MISALIGNED: neorv32_uart0_puts("Store address misaligned"); break;
     b30:	000015b7          	lui	a1,0x1
     b34:	48858593          	add	a1,a1,1160 # 1488 <__etext+0x1fc>
     b38:	f31ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_S_ACCESS:     neorv32_uart0_puts("Store access fault"); break;
     b3c:	000015b7          	lui	a1,0x1
     b40:	4a458593          	add	a1,a1,1188 # 14a4 <__etext+0x218>
     b44:	f25ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_UENV_CALL:    neorv32_uart0_puts("Environment call from U-mode"); break;
     b48:	000015b7          	lui	a1,0x1
     b4c:	4b858593          	add	a1,a1,1208 # 14b8 <__etext+0x22c>
     b50:	f19ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_MENV_CALL:    neorv32_uart0_puts("Environment call from M-mode"); break;
     b54:	000015b7          	lui	a1,0x1
     b58:	4d858593          	add	a1,a1,1240 # 14d8 <__etext+0x24c>
     b5c:	f0dff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_MSI:          neorv32_uart0_puts("Machine software IRQ"); break;
     b60:	000015b7          	lui	a1,0x1
     b64:	4f858593          	add	a1,a1,1272 # 14f8 <__etext+0x26c>
     b68:	f01ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_MTI:          neorv32_uart0_puts("Machine timer IRQ"); break;
     b6c:	000015b7          	lui	a1,0x1
     b70:	51058593          	add	a1,a1,1296 # 1510 <__etext+0x284>
     b74:	ef5ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
    case TRAP_CODE_MEI:          neorv32_uart0_puts("Machine external IRQ"); break;
     b78:	000015b7          	lui	a1,0x1
     b7c:	52458593          	add	a1,a1,1316 # 1524 <__etext+0x298>
     b80:	ee9ff06f          	j	a68 <__neorv32_rte_debug_handler+0x120>
}
     b84:	00812403          	lw	s0,8(sp)
     b88:	00c12083          	lw	ra,12(sp)
     b8c:	00412483          	lw	s1,4(sp)
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
     b90:	000015b7          	lui	a1,0x1
     b94:	fffff537          	lui	a0,0xfffff
     b98:	5b058593          	add	a1,a1,1456 # 15b0 <__etext+0x324>
     b9c:	50050513          	add	a0,a0,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
}
     ba0:	01010113          	add	sp,sp,16
  neorv32_uart0_puts(" </NEORV32-RTE>\n");
     ba4:	2d00006f          	j	e74 <neorv32_uart_puts>
}
     ba8:	00c12083          	lw	ra,12(sp)
     bac:	00812403          	lw	s0,8(sp)
     bb0:	00412483          	lw	s1,4(sp)
     bb4:	01010113          	add	sp,sp,16
     bb8:	00008067          	ret

00000bbc <neorv32_rte_handler_install>:
  asm volatile ("csrr x0, mhartid");
     bbc:	f1402073          	csrr	zero,mhartid
  if (index < ((uint32_t)NEORV32_RTE_NUM_TRAPS)) {
     bc0:	01c00793          	li	a5,28
     bc4:	02a7e063          	bltu	a5,a0,be4 <neorv32_rte_handler_install+0x28>
    __neorv32_rte_vector_lut[index] = (uint32_t)handler; // install handler
     bc8:	800017b7          	lui	a5,0x80001
     bcc:	00251513          	sll	a0,a0,0x2
     bd0:	00078793          	mv	a5,a5
     bd4:	00a787b3          	add	a5,a5,a0
     bd8:	00b7a023          	sw	a1,0(a5) # 80001000 <__neorv32_rte_vector_lut>
    return 0;
     bdc:	00000513          	li	a0,0
     be0:	00008067          	ret
  return -1;
     be4:	fff00513          	li	a0,-1
}
     be8:	00008067          	ret

00000bec <neorv32_rte_handler_uninstall>:
  asm volatile ("csrr x0, mhartid");
     bec:	f1402073          	csrr	zero,mhartid
  if (index < ((uint32_t)NEORV32_RTE_NUM_TRAPS)) {
     bf0:	01c00793          	li	a5,28
     bf4:	02a7e463          	bltu	a5,a0,c1c <neorv32_rte_handler_uninstall+0x30>
    __neorv32_rte_vector_lut[index] = (uint32_t)(&__neorv32_rte_debug_handler); // use dummy handler in case the trap is accidentally triggered
     bf8:	800017b7          	lui	a5,0x80001
     bfc:	00251513          	sll	a0,a0,0x2
     c00:	00078793          	mv	a5,a5
     c04:	00001737          	lui	a4,0x1
     c08:	00a787b3          	add	a5,a5,a0
     c0c:	94870713          	add	a4,a4,-1720 # 948 <__neorv32_rte_debug_handler>
     c10:	00e7a023          	sw	a4,0(a5) # 80001000 <__neorv32_rte_vector_lut>
    return 0;
     c14:	00000513          	li	a0,0
     c18:	00008067          	ret
  return -1;
     c1c:	fff00513          	li	a0,-1
}
     c20:	00008067          	ret

00000c24 <neorv32_rte_setup>:
void neorv32_rte_setup(void) {
     c24:	ff010113          	add	sp,sp,-16
     c28:	000027b7          	lui	a5,0x2
     c2c:	00112623          	sw	ra,12(sp)
     c30:	00812423          	sw	s0,8(sp)
     c34:	00912223          	sw	s1,4(sp)
     c38:	80078793          	add	a5,a5,-2048 # 1800 <__RODATA_END__+0x138>
     c3c:	30079073          	csrw	mstatus,a5
     c40:	5a000793          	li	a5,1440
     c44:	30579073          	csrw	mtvec,a5
     c48:	00000793          	li	a5,0
     c4c:	30479073          	csrw	mie,a5
     c50:	34479073          	csrw	mip,a5
  for (id = 0; id < ((int)NEORV32_RTE_NUM_TRAPS); id++) {
     c54:	00000413          	li	s0,0
     c58:	01d00493          	li	s1,29
    neorv32_rte_handler_uninstall(id); // this will configure the debug handler
     c5c:	00040513          	mv	a0,s0
  for (id = 0; id < ((int)NEORV32_RTE_NUM_TRAPS); id++) {
     c60:	00140413          	add	s0,s0,1
    neorv32_rte_handler_uninstall(id); // this will configure the debug handler
     c64:	f89ff0ef          	jal	bec <neorv32_rte_handler_uninstall>
  for (id = 0; id < ((int)NEORV32_RTE_NUM_TRAPS); id++) {
     c68:	fe941ae3          	bne	s0,s1,c5c <neorv32_rte_setup+0x38>
}
     c6c:	00c12083          	lw	ra,12(sp)
     c70:	00812403          	lw	s0,8(sp)
     c74:	00412483          	lw	s1,4(sp)
     c78:	01010113          	add	sp,sp,16
     c7c:	00008067          	ret

00000c80 <__neorv32_uart_itoa>:
 * Private function for 'neorv32_printf' to convert into decimal.
 *
 * @param[in] x Unsigned input number.
 * @param[in,out] res Pointer for storing the reuslting number string (11 chars).
 **************************************************************************/
static void __neorv32_uart_itoa(uint32_t x, char *res) {
     c80:	fd010113          	add	sp,sp,-48
     c84:	02812423          	sw	s0,40(sp)
     c88:	02912223          	sw	s1,36(sp)
     c8c:	03212023          	sw	s2,32(sp)
     c90:	01312e23          	sw	s3,28(sp)
     c94:	01412c23          	sw	s4,24(sp)
     c98:	02112623          	sw	ra,44(sp)
     c9c:	01512a23          	sw	s5,20(sp)
  buffer1[10] = '\0';
  res[10] = '\0';

  // convert
  for (i=0; i<10; i++) {
    buffer1[i] = numbers[x%10];
     ca0:	00001a37          	lui	s4,0x1
static void __neorv32_uart_itoa(uint32_t x, char *res) {
     ca4:	00050493          	mv	s1,a0
     ca8:	00058413          	mv	s0,a1
  res[10] = '\0';
     cac:	00058523          	sb	zero,10(a1)
     cb0:	00000993          	li	s3,0
    buffer1[i] = numbers[x%10];
     cb4:	00410913          	add	s2,sp,4
     cb8:	6bca0a13          	add	s4,s4,1724 # 16bc <numbers.1>
     cbc:	00a00593          	li	a1,10
     cc0:	00048513          	mv	a0,s1
     cc4:	564000ef          	jal	1228 <__umodsi3>
     cc8:	00aa0533          	add	a0,s4,a0
     ccc:	00054783          	lbu	a5,0(a0)
     cd0:	01390ab3          	add	s5,s2,s3
    x /= 10;
     cd4:	00048513          	mv	a0,s1
    buffer1[i] = numbers[x%10];
     cd8:	00fa8023          	sb	a5,0(s5)
    x /= 10;
     cdc:	00a00593          	li	a1,10
     ce0:	500000ef          	jal	11e0 <__hidden___udivsi3>
  for (i=0; i<10; i++) {
     ce4:	00198993          	add	s3,s3,1
     ce8:	00a00793          	li	a5,10
    x /= 10;
     cec:	00050493          	mv	s1,a0
  for (i=0; i<10; i++) {
     cf0:	fcf996e3          	bne	s3,a5,cbc <__neorv32_uart_itoa+0x3c>
     cf4:	00090693          	mv	a3,s2
  }

  // delete 'leading' zeros
  for (i=9; i!=0; i--) {
     cf8:	00900713          	li	a4,9
    if (buffer1[i] == '0')
     cfc:	03000613          	li	a2,48
     d00:	0096c583          	lbu	a1,9(a3)
     d04:	00070793          	mv	a5,a4
  for (i=9; i!=0; i--) {
     d08:	fff70713          	add	a4,a4,-1
     d0c:	01071713          	sll	a4,a4,0x10
     d10:	01075713          	srl	a4,a4,0x10
    if (buffer1[i] == '0')
     d14:	00c59a63          	bne	a1,a2,d28 <__neorv32_uart_itoa+0xa8>
      buffer1[i] = '\0';
     d18:	000684a3          	sb	zero,9(a3)
  for (i=9; i!=0; i--) {
     d1c:	fff68693          	add	a3,a3,-1
     d20:	fe0710e3          	bnez	a4,d00 <__neorv32_uart_itoa+0x80>
     d24:	00000793          	li	a5,0
     d28:	00f907b3          	add	a5,s2,a5
     d2c:	00000713          	li	a4,0
  }

  // reverse
  j = 0;
  do {
    if (buffer1[i] != '\0')
     d30:	0007c683          	lbu	a3,0(a5)
     d34:	00068c63          	beqz	a3,d4c <__neorv32_uart_itoa+0xcc>
      res[j++] = buffer1[i];
     d38:	00170613          	add	a2,a4,1
     d3c:	00e40733          	add	a4,s0,a4
     d40:	00d70023          	sb	a3,0(a4)
     d44:	01061713          	sll	a4,a2,0x10
     d48:	01075713          	srl	a4,a4,0x10
  } while (i--);
     d4c:	fff78693          	add	a3,a5,-1
     d50:	02f91863          	bne	s2,a5,d80 <__neorv32_uart_itoa+0x100>

  res[j] = '\0'; // terminate result string
     d54:	00e40433          	add	s0,s0,a4
     d58:	00040023          	sb	zero,0(s0)
}
     d5c:	02c12083          	lw	ra,44(sp)
     d60:	02812403          	lw	s0,40(sp)
     d64:	02412483          	lw	s1,36(sp)
     d68:	02012903          	lw	s2,32(sp)
     d6c:	01c12983          	lw	s3,28(sp)
     d70:	01812a03          	lw	s4,24(sp)
     d74:	01412a83          	lw	s5,20(sp)
     d78:	03010113          	add	sp,sp,48
     d7c:	00008067          	ret
     d80:	00068793          	mv	a5,a3
     d84:	fadff06f          	j	d30 <__neorv32_uart_itoa+0xb0>

00000d88 <neorv32_uart_available>:
  if ( ((uint32_t)UARTx == NEORV32_UART0_BASE) && (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0)) ) {
     d88:	fffff737          	lui	a4,0xfffff
     d8c:	50070713          	add	a4,a4,1280 # fffff500 <__crt0_stack_begin+0x7fffa504>
int neorv32_uart_available(neorv32_uart_t *UARTx) {
     d90:	00050793          	mv	a5,a0
  if ( ((uint32_t)UARTx == NEORV32_UART0_BASE) && (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART0)) ) {
     d94:	00e51a63          	bne	a0,a4,da8 <neorv32_uart_available+0x20>
     d98:	e0802503          	lw	a0,-504(zero) # fffffe08 <__crt0_stack_begin+0x7fffae0c>
     d9c:	01155513          	srl	a0,a0,0x11
  else if ( ((uint32_t)UARTx == NEORV32_UART1_BASE) && (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1)) ) {
     da0:	00157513          	and	a0,a0,1
}
     da4:	00008067          	ret
  else if ( ((uint32_t)UARTx == NEORV32_UART1_BASE) && (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1)) ) {
     da8:	fffff737          	lui	a4,0xfffff
     dac:	60070713          	add	a4,a4,1536 # fffff600 <__crt0_stack_begin+0x7fffa604>
    return 0;
     db0:	00000513          	li	a0,0
  else if ( ((uint32_t)UARTx == NEORV32_UART1_BASE) && (NEORV32_SYSINFO->SOC & (1 << SYSINFO_SOC_IO_UART1)) ) {
     db4:	fee798e3          	bne	a5,a4,da4 <neorv32_uart_available+0x1c>
     db8:	e0802503          	lw	a0,-504(zero) # fffffe08 <__crt0_stack_begin+0x7fffae0c>
     dbc:	01955513          	srl	a0,a0,0x19
     dc0:	fe1ff06f          	j	da0 <neorv32_uart_available+0x18>

00000dc4 <neorv32_uart_setup>:
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     dc4:	ff010113          	add	sp,sp,-16
     dc8:	00812423          	sw	s0,8(sp)
     dcc:	00912223          	sw	s1,4(sp)
     dd0:	00112623          	sw	ra,12(sp)
  UARTx->CTRL = 0;
     dd4:	00052023          	sw	zero,0(a0)
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     dd8:	00050493          	mv	s1,a0
  uint32_t clock = NEORV32_SYSINFO->CLK; // system clock in Hz
     ddc:	e0002503          	lw	a0,-512(zero) # fffffe00 <__crt0_stack_begin+0x7fffae04>
  baud_div = clock / (2*baudrate);
     de0:	00159593          	sll	a1,a1,0x1
void neorv32_uart_setup(neorv32_uart_t *UARTx, uint32_t baudrate, uint32_t irq_mask) {
     de4:	00060413          	mv	s0,a2
  baud_div = clock / (2*baudrate);
     de8:	3f8000ef          	jal	11e0 <__hidden___udivsi3>
  uint32_t prsc_sel = 0;
     dec:	00000713          	li	a4,0
  while (baud_div >= 0x3ffU) {
     df0:	3fe00693          	li	a3,1022
     df4:	04a6e663          	bltu	a3,a0,e40 <neorv32_uart_setup+0x7c>
  tmp |= (uint32_t)((baud_div - 1) & 0x3ffU) << UART_CTRL_BAUD0;
     df8:	fff50793          	add	a5,a0,-1
     dfc:	000106b7          	lui	a3,0x10
     e00:	fc068693          	add	a3,a3,-64 # ffc0 <//__neorv32_ram_size+0xafc0>
     e04:	00679793          	sll	a5,a5,0x6
     e08:	00d7f7b3          	and	a5,a5,a3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     e0c:	07c006b7          	lui	a3,0x7c00
     e10:	00d47433          	and	s0,s0,a3
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     e14:	00371713          	sll	a4,a4,0x3
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     e18:	0087e7b3          	or	a5,a5,s0
  tmp |= (uint32_t)(prsc_sel       & 3U)     << UART_CTRL_PRSC0;
     e1c:	01877713          	and	a4,a4,24
}
     e20:	00c12083          	lw	ra,12(sp)
     e24:	00812403          	lw	s0,8(sp)
  tmp |= (uint32_t)(irq_mask & (0x1fU << UART_CTRL_IRQ_RX_NEMPTY));
     e28:	00e7e7b3          	or	a5,a5,a4
     e2c:	0017e793          	or	a5,a5,1
  UARTx->CTRL = tmp;
     e30:	00f4a023          	sw	a5,0(s1)
}
     e34:	00412483          	lw	s1,4(sp)
     e38:	01010113          	add	sp,sp,16
     e3c:	00008067          	ret
    if ((prsc_sel == 2) || (prsc_sel == 4))
     e40:	ffe70793          	add	a5,a4,-2
     e44:	ffd7f793          	and	a5,a5,-3
     e48:	00079863          	bnez	a5,e58 <neorv32_uart_setup+0x94>
      baud_div >>= 3;
     e4c:	00355513          	srl	a0,a0,0x3
    prsc_sel++;
     e50:	00170713          	add	a4,a4,1
     e54:	fa1ff06f          	j	df4 <neorv32_uart_setup+0x30>
      baud_div >>= 1;
     e58:	00155513          	srl	a0,a0,0x1
     e5c:	ff5ff06f          	j	e50 <neorv32_uart_setup+0x8c>

00000e60 <neorv32_uart_putc>:
  while ((UARTx->CTRL & (1<<UART_CTRL_TX_FULL))); // wait for free space in TX FIFO
     e60:	00052783          	lw	a5,0(a0)
     e64:	00a79713          	sll	a4,a5,0xa
     e68:	fe074ce3          	bltz	a4,e60 <neorv32_uart_putc>
  UARTx->DATA = (uint32_t)c << UART_DATA_RTX_LSB;
     e6c:	00b52223          	sw	a1,4(a0)
}
     e70:	00008067          	ret

00000e74 <neorv32_uart_puts>:
void neorv32_uart_puts(neorv32_uart_t *UARTx, const char *s) {
     e74:	fe010113          	add	sp,sp,-32
     e78:	00812c23          	sw	s0,24(sp)
     e7c:	00912a23          	sw	s1,20(sp)
     e80:	01312623          	sw	s3,12(sp)
     e84:	00112e23          	sw	ra,28(sp)
     e88:	01212823          	sw	s2,16(sp)
     e8c:	00050493          	mv	s1,a0
     e90:	00058413          	mv	s0,a1
    if (c == '\n') {
     e94:	00a00993          	li	s3,10
  while ((c = *s++)) {
     e98:	00044903          	lbu	s2,0(s0)
     e9c:	00140413          	add	s0,s0,1
     ea0:	02091063          	bnez	s2,ec0 <neorv32_uart_puts+0x4c>
}
     ea4:	01c12083          	lw	ra,28(sp)
     ea8:	01812403          	lw	s0,24(sp)
     eac:	01412483          	lw	s1,20(sp)
     eb0:	01012903          	lw	s2,16(sp)
     eb4:	00c12983          	lw	s3,12(sp)
     eb8:	02010113          	add	sp,sp,32
     ebc:	00008067          	ret
    if (c == '\n') {
     ec0:	01391863          	bne	s2,s3,ed0 <neorv32_uart_puts+0x5c>
      neorv32_uart_putc(UARTx, '\r');
     ec4:	00d00593          	li	a1,13
     ec8:	00048513          	mv	a0,s1
     ecc:	f95ff0ef          	jal	e60 <neorv32_uart_putc>
    neorv32_uart_putc(UARTx, c);
     ed0:	00090593          	mv	a1,s2
     ed4:	00048513          	mv	a0,s1
     ed8:	f89ff0ef          	jal	e60 <neorv32_uart_putc>
     edc:	fbdff06f          	j	e98 <neorv32_uart_puts+0x24>

00000ee0 <neorv32_uart_vprintf>:
void neorv32_uart_vprintf(neorv32_uart_t *UARTx, const char *format, va_list args) {
     ee0:	fc010113          	add	sp,sp,-64
     ee4:	02812c23          	sw	s0,56(sp)
     ee8:	02912a23          	sw	s1,52(sp)
     eec:	03212823          	sw	s2,48(sp)
     ef0:	03312623          	sw	s3,44(sp)
     ef4:	03412423          	sw	s4,40(sp)
     ef8:	03512223          	sw	s5,36(sp)
     efc:	03612023          	sw	s6,32(sp)
     f00:	01812c23          	sw	s8,24(sp)
     f04:	02112e23          	sw	ra,60(sp)
     f08:	01712e23          	sw	s7,28(sp)
     f0c:	01912a23          	sw	s9,20(sp)
     f10:	00050913          	mv	s2,a0
     f14:	00058493          	mv	s1,a1
     f18:	00060413          	mv	s0,a2
    if (c == '%') {
     f1c:	02500993          	li	s3,37
      if (c == '\n') {
     f20:	00a00c13          	li	s8,10
      switch (c) {
     f24:	06900a13          	li	s4,105
     f28:	07500a93          	li	s5,117
     f2c:	06300b13          	li	s6,99
  while ((c = *format++)) {
     f30:	0004cc83          	lbu	s9,0(s1)
     f34:	020c9c63          	bnez	s9,f6c <neorv32_uart_vprintf+0x8c>
}
     f38:	03c12083          	lw	ra,60(sp)
     f3c:	03812403          	lw	s0,56(sp)
     f40:	03412483          	lw	s1,52(sp)
     f44:	03012903          	lw	s2,48(sp)
     f48:	02c12983          	lw	s3,44(sp)
     f4c:	02812a03          	lw	s4,40(sp)
     f50:	02412a83          	lw	s5,36(sp)
     f54:	02012b03          	lw	s6,32(sp)
     f58:	01c12b83          	lw	s7,28(sp)
     f5c:	01812c03          	lw	s8,24(sp)
     f60:	01412c83          	lw	s9,20(sp)
     f64:	04010113          	add	sp,sp,64
     f68:	00008067          	ret
    if (c == '%') {
     f6c:	173c9463          	bne	s9,s3,10d4 <neorv32_uart_vprintf+0x1f4>
      c = *format++;
     f70:	00248b93          	add	s7,s1,2
     f74:	0014c483          	lbu	s1,1(s1)
      switch (c) {
     f78:	11448e63          	beq	s1,s4,1094 <neorv32_uart_vprintf+0x1b4>
     f7c:	049a6063          	bltu	s4,s1,fbc <neorv32_uart_vprintf+0xdc>
     f80:	0f648c63          	beq	s1,s6,1078 <neorv32_uart_vprintf+0x198>
     f84:	009b6e63          	bltu	s6,s1,fa0 <neorv32_uart_vprintf+0xc0>
     f88:	05800793          	li	a5,88
     f8c:	07349063          	bne	s1,s3,fec <neorv32_uart_vprintf+0x10c>
          neorv32_uart_putc(UARTx, '%');
     f90:	02500593          	li	a1,37
      neorv32_uart_putc(UARTx, c);
     f94:	00090513          	mv	a0,s2
     f98:	ec9ff0ef          	jal	e60 <neorv32_uart_putc>
     f9c:	0f00006f          	j	108c <neorv32_uart_vprintf+0x1ac>
      switch (c) {
     fa0:	06400793          	li	a5,100
     fa4:	0ef48863          	beq	s1,a5,1094 <neorv32_uart_vprintf+0x1b4>
          neorv32_uart_putc(UARTx, '%');
     fa8:	02500593          	li	a1,37
     fac:	00090513          	mv	a0,s2
     fb0:	eb1ff0ef          	jal	e60 <neorv32_uart_putc>
          neorv32_uart_putc(UARTx, c);
     fb4:	00048593          	mv	a1,s1
     fb8:	fddff06f          	j	f94 <neorv32_uart_vprintf+0xb4>
      switch (c) {
     fbc:	11548463          	beq	s1,s5,10c4 <neorv32_uart_vprintf+0x1e4>
     fc0:	029ae463          	bltu	s5,s1,fe8 <neorv32_uart_vprintf+0x108>
     fc4:	07000793          	li	a5,112
     fc8:	02f48463          	beq	s1,a5,ff0 <neorv32_uart_vprintf+0x110>
     fcc:	07300793          	li	a5,115
     fd0:	fcf49ce3          	bne	s1,a5,fa8 <neorv32_uart_vprintf+0xc8>
          neorv32_uart_puts(UARTx, va_arg(args, char*));
     fd4:	00042583          	lw	a1,0(s0)
     fd8:	00440493          	add	s1,s0,4
          neorv32_uart_puts(UARTx, string_buf);
     fdc:	00090513          	mv	a0,s2
     fe0:	e95ff0ef          	jal	e74 <neorv32_uart_puts>
          break;
     fe4:	0a40006f          	j	1088 <neorv32_uart_vprintf+0x1a8>
      switch (c) {
     fe8:	07800793          	li	a5,120
     fec:	faf49ee3          	bne	s1,a5,fa8 <neorv32_uart_vprintf+0xc8>
          __neorv32_uart_tohex(va_arg(args, uint32_t), string_buf);
     ff0:	00042803          	lw	a6,0(s0)
     ff4:	00410693          	add	a3,sp,4
  static const char symbols[] = "0123456789abcdef";

  int i;
  for (i=0; i<8; i++) { // nibble by nibble
    uint32_t num_tmp = x >> (4*i);
    res[7-i] = (char)symbols[num_tmp & 0x0f];
     ff8:	00001637          	lui	a2,0x1
          __neorv32_uart_tohex(va_arg(args, uint32_t), string_buf);
     ffc:	00440c93          	add	s9,s0,4
    1000:	00000713          	li	a4,0
    1004:	00068593          	mv	a1,a3
    res[7-i] = (char)symbols[num_tmp & 0x0f];
    1008:	6a860613          	add	a2,a2,1704 # 16a8 <symbols.0>
  for (i=0; i<8; i++) { // nibble by nibble
    100c:	02000513          	li	a0,32
    uint32_t num_tmp = x >> (4*i);
    1010:	00e857b3          	srl	a5,a6,a4
    res[7-i] = (char)symbols[num_tmp & 0x0f];
    1014:	00f7f793          	and	a5,a5,15
    1018:	00f607b3          	add	a5,a2,a5
    101c:	0007c783          	lbu	a5,0(a5)
  for (i=0; i<8; i++) { // nibble by nibble
    1020:	00470713          	add	a4,a4,4
    1024:	fff68693          	add	a3,a3,-1 # 7bfffff <//__neorv32_ram_size+0x7bfafff>
    res[7-i] = (char)symbols[num_tmp & 0x0f];
    1028:	00f68423          	sb	a5,8(a3)
  for (i=0; i<8; i++) { // nibble by nibble
    102c:	fea712e3          	bne	a4,a0,1010 <neorv32_uart_vprintf+0x130>
  }

  res[8] = '\0'; // terminate result string
    1030:	00010623          	sb	zero,12(sp)
          if (c == 'X') {
    1034:	05800793          	li	a5,88
    1038:	02f49863          	bne	s1,a5,1068 <neorv32_uart_vprintf+0x188>
    103c:	00058793          	mv	a5,a1

  char tmp;

  while (len > 0) {
    tmp = *ptr;
    if ((tmp >= 'a') && (tmp <= 'z')) {
    1040:	01900513          	li	a0,25
  while (len > 0) {
    1044:	00f10613          	add	a2,sp,15
    tmp = *ptr;
    1048:	0007c703          	lbu	a4,0(a5)
    if ((tmp >= 'a') && (tmp <= 'z')) {
    104c:	f9f70693          	add	a3,a4,-97
    1050:	0ff6f693          	zext.b	a3,a3
    1054:	00d56663          	bltu	a0,a3,1060 <neorv32_uart_vprintf+0x180>
      *ptr = tmp - 32;
    1058:	fe070713          	add	a4,a4,-32
    105c:	00e78023          	sb	a4,0(a5)
    }
    ptr++;
    1060:	00178793          	add	a5,a5,1
  while (len > 0) {
    1064:	fec792e3          	bne	a5,a2,1048 <neorv32_uart_vprintf+0x168>
          neorv32_uart_puts(UARTx, string_buf);
    1068:	00090513          	mv	a0,s2
    106c:	e09ff0ef          	jal	e74 <neorv32_uart_puts>
          __neorv32_uart_tohex(va_arg(args, uint32_t), string_buf);
    1070:	000c8413          	mv	s0,s9
          break;
    1074:	0180006f          	j	108c <neorv32_uart_vprintf+0x1ac>
          neorv32_uart_putc(UARTx, (char)va_arg(args, int));
    1078:	00044583          	lbu	a1,0(s0)
    107c:	00090513          	mv	a0,s2
    1080:	00440493          	add	s1,s0,4
    1084:	dddff0ef          	jal	e60 <neorv32_uart_putc>
    1088:	00048413          	mv	s0,s1
          neorv32_uart_puts(UARTx, va_arg(args, char*));
    108c:	000b8493          	mv	s1,s7
    1090:	ea1ff06f          	j	f30 <neorv32_uart_vprintf+0x50>
          n = (int32_t)va_arg(args, int32_t);
    1094:	00440493          	add	s1,s0,4
    1098:	00042403          	lw	s0,0(s0)
          if (n < 0) {
    109c:	00045a63          	bgez	s0,10b0 <neorv32_uart_vprintf+0x1d0>
            neorv32_uart_putc(UARTx, '-');
    10a0:	02d00593          	li	a1,45
    10a4:	00090513          	mv	a0,s2
            n = -n;
    10a8:	40800433          	neg	s0,s0
            neorv32_uart_putc(UARTx, '-');
    10ac:	db5ff0ef          	jal	e60 <neorv32_uart_putc>
          __neorv32_uart_itoa((uint32_t)n, string_buf);
    10b0:	00410593          	add	a1,sp,4
    10b4:	00040513          	mv	a0,s0
          __neorv32_uart_itoa(va_arg(args, uint32_t), string_buf);
    10b8:	bc9ff0ef          	jal	c80 <__neorv32_uart_itoa>
          neorv32_uart_puts(UARTx, string_buf);
    10bc:	00410593          	add	a1,sp,4
    10c0:	f1dff06f          	j	fdc <neorv32_uart_vprintf+0xfc>
          __neorv32_uart_itoa(va_arg(args, uint32_t), string_buf);
    10c4:	00042503          	lw	a0,0(s0)
    10c8:	00440493          	add	s1,s0,4
    10cc:	00410593          	add	a1,sp,4
    10d0:	fe9ff06f          	j	10b8 <neorv32_uart_vprintf+0x1d8>
      if (c == '\n') {
    10d4:	018c9863          	bne	s9,s8,10e4 <neorv32_uart_vprintf+0x204>
        neorv32_uart_putc(UARTx, '\r');
    10d8:	00d00593          	li	a1,13
    10dc:	00090513          	mv	a0,s2
    10e0:	d81ff0ef          	jal	e60 <neorv32_uart_putc>
  while ((c = *format++)) {
    10e4:	00148b93          	add	s7,s1,1
      neorv32_uart_putc(UARTx, c);
    10e8:	000c8593          	mv	a1,s9
    10ec:	ea9ff06f          	j	f94 <neorv32_uart_vprintf+0xb4>

000010f0 <neorv32_uart_printf>:
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    10f0:	fc010113          	add	sp,sp,-64
    10f4:	02c12423          	sw	a2,40(sp)
  va_start(args, format);
    10f8:	02810613          	add	a2,sp,40
void neorv32_uart_printf(neorv32_uart_t *UARTx, const char *format, ...) {
    10fc:	00112e23          	sw	ra,28(sp)
    1100:	02d12623          	sw	a3,44(sp)
    1104:	02e12823          	sw	a4,48(sp)
    1108:	02f12a23          	sw	a5,52(sp)
    110c:	03012c23          	sw	a6,56(sp)
    1110:	03112e23          	sw	a7,60(sp)
  va_start(args, format);
    1114:	00c12623          	sw	a2,12(sp)
  neorv32_uart_vprintf(UARTx, format, args);
    1118:	dc9ff0ef          	jal	ee0 <neorv32_uart_vprintf>
}
    111c:	01c12083          	lw	ra,28(sp)
    1120:	04010113          	add	sp,sp,64
    1124:	00008067          	ret

00001128 <__mulsi3>:
    1128:	00050613          	mv	a2,a0
    112c:	00000513          	li	a0,0
    1130:	0015f693          	and	a3,a1,1
    1134:	00068463          	beqz	a3,113c <__mulsi3+0x14>
    1138:	00c50533          	add	a0,a0,a2
    113c:	0015d593          	srl	a1,a1,0x1
    1140:	00161613          	sll	a2,a2,0x1
    1144:	fe0596e3          	bnez	a1,1130 <__mulsi3+0x8>
    1148:	00008067          	ret

0000114c <__muldi3>:
    114c:	00050e13          	mv	t3,a0
    1150:	ff010113          	add	sp,sp,-16
    1154:	00068313          	mv	t1,a3
    1158:	00112623          	sw	ra,12(sp)
    115c:	00060513          	mv	a0,a2
    1160:	000e0893          	mv	a7,t3
    1164:	00060693          	mv	a3,a2
    1168:	00000713          	li	a4,0
    116c:	00000793          	li	a5,0
    1170:	00000813          	li	a6,0
    1174:	0016fe93          	and	t4,a3,1
    1178:	00171613          	sll	a2,a4,0x1
    117c:	000e8a63          	beqz	t4,1190 <__muldi3+0x44>
    1180:	01088833          	add	a6,a7,a6
    1184:	00e787b3          	add	a5,a5,a4
    1188:	01183733          	sltu	a4,a6,a7
    118c:	00f707b3          	add	a5,a4,a5
    1190:	01f8d713          	srl	a4,a7,0x1f
    1194:	0016d693          	srl	a3,a3,0x1
    1198:	00e66733          	or	a4,a2,a4
    119c:	00189893          	sll	a7,a7,0x1
    11a0:	fc069ae3          	bnez	a3,1174 <__muldi3+0x28>
    11a4:	00058663          	beqz	a1,11b0 <__muldi3+0x64>
    11a8:	f81ff0ef          	jal	1128 <__mulsi3>
    11ac:	00a787b3          	add	a5,a5,a0
    11b0:	00030a63          	beqz	t1,11c4 <__muldi3+0x78>
    11b4:	000e0513          	mv	a0,t3
    11b8:	00030593          	mv	a1,t1
    11bc:	f6dff0ef          	jal	1128 <__mulsi3>
    11c0:	00f507b3          	add	a5,a0,a5
    11c4:	00c12083          	lw	ra,12(sp)
    11c8:	00080513          	mv	a0,a6
    11cc:	00078593          	mv	a1,a5
    11d0:	01010113          	add	sp,sp,16
    11d4:	00008067          	ret

000011d8 <__divsi3>:
    11d8:	06054063          	bltz	a0,1238 <__umodsi3+0x10>
    11dc:	0605c663          	bltz	a1,1248 <__umodsi3+0x20>

000011e0 <__hidden___udivsi3>:
    11e0:	00058613          	mv	a2,a1
    11e4:	00050593          	mv	a1,a0
    11e8:	fff00513          	li	a0,-1
    11ec:	02060c63          	beqz	a2,1224 <__hidden___udivsi3+0x44>
    11f0:	00100693          	li	a3,1
    11f4:	00b67a63          	bgeu	a2,a1,1208 <__hidden___udivsi3+0x28>
    11f8:	00c05863          	blez	a2,1208 <__hidden___udivsi3+0x28>
    11fc:	00161613          	sll	a2,a2,0x1
    1200:	00169693          	sll	a3,a3,0x1
    1204:	feb66ae3          	bltu	a2,a1,11f8 <__hidden___udivsi3+0x18>
    1208:	00000513          	li	a0,0
    120c:	00c5e663          	bltu	a1,a2,1218 <__hidden___udivsi3+0x38>
    1210:	40c585b3          	sub	a1,a1,a2
    1214:	00d56533          	or	a0,a0,a3
    1218:	0016d693          	srl	a3,a3,0x1
    121c:	00165613          	srl	a2,a2,0x1
    1220:	fe0696e3          	bnez	a3,120c <__hidden___udivsi3+0x2c>
    1224:	00008067          	ret

00001228 <__umodsi3>:
    1228:	00008293          	mv	t0,ra
    122c:	fb5ff0ef          	jal	11e0 <__hidden___udivsi3>
    1230:	00058513          	mv	a0,a1
    1234:	00028067          	jr	t0
    1238:	40a00533          	neg	a0,a0
    123c:	00b04863          	bgtz	a1,124c <__umodsi3+0x24>
    1240:	40b005b3          	neg	a1,a1
    1244:	f9dff06f          	j	11e0 <__hidden___udivsi3>
    1248:	40b005b3          	neg	a1,a1
    124c:	00008293          	mv	t0,ra
    1250:	f91ff0ef          	jal	11e0 <__hidden___udivsi3>
    1254:	40a00533          	neg	a0,a0
    1258:	00028067          	jr	t0

0000125c <__modsi3>:
    125c:	00008293          	mv	t0,ra
    1260:	0005ca63          	bltz	a1,1274 <__modsi3+0x18>
    1264:	00054c63          	bltz	a0,127c <__modsi3+0x20>
    1268:	f79ff0ef          	jal	11e0 <__hidden___udivsi3>
    126c:	00058513          	mv	a0,a1
    1270:	00028067          	jr	t0
    1274:	40b005b3          	neg	a1,a1
    1278:	fe0558e3          	bgez	a0,1268 <__modsi3+0xc>
    127c:	40a00533          	neg	a0,a0
    1280:	f61ff0ef          	jal	11e0 <__hidden___udivsi3>
    1284:	40b00533          	neg	a0,a1
    1288:	00028067          	jr	t0
