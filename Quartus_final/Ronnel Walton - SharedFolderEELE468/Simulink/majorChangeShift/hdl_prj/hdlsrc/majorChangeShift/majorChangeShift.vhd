-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj\hdlsrc\majorChangeShift\majorChangeShift.vhd
-- Created: 2022-05-06 03:21:25
-- 
-- Generated by MATLAB 9.12 and HDL Coder 3.20
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1.01725e-08
-- Target subsystem base rate: 1.01725e-08
-- Explicit user oversample request: 2048x
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        2.08333e-05
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- AudioOut                      ce_out        2.08333e-05
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: majorChangeShift
-- Source Path: majorChangeShift/majorChangeShift
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY majorChangeShift IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        AudioIn                           :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En16
        Pitch1                            :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En16
        Pitch2                            :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En16
        ce_out                            :   OUT   std_logic;
        AudioOut                          :   OUT   std_logic_vector(23 DOWNTO 0)  -- sfix24_En16
        );
END majorChangeShift;


ARCHITECTURE rtl OF majorChangeShift IS

  ATTRIBUTE multstyle : string;

  -- Component Declarations
  COMPONENT majorChangeShift_tc
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb_2048_1_0                    :   OUT   std_logic;
          enb                             :   OUT   std_logic;
          enb_1_1_1                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT DualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : majorChangeShift_tc
    USE ENTITY work.majorChangeShift_tc(rtl);

  FOR ALL : DualPortRAM_generic
    USE ENTITY work.DualPortRAM_generic(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_1_1                        : std_logic;
  SIGNAL enb_2048_1_0                     : std_logic;
  SIGNAL tt_ctrl_const_out                : std_logic;
  SIGNAL tt_ctrl_delay_out                : std_logic;
  SIGNAL tt_Initial_Val_out               : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count_step                       : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tt_out1                          : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL count                            : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL tt_out                           : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL plus2_out1                       : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Sum_add_cast                     : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Sum_out1                         : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Enable_out1                      : std_logic;
  SIGNAL count_step_1                     : unsigned(25 DOWNTO 0);  -- ufix26_En16
  SIGNAL idx1_out1                        : unsigned(25 DOWNTO 0);  -- ufix26_En16
  SIGNAL count_1                          : unsigned(25 DOWNTO 0);  -- ufix26_En16
  SIGNAL Pitch1_signed                    : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Subtract1_add_cast               : unsigned(25 DOWNTO 0);  -- ufix26_En16
  SIGNAL Subtract1_add_temp               : unsigned(25 DOWNTO 0);  -- ufix26_En16
  SIGNAL Subtract1_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL tt1_ctrl_const_out               : std_logic;
  SIGNAL tt1_ctrl_delay_out               : std_logic;
  SIGNAL tt1_Initial_Val_out              : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_step_2                     : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tt1_out1                         : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_2                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL tt1_out                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL buffer_size_out1                 : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Bit_Shift_out1                   : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Add_add_cast                     : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Add_add_cast_1                   : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Add_out1                         : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Sum1_add_temp                    : signed(26 DOWNTO 0);  -- sfix27_En16
  SIGNAL Sum1_out1                        : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Pitch2_signed                    : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Subtract2_add_cast               : unsigned(25 DOWNTO 0);  -- ufix26_En16
  SIGNAL Subtract2_add_temp               : unsigned(25 DOWNTO 0);  -- ufix26_En16
  SIGNAL Subtract2_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL ringbuffer1_out1                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer1_out2                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer1_out2_signed          : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Gain_out1                        : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL ringbuffer2_out1                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer2_out2                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer2_out2_signed          : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Add4_stage2_add_cast             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_stage2_add_temp             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_op_stage1                   : signed(48 DOWNTO 0);  -- sfix49_En40
  SIGNAL ringbuffer3_out1                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer3_out2                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer3_out2_signed          : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Gain1_out1                       : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_stage3_add_cast             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_stage3_add_temp             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_op_stage2                   : signed(49 DOWNTO 0);  -- sfix50_En40
  SIGNAL ringbuffer4_out1                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer4_out2                 : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL ringbuffer4_out2_signed          : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Add4_stage4_add_cast             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_stage4_add_cast_1           : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_stage4_add_temp             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_op_stage3                   : signed(50 DOWNTO 0);  -- sfix51_En40
  SIGNAL AudioIn_signed                   : signed(23 DOWNTO 0);  -- sfix24_En16
  SIGNAL Gain2_out1                       : signed(47 DOWNTO 0);  -- sfix48_En39
  SIGNAL Add4_stage5_add_cast             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_stage5_add_cast_1           : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_stage5_add_temp             : signed(47 DOWNTO 0);  -- sfix48_En40
  SIGNAL Add4_out1                        : signed(23 DOWNTO 0);  -- sfix24_En16

BEGIN
  u_majorChangeShift_tc : majorChangeShift_tc
    PORT MAP( clk => clk,
              reset => reset,
              clk_enable => clk_enable,
              enb_2048_1_0 => enb_2048_1_0,
              enb => enb,
              enb_1_1_1 => enb_1_1_1
              );

  u_ringbuffer1 : DualPortRAM_generic
    GENERIC MAP( AddrWidth => 16,
                 DataWidth => 24
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => AudioIn,
              wr_addr => std_logic_vector(Sum_out1),
              wr_en => Enable_out1,
              rd_addr => std_logic_vector(Subtract1_out1),
              wr_dout => ringbuffer1_out1,
              rd_dout => ringbuffer1_out2
              );

  u_ringbuffer2 : DualPortRAM_generic
    GENERIC MAP( AddrWidth => 16,
                 DataWidth => 24
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => AudioIn,
              wr_addr => std_logic_vector(Sum1_out1),
              wr_en => Enable_out1,
              rd_addr => std_logic_vector(Subtract1_out1),
              wr_dout => ringbuffer2_out1,
              rd_dout => ringbuffer2_out2
              );

  u_ringbuffer3 : DualPortRAM_generic
    GENERIC MAP( AddrWidth => 16,
                 DataWidth => 24
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => AudioIn,
              wr_addr => std_logic_vector(Sum_out1),
              wr_en => Enable_out1,
              rd_addr => std_logic_vector(Subtract2_out1),
              wr_dout => ringbuffer3_out1,
              rd_dout => ringbuffer3_out2
              );

  u_ringbuffer4 : DualPortRAM_generic
    GENERIC MAP( AddrWidth => 16,
                 DataWidth => 24
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => AudioIn,
              wr_addr => std_logic_vector(Sum1_out1),
              wr_en => Enable_out1,
              rd_addr => std_logic_vector(Subtract2_out1),
              wr_dout => ringbuffer4_out1,
              rd_dout => ringbuffer4_out2
              );

  tt_ctrl_const_out <= '1';

  tt_ctrl_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tt_ctrl_delay_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tt_ctrl_delay_out <= tt_ctrl_const_out;
      END IF;
    END IF;
  END PROCESS tt_ctrl_delay_process;


  tt_Initial_Val_out <= to_unsigned(16#001#, 10);

  -- Free running, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  count_step <= to_unsigned(16#001#, 10);

  count <= tt_out1 + count_step;

  tt_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tt_out <= to_unsigned(16#000#, 10);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tt_out <= count;
      END IF;
    END IF;
  END PROCESS tt_process;


  
  tt_out1 <= tt_Initial_Val_out WHEN tt_ctrl_delay_out = '0' ELSE
      tt_out;

  plus2_out1 <= to_signed(16#0010000#, 27);

  Sum_add_cast <= unsigned(plus2_out1(25 DOWNTO 16));
  Sum_out1 <= resize(tt_out1 + Sum_add_cast, 16);

  Enable_out1 <= '1';

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  count_step_1 <= to_unsigned(16#0010000#, 26);

  count_1 <= idx1_out1 + count_step_1;

  idx1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      idx1_out1 <= to_unsigned(16#0000000#, 26);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        idx1_out1 <= count_1;
      END IF;
    END IF;
  END PROCESS idx1_process;


  Pitch1_signed <= signed(Pitch1);

  Subtract1_add_cast <= unsigned(resize(Pitch1_signed, 26));
  Subtract1_add_temp <= idx1_out1 + Subtract1_add_cast;
  Subtract1_out1 <= (resize(Subtract1_add_temp(25 DOWNTO 16), 16)) + ('0' & Subtract1_add_temp(15));

  tt1_ctrl_const_out <= '1';

  tt1_ctrl_delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tt1_ctrl_delay_out <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tt1_ctrl_delay_out <= tt1_ctrl_const_out;
      END IF;
    END IF;
  END PROCESS tt1_ctrl_delay_process;


  tt1_Initial_Val_out <= to_unsigned(16#001#, 9);

  -- Free running, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  count_step_2 <= to_unsigned(16#001#, 9);

  count_2 <= tt1_out1 + count_step_2;

  tt1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      tt1_out <= to_unsigned(16#000#, 9);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        tt1_out <= count_2;
      END IF;
    END IF;
  END PROCESS tt1_process;


  
  tt1_out1 <= tt1_Initial_Val_out WHEN tt1_ctrl_delay_out = '0' ELSE
      tt1_out;

  buffer_size_out1 <= to_signed(16#7FFFFF#, 24);

  Bit_Shift_out1 <= buffer_size_out1 srl 1;

  Add_add_cast <= signed(resize(tt1_out1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 27));
  Add_add_cast_1 <= resize(Bit_Shift_out1, 27);
  Add_out1 <= Add_add_cast + Add_add_cast_1;

  Sum1_add_temp <= Add_out1 + plus2_out1;
  Sum1_out1 <= unsigned(resize(Sum1_add_temp(26 DOWNTO 16), 16));

  Pitch2_signed <= signed(Pitch2);

  Subtract2_add_cast <= unsigned(resize(Pitch2_signed, 26));
  Subtract2_add_temp <= idx1_out1 + Subtract2_add_cast;
  Subtract2_out1 <= (resize(Subtract2_add_temp(25 DOWNTO 16), 16)) + ('0' & Subtract2_add_temp(15));

  ringbuffer1_out2_signed <= signed(ringbuffer1_out2);

  Gain_out1 <= resize(ringbuffer1_out2_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 48);

  ringbuffer2_out2_signed <= signed(ringbuffer2_out2);

  Add4_stage2_add_cast <= ringbuffer2_out2_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  Add4_stage2_add_temp <= Gain_out1 + Add4_stage2_add_cast;
  Add4_op_stage1 <= resize(Add4_stage2_add_temp, 49);

  ringbuffer3_out2_signed <= signed(ringbuffer3_out2);

  Gain1_out1 <= resize(ringbuffer3_out2_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 48);

  Add4_stage3_add_cast <= Add4_op_stage1(47 DOWNTO 0);
  Add4_stage3_add_temp <= Add4_stage3_add_cast + Gain1_out1;
  Add4_op_stage2 <= resize(Add4_stage3_add_temp, 50);

  ringbuffer4_out2_signed <= signed(ringbuffer4_out2);

  Add4_stage4_add_cast <= Add4_op_stage2(47 DOWNTO 0);
  Add4_stage4_add_cast_1 <= ringbuffer4_out2_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0';
  Add4_stage4_add_temp <= Add4_stage4_add_cast + Add4_stage4_add_cast_1;
  Add4_op_stage3 <= resize(Add4_stage4_add_temp, 51);

  AudioIn_signed <= signed(AudioIn);

  Gain2_out1 <= resize(AudioIn_signed & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 48);

  Add4_stage5_add_cast <= Add4_op_stage3(47 DOWNTO 0);
  Add4_stage5_add_cast_1 <= Gain2_out1(46 DOWNTO 0) & '0';
  Add4_stage5_add_temp <= Add4_stage5_add_cast + Add4_stage5_add_cast_1;
  Add4_out1 <= Add4_stage5_add_temp(47 DOWNTO 24);

  AudioOut <= std_logic_vector(Add4_out1);

  ce_out <= enb_1_1_1;

END rtl;

