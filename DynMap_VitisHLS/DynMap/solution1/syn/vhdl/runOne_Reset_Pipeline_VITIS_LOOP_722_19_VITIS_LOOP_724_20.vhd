-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
-- Version: 2021.2
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity runOne_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    add_ln722 : IN STD_LOGIC_VECTOR (9 downto 0);
    mul_ln725 : IN STD_LOGIC_VECTOR (9 downto 0);
    dependency_predecessor_values_address0 : OUT STD_LOGIC_VECTOR (9 downto 0);
    dependency_predecessor_values_ce0 : OUT STD_LOGIC;
    dependency_predecessor_values_we0 : OUT STD_LOGIC;
    dependency_predecessor_values_d0 : OUT STD_LOGIC_VECTOR (7 downto 0) );
end;


architecture behav of runOne_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv7_7F : STD_LOGIC_VECTOR (6 downto 0) := "1111111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln722_fu_130_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal dependency_predecessors_kernels_values1_address0 : STD_LOGIC_VECTOR (12 downto 0);
    signal dependency_predecessors_kernels_values1_ce0 : STD_LOGIC;
    signal dependency_predecessors_kernels_values1_q0 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal select_ln722_fu_160_p3 : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln722_reg_349 : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln722_reg_349_pp0_iter1_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln722_reg_349_pp0_iter2_reg : STD_LOGIC_VECTOR (3 downto 0);
    signal select_ln722_1_fu_168_p3 : STD_LOGIC_VECTOR (5 downto 0);
    signal select_ln722_1_reg_356 : STD_LOGIC_VECTOR (5 downto 0);
    signal select_ln722_1_reg_356_pp0_iter1_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal select_ln722_1_reg_356_pp0_iter2_reg : STD_LOGIC_VECTOR (5 downto 0);
    signal dependency_predecessors_kernels_values1_load_reg_368 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln725_2_fu_240_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal zext_ln730_5_fu_282_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal j_fu_62 : STD_LOGIC_VECTOR (3 downto 0);
    signal add_ln724_fu_176_p2 : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_j_load : STD_LOGIC_VECTOR (3 downto 0);
    signal i_fu_66 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_sig_allocacmp_i_load : STD_LOGIC_VECTOR (5 downto 0);
    signal indvar_flatten54_fu_70 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln722_1_fu_136_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_sig_allocacmp_indvar_flatten54_load : STD_LOGIC_VECTOR (9 downto 0);
    signal icmp_ln724_fu_154_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_13_fu_148_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal zext_ln730_fu_197_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln725_fu_200_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal tmp_fu_213_p3 : STD_LOGIC_VECTOR (10 downto 0);
    signal p_shl_cast_fu_205_p3 : STD_LOGIC_VECTOR (12 downto 0);
    signal zext_ln725_1_fu_221_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln725_1_fu_225_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal zext_ln730_3_fu_231_p1 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln725_2_fu_234_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal tmp_s_fu_245_p3 : STD_LOGIC_VECTOR (8 downto 0);
    signal tmp_6_fu_256_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal zext_ln730_1_fu_252_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln730_2_fu_263_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln730_fu_267_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal zext_ln730_4_fu_273_p1 : STD_LOGIC_VECTOR (9 downto 0);
    signal add_ln730_1_fu_276_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal icmp_ln725_fu_287_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln725_1_fu_295_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal or_ln725_fu_300_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln725_fu_292_p1 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln725_fu_306_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component runOne_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_dependency_predecessors_kebkb IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (12 downto 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR (5 downto 0) );
    end component;


    component runOne_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    dependency_predecessors_kernels_values1_U : component runOne_Reset_Pipeline_VITIS_LOOP_722_19_VITIS_LOOP_724_20_dependency_predecessors_kebkb
    generic map (
        DataWidth => 6,
        AddressRange => 6000,
        AddressWidth => 13)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => dependency_predecessors_kernels_values1_address0,
        ce0 => dependency_predecessors_kernels_values1_ce0,
        q0 => dependency_predecessors_kernels_values1_q0);

    flow_control_loop_pipe_sequential_init_U : component runOne_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    i_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln722_fu_130_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    i_fu_66 <= select_ln722_1_fu_168_p3;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    i_fu_66 <= ap_const_lv6_0;
                end if;
            end if; 
        end if;
    end process;

    indvar_flatten54_fu_70_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln722_fu_130_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    indvar_flatten54_fu_70 <= add_ln722_1_fu_136_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten54_fu_70 <= ap_const_lv10_0;
                end if;
            end if; 
        end if;
    end process;

    j_fu_62_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((icmp_ln722_fu_130_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
                    j_fu_62 <= add_ln724_fu_176_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    j_fu_62 <= ap_const_lv4_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
                select_ln722_1_reg_356_pp0_iter1_reg <= select_ln722_1_reg_356;
                select_ln722_reg_349_pp0_iter1_reg <= select_ln722_reg_349;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_boolean_0 = ap_block_pp0_stage0_11001)) then
                dependency_predecessors_kernels_values1_load_reg_368 <= dependency_predecessors_kernels_values1_q0;
                select_ln722_1_reg_356_pp0_iter2_reg <= select_ln722_1_reg_356_pp0_iter1_reg;
                select_ln722_reg_349_pp0_iter2_reg <= select_ln722_reg_349_pp0_iter1_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln722_fu_130_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                select_ln722_1_reg_356 <= select_ln722_1_fu_168_p3;
                select_ln722_reg_349 <= select_ln722_fu_160_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln722_1_fu_136_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_indvar_flatten54_load) + unsigned(ap_const_lv10_1));
    add_ln724_fu_176_p2 <= std_logic_vector(unsigned(select_ln722_fu_160_p3) + unsigned(ap_const_lv4_1));
    add_ln725_1_fu_225_p2 <= std_logic_vector(unsigned(p_shl_cast_fu_205_p3) + unsigned(zext_ln725_1_fu_221_p1));
    add_ln725_2_fu_234_p2 <= std_logic_vector(unsigned(add_ln725_1_fu_225_p2) + unsigned(zext_ln730_3_fu_231_p1));
    add_ln725_fu_200_p2 <= std_logic_vector(unsigned(mul_ln725) + unsigned(zext_ln730_fu_197_p1));
    add_ln730_1_fu_276_p2 <= std_logic_vector(unsigned(add_ln730_fu_267_p2) + unsigned(zext_ln730_4_fu_273_p1));
    add_ln730_fu_267_p2 <= std_logic_vector(unsigned(zext_ln730_1_fu_252_p1) + unsigned(zext_ln730_2_fu_263_p1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone, icmp_ln722_fu_130_p2)
    begin
        if (((icmp_ln722_fu_130_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_block_pp0_stage0_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_idle_pp0 = ap_const_logic_1) and (ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_i_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, i_fu_66)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_i_load <= ap_const_lv6_0;
        else 
            ap_sig_allocacmp_i_load <= i_fu_66;
        end if; 
    end process;


    ap_sig_allocacmp_indvar_flatten54_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, ap_loop_init, indvar_flatten54_fu_70)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_indvar_flatten54_load <= ap_const_lv10_0;
        else 
            ap_sig_allocacmp_indvar_flatten54_load <= indvar_flatten54_fu_70;
        end if; 
    end process;


    ap_sig_allocacmp_j_load_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, j_fu_62, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_j_load <= ap_const_lv4_0;
        else 
            ap_sig_allocacmp_j_load <= j_fu_62;
        end if; 
    end process;

    dependency_predecessor_values_address0 <= zext_ln730_5_fu_282_p1(10 - 1 downto 0);

    dependency_predecessor_values_ce0_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            dependency_predecessor_values_ce0 <= ap_const_logic_1;
        else 
            dependency_predecessor_values_ce0 <= ap_const_logic_0;
        end if; 
    end process;

        dependency_predecessor_values_d0 <= std_logic_vector(IEEE.numeric_std.resize(signed(select_ln725_fu_306_p3),8));


    dependency_predecessor_values_we0_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
            dependency_predecessor_values_we0 <= ap_const_logic_1;
        else 
            dependency_predecessor_values_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dependency_predecessors_kernels_values1_address0 <= zext_ln725_2_fu_240_p1(13 - 1 downto 0);

    dependency_predecessors_kernels_values1_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            dependency_predecessors_kernels_values1_ce0 <= ap_const_logic_1;
        else 
            dependency_predecessors_kernels_values1_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    i_13_fu_148_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_i_load) + unsigned(ap_const_lv6_1));
    icmp_ln722_fu_130_p2 <= "1" when (ap_sig_allocacmp_indvar_flatten54_load = add_ln722) else "0";
    icmp_ln724_fu_154_p2 <= "1" when (ap_sig_allocacmp_j_load = ap_const_lv4_A) else "0";
    icmp_ln725_1_fu_295_p2 <= "0" when (dependency_predecessors_kernels_values1_load_reg_368 = ap_const_lv6_0) else "1";
    icmp_ln725_fu_287_p2 <= "1" when (select_ln722_reg_349_pp0_iter2_reg = ap_const_lv4_0) else "0";
    or_ln725_fu_300_p2 <= (icmp_ln725_fu_287_p2 or icmp_ln725_1_fu_295_p2);
    p_shl_cast_fu_205_p3 <= (add_ln725_fu_200_p2 & ap_const_lv3_0);
    select_ln722_1_fu_168_p3 <= 
        i_13_fu_148_p2 when (icmp_ln724_fu_154_p2(0) = '1') else 
        ap_sig_allocacmp_i_load;
    select_ln722_fu_160_p3 <= 
        ap_const_lv4_0 when (icmp_ln724_fu_154_p2(0) = '1') else 
        ap_sig_allocacmp_j_load;
    select_ln725_fu_306_p3 <= 
        zext_ln725_fu_292_p1 when (or_ln725_fu_300_p2(0) = '1') else 
        ap_const_lv7_7F;
    tmp_6_fu_256_p3 <= (select_ln722_1_reg_356_pp0_iter2_reg & ap_const_lv1_0);
    tmp_fu_213_p3 <= (add_ln725_fu_200_p2 & ap_const_lv1_0);
    tmp_s_fu_245_p3 <= (select_ln722_1_reg_356_pp0_iter2_reg & ap_const_lv3_0);
    zext_ln725_1_fu_221_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_fu_213_p3),13));
    zext_ln725_2_fu_240_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln725_2_fu_234_p2),64));
    zext_ln725_fu_292_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(dependency_predecessors_kernels_values1_load_reg_368),7));
    zext_ln730_1_fu_252_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_s_fu_245_p3),10));
    zext_ln730_2_fu_263_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(tmp_6_fu_256_p3),10));
    zext_ln730_3_fu_231_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln722_reg_349),13));
    zext_ln730_4_fu_273_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln722_reg_349_pp0_iter2_reg),10));
    zext_ln730_5_fu_282_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln730_1_fu_276_p2),64));
    zext_ln730_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln722_1_reg_356),10));
end behav;