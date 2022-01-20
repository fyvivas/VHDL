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

-- DATE "03/07/2021 21:27:56"

-- 
-- Device: Altera EP3C16F484C6 Package FBGA484
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

ENTITY 	fsm IS
    PORT (
	Press : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	Open_CW : BUFFER std_logic;
	Close_CCW : BUFFER std_logic
	);
END fsm;

-- Design Ports Information
-- Open_CW	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Close_CCW	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Press	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_H7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fsm IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Press : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_Open_CW : std_logic;
SIGNAL ww_Close_CCW : std_logic;
SIGNAL \Open_CW~output_o\ : std_logic;
SIGNAL \Close_CCW~output_o\ : std_logic;
SIGNAL \Press~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \current_state~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \current_state~q\ : std_logic;
SIGNAL \Open_CW~0_combout\ : std_logic;
SIGNAL \Close_CCW~0_combout\ : std_logic;

BEGIN

ww_Press <= Press;
ww_clk <= clk;
ww_reset <= reset;
Open_CW <= ww_Open_CW;
Close_CCW <= ww_Close_CCW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X0_Y24_N2
\Open_CW~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Open_CW~0_combout\,
	devoe => ww_devoe,
	o => \Open_CW~output_o\);

-- Location: IOOBUF_X0_Y25_N2
\Close_CCW~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Close_CCW~0_combout\,
	devoe => ww_devoe,
	o => \Close_CCW~output_o\);

-- Location: IOIBUF_X0_Y25_N22
\Press~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Press,
	o => \Press~input_o\);

-- Location: IOIBUF_X0_Y25_N15
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: LCCOMB_X1_Y25_N0
\current_state~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \current_state~0_combout\ = \current_state~q\ $ (\Press~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \current_state~q\,
	datad => \Press~input_o\,
	combout => \current_state~0_combout\);

-- Location: IOIBUF_X0_Y24_N22
\reset~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X1_Y25_N1
current_state : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \current_state~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state~q\);

-- Location: LCCOMB_X1_Y25_N30
\Open_CW~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Open_CW~0_combout\ = (\Press~input_o\ & !\current_state~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Press~input_o\,
	datad => \current_state~q\,
	combout => \Open_CW~0_combout\);

-- Location: LCCOMB_X1_Y25_N16
\Close_CCW~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \Close_CCW~0_combout\ = (\Press~input_o\ & \current_state~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Press~input_o\,
	datad => \current_state~q\,
	combout => \Close_CCW~0_combout\);

ww_Open_CW <= \Open_CW~output_o\;

ww_Close_CCW <= \Close_CCW~output_o\;
END structure;


