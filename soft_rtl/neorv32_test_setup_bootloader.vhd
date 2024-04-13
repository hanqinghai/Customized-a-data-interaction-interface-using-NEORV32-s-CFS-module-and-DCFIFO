-- #################################################################################################
-- # << NEORV32 - Test Setup using the default UART-Bootloader to upload and run executables >>    #
-- # ********************************************************************************************* #
-- # BSD 3-Clause License                                                                          #
-- #                                                                                               #
-- # Copyright (c) 2023, Stephan Nolting. All rights reserved.                                     #
-- #                                                                                               #
-- # Redistribution and use in source and binary forms, with or without modification, are          #
-- # permitted provided that the following conditions are met:                                     #
-- #                                                                                               #
-- # 1. Redistributions of source code must retain the above copyright notice, this list of        #
-- #    conditions and the following disclaimer.                                                   #
-- #                                                                                               #
-- # 2. Redistributions in binary form must reproduce the above copyright notice, this list of     #
-- #    conditions and the following disclaimer in the documentation and/or other materials        #
-- #    provided with the distribution.                                                            #
-- #                                                                                               #
-- # 3. Neither the name of the copyright holder nor the names of its contributors may be used to  #
-- #    endorse or promote products derived from this software without specific prior written      #
-- #    permission.                                                                                #
-- #                                                                                               #
-- # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS   #
-- # OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF               #
-- # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE    #
-- # COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,     #
-- # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE #
-- # GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED    #
-- # AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     #
-- # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED  #
-- # OF THE POSSIBILITY OF SUCH DAMAGE.                                                            #
-- # ********************************************************************************************* #
-- # The NEORV32 RISC-V Processor - https://github.com/stnolting/neorv32                           #
-- #################################################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;
use neorv32.neorv32_package.all;

entity neorv32_test_setup_bootloader is
  generic (
    -- adapt these for your setup --
    CLOCK_FREQUENCY   : natural := 50000000; -- clock frequency of clk_i in Hz
    MEM_INT_IMEM_SIZE : natural := 20*1024;   -- size of processor-internal instruction memory in bytes
    MEM_INT_DMEM_SIZE : natural := 20*1024     -- size of processor-internal data memory in bytes
  );
  port (
    -- Global control --
    clk_i       : in  std_ulogic; -- global clock, rising edge
    rstn_i      : in  std_ulogic; -- global reset, low-active, async
    -- GPIO --
    gpio_o      : out std_ulogic_vector(7 downto 0); -- parallel output
	 
--	 --interrupt--
--	 xirq_i		 : in  std_ulogic_vector(4 downto 0);
	 
	 -- CFS --
	 cfs_in_i    : in  std_ulogic_vector(31 downto 0);
	 cfs_out_o   : out std_ulogic_vector(31 downto 0);
	 
	 --slink_RX--
	 slink_rx_dat_i : in  std_ulogic_vector(31 downto 0);
	 slink_rx_val_i : in  std_ulogic;
	 slink_rx_rdy_o : out std_ulogic;
	 --slink_TX--
	 slink_tx_dat_o : out std_ulogic_vector(31 downto 0);
	 slink_tx_val_o : out std_ulogic;
	 slink_tx_rdy_i : in  std_ulogic;
	 
	 -- UART1 --
	 uart1_txd_o : out std_ulogic; -- UART1 send data
    uart1_rxd_i : in  std_ulogic;-- UART1 receive data
    -- UART0 --
    uart0_txd_o : out std_ulogic; -- UART0 send data
    uart0_rxd_i : in  std_ulogic  -- UART0 receive data	
 );
end entity;

architecture neorv32_test_setup_bootloader_rtl of neorv32_test_setup_bootloader is

  signal con_gpio_o : std_ulogic_vector(63 downto 0);

begin

  -- The Core Of The Problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  neorv32_top_inst: neorv32_top
  generic map (
    -- General --
    CLOCK_FREQUENCY              => CLOCK_FREQUENCY,   -- clock frequency of clk_i in Hz
    INT_BOOTLOADER_EN            => true,              -- boot configuration: true = boot explicit bootloader; false = boot from int/ext (I)MEM
    -- RISC-V CPU Extensions --
    CPU_EXTENSION_RISCV_C        => true,              -- implement compressed extension?
    CPU_EXTENSION_RISCV_M        => true,              -- implement mul/div extension?
    CPU_EXTENSION_RISCV_Zicntr   => true,              -- implement base counters?
    -- Internal Instruction memory --
    MEM_INT_IMEM_EN              => true,              -- implement processor-internal instruction memory
    MEM_INT_IMEM_SIZE            => MEM_INT_IMEM_SIZE, -- size of processor-internal instruction memory in bytes
    -- Internal Data memory --
    MEM_INT_DMEM_EN              => true,              -- implement processor-internal data memory
    MEM_INT_DMEM_SIZE            => MEM_INT_DMEM_SIZE, -- size of processor-internal data memory in bytes
    -- Processor peripherals --
    IO_GPIO_NUM                  => 12,                 -- number of GPIO input/output pairs (0..64)
    IO_MTIME_EN                  => true,              -- implement machine system timer (MTIME)?
    
--	 --interrupt--
--	 XIRQ_NUM_CH						=>5,
--	 XIRQ_TRIGGER_TYPE				=>"11111111111111111111111111111111",
--	 XIRQ_TRIGGER_POLARITY			=>"00000000000000000000000000000000",
	 
	 -- CFS configuration -- 
	 IO_CFS_EN							=>true,
	 IO_CFS_CONFIG						=>"00000000000000000000000000000001",
	 IO_CFS_IN_SIZE					=>32,
	 IO_CFS_OUT_SIZE					=>32,	
	
	 --SLINK--
	 IO_SLINK_EN						=>true,
	 IO_SLINK_RX_FIFO					=>1024,
	 IO_SLINK_TX_FIFO					=>16, 
	 
	 --UART1--
	 IO_UART1_EN                  => true,              -- implement primary universal asynchronous receiver/transmitter (UART1)?
	 IO_UART1_RX_FIFO             => 64,				    -- RX fifo depth, has to be a power of two, min 1
	 IO_UART1_TX_FIFO             => 256,       
	 --UART0--
	 IO_UART0_EN                  => true               -- implement primary universal asynchronous receiver/transmitter (UART0)?	 
  )
  port map (
    -- Global control --
    clk_i       => clk_i,       -- global clock, rising edge
    rstn_i      => rstn_i,      -- global reset, low-active, async
    -- GPIO (available if IO_GPIO_EN = true) --
    gpio_o      => con_gpio_o,  -- parallel output
    
--	 --available interrupt if IO_GPIO_NUM >0) 
--	 xirq_i(4 downto 0)	=>xirq_i,
	 
	 -- cfs control --	
	 cfs_in_i	 => cfs_in_i,
	 cfs_out_o	 => cfs_out_o,
	 
	 -- primary SLINK (available if IO_GPIO_NUM > 0) --
	 slink_rx_dat_i(31 downto 0)	=>slink_rx_dat_i,
	 slink_rx_val_i 					=>slink_rx_val_i,
	 slink_rx_rdy_o  					=>slink_rx_rdy_o,
	 slink_tx_dat_o(31 downto 0)	=>slink_tx_dat_o,
	 slink_tx_val_o 					=>slink_tx_val_o,
	 slink_tx_rdy_i 					=>slink_tx_rdy_i,
	 
	 -- primary UART1 (available if IO_GPIO_NUM > 0) --
	 uart1_txd_o => uart1_txd_o, -- UART1 send data
    uart1_rxd_i => uart1_rxd_i, -- UART1 receive data	 
	 -- primary UART0 (available if IO_GPIO_NUM > 0) --
    uart0_txd_o => uart0_txd_o, -- UART0 send data
    uart0_rxd_i => uart0_rxd_i  -- UART0 receive data
  	 
  );

  -- GPIO output --
  gpio_o <= con_gpio_o(7 downto 0);


end architecture;
