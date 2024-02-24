-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_3R is 
    generic(
             DataWidth     : integer := 2; 
             AddressWidth     : integer := 4; 
             AddressRange    : integer := 16
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          address1      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce1       : in std_logic; 
          q1         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of runOne_BypassOptPlacement_Gen_Record_Tile2XY_0_ROM_AUTO_3R is 

signal address0_t1_tmp : std_logic_vector(AddressWidth-1 downto 0); 
signal address1_t1_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "00", 1 => "01", 2 => "10", 3 => "11", 4 => "00", 5 => "01", 
    6 => "10", 7 => "11", 8 => "00", 9 => "01", 10 => "10", 11 => "11", 
    12 => "00", 13 => "01", 14 => "10", 15 => "11" );


signal address0_t0 : std_logic_vector(AddressWidth-1 downto 0); 
signal address0_t1 : std_logic_vector(AddressWidth-1 downto 0); 
signal q0_t0 : std_logic_vector(DataWidth-1 downto 0);
signal q0_t1 : std_logic_vector(DataWidth-1 downto 0);
signal address1_t0 : std_logic_vector(AddressWidth-1 downto 0); 
signal address1_t1 : std_logic_vector(AddressWidth-1 downto 0); 
signal q1_t0 : std_logic_vector(DataWidth-1 downto 0);
signal q1_t1 : std_logic_vector(DataWidth-1 downto 0);
begin 

address0_t0 <= address0;
q0 <= q0_t1;
address1_t0 <= address1;
q1 <= q1_t1;

p_IO_pipeline_reg : process (clk)  
begin
    if (clk'event and clk = '1') then
      if (ce0 = '1') then 
        address0_t1 <= address0_t0; 
        q0_t1 <= q0_t0;
      end if;
      if (ce1 = '1') then 
        address1_t1 <= address1_t0; 
        q1_t1 <= q1_t0;
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

memory_access_guard_1: process (address1_t1) 
begin
      address1_t1_tmp <= address1_t1;
--synthesis translate_off
      if (CONV_INTEGER(address1_t1) > AddressRange-1) then
           address1_t1_tmp <= (others => '0');
      else 
           address1_t1_tmp <= address1_t1;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0_t0 <= mem(CONV_INTEGER(address0_t1_tmp)); 
        end if;
        if (ce1 = '1') then 
            q1_t0 <= mem(CONV_INTEGER(address1_t1_tmp)); 
        end if;
    end if;
end process;

end rtl;

