-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_3R is 
    generic(
             DataWidth     : integer := 4; 
             AddressWidth     : integer := 10; 
             AddressRange    : integer := 600
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of runOne_dynamic_placement_routing_placement_static_Opt2Tile_kernels_values1_ROM_AUTO_3R is 

signal address0_t1_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "1010", 1 => "1001", 2 => "0101", 3 => "0110", 4 => "1010", 
    5 => "1110", 6 => "0010", 7 => "1001", 8 => "0101", 9 => "1101", 
    10 => "1010", 11 => "0001", 12 => "1000", 13 => "1100", 14 => "0110", 
    15 => "0101", 16 => "0100", 17 => "0001", 18 => "0010", 19 => "1000", 
    20 => "0000", 21 => "0100", 22 => "1110", 23 => "1001", 24 => "0110", 
    25 => "0001", 26 => "1101", 27 => "0100", 28 => "1100", 29 => "1010", 
    30 => "1001", 31 => "0101", 32 to 33=> "1000", 34 => "0100", 35 => "1100", 
    36 => "0000", 37 => "1101", 38 => "0010", 39 => "1110", 40 => "1101", 
    41 => "1001", 42 to 99=> "0000", 100 => "0110", 101 => "1010", 102 => "1001", 
    103 => "1010", 104 => "1001", 105 => "0101", 106 => "0110", 107 => "1101", 
    108 => "0001", 109 => "0101", 110 => "0100", 111 => "0010", 112 => "1100", 
    113 => "1000", 114 => "1110", 115 to 116=> "0001", 117 => "1000", 118 => "1101", 
    119 => "1100", 120 => "0010", 121 => "0110", 122 => "0010", 123 => "0100", 
    124 => "0110", 125 => "0101", 126 => "1110", 127 => "0101", 128 => "1101", 
    129 => "0100", 130 => "1010", 131 => "0001", 132 => "1001", 133 => "1010", 
    134 => "1100", 135 => "1101", 136 => "1001", 137 => "1000", 138 => "0000", 
    139 to 140=> "1110", 141 => "1100", 142 to 199=> "0000", 200 => "1001", 201 => "0101", 
    202 => "1001", 203 => "0101", 204 to 205=> "1001", 206 => "1000", 207 => "1100", 
    208 => "1000", 209 => "1100", 210 => "0110", 211 => "0100", 212 => "1101", 
    213 => "0100", 214 => "1101", 215 => "1010", 216 => "0110", 217 => "1100", 
    218 => "0110", 219 => "1010", 220 => "0110", 221 => "1010", 222 => "1000", 
    223 => "0101", 224 => "0110", 225 => "0100", 226 => "1010", 227 => "1001", 
    228 => "0101", 229 => "1101", 230 => "1000", 231 => "0100", 232 to 299=> "0000", 
    300 => "1001", 301 => "0101", 302 => "1001", 303 => "1010", 304 => "1001", 
    305 => "0101", 306 => "1001", 307 => "1000", 308 => "1001", 309 => "1000", 
    310 => "1100", 311 => "1101", 312 => "0110", 313 => "0100", 314 => "1101", 
    315 => "1001", 316 => "1010", 317 => "1100", 318 => "0100", 319 => "0110", 
    320 => "0101", 321 => "1000", 322 => "1010", 323 => "0110", 324 => "1100", 
    325 => "1101", 326 => "1010", 327 => "1100", 328 => "0100", 329 => "1000", 
    330 => "1100", 331 to 399=> "0000", 400 => "1001", 401 => "1010", 402 => "1001", 
    403 => "1010", 404 => "1110", 405 => "1101", 406 => "1100", 407 => "1000", 
    408 to 409=> "1110", 410 => "1101", 411 => "1100", 412 => "1000", 413 => "1100", 
    414 => "1000", 415 => "1101", 416 => "1001", 417 => "1100", 418 => "1101", 
    419 => "1010", 420 => "1110", 421 to 499=> "0000", 500 => "1010", 501 => "1001", 
    502 => "1010", 503 => "1110", 504 => "1101", 505 => "1100", 506 => "1110", 
    507 => "1101", 508 => "1001", 509 to 510=> "1000", 511 => "1100", 512 => "1001", 
    513 => "1101", 514 => "1001", 515 => "1101", 516 => "1110", 517 to 599=> "0000" );


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

