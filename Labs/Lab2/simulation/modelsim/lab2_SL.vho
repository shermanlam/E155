-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "09/17/2014 21:10:51"

-- 
-- Device: Altera EP3C5E144C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	lab2_SL IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	s1 : IN std_logic_vector(3 DOWNTO 0);
	s2 : IN std_logic_vector(3 DOWNTO 0);
	on1 : OUT std_logic;
	on2 : OUT std_logic;
	seg : OUT std_logic_vector(6 DOWNTO 0)
	);
END lab2_SL;

-- Design Ports Information
-- on1	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- on2	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[0]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[1]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[2]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[3]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[4]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[5]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[6]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[0]	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[0]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[1]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[1]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[2]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[2]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[3]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[3]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF lab2_SL IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_s1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_s2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_on1 : std_logic;
SIGNAL ww_on2 : std_logic;
SIGNAL ww_seg : std_logic_vector(6 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \on1~output_o\ : std_logic;
SIGNAL \on2~output_o\ : std_logic;
SIGNAL \seg[0]~output_o\ : std_logic;
SIGNAL \seg[1]~output_o\ : std_logic;
SIGNAL \seg[2]~output_o\ : std_logic;
SIGNAL \seg[3]~output_o\ : std_logic;
SIGNAL \seg[4]~output_o\ : std_logic;
SIGNAL \seg[5]~output_o\ : std_logic;
SIGNAL \seg[6]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \m1|counter[0]~20_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \m1|counter[0]~21\ : std_logic;
SIGNAL \m1|counter[1]~22_combout\ : std_logic;
SIGNAL \m1|counter[1]~23\ : std_logic;
SIGNAL \m1|counter[2]~24_combout\ : std_logic;
SIGNAL \m1|counter[2]~25\ : std_logic;
SIGNAL \m1|counter[3]~26_combout\ : std_logic;
SIGNAL \m1|counter[3]~27\ : std_logic;
SIGNAL \m1|counter[4]~28_combout\ : std_logic;
SIGNAL \m1|counter[4]~29\ : std_logic;
SIGNAL \m1|counter[5]~30_combout\ : std_logic;
SIGNAL \m1|counter[5]~31\ : std_logic;
SIGNAL \m1|counter[6]~32_combout\ : std_logic;
SIGNAL \m1|counter[6]~33\ : std_logic;
SIGNAL \m1|counter[7]~34_combout\ : std_logic;
SIGNAL \m1|counter[7]~35\ : std_logic;
SIGNAL \m1|counter[8]~36_combout\ : std_logic;
SIGNAL \m1|counter[8]~37\ : std_logic;
SIGNAL \m1|counter[9]~38_combout\ : std_logic;
SIGNAL \m1|counter[9]~39\ : std_logic;
SIGNAL \m1|counter[10]~40_combout\ : std_logic;
SIGNAL \m1|counter[10]~41\ : std_logic;
SIGNAL \m1|counter[11]~42_combout\ : std_logic;
SIGNAL \m1|counter[11]~43\ : std_logic;
SIGNAL \m1|counter[12]~44_combout\ : std_logic;
SIGNAL \m1|counter[12]~45\ : std_logic;
SIGNAL \m1|counter[13]~46_combout\ : std_logic;
SIGNAL \m1|counter[13]~47\ : std_logic;
SIGNAL \m1|counter[14]~48_combout\ : std_logic;
SIGNAL \m1|counter[14]~49\ : std_logic;
SIGNAL \m1|counter[15]~50_combout\ : std_logic;
SIGNAL \m1|LessThan0~5_combout\ : std_logic;
SIGNAL \m1|LessThan0~4_combout\ : std_logic;
SIGNAL \m1|counter[15]~51\ : std_logic;
SIGNAL \m1|counter[16]~52_combout\ : std_logic;
SIGNAL \m1|counter[16]~53\ : std_logic;
SIGNAL \m1|counter[17]~54_combout\ : std_logic;
SIGNAL \m1|counter[17]~55\ : std_logic;
SIGNAL \m1|counter[18]~56_combout\ : std_logic;
SIGNAL \m1|counter[18]~57\ : std_logic;
SIGNAL \m1|counter[19]~58_combout\ : std_logic;
SIGNAL \m1|LessThan0~0_combout\ : std_logic;
SIGNAL \m1|LessThan0~1_combout\ : std_logic;
SIGNAL \m1|LessThan0~2_combout\ : std_logic;
SIGNAL \m1|LessThan0~3_combout\ : std_logic;
SIGNAL \m1|LessThan0~6_combout\ : std_logic;
SIGNAL \m1|on1~0_combout\ : std_logic;
SIGNAL \m1|on1~q\ : std_logic;
SIGNAL \s1[2]~input_o\ : std_logic;
SIGNAL \s2[2]~input_o\ : std_logic;
SIGNAL \s3[2]~2_combout\ : std_logic;
SIGNAL \s2[1]~input_o\ : std_logic;
SIGNAL \s1[1]~input_o\ : std_logic;
SIGNAL \s3[1]~1_combout\ : std_logic;
SIGNAL \s2[3]~input_o\ : std_logic;
SIGNAL \s1[3]~input_o\ : std_logic;
SIGNAL \s3[3]~3_combout\ : std_logic;
SIGNAL \s1[0]~input_o\ : std_logic;
SIGNAL \s2[0]~input_o\ : std_logic;
SIGNAL \s3[0]~0_combout\ : std_logic;
SIGNAL \decoder|WideOr6~0_combout\ : std_logic;
SIGNAL \decoder|WideOr5~0_combout\ : std_logic;
SIGNAL \decoder|WideOr4~0_combout\ : std_logic;
SIGNAL \decoder|WideOr3~0_combout\ : std_logic;
SIGNAL \decoder|WideOr2~0_combout\ : std_logic;
SIGNAL \decoder|WideOr1~0_combout\ : std_logic;
SIGNAL \decoder|WideOr0~0_combout\ : std_logic;
SIGNAL \m1|counter\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;
SIGNAL \decoder|ALT_INV_WideOr0~0_combout\ : std_logic;
SIGNAL \m1|ALT_INV_on1~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_s1 <= s1;
ww_s2 <= s2;
on1 <= ww_on1;
on2 <= ww_on2;
seg <= ww_seg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\decoder|ALT_INV_WideOr0~0_combout\ <= NOT \decoder|WideOr0~0_combout\;
\m1|ALT_INV_on1~q\ <= NOT \m1|on1~q\;

-- Location: IOOBUF_X18_Y0_N23
\on1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1|ALT_INV_on1~q\,
	devoe => ww_devoe,
	o => \on1~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\on2~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1|on1~q\,
	devoe => ww_devoe,
	o => \on2~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\seg[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|WideOr6~0_combout\,
	devoe => ww_devoe,
	o => \seg[0]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\seg[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|WideOr5~0_combout\,
	devoe => ww_devoe,
	o => \seg[1]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\seg[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|WideOr4~0_combout\,
	devoe => ww_devoe,
	o => \seg[2]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\seg[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|WideOr3~0_combout\,
	devoe => ww_devoe,
	o => \seg[3]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\seg[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|WideOr2~0_combout\,
	devoe => ww_devoe,
	o => \seg[4]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\seg[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|WideOr1~0_combout\,
	devoe => ww_devoe,
	o => \seg[5]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\seg[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \decoder|ALT_INV_WideOr0~0_combout\,
	devoe => ww_devoe,
	o => \seg[6]~output_o\);

-- Location: IOIBUF_X0_Y11_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X16_Y2_N12
\m1|counter[0]~20\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[0]~20_combout\ = \m1|counter\(0) $ (VCC)
-- \m1|counter[0]~21\ = CARRY(\m1|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(0),
	datad => VCC,
	combout => \m1|counter[0]~20_combout\,
	cout => \m1|counter[0]~21\);

-- Location: IOIBUF_X16_Y0_N22
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X16_Y2_N13
\m1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[0]~20_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(0));

-- Location: LCCOMB_X16_Y2_N14
\m1|counter[1]~22\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[1]~22_combout\ = (\m1|counter\(1) & (!\m1|counter[0]~21\)) # (!\m1|counter\(1) & ((\m1|counter[0]~21\) # (GND)))
-- \m1|counter[1]~23\ = CARRY((!\m1|counter[0]~21\) # (!\m1|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(1),
	datad => VCC,
	cin => \m1|counter[0]~21\,
	combout => \m1|counter[1]~22_combout\,
	cout => \m1|counter[1]~23\);

-- Location: FF_X16_Y2_N15
\m1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[1]~22_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(1));

-- Location: LCCOMB_X16_Y2_N16
\m1|counter[2]~24\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[2]~24_combout\ = (\m1|counter\(2) & (\m1|counter[1]~23\ $ (GND))) # (!\m1|counter\(2) & (!\m1|counter[1]~23\ & VCC))
-- \m1|counter[2]~25\ = CARRY((\m1|counter\(2) & !\m1|counter[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(2),
	datad => VCC,
	cin => \m1|counter[1]~23\,
	combout => \m1|counter[2]~24_combout\,
	cout => \m1|counter[2]~25\);

-- Location: FF_X16_Y2_N17
\m1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[2]~24_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(2));

-- Location: LCCOMB_X16_Y2_N18
\m1|counter[3]~26\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[3]~26_combout\ = (\m1|counter\(3) & (!\m1|counter[2]~25\)) # (!\m1|counter\(3) & ((\m1|counter[2]~25\) # (GND)))
-- \m1|counter[3]~27\ = CARRY((!\m1|counter[2]~25\) # (!\m1|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(3),
	datad => VCC,
	cin => \m1|counter[2]~25\,
	combout => \m1|counter[3]~26_combout\,
	cout => \m1|counter[3]~27\);

-- Location: FF_X16_Y2_N19
\m1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[3]~26_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(3));

-- Location: LCCOMB_X16_Y2_N20
\m1|counter[4]~28\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[4]~28_combout\ = (\m1|counter\(4) & (\m1|counter[3]~27\ $ (GND))) # (!\m1|counter\(4) & (!\m1|counter[3]~27\ & VCC))
-- \m1|counter[4]~29\ = CARRY((\m1|counter\(4) & !\m1|counter[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(4),
	datad => VCC,
	cin => \m1|counter[3]~27\,
	combout => \m1|counter[4]~28_combout\,
	cout => \m1|counter[4]~29\);

-- Location: FF_X16_Y2_N21
\m1|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[4]~28_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(4));

-- Location: LCCOMB_X16_Y2_N22
\m1|counter[5]~30\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[5]~30_combout\ = (\m1|counter\(5) & (!\m1|counter[4]~29\)) # (!\m1|counter\(5) & ((\m1|counter[4]~29\) # (GND)))
-- \m1|counter[5]~31\ = CARRY((!\m1|counter[4]~29\) # (!\m1|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(5),
	datad => VCC,
	cin => \m1|counter[4]~29\,
	combout => \m1|counter[5]~30_combout\,
	cout => \m1|counter[5]~31\);

-- Location: FF_X16_Y2_N23
\m1|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[5]~30_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(5));

-- Location: LCCOMB_X16_Y2_N24
\m1|counter[6]~32\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[6]~32_combout\ = (\m1|counter\(6) & (\m1|counter[5]~31\ $ (GND))) # (!\m1|counter\(6) & (!\m1|counter[5]~31\ & VCC))
-- \m1|counter[6]~33\ = CARRY((\m1|counter\(6) & !\m1|counter[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(6),
	datad => VCC,
	cin => \m1|counter[5]~31\,
	combout => \m1|counter[6]~32_combout\,
	cout => \m1|counter[6]~33\);

-- Location: FF_X16_Y2_N25
\m1|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[6]~32_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(6));

-- Location: LCCOMB_X16_Y2_N26
\m1|counter[7]~34\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[7]~34_combout\ = (\m1|counter\(7) & (!\m1|counter[6]~33\)) # (!\m1|counter\(7) & ((\m1|counter[6]~33\) # (GND)))
-- \m1|counter[7]~35\ = CARRY((!\m1|counter[6]~33\) # (!\m1|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(7),
	datad => VCC,
	cin => \m1|counter[6]~33\,
	combout => \m1|counter[7]~34_combout\,
	cout => \m1|counter[7]~35\);

-- Location: FF_X16_Y2_N27
\m1|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[7]~34_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(7));

-- Location: LCCOMB_X16_Y2_N28
\m1|counter[8]~36\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[8]~36_combout\ = (\m1|counter\(8) & (\m1|counter[7]~35\ $ (GND))) # (!\m1|counter\(8) & (!\m1|counter[7]~35\ & VCC))
-- \m1|counter[8]~37\ = CARRY((\m1|counter\(8) & !\m1|counter[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(8),
	datad => VCC,
	cin => \m1|counter[7]~35\,
	combout => \m1|counter[8]~36_combout\,
	cout => \m1|counter[8]~37\);

-- Location: FF_X17_Y1_N29
\m1|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \m1|counter[8]~36_combout\,
	sclr => \m1|LessThan0~6_combout\,
	sload => VCC,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(8));

-- Location: LCCOMB_X16_Y2_N30
\m1|counter[9]~38\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[9]~38_combout\ = (\m1|counter\(9) & (!\m1|counter[8]~37\)) # (!\m1|counter\(9) & ((\m1|counter[8]~37\) # (GND)))
-- \m1|counter[9]~39\ = CARRY((!\m1|counter[8]~37\) # (!\m1|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(9),
	datad => VCC,
	cin => \m1|counter[8]~37\,
	combout => \m1|counter[9]~38_combout\,
	cout => \m1|counter[9]~39\);

-- Location: FF_X16_Y2_N31
\m1|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[9]~38_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(9));

-- Location: LCCOMB_X16_Y1_N0
\m1|counter[10]~40\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[10]~40_combout\ = (\m1|counter\(10) & (\m1|counter[9]~39\ $ (GND))) # (!\m1|counter\(10) & (!\m1|counter[9]~39\ & VCC))
-- \m1|counter[10]~41\ = CARRY((\m1|counter\(10) & !\m1|counter[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(10),
	datad => VCC,
	cin => \m1|counter[9]~39\,
	combout => \m1|counter[10]~40_combout\,
	cout => \m1|counter[10]~41\);

-- Location: FF_X16_Y1_N1
\m1|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[10]~40_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(10));

-- Location: LCCOMB_X16_Y1_N2
\m1|counter[11]~42\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[11]~42_combout\ = (\m1|counter\(11) & (!\m1|counter[10]~41\)) # (!\m1|counter\(11) & ((\m1|counter[10]~41\) # (GND)))
-- \m1|counter[11]~43\ = CARRY((!\m1|counter[10]~41\) # (!\m1|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(11),
	datad => VCC,
	cin => \m1|counter[10]~41\,
	combout => \m1|counter[11]~42_combout\,
	cout => \m1|counter[11]~43\);

-- Location: FF_X16_Y1_N3
\m1|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[11]~42_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(11));

-- Location: LCCOMB_X16_Y1_N4
\m1|counter[12]~44\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[12]~44_combout\ = (\m1|counter\(12) & (\m1|counter[11]~43\ $ (GND))) # (!\m1|counter\(12) & (!\m1|counter[11]~43\ & VCC))
-- \m1|counter[12]~45\ = CARRY((\m1|counter\(12) & !\m1|counter[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(12),
	datad => VCC,
	cin => \m1|counter[11]~43\,
	combout => \m1|counter[12]~44_combout\,
	cout => \m1|counter[12]~45\);

-- Location: FF_X16_Y1_N5
\m1|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[12]~44_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(12));

-- Location: LCCOMB_X16_Y1_N6
\m1|counter[13]~46\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[13]~46_combout\ = (\m1|counter\(13) & (!\m1|counter[12]~45\)) # (!\m1|counter\(13) & ((\m1|counter[12]~45\) # (GND)))
-- \m1|counter[13]~47\ = CARRY((!\m1|counter[12]~45\) # (!\m1|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(13),
	datad => VCC,
	cin => \m1|counter[12]~45\,
	combout => \m1|counter[13]~46_combout\,
	cout => \m1|counter[13]~47\);

-- Location: FF_X16_Y1_N7
\m1|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[13]~46_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(13));

-- Location: LCCOMB_X16_Y1_N8
\m1|counter[14]~48\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[14]~48_combout\ = (\m1|counter\(14) & (\m1|counter[13]~47\ $ (GND))) # (!\m1|counter\(14) & (!\m1|counter[13]~47\ & VCC))
-- \m1|counter[14]~49\ = CARRY((\m1|counter\(14) & !\m1|counter[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(14),
	datad => VCC,
	cin => \m1|counter[13]~47\,
	combout => \m1|counter[14]~48_combout\,
	cout => \m1|counter[14]~49\);

-- Location: FF_X16_Y1_N9
\m1|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[14]~48_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(14));

-- Location: LCCOMB_X16_Y1_N10
\m1|counter[15]~50\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[15]~50_combout\ = (\m1|counter\(15) & (!\m1|counter[14]~49\)) # (!\m1|counter\(15) & ((\m1|counter[14]~49\) # (GND)))
-- \m1|counter[15]~51\ = CARRY((!\m1|counter[14]~49\) # (!\m1|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(15),
	datad => VCC,
	cin => \m1|counter[14]~49\,
	combout => \m1|counter[15]~50_combout\,
	cout => \m1|counter[15]~51\);

-- Location: FF_X16_Y1_N11
\m1|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[15]~50_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(15));

-- Location: LCCOMB_X16_Y1_N26
\m1|LessThan0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~5_combout\ = (\m1|counter\(15)) # ((\m1|counter\(12)) # ((\m1|counter\(14)) # (\m1|counter\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(15),
	datab => \m1|counter\(12),
	datac => \m1|counter\(14),
	datad => \m1|counter\(13),
	combout => \m1|LessThan0~5_combout\);

-- Location: LCCOMB_X16_Y1_N20
\m1|LessThan0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~4_combout\ = (\m1|counter\(9)) # ((\m1|counter\(10)) # ((\m1|counter\(11)) # (\m1|counter\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(9),
	datab => \m1|counter\(10),
	datac => \m1|counter\(11),
	datad => \m1|counter\(8),
	combout => \m1|LessThan0~4_combout\);

-- Location: LCCOMB_X16_Y1_N12
\m1|counter[16]~52\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[16]~52_combout\ = (\m1|counter\(16) & (\m1|counter[15]~51\ $ (GND))) # (!\m1|counter\(16) & (!\m1|counter[15]~51\ & VCC))
-- \m1|counter[16]~53\ = CARRY((\m1|counter\(16) & !\m1|counter[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(16),
	datad => VCC,
	cin => \m1|counter[15]~51\,
	combout => \m1|counter[16]~52_combout\,
	cout => \m1|counter[16]~53\);

-- Location: FF_X16_Y1_N13
\m1|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[16]~52_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(16));

-- Location: LCCOMB_X16_Y1_N14
\m1|counter[17]~54\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[17]~54_combout\ = (\m1|counter\(17) & (!\m1|counter[16]~53\)) # (!\m1|counter\(17) & ((\m1|counter[16]~53\) # (GND)))
-- \m1|counter[17]~55\ = CARRY((!\m1|counter[16]~53\) # (!\m1|counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(17),
	datad => VCC,
	cin => \m1|counter[16]~53\,
	combout => \m1|counter[17]~54_combout\,
	cout => \m1|counter[17]~55\);

-- Location: FF_X16_Y1_N15
\m1|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[17]~54_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(17));

-- Location: LCCOMB_X16_Y1_N16
\m1|counter[18]~56\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[18]~56_combout\ = (\m1|counter\(18) & (\m1|counter[17]~55\ $ (GND))) # (!\m1|counter\(18) & (!\m1|counter[17]~55\ & VCC))
-- \m1|counter[18]~57\ = CARRY((\m1|counter\(18) & !\m1|counter[17]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(18),
	datad => VCC,
	cin => \m1|counter[17]~55\,
	combout => \m1|counter[18]~56_combout\,
	cout => \m1|counter[18]~57\);

-- Location: FF_X16_Y1_N17
\m1|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[18]~56_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(18));

-- Location: LCCOMB_X16_Y1_N18
\m1|counter[19]~58\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[19]~58_combout\ = \m1|counter[18]~57\ $ (\m1|counter\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \m1|counter\(19),
	cin => \m1|counter[18]~57\,
	combout => \m1|counter[19]~58_combout\);

-- Location: FF_X16_Y1_N19
\m1|counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[19]~58_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(19));

-- Location: LCCOMB_X16_Y1_N22
\m1|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~0_combout\ = (\m1|counter\(16)) # ((\m1|counter\(18)) # ((\m1|counter\(17)) # (\m1|counter\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(16),
	datab => \m1|counter\(18),
	datac => \m1|counter\(17),
	datad => \m1|counter\(19),
	combout => \m1|LessThan0~0_combout\);

-- Location: LCCOMB_X16_Y2_N4
\m1|LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~1_combout\ = (\m1|counter\(0)) # ((\m1|counter\(3)) # ((\m1|counter\(1)) # (\m1|counter\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(0),
	datab => \m1|counter\(3),
	datac => \m1|counter\(1),
	datad => \m1|counter\(2),
	combout => \m1|LessThan0~1_combout\);

-- Location: LCCOMB_X16_Y2_N2
\m1|LessThan0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~2_combout\ = (\m1|counter\(5)) # (\m1|counter\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \m1|counter\(5),
	datad => \m1|counter\(4),
	combout => \m1|LessThan0~2_combout\);

-- Location: LCCOMB_X16_Y2_N8
\m1|LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~3_combout\ = (\m1|counter\(7)) # ((\m1|counter\(6)) # ((\m1|LessThan0~1_combout\) # (\m1|LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(7),
	datab => \m1|counter\(6),
	datac => \m1|LessThan0~1_combout\,
	datad => \m1|LessThan0~2_combout\,
	combout => \m1|LessThan0~3_combout\);

-- Location: LCCOMB_X16_Y1_N28
\m1|LessThan0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~6_combout\ = (\m1|LessThan0~5_combout\) # ((\m1|LessThan0~4_combout\) # ((\m1|LessThan0~0_combout\) # (\m1|LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|LessThan0~5_combout\,
	datab => \m1|LessThan0~4_combout\,
	datac => \m1|LessThan0~0_combout\,
	datad => \m1|LessThan0~3_combout\,
	combout => \m1|LessThan0~6_combout\);

-- Location: LCCOMB_X16_Y1_N24
\m1|on1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|on1~0_combout\ = \m1|on1~q\ $ (\m1|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \m1|on1~q\,
	datad => \m1|LessThan0~6_combout\,
	combout => \m1|on1~0_combout\);

-- Location: FF_X16_Y1_N25
\m1|on1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|on1~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|on1~q\);

-- Location: IOIBUF_X30_Y24_N1
\s1[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(2),
	o => \s1[2]~input_o\);

-- Location: IOIBUF_X34_Y20_N8
\s2[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(2),
	o => \s2[2]~input_o\);

-- Location: LCCOMB_X29_Y21_N12
\s3[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[2]~2_combout\ = (\m1|on1~q\ & ((\s2[2]~input_o\))) # (!\m1|on1~q\ & (\s1[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \m1|on1~q\,
	datac => \s1[2]~input_o\,
	datad => \s2[2]~input_o\,
	combout => \s3[2]~2_combout\);

-- Location: IOIBUF_X30_Y24_N22
\s2[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(1),
	o => \s2[1]~input_o\);

-- Location: IOIBUF_X28_Y24_N15
\s1[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(1),
	o => \s1[1]~input_o\);

-- Location: LCCOMB_X29_Y21_N18
\s3[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[1]~1_combout\ = (\m1|on1~q\ & (\s2[1]~input_o\)) # (!\m1|on1~q\ & ((\s1[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s2[1]~input_o\,
	datac => \s1[1]~input_o\,
	datad => \m1|on1~q\,
	combout => \s3[1]~1_combout\);

-- Location: IOIBUF_X28_Y24_N22
\s2[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(3),
	o => \s2[3]~input_o\);

-- Location: IOIBUF_X34_Y18_N15
\s1[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(3),
	o => \s1[3]~input_o\);

-- Location: LCCOMB_X29_Y21_N26
\s3[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[3]~3_combout\ = (\m1|on1~q\ & (\s2[3]~input_o\)) # (!\m1|on1~q\ & ((\s1[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \m1|on1~q\,
	datac => \s2[3]~input_o\,
	datad => \s1[3]~input_o\,
	combout => \s3[3]~3_combout\);

-- Location: IOIBUF_X34_Y17_N1
\s1[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(0),
	o => \s1[0]~input_o\);

-- Location: IOIBUF_X34_Y18_N1
\s2[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(0),
	o => \s2[0]~input_o\);

-- Location: LCCOMB_X29_Y21_N24
\s3[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[0]~0_combout\ = (\m1|on1~q\ & ((\s2[0]~input_o\))) # (!\m1|on1~q\ & (\s1[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s1[0]~input_o\,
	datac => \s2[0]~input_o\,
	datad => \m1|on1~q\,
	combout => \s3[0]~0_combout\);

-- Location: LCCOMB_X29_Y21_N0
\decoder|WideOr6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr6~0_combout\ = (\s3[2]~2_combout\ & (!\s3[1]~1_combout\ & ((\s3[3]~3_combout\) # (!\s3[0]~0_combout\)))) # (!\s3[2]~2_combout\ & (\s3[0]~0_combout\ & (\s3[1]~1_combout\ $ (!\s3[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[1]~1_combout\,
	datac => \s3[3]~3_combout\,
	datad => \s3[0]~0_combout\,
	combout => \decoder|WideOr6~0_combout\);

-- Location: LCCOMB_X29_Y21_N30
\decoder|WideOr5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr5~0_combout\ = (\s3[1]~1_combout\ & ((\s3[0]~0_combout\ & ((\s3[3]~3_combout\))) # (!\s3[0]~0_combout\ & (\s3[2]~2_combout\)))) # (!\s3[1]~1_combout\ & (\s3[2]~2_combout\ & (\s3[3]~3_combout\ $ (\s3[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[1]~1_combout\,
	datac => \s3[3]~3_combout\,
	datad => \s3[0]~0_combout\,
	combout => \decoder|WideOr5~0_combout\);

-- Location: LCCOMB_X29_Y21_N4
\decoder|WideOr4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr4~0_combout\ = (\s3[2]~2_combout\ & (\s3[3]~3_combout\ & ((\s3[1]~1_combout\) # (!\s3[0]~0_combout\)))) # (!\s3[2]~2_combout\ & (\s3[1]~1_combout\ & (!\s3[3]~3_combout\ & !\s3[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[1]~1_combout\,
	datac => \s3[3]~3_combout\,
	datad => \s3[0]~0_combout\,
	combout => \decoder|WideOr4~0_combout\);

-- Location: LCCOMB_X29_Y21_N2
\decoder|WideOr3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr3~0_combout\ = (\s3[0]~0_combout\ & (\s3[2]~2_combout\ $ ((!\s3[1]~1_combout\)))) # (!\s3[0]~0_combout\ & ((\s3[2]~2_combout\ & (!\s3[1]~1_combout\ & !\s3[3]~3_combout\)) # (!\s3[2]~2_combout\ & (\s3[1]~1_combout\ & \s3[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[1]~1_combout\,
	datac => \s3[3]~3_combout\,
	datad => \s3[0]~0_combout\,
	combout => \decoder|WideOr3~0_combout\);

-- Location: LCCOMB_X29_Y21_N8
\decoder|WideOr2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr2~0_combout\ = (\s3[1]~1_combout\ & (((!\s3[3]~3_combout\ & \s3[0]~0_combout\)))) # (!\s3[1]~1_combout\ & ((\s3[2]~2_combout\ & (!\s3[3]~3_combout\)) # (!\s3[2]~2_combout\ & ((\s3[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[1]~1_combout\,
	datac => \s3[3]~3_combout\,
	datad => \s3[0]~0_combout\,
	combout => \decoder|WideOr2~0_combout\);

-- Location: LCCOMB_X29_Y21_N10
\decoder|WideOr1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr1~0_combout\ = (\s3[2]~2_combout\ & ((\s3[1]~1_combout\ & (!\s3[3]~3_combout\ & \s3[0]~0_combout\)) # (!\s3[1]~1_combout\ & (\s3[3]~3_combout\)))) # (!\s3[2]~2_combout\ & (!\s3[3]~3_combout\ & ((\s3[1]~1_combout\) # (\s3[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[1]~1_combout\,
	datac => \s3[3]~3_combout\,
	datad => \s3[0]~0_combout\,
	combout => \decoder|WideOr1~0_combout\);

-- Location: LCCOMB_X29_Y21_N20
\decoder|WideOr0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr0~0_combout\ = (\s3[3]~3_combout\) # ((\s3[2]~2_combout\ & ((!\s3[0]~0_combout\) # (!\s3[1]~1_combout\))) # (!\s3[2]~2_combout\ & (\s3[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[1]~1_combout\,
	datac => \s3[3]~3_combout\,
	datad => \s3[0]~0_combout\,
	combout => \decoder|WideOr0~0_combout\);

ww_on1 <= \on1~output_o\;

ww_on2 <= \on2~output_o\;

ww_seg(0) <= \seg[0]~output_o\;

ww_seg(1) <= \seg[1]~output_o\;

ww_seg(2) <= \seg[2]~output_o\;

ww_seg(3) <= \seg[3]~output_o\;

ww_seg(4) <= \seg[4]~output_o\;

ww_seg(5) <= \seg[5]~output_o\;

ww_seg(6) <= \seg[6]~output_o\;
END structure;


