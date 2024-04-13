// #################################################################################################
// # << NEORV32 - Custom Functions Subsystem (CFS) Demo Program >>                                 #
// # ********************************************************************************************* #
// # BSD 3-Clause License                                                                          #
// #                                                                                               #
// # Copyright (c) 2023, Stephan Nolting. All rights reserved.                                     #
// #                                                                                               #
// # Redistribution and use in source and binary forms, with or without modification, are          #
// # permitted provided that the following conditions are met:                                     #
// #                                                                                               #
// # 1. Redistributions of source code must retain the above copyright notice, this list of        #
// #    conditions and the following disclaimer.                                                   #
// #                                                                                               #
// # 2. Redistributions in binary form must reproduce the above copyright notice, this list of     #
// #    conditions and the following disclaimer in the documentation and/or other materials        #
// #    provided with the distribution.                                                            #
// #                                                                                               #
// # 3. Neither the name of the copyright holder nor the names of its contributors may be used to  #
// #    endorse or promote products derived from this software without specific prior written      #
// #    permission.                                                                                #
// #                                                                                               #
// # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS   #
// # OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF               #
// # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE    #
// # COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,     #
// # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE #
// # GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED    #
// # AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     #
// # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED  #
// # OF THE POSSIBILITY OF SUCH DAMAGE.                                                            #
// # ********************************************************************************************* #
// # The NEORV32 Processor - https://github.com/stnolting/neorv32              (c) Stephan Nolting #
// #################################################################################################


/**********************************************************************//**
 * @file demo_cfs/main.c
 * @author hanqinghai
 * @brief 
 **************************************************************************/
#include <neorv32.h>
#include "neorv32_uart.h"

/**********************************************************************//**
 * @name User configuration
 **************************************************************************/
/**@{*/
/** UART BAUD rate */
#define BAUD_RATE 19200

struct cfs_input
{
  short addr;
  short data;
};

struct cfs_input cfs[1024] ;

void write_cfs_fifo(void);
int read_cfs_fifo(struct cfs_input *ps);
int clear_cfs_fifo(void);

void uart1_firq_handler(void);

/**********************************************************************//**
 * Main function
 * @note This program requires the CFS and UART0.
 * @return 0 if execution was successful
 **************************************************************************/
int main() 
{

  neorv32_rte_setup();

  // setup UART at default baud rate, no interrupts
  neorv32_uart0_setup(BAUD_RATE, 0);

  // setup UART at default baud rate, turn on interrupts
  neorv32_uart1_setup(115200, 1<<UART_CTRL_IRQ_RX_NEMPTY);

  //check if CFS is implemented at all
  if (neorv32_cfs_available() == 0) {
    neorv32_uart0_printf("Error! No CFS synthesized!\n");
    return 1;
  }

  if (neorv32_uart1_available() == 0) {
    neorv32_uart0_printf("ERROR! uart1 module not implemented.");
    return -1;
  }

  // Configure a UART1 interrupt
  neorv32_rte_handler_install(UART1_RX_RTE_ID ,uart1_firq_handler);
  neorv32_cpu_csr_set(CSR_MIE, 1 << UART1_RX_FIRQ_ENABLE ); 
  neorv32_cpu_csr_set(CSR_MSTATUS, 1 << CSR_MSTATUS_MIE); // enable machine-mode interrupts

  // intro
  neorv32_uart0_printf("<<< NEORV32 Custom Functions Subsystem (CFS) Demo Program >>>\n\n");
  neorv32_uart0_printf("NOTE: This program assumes the _default_ CFS hardware module, which implements\n"
                       "      simple data conversion functions using four memory-mapped registers.\n\n");
  
  clear_cfs_fifo();
  neorv32_cpu_delay_ms(50);
  while(1)
  {
    write_cfs_fifo();

    neorv32_uart0_printf("read= %d \r\n", read_cfs_fifo(cfs));
    for(int i =0;i<1024;i++)
      neorv32_uart0_printf("data= %d   addr= %d \r\n", cfs[i].data,cfs[i].addr);
    
    neorv32_cpu_delay_ms(100);
   
  }
  
}

void uart1_firq_handler(void)
{
 
  neorv32_cpu_csr_clr(CSR_MIP, 1 << UART1_RX_FIRQ_PENDING); // clear UART1 interrupt flag

}


void write_cfs_fifo(void)   //写入cfs的fifo，需操作（NEORV32->REG[0]的17bit为wrfull）、（16bit为wrreq）
{
  NEORV32_CFS->REG[0] =0x10000; //将wrreq至为高，开启写入
  
  while(1)    //循环写入，直到fifo被写满
  {
    int receive =0;
    receive =NEORV32_CFS->REG[0] ;   //获取fifo的状态
    if(receive & 0x20000)   //检测wrfull，如果为高，则fifo已满，停止写入
      break;

    neorv32_uart0_printf("command= %d \r\n", receive); 
  }

}

int read_cfs_fifo(struct cfs_input *ps)  //读取cfs的fifo，需要操作（NEORV32->REG[0]的18bit为rdclk）、（19bit为rdreq）（20bit为读端口rdempty）
{
  int receive =NEORV32_CFS->REG[0];
  neorv32_uart0_printf("command= %d \r\n", receive); 
  if(receive & 0x20000)   //检查wrfull是否满了，如果满了则进行读取，并返回1，否则直接返回0
  {
    for(int i =0;i<1024;i++)
    {
      NEORV32_CFS->REG[0] =0xc0000;
      ps[i].data =NEORV32_CFS->REG[0];
      ps[i].addr =i;
      NEORV32_CFS->REG[0] =0x80000;
    }
    NEORV32_CFS->REG[0] =0;
    return 1;
  } 
  else
    return 0;
  
}

int clear_cfs_fifo(void)    //cfs fifo的清除，需要操作（NEORV32->REG[0]的20bit为rdempty）
{
  int receive =NEORV32_CFS->REG[0];   //获取NEORV32->REG[0]的状态
  neorv32_uart0_printf("command= %d \r\n", receive); // read from CFS memory-mapped register 1 s 
  
  if(receive & 0x100000)   //检查rdempty是否为空，如果不为空，则进入读取状态，但在读取时不将存储数据，已此来达到销毁数据的目的
    return 0;
  else 
  {
    for(int i =0;i<1024;i++)
    {
      NEORV32_CFS->REG[0] =0xc0000;
      NEORV32_CFS->REG[0] =0x80000;
    }
    NEORV32_CFS->REG[0] =0;
    return 1;
  }  

}