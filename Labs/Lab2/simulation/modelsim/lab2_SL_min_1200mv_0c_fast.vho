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

-- DATE "09/19/2014 17:05:56"

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
	on1 : BUFFER std_logic;
	on2 : BUFFER std_logic;
	seg : BUFFER std_logic_vector(6 DOWNTO 0);
	led : BUFFER std_logic_vector(4 DOWNTO 0)
	);
END lab2_SL;

-- Design Ports Information
-- on1	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- on2	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[0]	=>  Location: PIN_2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[1]	=>  Location: PIN_1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[2]	=>  Location: PIN_4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[3]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[4]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[5]	=>  Location: PIN_3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- seg[6]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[0]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[1]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[2]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[3]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led[4]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[0]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[0]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[1]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[1]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[2]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[2]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s2[3]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s1[3]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_led : std_logic_vector(4 DOWNTO 0);
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
SIGNAL \led[0]~output_o\ : std_logic;
SIGNAL \led[1]~output_o\ : std_logic;
SIGNAL \led[2]~output_o\ : std_logic;
SIGNAL \led[3]~output_o\ : std_logic;
SIGNAL \led[4]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \m1|counter[0]~19_combout\ : std_logic;
SIGNAL \m1|LessThan0~4_combout\ : std_logic;
SIGNAL \m1|LessThan0~0_combout\ : std_logic;
SIGNAL \m1|LessThan0~1_combout\ : std_logic;
SIGNAL \m1|LessThan0~2_combout\ : std_logic;
SIGNAL \m1|LessThan0~3_combout\ : std_logic;
SIGNAL \m1|LessThan0~6_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \m1|counter[0]~20\ : std_logic;
SIGNAL \m1|counter[1]~21_combout\ : std_logic;
SIGNAL \m1|counter[1]~22\ : std_logic;
SIGNAL \m1|counter[2]~23_combout\ : std_logic;
SIGNAL \m1|counter[2]~24\ : std_logic;
SIGNAL \m1|counter[3]~25_combout\ : std_logic;
SIGNAL \m1|counter[3]~26\ : std_logic;
SIGNAL \m1|counter[4]~27_combout\ : std_logic;
SIGNAL \m1|counter[4]~28\ : std_logic;
SIGNAL \m1|counter[5]~29_combout\ : std_logic;
SIGNAL \m1|counter[5]~30\ : std_logic;
SIGNAL \m1|counter[6]~31_combout\ : std_logic;
SIGNAL \m1|counter[6]~32\ : std_logic;
SIGNAL \m1|counter[7]~33_combout\ : std_logic;
SIGNAL \m1|counter[7]~34\ : std_logic;
SIGNAL \m1|counter[8]~35_combout\ : std_logic;
SIGNAL \m1|counter[8]~36\ : std_logic;
SIGNAL \m1|counter[9]~37_combout\ : std_logic;
SIGNAL \m1|counter[9]~38\ : std_logic;
SIGNAL \m1|counter[10]~39_combout\ : std_logic;
SIGNAL \m1|counter[10]~40\ : std_logic;
SIGNAL \m1|counter[11]~41_combout\ : std_logic;
SIGNAL \m1|counter[11]~42\ : std_logic;
SIGNAL \m1|counter[12]~43_combout\ : std_logic;
SIGNAL \m1|counter[12]~44\ : std_logic;
SIGNAL \m1|counter[13]~45_combout\ : std_logic;
SIGNAL \m1|counter[13]~46\ : std_logic;
SIGNAL \m1|counter[14]~47_combout\ : std_logic;
SIGNAL \m1|counter[14]~48\ : std_logic;
SIGNAL \m1|counter[15]~49_combout\ : std_logic;
SIGNAL \m1|counter[15]~50\ : std_logic;
SIGNAL \m1|counter[16]~51_combout\ : std_logic;
SIGNAL \m1|counter[16]~52\ : std_logic;
SIGNAL \m1|counter[17]~53_combout\ : std_logic;
SIGNAL \m1|counter[17]~54\ : std_logic;
SIGNAL \m1|counter[18]~55_combout\ : std_logic;
SIGNAL \m1|LessThan0~5_combout\ : std_logic;
SIGNAL \m1|on1~0_combout\ : std_logic;
SIGNAL \m1|on1~q\ : std_logic;
SIGNAL \s2[2]~input_o\ : std_logic;
SIGNAL \s1[2]~input_o\ : std_logic;
SIGNAL \s3[2]~2_combout\ : std_logic;
SIGNAL \s1[3]~input_o\ : std_logic;
SIGNAL \s2[3]~input_o\ : std_logic;
SIGNAL \s3[3]~3_combout\ : std_logic;
SIGNAL \s1[0]~input_o\ : std_logic;
SIGNAL \s2[0]~input_o\ : std_logic;
SIGNAL \s3[0]~0_combout\ : std_logic;
SIGNAL \s2[1]~input_o\ : std_logic;
SIGNAL \s1[1]~input_o\ : std_logic;
SIGNAL \s3[1]~1_combout\ : std_logic;
SIGNAL \decoder|WideOr6~0_combout\ : std_logic;
SIGNAL \decoder|WideOr5~0_combout\ : std_logic;
SIGNAL \decoder|WideOr4~0_combout\ : std_logic;
SIGNAL \decoder|WideOr3~0_combout\ : std_logic;
SIGNAL \decoder|WideOr2~0_combout\ : std_logic;
SIGNAL \decoder|WideOr1~0_combout\ : std_logic;
SIGNAL \decoder|WideOr0~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \m1|counter\ : std_logic_vector(18 DOWNTO 0);
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
led <= ww_led;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
\decoder|ALT_INV_WideOr0~0_combout\ <= NOT \decoder|WideOr0~0_combout\;
\m1|ALT_INV_on1~q\ <= NOT \m1|on1~q\;

-- Location: IOOBUF_X34_Y10_N9
\on1~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1|on1~q\,
	devoe => ww_devoe,
	o => \on1~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\on2~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \m1|ALT_INV_on1~q\,
	devoe => ww_devoe,
	o => \on2~output_o\);

-- Location: IOOBUF_X0_Y23_N9
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

-- Location: IOOBUF_X0_Y23_N2
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

-- Location: IOOBUF_X0_Y22_N2
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

-- Location: IOOBUF_X0_Y18_N16
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

-- Location: IOOBUF_X0_Y18_N23
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

-- Location: IOOBUF_X0_Y23_N16
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

-- Location: IOOBUF_X0_Y21_N9
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

-- Location: IOOBUF_X0_Y9_N9
\led[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~0_combout\,
	devoe => ww_devoe,
	o => \led[0]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\led[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~2_combout\,
	devoe => ww_devoe,
	o => \led[1]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\led[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~4_combout\,
	devoe => ww_devoe,
	o => \led[2]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\led[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~6_combout\,
	devoe => ww_devoe,
	o => \led[3]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\led[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add0~8_combout\,
	devoe => ww_devoe,
	o => \led[4]~output_o\);

-- Location: IOIBUF_X34_Y12_N22
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G8
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

-- Location: LCCOMB_X23_Y4_N14
\m1|counter[0]~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[0]~19_combout\ = \m1|counter\(0) $ (VCC)
-- \m1|counter[0]~20\ = CARRY(\m1|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(0),
	datad => VCC,
	combout => \m1|counter[0]~19_combout\,
	cout => \m1|counter[0]~20\);

-- Location: LCCOMB_X23_Y3_N24
\m1|LessThan0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~4_combout\ = (!\m1|counter\(15) & (!\m1|counter\(17) & (!\m1|counter\(13) & !\m1|counter\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(15),
	datab => \m1|counter\(17),
	datac => \m1|counter\(13),
	datad => \m1|counter\(14),
	combout => \m1|LessThan0~4_combout\);

-- Location: LCCOMB_X23_Y4_N4
\m1|LessThan0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~0_combout\ = (!\m1|counter\(8) & (!\m1|counter\(5) & (!\m1|counter\(6) & !\m1|counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(8),
	datab => \m1|counter\(5),
	datac => \m1|counter\(6),
	datad => \m1|counter\(7),
	combout => \m1|LessThan0~0_combout\);

-- Location: LCCOMB_X23_Y4_N2
\m1|LessThan0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~1_combout\ = (\m1|counter\(3)) # ((\m1|counter\(2) & ((\m1|counter\(0)) # (\m1|counter\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(3),
	datab => \m1|counter\(2),
	datac => \m1|counter\(0),
	datad => \m1|counter\(1),
	combout => \m1|LessThan0~1_combout\);

-- Location: LCCOMB_X23_Y4_N0
\m1|LessThan0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~2_combout\ = (\m1|counter\(9) & (((\m1|counter\(4) & \m1|LessThan0~1_combout\)) # (!\m1|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(9),
	datab => \m1|counter\(4),
	datac => \m1|LessThan0~0_combout\,
	datad => \m1|LessThan0~1_combout\,
	combout => \m1|LessThan0~2_combout\);

-- Location: LCCOMB_X23_Y3_N26
\m1|LessThan0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~3_combout\ = ((!\m1|counter\(11) & ((!\m1|LessThan0~2_combout\) # (!\m1|counter\(10))))) # (!\m1|counter\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(10),
	datab => \m1|counter\(11),
	datac => \m1|counter\(12),
	datad => \m1|LessThan0~2_combout\,
	combout => \m1|LessThan0~3_combout\);

-- Location: LCCOMB_X23_Y3_N28
\m1|LessThan0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~6_combout\ = (!\m1|LessThan0~5_combout\ & ((!\m1|LessThan0~3_combout\) # (!\m1|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|LessThan0~5_combout\,
	datab => \m1|LessThan0~4_combout\,
	datac => \m1|LessThan0~3_combout\,
	combout => \m1|LessThan0~6_combout\);

-- Location: IOIBUF_X23_Y0_N8
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X23_Y4_N15
\m1|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[0]~19_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(0));

-- Location: LCCOMB_X23_Y4_N16
\m1|counter[1]~21\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[1]~21_combout\ = (\m1|counter\(1) & (!\m1|counter[0]~20\)) # (!\m1|counter\(1) & ((\m1|counter[0]~20\) # (GND)))
-- \m1|counter[1]~22\ = CARRY((!\m1|counter[0]~20\) # (!\m1|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(1),
	datad => VCC,
	cin => \m1|counter[0]~20\,
	combout => \m1|counter[1]~21_combout\,
	cout => \m1|counter[1]~22\);

-- Location: FF_X23_Y4_N17
\m1|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[1]~21_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(1));

-- Location: LCCOMB_X23_Y4_N18
\m1|counter[2]~23\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[2]~23_combout\ = (\m1|counter\(2) & (\m1|counter[1]~22\ $ (GND))) # (!\m1|counter\(2) & (!\m1|counter[1]~22\ & VCC))
-- \m1|counter[2]~24\ = CARRY((\m1|counter\(2) & !\m1|counter[1]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(2),
	datad => VCC,
	cin => \m1|counter[1]~22\,
	combout => \m1|counter[2]~23_combout\,
	cout => \m1|counter[2]~24\);

-- Location: FF_X23_Y4_N19
\m1|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[2]~23_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(2));

-- Location: LCCOMB_X23_Y4_N20
\m1|counter[3]~25\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[3]~25_combout\ = (\m1|counter\(3) & (!\m1|counter[2]~24\)) # (!\m1|counter\(3) & ((\m1|counter[2]~24\) # (GND)))
-- \m1|counter[3]~26\ = CARRY((!\m1|counter[2]~24\) # (!\m1|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(3),
	datad => VCC,
	cin => \m1|counter[2]~24\,
	combout => \m1|counter[3]~25_combout\,
	cout => \m1|counter[3]~26\);

-- Location: FF_X23_Y4_N21
\m1|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[3]~25_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(3));

-- Location: LCCOMB_X23_Y4_N22
\m1|counter[4]~27\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[4]~27_combout\ = (\m1|counter\(4) & (\m1|counter[3]~26\ $ (GND))) # (!\m1|counter\(4) & (!\m1|counter[3]~26\ & VCC))
-- \m1|counter[4]~28\ = CARRY((\m1|counter\(4) & !\m1|counter[3]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(4),
	datad => VCC,
	cin => \m1|counter[3]~26\,
	combout => \m1|counter[4]~27_combout\,
	cout => \m1|counter[4]~28\);

-- Location: FF_X23_Y4_N23
\m1|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[4]~27_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(4));

-- Location: LCCOMB_X23_Y4_N24
\m1|counter[5]~29\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[5]~29_combout\ = (\m1|counter\(5) & (!\m1|counter[4]~28\)) # (!\m1|counter\(5) & ((\m1|counter[4]~28\) # (GND)))
-- \m1|counter[5]~30\ = CARRY((!\m1|counter[4]~28\) # (!\m1|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(5),
	datad => VCC,
	cin => \m1|counter[4]~28\,
	combout => \m1|counter[5]~29_combout\,
	cout => \m1|counter[5]~30\);

-- Location: FF_X23_Y4_N25
\m1|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[5]~29_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(5));

-- Location: LCCOMB_X23_Y4_N26
\m1|counter[6]~31\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[6]~31_combout\ = (\m1|counter\(6) & (\m1|counter[5]~30\ $ (GND))) # (!\m1|counter\(6) & (!\m1|counter[5]~30\ & VCC))
-- \m1|counter[6]~32\ = CARRY((\m1|counter\(6) & !\m1|counter[5]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(6),
	datad => VCC,
	cin => \m1|counter[5]~30\,
	combout => \m1|counter[6]~31_combout\,
	cout => \m1|counter[6]~32\);

-- Location: FF_X23_Y4_N27
\m1|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[6]~31_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(6));

-- Location: LCCOMB_X23_Y4_N28
\m1|counter[7]~33\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[7]~33_combout\ = (\m1|counter\(7) & (!\m1|counter[6]~32\)) # (!\m1|counter\(7) & ((\m1|counter[6]~32\) # (GND)))
-- \m1|counter[7]~34\ = CARRY((!\m1|counter[6]~32\) # (!\m1|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(7),
	datad => VCC,
	cin => \m1|counter[6]~32\,
	combout => \m1|counter[7]~33_combout\,
	cout => \m1|counter[7]~34\);

-- Location: FF_X23_Y4_N29
\m1|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[7]~33_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(7));

-- Location: LCCOMB_X23_Y4_N30
\m1|counter[8]~35\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[8]~35_combout\ = (\m1|counter\(8) & (\m1|counter[7]~34\ $ (GND))) # (!\m1|counter\(8) & (!\m1|counter[7]~34\ & VCC))
-- \m1|counter[8]~36\ = CARRY((\m1|counter\(8) & !\m1|counter[7]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(8),
	datad => VCC,
	cin => \m1|counter[7]~34\,
	combout => \m1|counter[8]~35_combout\,
	cout => \m1|counter[8]~36\);

-- Location: FF_X23_Y4_N31
\m1|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[8]~35_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(8));

-- Location: LCCOMB_X23_Y3_N0
\m1|counter[9]~37\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[9]~37_combout\ = (\m1|counter\(9) & (!\m1|counter[8]~36\)) # (!\m1|counter\(9) & ((\m1|counter[8]~36\) # (GND)))
-- \m1|counter[9]~38\ = CARRY((!\m1|counter[8]~36\) # (!\m1|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(9),
	datad => VCC,
	cin => \m1|counter[8]~36\,
	combout => \m1|counter[9]~37_combout\,
	cout => \m1|counter[9]~38\);

-- Location: FF_X23_Y3_N1
\m1|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[9]~37_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(9));

-- Location: LCCOMB_X23_Y3_N2
\m1|counter[10]~39\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[10]~39_combout\ = (\m1|counter\(10) & (\m1|counter[9]~38\ $ (GND))) # (!\m1|counter\(10) & (!\m1|counter[9]~38\ & VCC))
-- \m1|counter[10]~40\ = CARRY((\m1|counter\(10) & !\m1|counter[9]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(10),
	datad => VCC,
	cin => \m1|counter[9]~38\,
	combout => \m1|counter[10]~39_combout\,
	cout => \m1|counter[10]~40\);

-- Location: FF_X23_Y3_N3
\m1|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[10]~39_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(10));

-- Location: LCCOMB_X23_Y3_N4
\m1|counter[11]~41\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[11]~41_combout\ = (\m1|counter\(11) & (!\m1|counter[10]~40\)) # (!\m1|counter\(11) & ((\m1|counter[10]~40\) # (GND)))
-- \m1|counter[11]~42\ = CARRY((!\m1|counter[10]~40\) # (!\m1|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(11),
	datad => VCC,
	cin => \m1|counter[10]~40\,
	combout => \m1|counter[11]~41_combout\,
	cout => \m1|counter[11]~42\);

-- Location: FF_X23_Y3_N5
\m1|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[11]~41_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(11));

-- Location: LCCOMB_X23_Y3_N6
\m1|counter[12]~43\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[12]~43_combout\ = (\m1|counter\(12) & (\m1|counter[11]~42\ $ (GND))) # (!\m1|counter\(12) & (!\m1|counter[11]~42\ & VCC))
-- \m1|counter[12]~44\ = CARRY((\m1|counter\(12) & !\m1|counter[11]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(12),
	datad => VCC,
	cin => \m1|counter[11]~42\,
	combout => \m1|counter[12]~43_combout\,
	cout => \m1|counter[12]~44\);

-- Location: FF_X23_Y3_N7
\m1|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[12]~43_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(12));

-- Location: LCCOMB_X23_Y3_N8
\m1|counter[13]~45\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[13]~45_combout\ = (\m1|counter\(13) & (!\m1|counter[12]~44\)) # (!\m1|counter\(13) & ((\m1|counter[12]~44\) # (GND)))
-- \m1|counter[13]~46\ = CARRY((!\m1|counter[12]~44\) # (!\m1|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(13),
	datad => VCC,
	cin => \m1|counter[12]~44\,
	combout => \m1|counter[13]~45_combout\,
	cout => \m1|counter[13]~46\);

-- Location: FF_X23_Y3_N9
\m1|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[13]~45_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(13));

-- Location: LCCOMB_X23_Y3_N10
\m1|counter[14]~47\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[14]~47_combout\ = (\m1|counter\(14) & (\m1|counter[13]~46\ $ (GND))) # (!\m1|counter\(14) & (!\m1|counter[13]~46\ & VCC))
-- \m1|counter[14]~48\ = CARRY((\m1|counter\(14) & !\m1|counter[13]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(14),
	datad => VCC,
	cin => \m1|counter[13]~46\,
	combout => \m1|counter[14]~47_combout\,
	cout => \m1|counter[14]~48\);

-- Location: FF_X23_Y3_N11
\m1|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[14]~47_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(14));

-- Location: LCCOMB_X23_Y3_N12
\m1|counter[15]~49\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[15]~49_combout\ = (\m1|counter\(15) & (!\m1|counter[14]~48\)) # (!\m1|counter\(15) & ((\m1|counter[14]~48\) # (GND)))
-- \m1|counter[15]~50\ = CARRY((!\m1|counter[14]~48\) # (!\m1|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(15),
	datad => VCC,
	cin => \m1|counter[14]~48\,
	combout => \m1|counter[15]~49_combout\,
	cout => \m1|counter[15]~50\);

-- Location: FF_X23_Y3_N13
\m1|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[15]~49_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(15));

-- Location: LCCOMB_X23_Y3_N14
\m1|counter[16]~51\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[16]~51_combout\ = (\m1|counter\(16) & (\m1|counter[15]~50\ $ (GND))) # (!\m1|counter\(16) & (!\m1|counter[15]~50\ & VCC))
-- \m1|counter[16]~52\ = CARRY((\m1|counter\(16) & !\m1|counter[15]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(16),
	datad => VCC,
	cin => \m1|counter[15]~50\,
	combout => \m1|counter[16]~51_combout\,
	cout => \m1|counter[16]~52\);

-- Location: FF_X23_Y3_N15
\m1|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[16]~51_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(16));

-- Location: LCCOMB_X23_Y3_N16
\m1|counter[17]~53\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[17]~53_combout\ = (\m1|counter\(17) & (!\m1|counter[16]~52\)) # (!\m1|counter\(17) & ((\m1|counter[16]~52\) # (GND)))
-- \m1|counter[17]~54\ = CARRY((!\m1|counter[16]~52\) # (!\m1|counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \m1|counter\(17),
	datad => VCC,
	cin => \m1|counter[16]~52\,
	combout => \m1|counter[17]~53_combout\,
	cout => \m1|counter[17]~54\);

-- Location: FF_X23_Y3_N17
\m1|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[17]~53_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(17));

-- Location: LCCOMB_X23_Y3_N18
\m1|counter[18]~55\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|counter[18]~55_combout\ = \m1|counter\(18) $ (!\m1|counter[17]~54\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(18),
	cin => \m1|counter[17]~54\,
	combout => \m1|counter[18]~55_combout\);

-- Location: FF_X23_Y3_N19
\m1|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \m1|counter[18]~55_combout\,
	sclr => \m1|LessThan0~6_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \m1|counter\(18));

-- Location: LCCOMB_X23_Y3_N30
\m1|LessThan0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|LessThan0~5_combout\ = ((!\m1|counter\(16) & !\m1|counter\(17))) # (!\m1|counter\(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|counter\(18),
	datac => \m1|counter\(16),
	datad => \m1|counter\(17),
	combout => \m1|LessThan0~5_combout\);

-- Location: LCCOMB_X23_Y3_N20
\m1|on1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \m1|on1~0_combout\ = \m1|on1~q\ $ (((!\m1|LessThan0~5_combout\ & ((!\m1|LessThan0~3_combout\) # (!\m1|LessThan0~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000110100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \m1|LessThan0~5_combout\,
	datab => \m1|LessThan0~4_combout\,
	datac => \m1|on1~q\,
	datad => \m1|LessThan0~3_combout\,
	combout => \m1|on1~0_combout\);

-- Location: FF_X23_Y3_N21
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

-- Location: IOIBUF_X13_Y0_N1
\s2[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(2),
	o => \s2[2]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\s1[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(2),
	o => \s1[2]~input_o\);

-- Location: LCCOMB_X1_Y7_N22
\s3[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[2]~2_combout\ = (\m1|on1~q\ & (\s2[2]~input_o\)) # (!\m1|on1~q\ & ((\s1[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s2[2]~input_o\,
	datac => \m1|on1~q\,
	datad => \s1[2]~input_o\,
	combout => \s3[2]~2_combout\);

-- Location: IOIBUF_X0_Y11_N15
\s1[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(3),
	o => \s1[3]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\s2[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(3),
	o => \s2[3]~input_o\);

-- Location: LCCOMB_X1_Y7_N24
\s3[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[3]~3_combout\ = (\m1|on1~q\ & ((\s2[3]~input_o\))) # (!\m1|on1~q\ & (\s1[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s1[3]~input_o\,
	datab => \m1|on1~q\,
	datac => \s2[3]~input_o\,
	combout => \s3[3]~3_combout\);

-- Location: IOIBUF_X18_Y0_N22
\s1[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(0),
	o => \s1[0]~input_o\);

-- Location: IOIBUF_X5_Y0_N15
\s2[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(0),
	o => \s2[0]~input_o\);

-- Location: LCCOMB_X1_Y7_N26
\s3[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[0]~0_combout\ = (\m1|on1~q\ & ((\s2[0]~input_o\))) # (!\m1|on1~q\ & (\s1[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s1[0]~input_o\,
	datab => \m1|on1~q\,
	datac => \s2[0]~input_o\,
	combout => \s3[0]~0_combout\);

-- Location: IOIBUF_X13_Y0_N15
\s2[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s2(1),
	o => \s2[1]~input_o\);

-- Location: IOIBUF_X18_Y0_N15
\s1[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s1(1),
	o => \s1[1]~input_o\);

-- Location: LCCOMB_X1_Y7_N20
\s3[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \s3[1]~1_combout\ = (\m1|on1~q\ & (\s2[1]~input_o\)) # (!\m1|on1~q\ & ((\s1[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s2[1]~input_o\,
	datac => \m1|on1~q\,
	datad => \s1[1]~input_o\,
	combout => \s3[1]~1_combout\);

-- Location: LCCOMB_X1_Y7_N14
\decoder|WideOr6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr6~0_combout\ = (\s3[2]~2_combout\ & (!\s3[1]~1_combout\ & ((\s3[3]~3_combout\) # (!\s3[0]~0_combout\)))) # (!\s3[2]~2_combout\ & (\s3[0]~0_combout\ & (\s3[3]~3_combout\ $ (!\s3[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[3]~3_combout\,
	datac => \s3[0]~0_combout\,
	datad => \s3[1]~1_combout\,
	combout => \decoder|WideOr6~0_combout\);

-- Location: LCCOMB_X1_Y7_N12
\decoder|WideOr5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr5~0_combout\ = (\s3[3]~3_combout\ & ((\s3[0]~0_combout\ & ((\s3[1]~1_combout\))) # (!\s3[0]~0_combout\ & (\s3[2]~2_combout\)))) # (!\s3[3]~3_combout\ & (\s3[2]~2_combout\ & (\s3[0]~0_combout\ $ (\s3[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[3]~3_combout\,
	datac => \s3[0]~0_combout\,
	datad => \s3[1]~1_combout\,
	combout => \decoder|WideOr5~0_combout\);

-- Location: LCCOMB_X1_Y7_N10
\decoder|WideOr4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr4~0_combout\ = (\s3[2]~2_combout\ & (\s3[3]~3_combout\ & ((\s3[1]~1_combout\) # (!\s3[0]~0_combout\)))) # (!\s3[2]~2_combout\ & (!\s3[3]~3_combout\ & (!\s3[0]~0_combout\ & \s3[1]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[3]~3_combout\,
	datac => \s3[0]~0_combout\,
	datad => \s3[1]~1_combout\,
	combout => \decoder|WideOr4~0_combout\);

-- Location: LCCOMB_X1_Y7_N16
\decoder|WideOr3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr3~0_combout\ = (\s3[0]~0_combout\ & (\s3[2]~2_combout\ $ (((!\s3[1]~1_combout\))))) # (!\s3[0]~0_combout\ & ((\s3[2]~2_combout\ & (!\s3[3]~3_combout\ & !\s3[1]~1_combout\)) # (!\s3[2]~2_combout\ & (\s3[3]~3_combout\ & \s3[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[3]~3_combout\,
	datac => \s3[0]~0_combout\,
	datad => \s3[1]~1_combout\,
	combout => \decoder|WideOr3~0_combout\);

-- Location: LCCOMB_X1_Y7_N30
\decoder|WideOr2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr2~0_combout\ = (\s3[1]~1_combout\ & (((!\s3[3]~3_combout\ & \s3[0]~0_combout\)))) # (!\s3[1]~1_combout\ & ((\s3[2]~2_combout\ & (!\s3[3]~3_combout\)) # (!\s3[2]~2_combout\ & ((\s3[0]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[3]~3_combout\,
	datac => \s3[0]~0_combout\,
	datad => \s3[1]~1_combout\,
	combout => \decoder|WideOr2~0_combout\);

-- Location: LCCOMB_X1_Y7_N28
\decoder|WideOr1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr1~0_combout\ = (\s3[2]~2_combout\ & ((\s3[3]~3_combout\ & ((!\s3[1]~1_combout\))) # (!\s3[3]~3_combout\ & (\s3[0]~0_combout\ & \s3[1]~1_combout\)))) # (!\s3[2]~2_combout\ & (!\s3[3]~3_combout\ & ((\s3[0]~0_combout\) # (\s3[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000110011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[3]~3_combout\,
	datac => \s3[0]~0_combout\,
	datad => \s3[1]~1_combout\,
	combout => \decoder|WideOr1~0_combout\);

-- Location: LCCOMB_X1_Y7_N18
\decoder|WideOr0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \decoder|WideOr0~0_combout\ = (\s3[3]~3_combout\) # ((\s3[2]~2_combout\ & ((!\s3[1]~1_combout\) # (!\s3[0]~0_combout\))) # (!\s3[2]~2_combout\ & ((\s3[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s3[2]~2_combout\,
	datab => \s3[3]~3_combout\,
	datac => \s3[0]~0_combout\,
	datad => \s3[1]~1_combout\,
	combout => \decoder|WideOr0~0_combout\);

-- Location: LCCOMB_X1_Y7_N0
\Add0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\s1[0]~input_o\ & (\s2[0]~input_o\ $ (VCC))) # (!\s1[0]~input_o\ & (\s2[0]~input_o\ & VCC))
-- \Add0~1\ = CARRY((\s1[0]~input_o\ & \s2[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s1[0]~input_o\,
	datab => \s2[0]~input_o\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X1_Y7_N2
\Add0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\s1[1]~input_o\ & ((\s2[1]~input_o\ & (\Add0~1\ & VCC)) # (!\s2[1]~input_o\ & (!\Add0~1\)))) # (!\s1[1]~input_o\ & ((\s2[1]~input_o\ & (!\Add0~1\)) # (!\s2[1]~input_o\ & ((\Add0~1\) # (GND)))))
-- \Add0~3\ = CARRY((\s1[1]~input_o\ & (!\s2[1]~input_o\ & !\Add0~1\)) # (!\s1[1]~input_o\ & ((!\Add0~1\) # (!\s2[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s1[1]~input_o\,
	datab => \s2[1]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X1_Y7_N4
\Add0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\s1[2]~input_o\ $ (\s2[2]~input_o\ $ (!\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\s1[2]~input_o\ & ((\s2[2]~input_o\) # (!\Add0~3\))) # (!\s1[2]~input_o\ & (\s2[2]~input_o\ & !\Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s1[2]~input_o\,
	datab => \s2[2]~input_o\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X1_Y7_N6
\Add0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\s2[3]~input_o\ & ((\s1[3]~input_o\ & (\Add0~5\ & VCC)) # (!\s1[3]~input_o\ & (!\Add0~5\)))) # (!\s2[3]~input_o\ & ((\s1[3]~input_o\ & (!\Add0~5\)) # (!\s1[3]~input_o\ & ((\Add0~5\) # (GND)))))
-- \Add0~7\ = CARRY((\s2[3]~input_o\ & (!\s1[3]~input_o\ & !\Add0~5\)) # (!\s2[3]~input_o\ & ((!\Add0~5\) # (!\s1[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \s2[3]~input_o\,
	datab => \s1[3]~input_o\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X1_Y7_N8
\Add0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = !\Add0~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add0~7\,
	combout => \Add0~8_combout\);

ww_on1 <= \on1~output_o\;

ww_on2 <= \on2~output_o\;

ww_seg(0) <= \seg[0]~output_o\;

ww_seg(1) <= \seg[1]~output_o\;

ww_seg(2) <= \seg[2]~output_o\;

ww_seg(3) <= \seg[3]~output_o\;

ww_seg(4) <= \seg[4]~output_o\;

ww_seg(5) <= \seg[5]~output_o\;

ww_seg(6) <= \seg[6]~output_o\;

ww_led(0) <= \led[0]~output_o\;

ww_led(1) <= \led[1]~output_o\;

ww_led(2) <= \led[2]~output_o\;

ww_led(3) <= \led[3]~output_o\;

ww_led(4) <= \led[4]~output_o\;
END structure;


