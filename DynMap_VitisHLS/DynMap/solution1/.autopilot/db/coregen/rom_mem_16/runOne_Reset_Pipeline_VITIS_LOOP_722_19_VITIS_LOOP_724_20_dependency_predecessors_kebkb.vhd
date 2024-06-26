-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity runOne_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_dependency_predecessors_kebkb is 
    generic(
             DataWidth     : integer := 6; 
             AddressWidth     : integer := 13; 
             AddressRange    : integer := 6000
    ); 
    port (
          address0      : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DataWidth-1 downto 0);
          reset     : in std_logic;
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of runOne_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_dependency_predecessors_kebkb is 

signal address0_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal mem : mem_array := (
    0 => "100111", 1 => "101001", 2 to 69=> "000000", 70 => "000100", 71 to 79=> "000000", 
    80 => "000100", 81 to 89=> "000000", 90 => "011010", 91 to 99=> "000000", 100 => "011010", 
    101 to 109=> "000000", 110 => "100111", 111 to 119=> "000000", 120 => "000101", 121 to 129=> "000000", 
    130 => "011011", 131 to 139=> "000000", 140 => "101000", 141 to 150=> "000000", 151 => "101001", 
    152 to 159=> "000000", 160 => "000001", 161 => "101001", 162 to 169=> "000000", 170 => "000010", 
    171 => "101001", 172 to 179=> "000000", 180 => "000011", 181 => "101001", 182 to 189=> "000000", 
    190 => "101001", 191 to 200=> "000000", 201 => "101001", 202 to 209=> "000000", 210 => "101001", 
    211 to 219=> "000000", 220 => "000111", 221 to 229=> "000000", 230 => "001000", 231 to 239=> "000000", 
    240 => "001001", 241 to 249=> "000000", 250 => "001010", 251 to 259=> "000000", 260 => "010011", 
    261 to 269=> "000000", 270 => "011101", 271 to 279=> "000000", 280 => "100000", 281 to 289=> "000000", 
    290 => "001011", 291 to 299=> "000000", 300 => "010100", 301 to 309=> "000000", 310 => "011110", 
    311 to 319=> "000000", 320 => "100001", 321 to 329=> "000000", 330 => "001111", 331 => "001100", 
    332 to 339=> "000000", 340 => "011111", 341 => "100010", 342 to 349=> "000000", 350 => "010000", 
    351 => "001101", 352 to 359=> "000000", 360 => "011100", 361 => "100011", 362 to 369=> "000000", 
    370 => "010001", 371 => "001110", 372 to 379=> "000000", 380 => "100101", 381 to 389=> "000000", 
    390 => "010010", 391 => "010101", 392 to 399=> "000000", 400 => "000110", 401 => "010110", 
    402 to 409=> "000000", 410 => "011000", 411 to 999=> "000000", 1000 => "100111", 1001 => "101001", 
    1002 to 1019=> "000000", 1020 => "100111", 1021 => "101001", 1022 to 1029=> "000000", 1030 => "101000", 
    1031 to 1040=> "000000", 1041 => "101001", 1042 to 1049=> "000000", 1050 => "000001", 1051 to 1059=> "000000", 
    1060 => "000001", 1061 to 1069=> "000000", 1070 => "000001", 1071 to 1079=> "000000", 1080 => "000010", 
    1081 => "101001", 1082 to 1089=> "000000", 1090 => "010001", 1091 to 1099=> "000000", 1100 => "010001", 
    1101 to 1109=> "000000", 1110 => "010001", 1111 to 1119=> "000000", 1120 => "011100", 1121 to 1129=> "000000", 
    1130 => "011100", 1131 to 1139=> "000000", 1140 => "011100", 1141 to 1149=> "000000", 1150 => "000011", 
    1151 to 1159=> "000000", 1160 => "010010", 1161 to 1169=> "000000", 1170 => "010111", 1171 to 1179=> "000000", 
    1180 => "011101", 1181 to 1189=> "000000", 1190 => "100010", 1191 to 1199=> "000000", 1200 => "000100", 
    1201 to 1209=> "000000", 1210 => "000100", 1211 to 1219=> "000000", 1220 => "000101", 1221 to 1229=> "000000", 
    1230 => "001001", 1231 to 1239=> "000000", 1240 => "000101", 1241 to 1249=> "000000", 1250 => "001001", 
    1251 to 1259=> "000000", 1260 => "000110", 1261 to 1269=> "000000", 1270 => "001010", 1271 to 1279=> "000000", 
    1280 => "000111", 1281 => "101001", 1282 to 1289=> "000000", 1290 => "001011", 1291 => "101001", 
    1292 to 1299=> "000000", 1300 => "000111", 1301 => "101001", 1302 to 1309=> "000000", 1310 => "001011", 
    1311 => "101001", 1312 to 1319=> "000000", 1320 => "001000", 1321 => "001100", 1322 to 1329=> "000000", 
    1330 => "001110", 1331 => "001111", 1332 to 1339=> "000000", 1340 => "010011", 1341 => "001101", 
    1342 to 1349=> "000000", 1350 => "001101", 1351 => "011000", 1352 to 1359=> "000000", 1360 => "011110", 
    1361 => "010000", 1362 to 1369=> "000000", 1370 => "010000", 1371 => "100011", 1372 to 1379=> "000000", 
    1380 => "010101", 1381 to 1389=> "000000", 1390 => "011010", 1391 to 1399=> "000000", 1400 => "100000", 
    1401 to 1409=> "000000", 1410 => "100101", 1411 to 1999=> "000000", 2000 => "011101", 2001 => "011111", 
    2002 to 2029=> "000000", 2030 => "011101", 2031 to 2039=> "000000", 2040 => "011110", 2041 to 2050=> "000000", 
    2051 => "011111", 2052 to 2060=> "000000", 2061 => "011111", 2062 to 2069=> "000000", 2070 => "010110", 
    2071 => "011111", 2072 to 2079=> "000000", 2080 => "000001", 2081 to 2089=> "000000", 2090 => "000001", 
    2091 => "011111", 2092 to 2099=> "000000", 2100 => "000001", 2101 => "011111", 2102 to 2109=> "000000", 
    2110 => "001101", 2111 => "011111", 2112 to 2119=> "000000", 2120 => "010111", 2121 to 2129=> "000000", 
    2130 => "000010", 2131 to 2139=> "000000", 2140 => "000111", 2141 to 2149=> "000000", 2150 => "001010", 
    2151 to 2159=> "000000", 2160 => "001110", 2161 to 2169=> "000000", 2170 => "011000", 2171 to 2179=> "000000", 
    2180 => "000011", 2181 to 2189=> "000000", 2190 => "001000", 2191 to 2199=> "000000", 2200 => "001011", 
    2201 to 2209=> "000000", 2210 => "001111", 2211 to 2219=> "000000", 2220 => "011001", 2221 => "011111", 
    2222 to 2229=> "000000", 2230 => "000100", 2231 => "011111", 2232 to 2239=> "000000", 2240 => "001001", 
    2241 => "001100", 2242 to 2249=> "000000", 2250 => "011010", 2251 to 2259=> "000000", 2260 => "000101", 
    2261 to 2269=> "000000", 2270 => "010001", 2271 => "001001", 2272 => "001100", 2273 to 2279=> "000000", 
    2280 => "010010", 2281 => "010000", 2282 to 2289=> "000000", 2290 => "010011", 2291 => "010000", 
    2292 => "010010", 2293 to 2299=> "000000", 2300 => "010100", 2301 => "000110", 2302 to 2309=> "000000", 
    2310 => "011011", 2311 to 3009=> "000000", 3010 => "011100", 3011 to 3019=> "000000", 3020 => "011101", 
    3021 to 3029=> "000000", 3030 => "011100", 3031 => "011110", 3032 to 3049=> "000000", 3050 => "000011", 
    3051 to 3059=> "000000", 3060 => "000100", 3061 => "000010", 3062 to 3069=> "000000", 3070 => "000101", 
    3071 => "011010", 3072 to 3079=> "000000", 3080 => "011011", 3081 => "011110", 3082 to 3089=> "000000", 
    3090 => "000001", 3091 => "011110", 3092 to 3099=> "000000", 3100 => "000001", 3101 to 3109=> "000000", 
    3110 => "000001", 3111 to 3119=> "000000", 3120 => "000001", 3121 to 3129=> "000000", 3130 => "000001", 
    3131 to 3139=> "000000", 3140 => "000110", 3141 to 3149=> "000000", 3150 => "001001", 3151 to 3159=> "000000", 
    3160 => "001111", 3161 to 3169=> "000000", 3170 => "010101", 3171 to 3179=> "000000", 3180 => "000111", 
    3181 to 3189=> "000000", 3190 => "001010", 3191 to 3199=> "000000", 3200 => "010000", 3201 to 3209=> "000000", 
    3210 => "010110", 3211 to 3219=> "000000", 3220 => "001011", 3221 to 3229=> "000000", 3230 => "010001", 
    3231 to 3239=> "000000", 3240 => "010111", 3241 to 3249=> "000000", 3250 => "001100", 3251 to 3259=> "000000", 
    3260 => "010010", 3261 to 3269=> "000000", 3270 => "001101", 3271 => "001000", 3272 to 3279=> "000000", 
    3280 => "001110", 3281 => "010011", 3282 to 3289=> "000000", 3290 => "010100", 3291 => "011000", 
    3292 to 3299=> "000000", 3300 => "011001", 3301 to 3999=> "000000", 4000 => "010010", 4001 => "010100", 
    4002 to 4009=> "000000", 4010 => "000001", 4011 to 4019=> "000000", 4020 => "010010", 4021 to 4029=> "000000", 
    4030 => "010011", 4031 to 4039=> "000000", 4040 => "010001", 4041 => "010100", 4042 to 4089=> "000000", 
    4090 => "000010", 4091 to 4099=> "000000", 4100 => "000100", 4101 to 4109=> "000000", 4110 => "001010", 
    4111 to 4119=> "000000", 4120 => "000101", 4121 to 4129=> "000000", 4130 => "001011", 4131 to 4139=> "000000", 
    4140 => "000110", 4141 to 4149=> "000000", 4150 => "001100", 4151 to 4159=> "000000", 4160 => "000111", 
    4161 to 4169=> "000000", 4170 => "001101", 4171 to 4179=> "000000", 4180 => "001000", 4181 => "000011", 
    4182 to 4189=> "000000", 4190 => "001110", 4191 => "001001", 4192 to 4199=> "000000", 4200 => "001101", 
    4201 to 5009=> "000000", 5010 => "001110", 5011 to 5019=> "000000", 5020 => "001111", 5021 to 5029=> "000000", 
    5030 => "001110", 5031 => "010000", 5032 to 5059=> "000000", 5060 => "000010", 5061 to 5069=> "000000", 
    5070 => "000011", 5071 to 5079=> "000000", 5080 => "000100", 5081 => "000101", 5082 to 5089=> "000000", 
    5090 => "000100", 5091 => "000101", 5092 to 5099=> "000000", 5100 => "000110", 5101 to 5109=> "000000", 
    5110 => "001001", 5111 to 5119=> "000000", 5120 => "000111", 5121 to 5129=> "000000", 5130 => "001010", 
    5131 to 5139=> "000000", 5140 => "001011", 5141 => "001000", 5142 to 5149=> "000000", 5150 => "001100", 
    5151 => "000001", 5152 to 5159=> "000000", 5160 => "001101", 5161 => "010000", 5162 to 5999=> "000000" );


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

