-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity runOne_DFG_NodesCount_kernels_values_ROM_AUTO_3R is 
    generic(
             DataWidth     : integer := 6; 
             AddressWidth     : integer := 3; 
             AddressRange    : integer := 6
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of runOne_DFG_NodesCount_kernels_values_ROM_AUTO_3R is 

signal address0_t1_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "101010", 2 => "100000", 3 => "011111", 4 => "010101", 5 => "010001" );


signal address0_t0 : std_logic_vector(AddressWidth-1 downto 0); 
signal address0_t1 : std_logic_vector(AddressWidth-1 downto 0); 
signal q0_t0 : std_logic_vector(DataWidth-1 downto 0);
signal q0_t1 : std_logic_vector(DataWidth-1 downto 0);
begin 

address0_t0 <= address0;
q0 <= q0_t1;

p_IO_pipeline_reg : process (clk)  
begin
    if (clk'event and clk = '1') then
      if (ce0 = '1') then 
        address0_t1 <= address0_t0; 
        q0_t1 <= q0_t0;
      end if;
    end if;
end process;

memory_access_guard_0: process (address0_t1) 
begin
      address0_t1_tmp <= address0_t1;
--synthesis translate_off
      if (CONV_INTEGER(address0_t1) > AddressRange-1) then
           address0_t1_tmp <= (others => '0');
      else 
           address0_t1_tmp <= address0_t1;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0_t0 <= mem(CONV_INTEGER(address0_t1_tmp)); 
        end if;
    end if;
end process;

end rtl;

