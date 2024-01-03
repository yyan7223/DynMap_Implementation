-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity runOne_dynamic_placement_routing_allocated_tiles_levelsValidLen_shapes_values_ROM_AUrcU is 
    generic(
             DataWidth     : integer := 4; 
             AddressWidth     : integer := 7; 
             AddressRange    : integer := 80
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of runOne_dynamic_placement_routing_allocated_tiles_levelsValidLen_shapes_values_ROM_AUrcU is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "0010", 1 => "0110", 2 => "0100", 3 => "0000", 4 => "0010", 
    5 => "0100", 6 => "0110", 7 => "0000", 8 => "0001", 9 => "0110", 
    10 => "0101", 11 => "0000", 12 => "1010", 13 => "0010", 14 to 15=> "0000", 
    16 => "0001", 17 => "0010", 18 => "0101", 19 => "0000", 20 to 21=> "0100", 
    22 to 23=> "0000", 24 => "0010", 25 => "0110", 26 to 27=> "0000", 28 => "0110", 
    29 => "0010", 30 to 31=> "0000", 32 => "0010", 33 => "0100", 34 to 35=> "0000", 
    36 to 38=> "0010", 39 => "0000", 40 to 42=> "0010", 43 => "0000", 44 => "0100", 
    45 => "0010", 46 to 47=> "0000", 48 => "0001", 49 => "0011", 50 => "0001", 
    51 => "0000", 52 to 53=> "0001", 54 => "0011", 55 => "0000", 56 => "0011", 
    57 => "0010", 58 to 59=> "0000", 60 => "0011", 61 => "0010", 62 to 63=> "0000", 
    64 => "0100", 65 to 67=> "0000", 68 to 69=> "0010", 70 to 71=> "0000", 72 to 73=> "0010", 
    74 to 75=> "0000", 76 to 77=> "0010", 78 to 79=> "0000" );


begin 


memory_access_guard_0: process (address0) 
begin
      address0_tmp <= address0;
--synthesis translate_off
      if (CONV_INTEGER(address0) > AddressRange-1) then
           address0_tmp <= (others => '0');
      else 
           address0_tmp <= address0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(address0_tmp)); 
        end if;
    end if;
end process;

end rtl;

