-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "01/17/2025 15:22:54"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	projeto_onibus IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	buzina_button : IN std_logic;
	button_portas : IN std_logic;
	button_parada : IN std_logic;
	ldr : IN std_logic;
	VRX : IN std_logic_vector(1 DOWNTO 0);
	VRY : IN std_logic;
	farol_DF : OUT std_logic;
	farol_EF : OUT std_logic;
	farol_DT : OUT std_logic;
	farol_ET : OUT std_logic;
	buzina : OUT std_logic;
	portas : OUT std_logic;
	catraca : OUT std_logic;
	led_parada : OUT std_logic;
	lcd_data : OUT std_logic;
	lcd_enable : OUT std_logic;
	lcd_rs : OUT std_logic
	);
END projeto_onibus;

-- Design Ports Information
-- ldr	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- farol_DF	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- farol_EF	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- farol_DT	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- farol_ET	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buzina	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- portas	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- catraca	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- led_parada	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_data	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_enable	=>  Location: PIN_C21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_rs	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button_portas	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- button_parada	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- buzina_button	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VRY	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VRX[0]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- VRX[1]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF projeto_onibus IS
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
SIGNAL ww_buzina_button : std_logic;
SIGNAL ww_button_portas : std_logic;
SIGNAL ww_button_parada : std_logic;
SIGNAL ww_ldr : std_logic;
SIGNAL ww_VRX : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_VRY : std_logic;
SIGNAL ww_farol_DF : std_logic;
SIGNAL ww_farol_EF : std_logic;
SIGNAL ww_farol_DT : std_logic;
SIGNAL ww_farol_ET : std_logic;
SIGNAL ww_buzina : std_logic;
SIGNAL ww_portas : std_logic;
SIGNAL ww_catraca : std_logic;
SIGNAL ww_led_parada : std_logic;
SIGNAL ww_lcd_data : std_logic;
SIGNAL ww_lcd_enable : std_logic;
SIGNAL ww_lcd_rs : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ldr~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \farol_DF~output_o\ : std_logic;
SIGNAL \farol_EF~output_o\ : std_logic;
SIGNAL \farol_DT~output_o\ : std_logic;
SIGNAL \farol_ET~output_o\ : std_logic;
SIGNAL \buzina~output_o\ : std_logic;
SIGNAL \portas~output_o\ : std_logic;
SIGNAL \catraca~output_o\ : std_logic;
SIGNAL \led_parada~output_o\ : std_logic;
SIGNAL \lcd_data~output_o\ : std_logic;
SIGNAL \lcd_enable~output_o\ : std_logic;
SIGNAL \lcd_rs~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \VRX[1]~input_o\ : std_logic;
SIGNAL \VRX[0]~input_o\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \VRY~input_o\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector0~4_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \farol_state_fsm.LUZ_RE~q\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \farol_state_fsm.SETA_DIREITA~q\ : std_logic;
SIGNAL \Selector0~2_combout\ : std_logic;
SIGNAL \Selector0~3_combout\ : std_logic;
SIGNAL \farol_state_fsm.IDLE~q\ : std_logic;
SIGNAL \farol_state~0_combout\ : std_logic;
SIGNAL \farol_DF~reg0_q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \farol_state_fsm.SETA_ESQUERDA~q\ : std_logic;
SIGNAL \farol_state~1_combout\ : std_logic;
SIGNAL \farol_EF~reg0feeder_combout\ : std_logic;
SIGNAL \farol_EF~reg0_q\ : std_logic;
SIGNAL \farol_state~2_combout\ : std_logic;
SIGNAL \farol_DT~reg0feeder_combout\ : std_logic;
SIGNAL \farol_DT~reg0_q\ : std_logic;
SIGNAL \farol_state~3_combout\ : std_logic;
SIGNAL \farol_ET~reg0_q\ : std_logic;
SIGNAL \buzina_button~input_o\ : std_logic;
SIGNAL \buzina_state~q\ : std_logic;
SIGNAL \buzina~reg0feeder_combout\ : std_logic;
SIGNAL \buzina~reg0_q\ : std_logic;
SIGNAL \button_portas~input_o\ : std_logic;
SIGNAL \portas_state~0_combout\ : std_logic;
SIGNAL \portas_state~q\ : std_logic;
SIGNAL \portas~0_combout\ : std_logic;
SIGNAL \portas~reg0_q\ : std_logic;
SIGNAL \button_parada~input_o\ : std_logic;
SIGNAL \led_parada~0_combout\ : std_logic;
SIGNAL \led_parada~reg0_q\ : std_logic;
SIGNAL farol_state : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_buzina_button <= buzina_button;
ww_button_portas <= button_portas;
ww_button_parada <= button_parada;
ww_ldr <= ldr;
ww_VRX <= VRX;
ww_VRY <= VRY;
farol_DF <= ww_farol_DF;
farol_EF <= ww_farol_EF;
farol_DT <= ww_farol_DT;
farol_ET <= ww_farol_ET;
buzina <= ww_buzina;
portas <= ww_portas;
catraca <= ww_catraca;
led_parada <= ww_led_parada;
lcd_data <= ww_lcd_data;
lcd_enable <= ww_lcd_enable;
lcd_rs <= ww_lcd_rs;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y41_N24
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X51_Y54_N16
\farol_DF~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \farol_DF~reg0_q\,
	devoe => ww_devoe,
	o => \farol_DF~output_o\);

-- Location: IOOBUF_X56_Y54_N30
\farol_EF~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \farol_EF~reg0_q\,
	devoe => ww_devoe,
	o => \farol_EF~output_o\);

-- Location: IOOBUF_X46_Y54_N9
\farol_DT~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \farol_DT~reg0_q\,
	devoe => ww_devoe,
	o => \farol_DT~output_o\);

-- Location: IOOBUF_X58_Y54_N23
\farol_ET~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \farol_ET~reg0_q\,
	devoe => ww_devoe,
	o => \farol_ET~output_o\);

-- Location: IOOBUF_X46_Y54_N2
\buzina~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \buzina~reg0_q\,
	devoe => ww_devoe,
	o => \buzina~output_o\);

-- Location: IOOBUF_X49_Y54_N16
\portas~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \portas~reg0_q\,
	devoe => ww_devoe,
	o => \portas~output_o\);

-- Location: IOOBUF_X46_Y54_N23
\catraca~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \catraca~output_o\);

-- Location: IOOBUF_X49_Y54_N23
\led_parada~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \led_parada~reg0_q\,
	devoe => ww_devoe,
	o => \led_parada~output_o\);

-- Location: IOOBUF_X56_Y0_N30
\lcd_data~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \lcd_data~output_o\);

-- Location: IOOBUF_X78_Y36_N2
\lcd_enable~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \lcd_enable~output_o\);

-- Location: IOOBUF_X78_Y29_N9
\lcd_rs~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \lcd_rs~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G19
\clk~inputclkctrl\ : fiftyfivenm_clkctrl
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

-- Location: IOIBUF_X54_Y54_N22
\VRX[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_VRX(1),
	o => \VRX[1]~input_o\);

-- Location: IOIBUF_X54_Y54_N29
\VRX[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_VRX(0),
	o => \VRX[0]~input_o\);

-- Location: LCCOMB_X51_Y53_N26
\Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (!\VRX[1]~input_o\ & \VRX[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \VRX[1]~input_o\,
	datab => \VRX[0]~input_o\,
	combout => \Selector1~0_combout\);

-- Location: IOIBUF_X51_Y54_N1
\VRY~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_VRY,
	o => \VRY~input_o\);

-- Location: LCCOMB_X51_Y53_N4
\Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (!\farol_state_fsm.IDLE~q\ & ((\VRY~input_o\) # (\VRX[1]~input_o\ $ (\VRX[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \VRX[1]~input_o\,
	datab => \VRY~input_o\,
	datac => \VRX[0]~input_o\,
	datad => \farol_state_fsm.IDLE~q\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X51_Y53_N0
\Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\VRY~input_o\ & (!\farol_state_fsm.IDLE~q\ & (\VRX[1]~input_o\ $ (!\VRX[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \VRX[1]~input_o\,
	datab => \VRX[0]~input_o\,
	datac => \VRY~input_o\,
	datad => \farol_state_fsm.IDLE~q\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X51_Y53_N10
\Selector0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~4_combout\ = (\farol_state_fsm.IDLE~q\ & (!\Selector0~2_combout\ & !\Selector0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \farol_state_fsm.IDLE~q\,
	datab => \Selector0~2_combout\,
	datad => \Selector0~1_combout\,
	combout => \Selector0~4_combout\);

-- Location: LCCOMB_X51_Y53_N20
\Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\Selector3~0_combout\) # ((\farol_state_fsm.LUZ_RE~q\ & \Selector0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector3~0_combout\,
	datac => \farol_state_fsm.LUZ_RE~q\,
	datad => \Selector0~4_combout\,
	combout => \Selector3~1_combout\);

-- Location: IOIBUF_X51_Y54_N22
\reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X51_Y53_N21
\farol_state_fsm.LUZ_RE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector3~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_state_fsm.LUZ_RE~q\);

-- Location: LCCOMB_X51_Y53_N12
\Selector0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (!\farol_state_fsm.SETA_DIREITA~q\ & (!\farol_state_fsm.LUZ_RE~q\ & ((\VRX[0]~input_o\) # (!\VRX[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \VRX[1]~input_o\,
	datab => \VRX[0]~input_o\,
	datac => \farol_state_fsm.SETA_DIREITA~q\,
	datad => \farol_state_fsm.LUZ_RE~q\,
	combout => \Selector0~1_combout\);

-- Location: LCCOMB_X51_Y53_N28
\Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\Selector0~0_combout\) # ((\farol_state_fsm.IDLE~q\ & ((\Selector0~2_combout\) # (\Selector0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \farol_state_fsm.IDLE~q\,
	datab => \Selector0~0_combout\,
	datac => \Selector0~2_combout\,
	datad => \Selector0~1_combout\,
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X51_Y53_N30
\Selector1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\farol_state_fsm.IDLE~q\ & (((\farol_state_fsm.SETA_DIREITA~q\ & !\Selector1~1_combout\)))) # (!\farol_state_fsm.IDLE~q\ & ((\Selector1~0_combout\) # ((\farol_state_fsm.SETA_DIREITA~q\ & !\Selector1~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \farol_state_fsm.IDLE~q\,
	datab => \Selector1~0_combout\,
	datac => \farol_state_fsm.SETA_DIREITA~q\,
	datad => \Selector1~1_combout\,
	combout => \Selector1~2_combout\);

-- Location: FF_X51_Y53_N31
\farol_state_fsm.SETA_DIREITA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector1~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_state_fsm.SETA_DIREITA~q\);

-- Location: LCCOMB_X51_Y53_N8
\Selector0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~2_combout\ = (\farol_state_fsm.SETA_DIREITA~q\ & (!\Selector1~0_combout\)) # (!\farol_state_fsm.SETA_DIREITA~q\ & (((!\VRY~input_o\ & \farol_state_fsm.LUZ_RE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~0_combout\,
	datab => \VRY~input_o\,
	datac => \farol_state_fsm.SETA_DIREITA~q\,
	datad => \farol_state_fsm.LUZ_RE~q\,
	combout => \Selector0~2_combout\);

-- Location: LCCOMB_X51_Y53_N16
\Selector0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~3_combout\ = (\Selector0~0_combout\) # ((!\Selector0~2_combout\ & (\farol_state_fsm.IDLE~q\ & !\Selector0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~2_combout\,
	datab => \Selector0~0_combout\,
	datac => \farol_state_fsm.IDLE~q\,
	datad => \Selector0~1_combout\,
	combout => \Selector0~3_combout\);

-- Location: FF_X51_Y53_N17
\farol_state_fsm.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_state_fsm.IDLE~q\);

-- Location: LCCOMB_X51_Y53_N14
\farol_state~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \farol_state~0_combout\ = (\farol_state_fsm.IDLE~q\ & ((farol_state(0)) # (\farol_state_fsm.SETA_DIREITA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \farol_state_fsm.IDLE~q\,
	datac => farol_state(0),
	datad => \farol_state_fsm.SETA_DIREITA~q\,
	combout => \farol_state~0_combout\);

-- Location: FF_X51_Y53_N15
\farol_state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \farol_state~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => farol_state(0));

-- Location: FF_X51_Y53_N27
\farol_DF~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => farol_state(0),
	sload => VCC,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_DF~reg0_q\);

-- Location: LCCOMB_X51_Y53_N24
\Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\VRX[1]~input_o\ & (!\VRX[0]~input_o\ & !\farol_state_fsm.IDLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \VRX[1]~input_o\,
	datab => \VRX[0]~input_o\,
	datad => \farol_state_fsm.IDLE~q\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X51_Y53_N2
\Selector2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\Selector2~0_combout\) # ((\farol_state_fsm.SETA_ESQUERDA~q\ & !\Selector1~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Selector2~0_combout\,
	datac => \farol_state_fsm.SETA_ESQUERDA~q\,
	datad => \Selector1~1_combout\,
	combout => \Selector2~1_combout\);

-- Location: FF_X51_Y53_N3
\farol_state_fsm.SETA_ESQUERDA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_state_fsm.SETA_ESQUERDA~q\);

-- Location: LCCOMB_X51_Y53_N18
\farol_state~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \farol_state~1_combout\ = (\farol_state_fsm.IDLE~q\ & ((\farol_state_fsm.SETA_ESQUERDA~q\) # (farol_state(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \farol_state_fsm.IDLE~q\,
	datab => \farol_state_fsm.SETA_ESQUERDA~q\,
	datac => farol_state(1),
	combout => \farol_state~1_combout\);

-- Location: FF_X51_Y53_N19
\farol_state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \farol_state~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => farol_state(1));

-- Location: LCCOMB_X51_Y53_N6
\farol_EF~reg0feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \farol_EF~reg0feeder_combout\ = farol_state(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => farol_state(1),
	combout => \farol_EF~reg0feeder_combout\);

-- Location: FF_X51_Y53_N7
\farol_EF~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \farol_EF~reg0feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_EF~reg0_q\);

-- Location: LCCOMB_X50_Y53_N28
\farol_state~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \farol_state~2_combout\ = (\farol_state_fsm.IDLE~q\ & ((farol_state(3)) # (!\farol_state_fsm.SETA_ESQUERDA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \farol_state_fsm.SETA_ESQUERDA~q\,
	datac => farol_state(3),
	datad => \farol_state_fsm.IDLE~q\,
	combout => \farol_state~2_combout\);

-- Location: FF_X50_Y53_N29
\farol_state[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \farol_state~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => farol_state(3));

-- Location: LCCOMB_X50_Y53_N4
\farol_DT~reg0feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \farol_DT~reg0feeder_combout\ = farol_state(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => farol_state(3),
	combout => \farol_DT~reg0feeder_combout\);

-- Location: FF_X50_Y53_N5
\farol_DT~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \farol_DT~reg0feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_DT~reg0_q\);

-- Location: LCCOMB_X51_Y53_N22
\farol_state~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \farol_state~3_combout\ = (\farol_state_fsm.IDLE~q\ & ((farol_state(2)) # (!\farol_state_fsm.SETA_DIREITA~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \farol_state_fsm.IDLE~q\,
	datac => farol_state(2),
	datad => \farol_state_fsm.SETA_DIREITA~q\,
	combout => \farol_state~3_combout\);

-- Location: FF_X51_Y53_N23
\farol_state[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \farol_state~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => farol_state(2));

-- Location: FF_X51_Y53_N11
\farol_ET~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => farol_state(2),
	sload => VCC,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \farol_ET~reg0_q\);

-- Location: IOIBUF_X46_Y54_N29
\buzina_button~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_buzina_button,
	o => \buzina_button~input_o\);

-- Location: FF_X50_Y53_N19
buzina_state : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \buzina_button~input_o\,
	clrn => \ALT_INV_reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \buzina_state~q\);

-- Location: LCCOMB_X50_Y53_N2
\buzina~reg0feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \buzina~reg0feeder_combout\ = \buzina_state~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \buzina_state~q\,
	combout => \buzina~reg0feeder_combout\);

-- Location: FF_X50_Y53_N3
\buzina~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \buzina~reg0feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \buzina~reg0_q\);

-- Location: IOIBUF_X49_Y54_N29
\button_portas~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button_portas,
	o => \button_portas~input_o\);

-- Location: LCCOMB_X50_Y53_N0
\portas_state~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \portas_state~0_combout\ = \portas_state~q\ $ (!\button_portas~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \portas_state~q\,
	datad => \button_portas~input_o\,
	combout => \portas_state~0_combout\);

-- Location: FF_X50_Y53_N1
portas_state : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \portas_state~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \portas_state~q\);

-- Location: LCCOMB_X50_Y53_N12
\portas~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \portas~0_combout\ = (\button_portas~input_o\ & (((\portas~reg0_q\)))) # (!\button_portas~input_o\ & ((\reset~input_o\ & (\portas~reg0_q\)) # (!\reset~input_o\ & ((!\portas_state~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \button_portas~input_o\,
	datab => \reset~input_o\,
	datac => \portas~reg0_q\,
	datad => \portas_state~q\,
	combout => \portas~0_combout\);

-- Location: FF_X50_Y53_N13
\portas~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \portas~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \portas~reg0_q\);

-- Location: IOIBUF_X51_Y54_N29
\button_parada~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_button_parada,
	o => \button_parada~input_o\);

-- Location: LCCOMB_X50_Y53_N26
\led_parada~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \led_parada~0_combout\ = !\button_parada~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \button_parada~input_o\,
	combout => \led_parada~0_combout\);

-- Location: FF_X50_Y53_N27
\led_parada~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \led_parada~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \led_parada~reg0_q\);

-- Location: IOIBUF_X49_Y54_N1
\ldr~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ldr,
	o => \ldr~input_o\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_farol_DF <= \farol_DF~output_o\;

ww_farol_EF <= \farol_EF~output_o\;

ww_farol_DT <= \farol_DT~output_o\;

ww_farol_ET <= \farol_ET~output_o\;

ww_buzina <= \buzina~output_o\;

ww_portas <= \portas~output_o\;

ww_catraca <= \catraca~output_o\;

ww_led_parada <= \led_parada~output_o\;

ww_lcd_data <= \lcd_data~output_o\;

ww_lcd_enable <= \lcd_enable~output_o\;

ww_lcd_rs <= \lcd_rs~output_o\;
END structure;


