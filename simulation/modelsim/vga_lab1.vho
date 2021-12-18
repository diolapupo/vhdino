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

-- DATE "12/18/2021 01:06:54"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	vga_lab1 IS
    PORT (
	clk50MHz : IN std_logic;
	chooseRes : IN std_logic;
	moveleft : IN std_logic;
	moveright : IN std_logic;
	r : OUT std_logic_vector(3 DOWNTO 0);
	g : OUT std_logic_vector(3 DOWNTO 0);
	b : OUT std_logic_vector(3 DOWNTO 0);
	hsync : OUT std_logic;
	vsync : OUT std_logic
	);
END vga_lab1;

-- Design Ports Information
-- chooseRes	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- moveleft	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- moveright	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- r[0]	=>  Location: PIN_AA1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- r[1]	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- r[2]	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- r[3]	=>  Location: PIN_Y1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- g[0]	=>  Location: PIN_W1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- g[1]	=>  Location: PIN_T2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- g[2]	=>  Location: PIN_R2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- g[3]	=>  Location: PIN_R1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- b[0]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- b[1]	=>  Location: PIN_T1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- b[2]	=>  Location: PIN_P4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- b[3]	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- hsync	=>  Location: PIN_N3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- vsync	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 8mA
-- clk50MHz	=>  Location: PIN_P11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF vga_lab1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk50MHz : std_logic;
SIGNAL ww_chooseRes : std_logic;
SIGNAL ww_moveleft : std_logic;
SIGNAL ww_moveright : std_logic;
SIGNAL ww_r : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_g : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_hsync : std_logic;
SIGNAL ww_vsync : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \disp_clk|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \disp_clk|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\ : std_logic_vector(0 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \chooseRes~input_o\ : std_logic;
SIGNAL \moveleft~input_o\ : std_logic;
SIGNAL \moveright~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_TDO~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \~ALTERA_TDO~~obuf_o\ : std_logic;
SIGNAL \clk50MHz~input_o\ : std_logic;
SIGNAL \disp_clk|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\ : std_logic;
SIGNAL \vposition[0]~32_combout\ : std_logic;
SIGNAL \vposition[5]~43\ : std_logic;
SIGNAL \vposition[6]~44_combout\ : std_logic;
SIGNAL \hposition[0]~32_combout\ : std_logic;
SIGNAL \hposition[0]~33\ : std_logic;
SIGNAL \hposition[1]~34_combout\ : std_logic;
SIGNAL \hposition[1]~35\ : std_logic;
SIGNAL \hposition[2]~36_combout\ : std_logic;
SIGNAL \hposition[2]~37\ : std_logic;
SIGNAL \hposition[3]~38_combout\ : std_logic;
SIGNAL \hposition[3]~39\ : std_logic;
SIGNAL \hposition[4]~40_combout\ : std_logic;
SIGNAL \hposition[4]~41\ : std_logic;
SIGNAL \hposition[5]~42_combout\ : std_logic;
SIGNAL \hposition[5]~43\ : std_logic;
SIGNAL \hposition[6]~44_combout\ : std_logic;
SIGNAL \hposition[6]~45\ : std_logic;
SIGNAL \hposition[7]~46_combout\ : std_logic;
SIGNAL \hposition[7]~47\ : std_logic;
SIGNAL \hposition[8]~48_combout\ : std_logic;
SIGNAL \hposition[8]~49\ : std_logic;
SIGNAL \hposition[9]~50_combout\ : std_logic;
SIGNAL \hposition[9]~51\ : std_logic;
SIGNAL \hposition[10]~52_combout\ : std_logic;
SIGNAL \hposition[10]~53\ : std_logic;
SIGNAL \hposition[11]~54_combout\ : std_logic;
SIGNAL \hposition[11]~55\ : std_logic;
SIGNAL \hposition[12]~56_combout\ : std_logic;
SIGNAL \hposition[12]~57\ : std_logic;
SIGNAL \hposition[13]~58_combout\ : std_logic;
SIGNAL \hposition[13]~59\ : std_logic;
SIGNAL \hposition[14]~60_combout\ : std_logic;
SIGNAL \hposition[14]~61\ : std_logic;
SIGNAL \hposition[15]~62_combout\ : std_logic;
SIGNAL \hposition[15]~63\ : std_logic;
SIGNAL \hposition[16]~64_combout\ : std_logic;
SIGNAL \hposition[16]~65\ : std_logic;
SIGNAL \hposition[17]~66_combout\ : std_logic;
SIGNAL \hposition[17]~67\ : std_logic;
SIGNAL \hposition[18]~68_combout\ : std_logic;
SIGNAL \hposition[18]~69\ : std_logic;
SIGNAL \hposition[19]~70_combout\ : std_logic;
SIGNAL \hposition[19]~71\ : std_logic;
SIGNAL \hposition[20]~72_combout\ : std_logic;
SIGNAL \hposition[20]~73\ : std_logic;
SIGNAL \hposition[21]~74_combout\ : std_logic;
SIGNAL \hposition[21]~75\ : std_logic;
SIGNAL \hposition[22]~76_combout\ : std_logic;
SIGNAL \hposition[22]~77\ : std_logic;
SIGNAL \hposition[23]~78_combout\ : std_logic;
SIGNAL \hposition[23]~79\ : std_logic;
SIGNAL \hposition[24]~80_combout\ : std_logic;
SIGNAL \hposition[24]~81\ : std_logic;
SIGNAL \hposition[25]~82_combout\ : std_logic;
SIGNAL \hposition[25]~83\ : std_logic;
SIGNAL \hposition[26]~84_combout\ : std_logic;
SIGNAL \LessThan3~5_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~3_combout\ : std_logic;
SIGNAL \LessThan3~4_combout\ : std_logic;
SIGNAL \hposition[26]~85\ : std_logic;
SIGNAL \hposition[27]~86_combout\ : std_logic;
SIGNAL \hposition[27]~87\ : std_logic;
SIGNAL \hposition[28]~88_combout\ : std_logic;
SIGNAL \hposition[28]~89\ : std_logic;
SIGNAL \hposition[29]~90_combout\ : std_logic;
SIGNAL \hposition[29]~91\ : std_logic;
SIGNAL \hposition[30]~92_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~6_combout\ : std_logic;
SIGNAL \LessThan3~7_combout\ : std_logic;
SIGNAL \hposition[30]~93\ : std_logic;
SIGNAL \hposition[31]~94_combout\ : std_logic;
SIGNAL \LessThan3~8_combout\ : std_logic;
SIGNAL \vposition[6]~45\ : std_logic;
SIGNAL \vposition[7]~46_combout\ : std_logic;
SIGNAL \vposition[7]~47\ : std_logic;
SIGNAL \vposition[8]~48_combout\ : std_logic;
SIGNAL \vposition[8]~49\ : std_logic;
SIGNAL \vposition[9]~50_combout\ : std_logic;
SIGNAL \vposition[9]~51\ : std_logic;
SIGNAL \vposition[10]~52_combout\ : std_logic;
SIGNAL \vposition[10]~53\ : std_logic;
SIGNAL \vposition[11]~54_combout\ : std_logic;
SIGNAL \vposition[11]~55\ : std_logic;
SIGNAL \vposition[12]~56_combout\ : std_logic;
SIGNAL \vposition[12]~57\ : std_logic;
SIGNAL \vposition[13]~58_combout\ : std_logic;
SIGNAL \vposition[13]~59\ : std_logic;
SIGNAL \vposition[14]~60_combout\ : std_logic;
SIGNAL \vposition[14]~61\ : std_logic;
SIGNAL \vposition[15]~62_combout\ : std_logic;
SIGNAL \vposition[15]~63\ : std_logic;
SIGNAL \vposition[16]~64_combout\ : std_logic;
SIGNAL \vposition[16]~65\ : std_logic;
SIGNAL \vposition[17]~66_combout\ : std_logic;
SIGNAL \vposition[17]~67\ : std_logic;
SIGNAL \vposition[18]~68_combout\ : std_logic;
SIGNAL \vposition[18]~69\ : std_logic;
SIGNAL \vposition[19]~70_combout\ : std_logic;
SIGNAL \vposition[19]~71\ : std_logic;
SIGNAL \vposition[20]~72_combout\ : std_logic;
SIGNAL \vposition[20]~73\ : std_logic;
SIGNAL \vposition[21]~74_combout\ : std_logic;
SIGNAL \vposition[21]~75\ : std_logic;
SIGNAL \vposition[22]~76_combout\ : std_logic;
SIGNAL \vposition[22]~77\ : std_logic;
SIGNAL \vposition[23]~78_combout\ : std_logic;
SIGNAL \vposition[23]~79\ : std_logic;
SIGNAL \vposition[24]~80_combout\ : std_logic;
SIGNAL \vposition[24]~81\ : std_logic;
SIGNAL \vposition[25]~82_combout\ : std_logic;
SIGNAL \vposition[25]~83\ : std_logic;
SIGNAL \vposition[26]~84_combout\ : std_logic;
SIGNAL \vposition[26]~85\ : std_logic;
SIGNAL \vposition[27]~86_combout\ : std_logic;
SIGNAL \vposition[27]~87\ : std_logic;
SIGNAL \vposition[28]~88_combout\ : std_logic;
SIGNAL \vposition[28]~89\ : std_logic;
SIGNAL \vposition[29]~90_combout\ : std_logic;
SIGNAL \vposition[29]~91\ : std_logic;
SIGNAL \vposition[30]~92_combout\ : std_logic;
SIGNAL \LessThan4~3_combout\ : std_logic;
SIGNAL \LessThan4~1_combout\ : std_logic;
SIGNAL \LessThan4~2_combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \LessThan4~4_combout\ : std_logic;
SIGNAL \LessThan4~5_combout\ : std_logic;
SIGNAL \LessThan4~6_combout\ : std_logic;
SIGNAL \vposition[30]~93\ : std_logic;
SIGNAL \vposition[31]~94_combout\ : std_logic;
SIGNAL \LessThan4~9_combout\ : std_logic;
SIGNAL \LessThan4~7_combout\ : std_logic;
SIGNAL \LessThan4~8_combout\ : std_logic;
SIGNAL \LessThan4~10_combout\ : std_logic;
SIGNAL \vposition[0]~33\ : std_logic;
SIGNAL \vposition[1]~34_combout\ : std_logic;
SIGNAL \vposition[1]~35\ : std_logic;
SIGNAL \vposition[2]~36_combout\ : std_logic;
SIGNAL \vposition[2]~37\ : std_logic;
SIGNAL \vposition[3]~38_combout\ : std_logic;
SIGNAL \vposition[3]~39\ : std_logic;
SIGNAL \vposition[4]~40_combout\ : std_logic;
SIGNAL \vposition[4]~41\ : std_logic;
SIGNAL \vposition[5]~42_combout\ : std_logic;
SIGNAL \bg_hstart[14]~feeder_combout\ : std_logic;
SIGNAL \count[0]~32_combout\ : std_logic;
SIGNAL \count[0]~33\ : std_logic;
SIGNAL \count[1]~34_combout\ : std_logic;
SIGNAL \count[1]~35\ : std_logic;
SIGNAL \count[2]~36_combout\ : std_logic;
SIGNAL \count[2]~37\ : std_logic;
SIGNAL \count[3]~38_combout\ : std_logic;
SIGNAL \count[3]~39\ : std_logic;
SIGNAL \count[4]~40_combout\ : std_logic;
SIGNAL \count[4]~41\ : std_logic;
SIGNAL \count[5]~42_combout\ : std_logic;
SIGNAL \count[5]~43\ : std_logic;
SIGNAL \count[6]~44_combout\ : std_logic;
SIGNAL \count[6]~45\ : std_logic;
SIGNAL \count[7]~46_combout\ : std_logic;
SIGNAL \count[7]~47\ : std_logic;
SIGNAL \count[8]~48_combout\ : std_logic;
SIGNAL \count[8]~49\ : std_logic;
SIGNAL \count[9]~50_combout\ : std_logic;
SIGNAL \count[9]~51\ : std_logic;
SIGNAL \count[10]~52_combout\ : std_logic;
SIGNAL \count[10]~53\ : std_logic;
SIGNAL \count[11]~54_combout\ : std_logic;
SIGNAL \count[11]~55\ : std_logic;
SIGNAL \count[12]~56_combout\ : std_logic;
SIGNAL \count[12]~57\ : std_logic;
SIGNAL \count[13]~58_combout\ : std_logic;
SIGNAL \count[13]~59\ : std_logic;
SIGNAL \count[14]~60_combout\ : std_logic;
SIGNAL \count[14]~61\ : std_logic;
SIGNAL \count[15]~62_combout\ : std_logic;
SIGNAL \count[15]~63\ : std_logic;
SIGNAL \count[16]~64_combout\ : std_logic;
SIGNAL \count[16]~65\ : std_logic;
SIGNAL \count[17]~66_combout\ : std_logic;
SIGNAL \count[17]~67\ : std_logic;
SIGNAL \count[18]~68_combout\ : std_logic;
SIGNAL \count[18]~69\ : std_logic;
SIGNAL \count[19]~70_combout\ : std_logic;
SIGNAL \count[19]~71\ : std_logic;
SIGNAL \count[20]~72_combout\ : std_logic;
SIGNAL \count[20]~73\ : std_logic;
SIGNAL \count[21]~74_combout\ : std_logic;
SIGNAL \count[21]~75\ : std_logic;
SIGNAL \count[22]~76_combout\ : std_logic;
SIGNAL \count[22]~77\ : std_logic;
SIGNAL \count[23]~78_combout\ : std_logic;
SIGNAL \count[23]~79\ : std_logic;
SIGNAL \count[24]~80_combout\ : std_logic;
SIGNAL \count[24]~81\ : std_logic;
SIGNAL \count[25]~82_combout\ : std_logic;
SIGNAL \count[25]~83\ : std_logic;
SIGNAL \count[26]~84_combout\ : std_logic;
SIGNAL \count[26]~85\ : std_logic;
SIGNAL \count[27]~86_combout\ : std_logic;
SIGNAL \count[27]~87\ : std_logic;
SIGNAL \count[28]~88_combout\ : std_logic;
SIGNAL \count[28]~89\ : std_logic;
SIGNAL \count[29]~90_combout\ : std_logic;
SIGNAL \count[29]~91\ : std_logic;
SIGNAL \count[30]~92_combout\ : std_logic;
SIGNAL \count[30]~93\ : std_logic;
SIGNAL \count[31]~94_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \Add10~29\ : std_logic;
SIGNAL \Add10~30_combout\ : std_logic;
SIGNAL \bg_hstart~20_combout\ : std_logic;
SIGNAL \bg_hstart[15]~feeder_combout\ : std_logic;
SIGNAL \Add10~31\ : std_logic;
SIGNAL \Add10~32_combout\ : std_logic;
SIGNAL \bg_hstart~19_combout\ : std_logic;
SIGNAL \bg_hstart[16]~feeder_combout\ : std_logic;
SIGNAL \Add10~33\ : std_logic;
SIGNAL \Add10~34_combout\ : std_logic;
SIGNAL \bg_hstart~18_combout\ : std_logic;
SIGNAL \Add10~35\ : std_logic;
SIGNAL \Add10~36_combout\ : std_logic;
SIGNAL \bg_hstart~17_combout\ : std_logic;
SIGNAL \Add10~37\ : std_logic;
SIGNAL \Add10~38_combout\ : std_logic;
SIGNAL \bg_hstart~16_combout\ : std_logic;
SIGNAL \Add10~39\ : std_logic;
SIGNAL \Add10~40_combout\ : std_logic;
SIGNAL \bg_hstart~15_combout\ : std_logic;
SIGNAL \Add10~41\ : std_logic;
SIGNAL \Add10~42_combout\ : std_logic;
SIGNAL \bg_hstart~14_combout\ : std_logic;
SIGNAL \Add10~43\ : std_logic;
SIGNAL \Add10~44_combout\ : std_logic;
SIGNAL \bg_hstart~13_combout\ : std_logic;
SIGNAL \Add10~45\ : std_logic;
SIGNAL \Add10~46_combout\ : std_logic;
SIGNAL \bg_hstart~12_combout\ : std_logic;
SIGNAL \Add10~47\ : std_logic;
SIGNAL \Add10~48_combout\ : std_logic;
SIGNAL \bg_hstart~11_combout\ : std_logic;
SIGNAL \Add10~49\ : std_logic;
SIGNAL \Add10~50_combout\ : std_logic;
SIGNAL \bg_hstart~10_combout\ : std_logic;
SIGNAL \bg_hstart[25]~feeder_combout\ : std_logic;
SIGNAL \Add10~51\ : std_logic;
SIGNAL \Add10~52_combout\ : std_logic;
SIGNAL \bg_hstart~9_combout\ : std_logic;
SIGNAL \Add10~53\ : std_logic;
SIGNAL \Add10~54_combout\ : std_logic;
SIGNAL \bg_hstart~8_combout\ : std_logic;
SIGNAL \Add10~55\ : std_logic;
SIGNAL \Add10~56_combout\ : std_logic;
SIGNAL \bg_hstart~7_combout\ : std_logic;
SIGNAL \bg_hstart[28]~feeder_combout\ : std_logic;
SIGNAL \Add10~57\ : std_logic;
SIGNAL \Add10~58_combout\ : std_logic;
SIGNAL \bg_hstart~34_combout\ : std_logic;
SIGNAL \Add10~59\ : std_logic;
SIGNAL \Add10~60_combout\ : std_logic;
SIGNAL \bg_hstart~6_combout\ : std_logic;
SIGNAL \Add10~61\ : std_logic;
SIGNAL \Add10~62_combout\ : std_logic;
SIGNAL \LessThan1~22_combout\ : std_logic;
SIGNAL \LessThan1~21_combout\ : std_logic;
SIGNAL \LessThan1~18_combout\ : std_logic;
SIGNAL \LessThan1~17_combout\ : std_logic;
SIGNAL \Add10~0_combout\ : std_logic;
SIGNAL \bg_hstart~33_combout\ : std_logic;
SIGNAL \Add10~1\ : std_logic;
SIGNAL \Add10~2_combout\ : std_logic;
SIGNAL \bg_hstart~32_combout\ : std_logic;
SIGNAL \Add10~3\ : std_logic;
SIGNAL \Add10~4_combout\ : std_logic;
SIGNAL \bg_hstart~31_combout\ : std_logic;
SIGNAL \Add10~5\ : std_logic;
SIGNAL \Add10~6_combout\ : std_logic;
SIGNAL \bg_hstart~30_combout\ : std_logic;
SIGNAL \Add10~7\ : std_logic;
SIGNAL \Add10~8_combout\ : std_logic;
SIGNAL \bg_hstart~29_combout\ : std_logic;
SIGNAL \Add10~9\ : std_logic;
SIGNAL \Add10~10_combout\ : std_logic;
SIGNAL \bg_hstart~28_combout\ : std_logic;
SIGNAL \Add10~11\ : std_logic;
SIGNAL \Add10~12_combout\ : std_logic;
SIGNAL \bg_hstart~36_combout\ : std_logic;
SIGNAL \Add10~13\ : std_logic;
SIGNAL \Add10~14_combout\ : std_logic;
SIGNAL \bg_hstart~27_combout\ : std_logic;
SIGNAL \Add10~15\ : std_logic;
SIGNAL \Add10~16_combout\ : std_logic;
SIGNAL \bg_hstart~35_combout\ : std_logic;
SIGNAL \Add10~17\ : std_logic;
SIGNAL \Add10~18_combout\ : std_logic;
SIGNAL \bg_hstart~26_combout\ : std_logic;
SIGNAL \bg_hstart[9]~feeder_combout\ : std_logic;
SIGNAL \Add10~19\ : std_logic;
SIGNAL \Add10~20_combout\ : std_logic;
SIGNAL \bg_hstart~25_combout\ : std_logic;
SIGNAL \Add10~21\ : std_logic;
SIGNAL \Add10~22_combout\ : std_logic;
SIGNAL \bg_hstart~24_combout\ : std_logic;
SIGNAL \Add10~23\ : std_logic;
SIGNAL \Add10~24_combout\ : std_logic;
SIGNAL \bg_hstart~23_combout\ : std_logic;
SIGNAL \Add10~25\ : std_logic;
SIGNAL \Add10~26_combout\ : std_logic;
SIGNAL \LessThan1~16_combout\ : std_logic;
SIGNAL \LessThan1~19_combout\ : std_logic;
SIGNAL \LessThan1~20_combout\ : std_logic;
SIGNAL \Add10~64_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \Add10~65_combout\ : std_logic;
SIGNAL \LessThan1~9_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \LessThan1~10_combout\ : std_logic;
SIGNAL \LessThan1~11_combout\ : std_logic;
SIGNAL \LessThan1~12_combout\ : std_logic;
SIGNAL \LessThan1~13_combout\ : std_logic;
SIGNAL \LessThan1~14_combout\ : std_logic;
SIGNAL \LessThan1~15_combout\ : std_logic;
SIGNAL \LessThan1~23_combout\ : std_logic;
SIGNAL \LessThan1~24_combout\ : std_logic;
SIGNAL \bg_hstart~22_combout\ : std_logic;
SIGNAL \bg_hstart[13]~feeder_combout\ : std_logic;
SIGNAL \Add10~27\ : std_logic;
SIGNAL \Add10~28_combout\ : std_logic;
SIGNAL \bg_hstart~21_combout\ : std_logic;
SIGNAL \Add16~1\ : std_logic;
SIGNAL \Add16~3\ : std_logic;
SIGNAL \Add16~5\ : std_logic;
SIGNAL \Add16~7\ : std_logic;
SIGNAL \Add16~9\ : std_logic;
SIGNAL \Add16~11\ : std_logic;
SIGNAL \Add16~13\ : std_logic;
SIGNAL \Add16~15\ : std_logic;
SIGNAL \Add16~17\ : std_logic;
SIGNAL \Add16~19\ : std_logic;
SIGNAL \Add16~21\ : std_logic;
SIGNAL \Add16~23\ : std_logic;
SIGNAL \Add16~25\ : std_logic;
SIGNAL \Add16~27\ : std_logic;
SIGNAL \Add16~28_combout\ : std_logic;
SIGNAL \Add16~26_combout\ : std_logic;
SIGNAL \Add16~24_combout\ : std_logic;
SIGNAL \Add16~22_combout\ : std_logic;
SIGNAL \Add16~20_combout\ : std_logic;
SIGNAL \Add16~18_combout\ : std_logic;
SIGNAL \Add17~1\ : std_logic;
SIGNAL \Add17~3\ : std_logic;
SIGNAL \Add17~5\ : std_logic;
SIGNAL \Add17~7\ : std_logic;
SIGNAL \Add17~9\ : std_logic;
SIGNAL \Add17~10_combout\ : std_logic;
SIGNAL \Add17~8_combout\ : std_logic;
SIGNAL \Add17~6_combout\ : std_logic;
SIGNAL \Add17~4_combout\ : std_logic;
SIGNAL \Add17~2_combout\ : std_logic;
SIGNAL \Add17~0_combout\ : std_logic;
SIGNAL \bg_address[9]~7\ : std_logic;
SIGNAL \bg_address[10]~9\ : std_logic;
SIGNAL \bg_address[11]~11\ : std_logic;
SIGNAL \bg_address[12]~13\ : std_logic;
SIGNAL \bg_address[13]~15\ : std_logic;
SIGNAL \bg_address[14]~16_combout\ : std_logic;
SIGNAL \process_0~7_combout\ : std_logic;
SIGNAL \process_0~8_combout\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \process_0~6_combout\ : std_logic;
SIGNAL \process_0~9_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \LessThan9~1_cout\ : std_logic;
SIGNAL \LessThan9~3_cout\ : std_logic;
SIGNAL \LessThan9~5_cout\ : std_logic;
SIGNAL \LessThan9~7_cout\ : std_logic;
SIGNAL \LessThan9~9_cout\ : std_logic;
SIGNAL \LessThan9~11_cout\ : std_logic;
SIGNAL \LessThan9~13_cout\ : std_logic;
SIGNAL \LessThan9~15_cout\ : std_logic;
SIGNAL \LessThan9~17_cout\ : std_logic;
SIGNAL \LessThan9~19_cout\ : std_logic;
SIGNAL \LessThan9~21_cout\ : std_logic;
SIGNAL \LessThan9~23_cout\ : std_logic;
SIGNAL \LessThan9~25_cout\ : std_logic;
SIGNAL \LessThan9~27_cout\ : std_logic;
SIGNAL \LessThan9~29_cout\ : std_logic;
SIGNAL \LessThan9~31_cout\ : std_logic;
SIGNAL \LessThan9~33_cout\ : std_logic;
SIGNAL \LessThan9~35_cout\ : std_logic;
SIGNAL \LessThan9~37_cout\ : std_logic;
SIGNAL \LessThan9~39_cout\ : std_logic;
SIGNAL \LessThan9~41_cout\ : std_logic;
SIGNAL \LessThan9~43_cout\ : std_logic;
SIGNAL \LessThan9~45_cout\ : std_logic;
SIGNAL \LessThan9~47_cout\ : std_logic;
SIGNAL \LessThan9~49_cout\ : std_logic;
SIGNAL \LessThan9~51_cout\ : std_logic;
SIGNAL \LessThan9~53_cout\ : std_logic;
SIGNAL \LessThan9~55_cout\ : std_logic;
SIGNAL \LessThan9~57_cout\ : std_logic;
SIGNAL \LessThan9~59_cout\ : std_logic;
SIGNAL \LessThan9~60_combout\ : std_logic;
SIGNAL \bg_hstop[30]~feeder_combout\ : std_logic;
SIGNAL \bg_hstop~27_combout\ : std_logic;
SIGNAL \Add11~0_combout\ : std_logic;
SIGNAL \bg_hstop~34_combout\ : std_logic;
SIGNAL \Add11~1\ : std_logic;
SIGNAL \Add11~2_combout\ : std_logic;
SIGNAL \bg_hstop~33_combout\ : std_logic;
SIGNAL \Add11~3\ : std_logic;
SIGNAL \Add11~4_combout\ : std_logic;
SIGNAL \bg_hstop~32_combout\ : std_logic;
SIGNAL \Add11~5\ : std_logic;
SIGNAL \Add11~6_combout\ : std_logic;
SIGNAL \bg_hstop~31_combout\ : std_logic;
SIGNAL \Add11~7\ : std_logic;
SIGNAL \Add11~8_combout\ : std_logic;
SIGNAL \bg_hstop~30_combout\ : std_logic;
SIGNAL \Add11~9\ : std_logic;
SIGNAL \Add11~10_combout\ : std_logic;
SIGNAL \bg_hstop~29_combout\ : std_logic;
SIGNAL \bg_hstop[5]~feeder_combout\ : std_logic;
SIGNAL \Add11~11\ : std_logic;
SIGNAL \Add11~12_combout\ : std_logic;
SIGNAL \bg_hstop~37_combout\ : std_logic;
SIGNAL \bg_hstop[6]~feeder_combout\ : std_logic;
SIGNAL \Add11~13\ : std_logic;
SIGNAL \Add11~14_combout\ : std_logic;
SIGNAL \bg_hstop~36_combout\ : std_logic;
SIGNAL \bg_hstop[7]~feeder_combout\ : std_logic;
SIGNAL \Add11~15\ : std_logic;
SIGNAL \Add11~17\ : std_logic;
SIGNAL \Add11~18_combout\ : std_logic;
SIGNAL \bg_hstop~28_combout\ : std_logic;
SIGNAL \Add11~19\ : std_logic;
SIGNAL \Add11~20_combout\ : std_logic;
SIGNAL \bg_hstop~11_combout\ : std_logic;
SIGNAL \Add11~21\ : std_logic;
SIGNAL \Add11~22_combout\ : std_logic;
SIGNAL \bg_hstop~26_combout\ : std_logic;
SIGNAL \bg_hstop[11]~feeder_combout\ : std_logic;
SIGNAL \Add11~23\ : std_logic;
SIGNAL \Add11~24_combout\ : std_logic;
SIGNAL \bg_hstop~25_combout\ : std_logic;
SIGNAL \Add11~25\ : std_logic;
SIGNAL \Add11~26_combout\ : std_logic;
SIGNAL \bg_hstop~24_combout\ : std_logic;
SIGNAL \bg_hstop[13]~feeder_combout\ : std_logic;
SIGNAL \Add11~27\ : std_logic;
SIGNAL \Add11~28_combout\ : std_logic;
SIGNAL \bg_hstop~23_combout\ : std_logic;
SIGNAL \Add11~29\ : std_logic;
SIGNAL \Add11~30_combout\ : std_logic;
SIGNAL \bg_hstop~22_combout\ : std_logic;
SIGNAL \Add11~31\ : std_logic;
SIGNAL \Add11~32_combout\ : std_logic;
SIGNAL \bg_hstop~21_combout\ : std_logic;
SIGNAL \Add11~33\ : std_logic;
SIGNAL \Add11~34_combout\ : std_logic;
SIGNAL \bg_hstop~20_combout\ : std_logic;
SIGNAL \Add11~35\ : std_logic;
SIGNAL \Add11~36_combout\ : std_logic;
SIGNAL \bg_hstop~19_combout\ : std_logic;
SIGNAL \Add11~37\ : std_logic;
SIGNAL \Add11~38_combout\ : std_logic;
SIGNAL \bg_hstop~18_combout\ : std_logic;
SIGNAL \Add11~39\ : std_logic;
SIGNAL \Add11~40_combout\ : std_logic;
SIGNAL \bg_hstop~17_combout\ : std_logic;
SIGNAL \Add11~41\ : std_logic;
SIGNAL \Add11~42_combout\ : std_logic;
SIGNAL \bg_hstop~16_combout\ : std_logic;
SIGNAL \bg_hstop[21]~feeder_combout\ : std_logic;
SIGNAL \Add11~43\ : std_logic;
SIGNAL \Add11~44_combout\ : std_logic;
SIGNAL \bg_hstop~15_combout\ : std_logic;
SIGNAL \bg_hstop[22]~feeder_combout\ : std_logic;
SIGNAL \Add11~45\ : std_logic;
SIGNAL \Add11~46_combout\ : std_logic;
SIGNAL \bg_hstop~14_combout\ : std_logic;
SIGNAL \bg_hstop[23]~feeder_combout\ : std_logic;
SIGNAL \Add11~47\ : std_logic;
SIGNAL \Add11~48_combout\ : std_logic;
SIGNAL \bg_hstop~13_combout\ : std_logic;
SIGNAL \Add11~49\ : std_logic;
SIGNAL \Add11~50_combout\ : std_logic;
SIGNAL \bg_hstop~12_combout\ : std_logic;
SIGNAL \Add11~51\ : std_logic;
SIGNAL \Add11~52_combout\ : std_logic;
SIGNAL \Add11~53\ : std_logic;
SIGNAL \Add11~54_combout\ : std_logic;
SIGNAL \LessThan2~13_combout\ : std_logic;
SIGNAL \LessThan2~14_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~9_combout\ : std_logic;
SIGNAL \LessThan2~6_combout\ : std_logic;
SIGNAL \LessThan2~5_combout\ : std_logic;
SIGNAL \LessThan2~4_combout\ : std_logic;
SIGNAL \LessThan2~7_combout\ : std_logic;
SIGNAL \LessThan2~8_combout\ : std_logic;
SIGNAL \LessThan2~10_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \LessThan2~11_combout\ : std_logic;
SIGNAL \LessThan2~12_combout\ : std_logic;
SIGNAL \LessThan2~15_combout\ : std_logic;
SIGNAL \Add11~61\ : std_logic;
SIGNAL \Add11~62_combout\ : std_logic;
SIGNAL \bg_hstop~35_combout\ : std_logic;
SIGNAL \Add11~16_combout\ : std_logic;
SIGNAL \bg_hstop~7_combout\ : std_logic;
SIGNAL \Add11~65_combout\ : std_logic;
SIGNAL \LessThan2~16_combout\ : std_logic;
SIGNAL \LessThan2~17_combout\ : std_logic;
SIGNAL \LessThan2~20_combout\ : std_logic;
SIGNAL \LessThan2~18_combout\ : std_logic;
SIGNAL \LessThan2~19_combout\ : std_logic;
SIGNAL \Add11~64_combout\ : std_logic;
SIGNAL \LessThan2~21_combout\ : std_logic;
SIGNAL \LessThan2~22_combout\ : std_logic;
SIGNAL \LessThan2~23_combout\ : std_logic;
SIGNAL \bg_hstop~10_combout\ : std_logic;
SIGNAL \Add11~55\ : std_logic;
SIGNAL \Add11~56_combout\ : std_logic;
SIGNAL \bg_hstop~9_combout\ : std_logic;
SIGNAL \Add11~57\ : std_logic;
SIGNAL \Add11~58_combout\ : std_logic;
SIGNAL \bg_hstop~8_combout\ : std_logic;
SIGNAL \Add11~59\ : std_logic;
SIGNAL \Add11~60_combout\ : std_logic;
SIGNAL \bg_hstop~6_combout\ : std_logic;
SIGNAL \LessThan10~1_cout\ : std_logic;
SIGNAL \LessThan10~3_cout\ : std_logic;
SIGNAL \LessThan10~5_cout\ : std_logic;
SIGNAL \LessThan10~7_cout\ : std_logic;
SIGNAL \LessThan10~9_cout\ : std_logic;
SIGNAL \LessThan10~11_cout\ : std_logic;
SIGNAL \LessThan10~13_cout\ : std_logic;
SIGNAL \LessThan10~15_cout\ : std_logic;
SIGNAL \LessThan10~17_cout\ : std_logic;
SIGNAL \LessThan10~19_cout\ : std_logic;
SIGNAL \LessThan10~21_cout\ : std_logic;
SIGNAL \LessThan10~23_cout\ : std_logic;
SIGNAL \LessThan10~25_cout\ : std_logic;
SIGNAL \LessThan10~27_cout\ : std_logic;
SIGNAL \LessThan10~29_cout\ : std_logic;
SIGNAL \LessThan10~31_cout\ : std_logic;
SIGNAL \LessThan10~33_cout\ : std_logic;
SIGNAL \LessThan10~35_cout\ : std_logic;
SIGNAL \LessThan10~37_cout\ : std_logic;
SIGNAL \LessThan10~39_cout\ : std_logic;
SIGNAL \LessThan10~41_cout\ : std_logic;
SIGNAL \LessThan10~43_cout\ : std_logic;
SIGNAL \LessThan10~45_cout\ : std_logic;
SIGNAL \LessThan10~47_cout\ : std_logic;
SIGNAL \LessThan10~49_cout\ : std_logic;
SIGNAL \LessThan10~51_cout\ : std_logic;
SIGNAL \LessThan10~53_cout\ : std_logic;
SIGNAL \LessThan10~55_cout\ : std_logic;
SIGNAL \LessThan10~57_cout\ : std_logic;
SIGNAL \LessThan10~59_cout\ : std_logic;
SIGNAL \LessThan10~60_combout\ : std_logic;
SIGNAL \process_0~10_combout\ : std_logic;
SIGNAL \bg_address[13]~14_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\ : std_logic;
SIGNAL \Add16~0_combout\ : std_logic;
SIGNAL \Add16~2_combout\ : std_logic;
SIGNAL \Add16~4_combout\ : std_logic;
SIGNAL \Add16~6_combout\ : std_logic;
SIGNAL \Add16~8_combout\ : std_logic;
SIGNAL \Add16~10_combout\ : std_logic;
SIGNAL \Add16~12_combout\ : std_logic;
SIGNAL \Add16~14_combout\ : std_logic;
SIGNAL \Add16~16_combout\ : std_logic;
SIGNAL \bg_address[9]~6_combout\ : std_logic;
SIGNAL \bg_address[10]~8_combout\ : std_logic;
SIGNAL \bg_address[11]~10_combout\ : std_logic;
SIGNAL \bg_address[12]~12_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|address_reg_a[0]~feeder_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|out_address_reg_a[1]~feeder_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\ : std_logic;
SIGNAL \LessThan13~0_combout\ : std_logic;
SIGNAL \process_0~1_combout\ : std_logic;
SIGNAL \LessThan15~0_combout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \LessThan16~0_combout\ : std_logic;
SIGNAL \LessThan16~1_combout\ : std_logic;
SIGNAL \LessThan16~2_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \r~0_combout\ : std_logic;
SIGNAL \r[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\ : std_logic;
SIGNAL \r~1_combout\ : std_logic;
SIGNAL \r[1]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\ : std_logic;
SIGNAL \r~2_combout\ : std_logic;
SIGNAL \r[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\ : std_logic;
SIGNAL \r~3_combout\ : std_logic;
SIGNAL \r[3]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\ : std_logic;
SIGNAL \g~0_combout\ : std_logic;
SIGNAL \g[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\ : std_logic;
SIGNAL \g~1_combout\ : std_logic;
SIGNAL \g[1]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a18~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a42~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\ : std_logic;
SIGNAL \g~2_combout\ : std_logic;
SIGNAL \g[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\ : std_logic;
SIGNAL \g~3_combout\ : std_logic;
SIGNAL \g[3]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\ : std_logic;
SIGNAL \b~0_combout\ : std_logic;
SIGNAL \b[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a25~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a37~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\ : std_logic;
SIGNAL \b~1_combout\ : std_logic;
SIGNAL \b[1]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\ : std_logic;
SIGNAL \b~2_combout\ : std_logic;
SIGNAL \b[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\ : std_logic;
SIGNAL \b~3_combout\ : std_logic;
SIGNAL \b[3]~reg0_q\ : std_logic;
SIGNAL \process_0~13_combout\ : std_logic;
SIGNAL \process_0~11_combout\ : std_logic;
SIGNAL \process_0~12_combout\ : std_logic;
SIGNAL \process_0~14_combout\ : std_logic;
SIGNAL \hsync~reg0_q\ : std_logic;
SIGNAL \process_0~15_combout\ : std_logic;
SIGNAL \process_0~16_combout\ : std_logic;
SIGNAL \process_0~17_combout\ : std_logic;
SIGNAL \vsync~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|out_address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL vposition : std_logic_vector(31 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL hposition : std_logic_vector(31 DOWNTO 0);
SIGNAL \disp_clk|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL count : std_logic_vector(31 DOWNTO 0);
SIGNAL bg_address : std_logic_vector(14 DOWNTO 0);
SIGNAL bg_hstop : std_logic_vector(31 DOWNTO 0);
SIGNAL bg_hstart : std_logic_vector(31 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_clk50MHz <= clk50MHz;
ww_chooseRes <= chooseRes;
ww_moveleft <= moveleft;
ww_moveright <= moveright;
r <= ww_r;
g <= ww_g;
b <= ww_b;
hsync <= ww_hsync;
vsync <= ww_vsync;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\bgread|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\(0);

\disp_clk|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clk50MHz~input_o\);

\disp_clk|altpll_component|auto_generated|wire_pll1_clk\(0) <= \disp_clk|altpll_component|auto_generated|pll1_CLK_bus\(0);
\disp_clk|altpll_component|auto_generated|wire_pll1_clk\(1) <= \disp_clk|altpll_component|auto_generated|pll1_CLK_bus\(1);
\disp_clk|altpll_component|auto_generated|wire_pll1_clk\(2) <= \disp_clk|altpll_component|auto_generated|pll1_CLK_bus\(2);
\disp_clk|altpll_component|auto_generated|wire_pll1_clk\(3) <= \disp_clk|altpll_component|auto_generated|pll1_CLK_bus\(3);
\disp_clk|altpll_component|auto_generated|wire_pll1_clk\(4) <= \disp_clk|altpll_component|auto_generated|pll1_CLK_bus\(4);

\bgread|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a18~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a42~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a25~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a37~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\(0);

\bgread|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\ <= (bg_address(12) & bg_address(11) & bg_address(10) & bg_address(9) & bg_address(8) & bg_address(7) & bg_address(6) & bg_address(5) & bg_address(4) & bg_address(3)
& bg_address(2) & bg_address(1) & bg_address(0));

\bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\ <= \bgread|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\(0);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \disp_clk|altpll_component|auto_generated|wire_pll1_clk\(1));

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

-- Location: IOOBUF_X18_Y0_N30
\r[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_r(0));

-- Location: IOOBUF_X0_Y12_N9
\r[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_r(1));

-- Location: IOOBUF_X16_Y0_N16
\r[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_r(2));

-- Location: IOOBUF_X16_Y0_N23
\r[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \r[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_r(3));

-- Location: IOOBUF_X0_Y9_N2
\g[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \g[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_g(0));

-- Location: IOOBUF_X0_Y15_N9
\g[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \g[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_g(1));

-- Location: IOOBUF_X0_Y3_N9
\g[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \g[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_g(2));

-- Location: IOOBUF_X0_Y3_N2
\g[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \g[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_g(3));

-- Location: IOOBUF_X0_Y13_N2
\b[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b[0]~reg0_q\,
	devoe => ww_devoe,
	o => ww_b(0));

-- Location: IOOBUF_X0_Y15_N2
\b[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b[1]~reg0_q\,
	devoe => ww_devoe,
	o => ww_b(1));

-- Location: IOOBUF_X0_Y23_N2
\b[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b[2]~reg0_q\,
	devoe => ww_devoe,
	o => ww_b(2));

-- Location: IOOBUF_X0_Y18_N9
\b[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b[3]~reg0_q\,
	devoe => ww_devoe,
	o => ww_b(3));

-- Location: IOOBUF_X0_Y18_N2
\hsync~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \hsync~reg0_q\,
	devoe => ww_devoe,
	o => ww_hsync);

-- Location: IOOBUF_X0_Y13_N9
\vsync~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \vsync~reg0_q\,
	devoe => ww_devoe,
	o => ww_vsync);

-- Location: IOIBUF_X34_Y0_N29
\clk50MHz~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk50MHz,
	o => \clk50MHz~input_o\);

-- Location: PLL_1
\disp_clk|altpll_component|auto_generated|pll1\ : fiftyfivenm_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 5,
	c0_initial => 1,
	c0_low => 5,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 0,
	c1_initial => 0,
	c1_low => 0,
	c1_mode => "bypass",
	c1_ph => 0,
	c1_use_casc_in => "off",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "unused",
	clk0_divide_by => 0,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 0,
	clk0_phase_shift => "0",
	clk1_counter => "c0",
	clk1_divide_by => 10,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 13,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock1",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 13,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "functional",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 192,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	fbin => \disp_clk|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \disp_clk|altpll_component|auto_generated|pll1_INCLK_bus\,
	fbout => \disp_clk|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \disp_clk|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G18
\disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\);

-- Location: LCCOMB_X29_Y18_N0
\vposition[0]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[0]~32_combout\ = vposition(0) $ (VCC)
-- \vposition[0]~33\ = CARRY(vposition(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => vposition(0),
	datad => VCC,
	combout => \vposition[0]~32_combout\,
	cout => \vposition[0]~33\);

-- Location: LCCOMB_X29_Y18_N10
\vposition[5]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[5]~42_combout\ = (vposition(5) & (!\vposition[4]~41\)) # (!vposition(5) & ((\vposition[4]~41\) # (GND)))
-- \vposition[5]~43\ = CARRY((!\vposition[4]~41\) # (!vposition(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datad => VCC,
	cin => \vposition[4]~41\,
	combout => \vposition[5]~42_combout\,
	cout => \vposition[5]~43\);

-- Location: LCCOMB_X29_Y18_N12
\vposition[6]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[6]~44_combout\ = (vposition(6) & (\vposition[5]~43\ $ (GND))) # (!vposition(6) & (!\vposition[5]~43\ & VCC))
-- \vposition[6]~45\ = CARRY((vposition(6) & !\vposition[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datad => VCC,
	cin => \vposition[5]~43\,
	combout => \vposition[6]~44_combout\,
	cout => \vposition[6]~45\);

-- Location: LCCOMB_X32_Y23_N0
\hposition[0]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[0]~32_combout\ = hposition(0) $ (VCC)
-- \hposition[0]~33\ = CARRY(hposition(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(0),
	datad => VCC,
	combout => \hposition[0]~32_combout\,
	cout => \hposition[0]~33\);

-- Location: FF_X32_Y23_N1
\hposition[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[0]~32_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(0));

-- Location: LCCOMB_X32_Y23_N2
\hposition[1]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[1]~34_combout\ = (hposition(1) & (!\hposition[0]~33\)) # (!hposition(1) & ((\hposition[0]~33\) # (GND)))
-- \hposition[1]~35\ = CARRY((!\hposition[0]~33\) # (!hposition(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(1),
	datad => VCC,
	cin => \hposition[0]~33\,
	combout => \hposition[1]~34_combout\,
	cout => \hposition[1]~35\);

-- Location: FF_X32_Y23_N3
\hposition[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[1]~34_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(1));

-- Location: LCCOMB_X32_Y23_N4
\hposition[2]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[2]~36_combout\ = (hposition(2) & (\hposition[1]~35\ $ (GND))) # (!hposition(2) & (!\hposition[1]~35\ & VCC))
-- \hposition[2]~37\ = CARRY((hposition(2) & !\hposition[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(2),
	datad => VCC,
	cin => \hposition[1]~35\,
	combout => \hposition[2]~36_combout\,
	cout => \hposition[2]~37\);

-- Location: FF_X32_Y23_N5
\hposition[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[2]~36_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(2));

-- Location: LCCOMB_X32_Y23_N6
\hposition[3]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[3]~38_combout\ = (hposition(3) & (!\hposition[2]~37\)) # (!hposition(3) & ((\hposition[2]~37\) # (GND)))
-- \hposition[3]~39\ = CARRY((!\hposition[2]~37\) # (!hposition(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datad => VCC,
	cin => \hposition[2]~37\,
	combout => \hposition[3]~38_combout\,
	cout => \hposition[3]~39\);

-- Location: FF_X32_Y23_N7
\hposition[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[3]~38_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(3));

-- Location: LCCOMB_X32_Y23_N8
\hposition[4]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[4]~40_combout\ = (hposition(4) & (\hposition[3]~39\ $ (GND))) # (!hposition(4) & (!\hposition[3]~39\ & VCC))
-- \hposition[4]~41\ = CARRY((hposition(4) & !\hposition[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(4),
	datad => VCC,
	cin => \hposition[3]~39\,
	combout => \hposition[4]~40_combout\,
	cout => \hposition[4]~41\);

-- Location: FF_X32_Y23_N9
\hposition[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[4]~40_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(4));

-- Location: LCCOMB_X32_Y23_N10
\hposition[5]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[5]~42_combout\ = (hposition(5) & (!\hposition[4]~41\)) # (!hposition(5) & ((\hposition[4]~41\) # (GND)))
-- \hposition[5]~43\ = CARRY((!\hposition[4]~41\) # (!hposition(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datad => VCC,
	cin => \hposition[4]~41\,
	combout => \hposition[5]~42_combout\,
	cout => \hposition[5]~43\);

-- Location: FF_X32_Y23_N11
\hposition[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[5]~42_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(5));

-- Location: LCCOMB_X32_Y23_N12
\hposition[6]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[6]~44_combout\ = (hposition(6) & (\hposition[5]~43\ $ (GND))) # (!hposition(6) & (!\hposition[5]~43\ & VCC))
-- \hposition[6]~45\ = CARRY((hposition(6) & !\hposition[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datad => VCC,
	cin => \hposition[5]~43\,
	combout => \hposition[6]~44_combout\,
	cout => \hposition[6]~45\);

-- Location: FF_X32_Y23_N13
\hposition[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[6]~44_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(6));

-- Location: LCCOMB_X32_Y23_N14
\hposition[7]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[7]~46_combout\ = (hposition(7) & (!\hposition[6]~45\)) # (!hposition(7) & ((\hposition[6]~45\) # (GND)))
-- \hposition[7]~47\ = CARRY((!\hposition[6]~45\) # (!hposition(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(7),
	datad => VCC,
	cin => \hposition[6]~45\,
	combout => \hposition[7]~46_combout\,
	cout => \hposition[7]~47\);

-- Location: FF_X32_Y23_N15
\hposition[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[7]~46_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(7));

-- Location: LCCOMB_X32_Y23_N16
\hposition[8]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[8]~48_combout\ = (hposition(8) & (\hposition[7]~47\ $ (GND))) # (!hposition(8) & (!\hposition[7]~47\ & VCC))
-- \hposition[8]~49\ = CARRY((hposition(8) & !\hposition[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(8),
	datad => VCC,
	cin => \hposition[7]~47\,
	combout => \hposition[8]~48_combout\,
	cout => \hposition[8]~49\);

-- Location: FF_X32_Y23_N17
\hposition[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[8]~48_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(8));

-- Location: LCCOMB_X32_Y23_N18
\hposition[9]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[9]~50_combout\ = (hposition(9) & (!\hposition[8]~49\)) # (!hposition(9) & ((\hposition[8]~49\) # (GND)))
-- \hposition[9]~51\ = CARRY((!\hposition[8]~49\) # (!hposition(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(9),
	datad => VCC,
	cin => \hposition[8]~49\,
	combout => \hposition[9]~50_combout\,
	cout => \hposition[9]~51\);

-- Location: FF_X32_Y23_N19
\hposition[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[9]~50_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(9));

-- Location: LCCOMB_X32_Y23_N20
\hposition[10]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[10]~52_combout\ = (hposition(10) & (\hposition[9]~51\ $ (GND))) # (!hposition(10) & (!\hposition[9]~51\ & VCC))
-- \hposition[10]~53\ = CARRY((hposition(10) & !\hposition[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(10),
	datad => VCC,
	cin => \hposition[9]~51\,
	combout => \hposition[10]~52_combout\,
	cout => \hposition[10]~53\);

-- Location: FF_X32_Y23_N21
\hposition[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[10]~52_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(10));

-- Location: LCCOMB_X32_Y23_N22
\hposition[11]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[11]~54_combout\ = (hposition(11) & (!\hposition[10]~53\)) # (!hposition(11) & ((\hposition[10]~53\) # (GND)))
-- \hposition[11]~55\ = CARRY((!\hposition[10]~53\) # (!hposition(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datad => VCC,
	cin => \hposition[10]~53\,
	combout => \hposition[11]~54_combout\,
	cout => \hposition[11]~55\);

-- Location: FF_X32_Y23_N23
\hposition[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[11]~54_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(11));

-- Location: LCCOMB_X32_Y23_N24
\hposition[12]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[12]~56_combout\ = (hposition(12) & (\hposition[11]~55\ $ (GND))) # (!hposition(12) & (!\hposition[11]~55\ & VCC))
-- \hposition[12]~57\ = CARRY((hposition(12) & !\hposition[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(12),
	datad => VCC,
	cin => \hposition[11]~55\,
	combout => \hposition[12]~56_combout\,
	cout => \hposition[12]~57\);

-- Location: FF_X32_Y23_N25
\hposition[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[12]~56_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(12));

-- Location: LCCOMB_X32_Y23_N26
\hposition[13]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[13]~58_combout\ = (hposition(13) & (!\hposition[12]~57\)) # (!hposition(13) & ((\hposition[12]~57\) # (GND)))
-- \hposition[13]~59\ = CARRY((!\hposition[12]~57\) # (!hposition(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datad => VCC,
	cin => \hposition[12]~57\,
	combout => \hposition[13]~58_combout\,
	cout => \hposition[13]~59\);

-- Location: FF_X32_Y23_N27
\hposition[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[13]~58_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(13));

-- Location: LCCOMB_X32_Y23_N28
\hposition[14]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[14]~60_combout\ = (hposition(14) & (\hposition[13]~59\ $ (GND))) # (!hposition(14) & (!\hposition[13]~59\ & VCC))
-- \hposition[14]~61\ = CARRY((hposition(14) & !\hposition[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(14),
	datad => VCC,
	cin => \hposition[13]~59\,
	combout => \hposition[14]~60_combout\,
	cout => \hposition[14]~61\);

-- Location: FF_X32_Y23_N29
\hposition[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[14]~60_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(14));

-- Location: LCCOMB_X32_Y23_N30
\hposition[15]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[15]~62_combout\ = (hposition(15) & (!\hposition[14]~61\)) # (!hposition(15) & ((\hposition[14]~61\) # (GND)))
-- \hposition[15]~63\ = CARRY((!\hposition[14]~61\) # (!hposition(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datad => VCC,
	cin => \hposition[14]~61\,
	combout => \hposition[15]~62_combout\,
	cout => \hposition[15]~63\);

-- Location: FF_X32_Y23_N31
\hposition[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[15]~62_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(15));

-- Location: LCCOMB_X32_Y22_N0
\hposition[16]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[16]~64_combout\ = (hposition(16) & (\hposition[15]~63\ $ (GND))) # (!hposition(16) & (!\hposition[15]~63\ & VCC))
-- \hposition[16]~65\ = CARRY((hposition(16) & !\hposition[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(16),
	datad => VCC,
	cin => \hposition[15]~63\,
	combout => \hposition[16]~64_combout\,
	cout => \hposition[16]~65\);

-- Location: FF_X32_Y22_N1
\hposition[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[16]~64_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(16));

-- Location: LCCOMB_X32_Y22_N2
\hposition[17]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[17]~66_combout\ = (hposition(17) & (!\hposition[16]~65\)) # (!hposition(17) & ((\hposition[16]~65\) # (GND)))
-- \hposition[17]~67\ = CARRY((!\hposition[16]~65\) # (!hposition(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(17),
	datad => VCC,
	cin => \hposition[16]~65\,
	combout => \hposition[17]~66_combout\,
	cout => \hposition[17]~67\);

-- Location: FF_X32_Y22_N3
\hposition[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[17]~66_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(17));

-- Location: LCCOMB_X32_Y22_N4
\hposition[18]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[18]~68_combout\ = (hposition(18) & (\hposition[17]~67\ $ (GND))) # (!hposition(18) & (!\hposition[17]~67\ & VCC))
-- \hposition[18]~69\ = CARRY((hposition(18) & !\hposition[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(18),
	datad => VCC,
	cin => \hposition[17]~67\,
	combout => \hposition[18]~68_combout\,
	cout => \hposition[18]~69\);

-- Location: FF_X32_Y22_N5
\hposition[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[18]~68_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(18));

-- Location: LCCOMB_X32_Y22_N6
\hposition[19]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[19]~70_combout\ = (hposition(19) & (!\hposition[18]~69\)) # (!hposition(19) & ((\hposition[18]~69\) # (GND)))
-- \hposition[19]~71\ = CARRY((!\hposition[18]~69\) # (!hposition(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datad => VCC,
	cin => \hposition[18]~69\,
	combout => \hposition[19]~70_combout\,
	cout => \hposition[19]~71\);

-- Location: FF_X32_Y22_N7
\hposition[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[19]~70_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(19));

-- Location: LCCOMB_X32_Y22_N8
\hposition[20]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[20]~72_combout\ = (hposition(20) & (\hposition[19]~71\ $ (GND))) # (!hposition(20) & (!\hposition[19]~71\ & VCC))
-- \hposition[20]~73\ = CARRY((hposition(20) & !\hposition[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(20),
	datad => VCC,
	cin => \hposition[19]~71\,
	combout => \hposition[20]~72_combout\,
	cout => \hposition[20]~73\);

-- Location: FF_X32_Y22_N9
\hposition[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[20]~72_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(20));

-- Location: LCCOMB_X32_Y22_N10
\hposition[21]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[21]~74_combout\ = (hposition(21) & (!\hposition[20]~73\)) # (!hposition(21) & ((\hposition[20]~73\) # (GND)))
-- \hposition[21]~75\ = CARRY((!\hposition[20]~73\) # (!hposition(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datad => VCC,
	cin => \hposition[20]~73\,
	combout => \hposition[21]~74_combout\,
	cout => \hposition[21]~75\);

-- Location: FF_X32_Y22_N11
\hposition[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[21]~74_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(21));

-- Location: LCCOMB_X32_Y22_N12
\hposition[22]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[22]~76_combout\ = (hposition(22) & (\hposition[21]~75\ $ (GND))) # (!hposition(22) & (!\hposition[21]~75\ & VCC))
-- \hposition[22]~77\ = CARRY((hposition(22) & !\hposition[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(22),
	datad => VCC,
	cin => \hposition[21]~75\,
	combout => \hposition[22]~76_combout\,
	cout => \hposition[22]~77\);

-- Location: FF_X32_Y22_N13
\hposition[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[22]~76_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(22));

-- Location: LCCOMB_X32_Y22_N14
\hposition[23]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[23]~78_combout\ = (hposition(23) & (!\hposition[22]~77\)) # (!hposition(23) & ((\hposition[22]~77\) # (GND)))
-- \hposition[23]~79\ = CARRY((!\hposition[22]~77\) # (!hposition(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(23),
	datad => VCC,
	cin => \hposition[22]~77\,
	combout => \hposition[23]~78_combout\,
	cout => \hposition[23]~79\);

-- Location: FF_X32_Y22_N15
\hposition[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[23]~78_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(23));

-- Location: LCCOMB_X32_Y22_N16
\hposition[24]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[24]~80_combout\ = (hposition(24) & (\hposition[23]~79\ $ (GND))) # (!hposition(24) & (!\hposition[23]~79\ & VCC))
-- \hposition[24]~81\ = CARRY((hposition(24) & !\hposition[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(24),
	datad => VCC,
	cin => \hposition[23]~79\,
	combout => \hposition[24]~80_combout\,
	cout => \hposition[24]~81\);

-- Location: FF_X32_Y22_N17
\hposition[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[24]~80_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(24));

-- Location: LCCOMB_X32_Y22_N18
\hposition[25]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[25]~82_combout\ = (hposition(25) & (!\hposition[24]~81\)) # (!hposition(25) & ((\hposition[24]~81\) # (GND)))
-- \hposition[25]~83\ = CARRY((!\hposition[24]~81\) # (!hposition(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(25),
	datad => VCC,
	cin => \hposition[24]~81\,
	combout => \hposition[25]~82_combout\,
	cout => \hposition[25]~83\);

-- Location: FF_X32_Y22_N19
\hposition[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[25]~82_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(25));

-- Location: LCCOMB_X32_Y22_N20
\hposition[26]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[26]~84_combout\ = (hposition(26) & (\hposition[25]~83\ $ (GND))) # (!hposition(26) & (!\hposition[25]~83\ & VCC))
-- \hposition[26]~85\ = CARRY((hposition(26) & !\hposition[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(26),
	datad => VCC,
	cin => \hposition[25]~83\,
	combout => \hposition[26]~84_combout\,
	cout => \hposition[26]~85\);

-- Location: FF_X32_Y22_N21
\hposition[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[26]~84_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(26));

-- Location: LCCOMB_X34_Y21_N10
\LessThan3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~5_combout\ = (!hposition(26) & (!hposition(25) & (!hposition(23) & !hposition(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(26),
	datab => hposition(25),
	datac => hposition(23),
	datad => hposition(24),
	combout => \LessThan3~5_combout\);

-- Location: LCCOMB_X34_Y21_N8
\LessThan3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (!hposition(17) & (!hposition(18) & (!hposition(15) & !hposition(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => hposition(18),
	datac => hposition(15),
	datad => hposition(16),
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X34_Y21_N18
\LessThan3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (!hposition(11) & !hposition(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datac => hposition(12),
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X34_Y21_N2
\LessThan3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~3_combout\ = (!hposition(13) & (\LessThan3~2_combout\ & (!hposition(14) & \LessThan3~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \LessThan3~2_combout\,
	datac => hposition(14),
	datad => \LessThan3~1_combout\,
	combout => \LessThan3~3_combout\);

-- Location: LCCOMB_X34_Y21_N4
\LessThan3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~4_combout\ = (!hposition(21) & (!hposition(20) & (!hposition(22) & !hposition(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => hposition(20),
	datac => hposition(22),
	datad => hposition(19),
	combout => \LessThan3~4_combout\);

-- Location: LCCOMB_X32_Y22_N22
\hposition[27]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[27]~86_combout\ = (hposition(27) & (!\hposition[26]~85\)) # (!hposition(27) & ((\hposition[26]~85\) # (GND)))
-- \hposition[27]~87\ = CARRY((!\hposition[26]~85\) # (!hposition(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datad => VCC,
	cin => \hposition[26]~85\,
	combout => \hposition[27]~86_combout\,
	cout => \hposition[27]~87\);

-- Location: FF_X32_Y22_N23
\hposition[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[27]~86_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(27));

-- Location: LCCOMB_X32_Y22_N24
\hposition[28]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[28]~88_combout\ = (hposition(28) & (\hposition[27]~87\ $ (GND))) # (!hposition(28) & (!\hposition[27]~87\ & VCC))
-- \hposition[28]~89\ = CARRY((hposition(28) & !\hposition[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(28),
	datad => VCC,
	cin => \hposition[27]~87\,
	combout => \hposition[28]~88_combout\,
	cout => \hposition[28]~89\);

-- Location: FF_X32_Y22_N25
\hposition[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[28]~88_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(28));

-- Location: LCCOMB_X32_Y22_N26
\hposition[29]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[29]~90_combout\ = (hposition(29) & (!\hposition[28]~89\)) # (!hposition(29) & ((\hposition[28]~89\) # (GND)))
-- \hposition[29]~91\ = CARRY((!\hposition[28]~89\) # (!hposition(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(29),
	datad => VCC,
	cin => \hposition[28]~89\,
	combout => \hposition[29]~90_combout\,
	cout => \hposition[29]~91\);

-- Location: FF_X32_Y22_N27
\hposition[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[29]~90_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(29));

-- Location: LCCOMB_X32_Y22_N28
\hposition[30]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[30]~92_combout\ = (hposition(30) & (\hposition[29]~91\ $ (GND))) # (!hposition(30) & (!\hposition[29]~91\ & VCC))
-- \hposition[30]~93\ = CARRY((hposition(30) & !\hposition[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(30),
	datad => VCC,
	cin => \hposition[29]~91\,
	combout => \hposition[30]~92_combout\,
	cout => \hposition[30]~93\);

-- Location: FF_X32_Y22_N29
\hposition[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[30]~92_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(30));

-- Location: LCCOMB_X34_Y21_N12
\LessThan3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (!hposition(28) & (!hposition(29) & (!hposition(30) & !hposition(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => hposition(29),
	datac => hposition(30),
	datad => hposition(27),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X34_Y21_N16
\LessThan3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~6_combout\ = (\LessThan3~5_combout\ & (\LessThan3~3_combout\ & (\LessThan3~4_combout\ & \LessThan3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~5_combout\,
	datab => \LessThan3~3_combout\,
	datac => \LessThan3~4_combout\,
	datad => \LessThan3~0_combout\,
	combout => \LessThan3~6_combout\);

-- Location: LCCOMB_X31_Y18_N30
\LessThan3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~7_combout\ = (!hposition(9) & (((!hposition(6) & !hposition(7))) # (!hposition(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => hposition(6),
	datac => hposition(8),
	datad => hposition(7),
	combout => \LessThan3~7_combout\);

-- Location: LCCOMB_X32_Y22_N30
\hposition[31]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \hposition[31]~94_combout\ = hposition(31) $ (\hposition[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(31),
	cin => \hposition[30]~93\,
	combout => \hposition[31]~94_combout\);

-- Location: FF_X32_Y22_N31
\hposition[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[31]~94_combout\,
	sclr => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(31));

-- Location: LCCOMB_X31_Y18_N0
\LessThan3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~8_combout\ = (!hposition(31) & (((hposition(10) & !\LessThan3~7_combout\)) # (!\LessThan3~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \LessThan3~6_combout\,
	datac => \LessThan3~7_combout\,
	datad => hposition(31),
	combout => \LessThan3~8_combout\);

-- Location: FF_X29_Y18_N13
\vposition[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[6]~44_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(6));

-- Location: LCCOMB_X29_Y18_N14
\vposition[7]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[7]~46_combout\ = (vposition(7) & (!\vposition[6]~45\)) # (!vposition(7) & ((\vposition[6]~45\) # (GND)))
-- \vposition[7]~47\ = CARRY((!\vposition[6]~45\) # (!vposition(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(7),
	datad => VCC,
	cin => \vposition[6]~45\,
	combout => \vposition[7]~46_combout\,
	cout => \vposition[7]~47\);

-- Location: FF_X29_Y18_N15
\vposition[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[7]~46_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(7));

-- Location: LCCOMB_X29_Y18_N16
\vposition[8]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[8]~48_combout\ = (vposition(8) & (\vposition[7]~47\ $ (GND))) # (!vposition(8) & (!\vposition[7]~47\ & VCC))
-- \vposition[8]~49\ = CARRY((vposition(8) & !\vposition[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(8),
	datad => VCC,
	cin => \vposition[7]~47\,
	combout => \vposition[8]~48_combout\,
	cout => \vposition[8]~49\);

-- Location: FF_X29_Y18_N17
\vposition[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[8]~48_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(8));

-- Location: LCCOMB_X29_Y18_N18
\vposition[9]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[9]~50_combout\ = (vposition(9) & (!\vposition[8]~49\)) # (!vposition(9) & ((\vposition[8]~49\) # (GND)))
-- \vposition[9]~51\ = CARRY((!\vposition[8]~49\) # (!vposition(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(9),
	datad => VCC,
	cin => \vposition[8]~49\,
	combout => \vposition[9]~50_combout\,
	cout => \vposition[9]~51\);

-- Location: FF_X29_Y18_N19
\vposition[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[9]~50_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(9));

-- Location: LCCOMB_X29_Y18_N20
\vposition[10]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[10]~52_combout\ = (vposition(10) & (\vposition[9]~51\ $ (GND))) # (!vposition(10) & (!\vposition[9]~51\ & VCC))
-- \vposition[10]~53\ = CARRY((vposition(10) & !\vposition[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(10),
	datad => VCC,
	cin => \vposition[9]~51\,
	combout => \vposition[10]~52_combout\,
	cout => \vposition[10]~53\);

-- Location: FF_X29_Y18_N21
\vposition[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[10]~52_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(10));

-- Location: LCCOMB_X29_Y18_N22
\vposition[11]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[11]~54_combout\ = (vposition(11) & (!\vposition[10]~53\)) # (!vposition(11) & ((\vposition[10]~53\) # (GND)))
-- \vposition[11]~55\ = CARRY((!\vposition[10]~53\) # (!vposition(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(11),
	datad => VCC,
	cin => \vposition[10]~53\,
	combout => \vposition[11]~54_combout\,
	cout => \vposition[11]~55\);

-- Location: FF_X29_Y18_N23
\vposition[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[11]~54_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(11));

-- Location: LCCOMB_X29_Y18_N24
\vposition[12]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[12]~56_combout\ = (vposition(12) & (\vposition[11]~55\ $ (GND))) # (!vposition(12) & (!\vposition[11]~55\ & VCC))
-- \vposition[12]~57\ = CARRY((vposition(12) & !\vposition[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(12),
	datad => VCC,
	cin => \vposition[11]~55\,
	combout => \vposition[12]~56_combout\,
	cout => \vposition[12]~57\);

-- Location: FF_X29_Y18_N25
\vposition[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[12]~56_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(12));

-- Location: LCCOMB_X29_Y18_N26
\vposition[13]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[13]~58_combout\ = (vposition(13) & (!\vposition[12]~57\)) # (!vposition(13) & ((\vposition[12]~57\) # (GND)))
-- \vposition[13]~59\ = CARRY((!\vposition[12]~57\) # (!vposition(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(13),
	datad => VCC,
	cin => \vposition[12]~57\,
	combout => \vposition[13]~58_combout\,
	cout => \vposition[13]~59\);

-- Location: FF_X29_Y18_N27
\vposition[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[13]~58_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(13));

-- Location: LCCOMB_X29_Y18_N28
\vposition[14]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[14]~60_combout\ = (vposition(14) & (\vposition[13]~59\ $ (GND))) # (!vposition(14) & (!\vposition[13]~59\ & VCC))
-- \vposition[14]~61\ = CARRY((vposition(14) & !\vposition[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(14),
	datad => VCC,
	cin => \vposition[13]~59\,
	combout => \vposition[14]~60_combout\,
	cout => \vposition[14]~61\);

-- Location: FF_X29_Y18_N29
\vposition[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[14]~60_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(14));

-- Location: LCCOMB_X29_Y18_N30
\vposition[15]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[15]~62_combout\ = (vposition(15) & (!\vposition[14]~61\)) # (!vposition(15) & ((\vposition[14]~61\) # (GND)))
-- \vposition[15]~63\ = CARRY((!\vposition[14]~61\) # (!vposition(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(15),
	datad => VCC,
	cin => \vposition[14]~61\,
	combout => \vposition[15]~62_combout\,
	cout => \vposition[15]~63\);

-- Location: FF_X29_Y18_N31
\vposition[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[15]~62_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(15));

-- Location: LCCOMB_X29_Y17_N0
\vposition[16]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[16]~64_combout\ = (vposition(16) & (\vposition[15]~63\ $ (GND))) # (!vposition(16) & (!\vposition[15]~63\ & VCC))
-- \vposition[16]~65\ = CARRY((vposition(16) & !\vposition[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(16),
	datad => VCC,
	cin => \vposition[15]~63\,
	combout => \vposition[16]~64_combout\,
	cout => \vposition[16]~65\);

-- Location: FF_X29_Y17_N1
\vposition[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[16]~64_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(16));

-- Location: LCCOMB_X29_Y17_N2
\vposition[17]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[17]~66_combout\ = (vposition(17) & (!\vposition[16]~65\)) # (!vposition(17) & ((\vposition[16]~65\) # (GND)))
-- \vposition[17]~67\ = CARRY((!\vposition[16]~65\) # (!vposition(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(17),
	datad => VCC,
	cin => \vposition[16]~65\,
	combout => \vposition[17]~66_combout\,
	cout => \vposition[17]~67\);

-- Location: FF_X29_Y17_N3
\vposition[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[17]~66_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(17));

-- Location: LCCOMB_X29_Y17_N4
\vposition[18]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[18]~68_combout\ = (vposition(18) & (\vposition[17]~67\ $ (GND))) # (!vposition(18) & (!\vposition[17]~67\ & VCC))
-- \vposition[18]~69\ = CARRY((vposition(18) & !\vposition[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(18),
	datad => VCC,
	cin => \vposition[17]~67\,
	combout => \vposition[18]~68_combout\,
	cout => \vposition[18]~69\);

-- Location: FF_X29_Y17_N5
\vposition[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[18]~68_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(18));

-- Location: LCCOMB_X29_Y17_N6
\vposition[19]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[19]~70_combout\ = (vposition(19) & (!\vposition[18]~69\)) # (!vposition(19) & ((\vposition[18]~69\) # (GND)))
-- \vposition[19]~71\ = CARRY((!\vposition[18]~69\) # (!vposition(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(19),
	datad => VCC,
	cin => \vposition[18]~69\,
	combout => \vposition[19]~70_combout\,
	cout => \vposition[19]~71\);

-- Location: FF_X29_Y17_N7
\vposition[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[19]~70_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(19));

-- Location: LCCOMB_X29_Y17_N8
\vposition[20]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[20]~72_combout\ = (vposition(20) & (\vposition[19]~71\ $ (GND))) # (!vposition(20) & (!\vposition[19]~71\ & VCC))
-- \vposition[20]~73\ = CARRY((vposition(20) & !\vposition[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(20),
	datad => VCC,
	cin => \vposition[19]~71\,
	combout => \vposition[20]~72_combout\,
	cout => \vposition[20]~73\);

-- Location: FF_X29_Y17_N9
\vposition[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[20]~72_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(20));

-- Location: LCCOMB_X29_Y17_N10
\vposition[21]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[21]~74_combout\ = (vposition(21) & (!\vposition[20]~73\)) # (!vposition(21) & ((\vposition[20]~73\) # (GND)))
-- \vposition[21]~75\ = CARRY((!\vposition[20]~73\) # (!vposition(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(21),
	datad => VCC,
	cin => \vposition[20]~73\,
	combout => \vposition[21]~74_combout\,
	cout => \vposition[21]~75\);

-- Location: FF_X29_Y17_N11
\vposition[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[21]~74_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(21));

-- Location: LCCOMB_X29_Y17_N12
\vposition[22]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[22]~76_combout\ = (vposition(22) & (\vposition[21]~75\ $ (GND))) # (!vposition(22) & (!\vposition[21]~75\ & VCC))
-- \vposition[22]~77\ = CARRY((vposition(22) & !\vposition[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(22),
	datad => VCC,
	cin => \vposition[21]~75\,
	combout => \vposition[22]~76_combout\,
	cout => \vposition[22]~77\);

-- Location: FF_X29_Y17_N13
\vposition[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[22]~76_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(22));

-- Location: LCCOMB_X29_Y17_N14
\vposition[23]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[23]~78_combout\ = (vposition(23) & (!\vposition[22]~77\)) # (!vposition(23) & ((\vposition[22]~77\) # (GND)))
-- \vposition[23]~79\ = CARRY((!\vposition[22]~77\) # (!vposition(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(23),
	datad => VCC,
	cin => \vposition[22]~77\,
	combout => \vposition[23]~78_combout\,
	cout => \vposition[23]~79\);

-- Location: FF_X29_Y17_N15
\vposition[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[23]~78_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(23));

-- Location: LCCOMB_X29_Y17_N16
\vposition[24]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[24]~80_combout\ = (vposition(24) & (\vposition[23]~79\ $ (GND))) # (!vposition(24) & (!\vposition[23]~79\ & VCC))
-- \vposition[24]~81\ = CARRY((vposition(24) & !\vposition[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(24),
	datad => VCC,
	cin => \vposition[23]~79\,
	combout => \vposition[24]~80_combout\,
	cout => \vposition[24]~81\);

-- Location: FF_X29_Y17_N17
\vposition[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[24]~80_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(24));

-- Location: LCCOMB_X29_Y17_N18
\vposition[25]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[25]~82_combout\ = (vposition(25) & (!\vposition[24]~81\)) # (!vposition(25) & ((\vposition[24]~81\) # (GND)))
-- \vposition[25]~83\ = CARRY((!\vposition[24]~81\) # (!vposition(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(25),
	datad => VCC,
	cin => \vposition[24]~81\,
	combout => \vposition[25]~82_combout\,
	cout => \vposition[25]~83\);

-- Location: FF_X29_Y17_N19
\vposition[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[25]~82_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(25));

-- Location: LCCOMB_X29_Y17_N20
\vposition[26]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[26]~84_combout\ = (vposition(26) & (\vposition[25]~83\ $ (GND))) # (!vposition(26) & (!\vposition[25]~83\ & VCC))
-- \vposition[26]~85\ = CARRY((vposition(26) & !\vposition[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(26),
	datad => VCC,
	cin => \vposition[25]~83\,
	combout => \vposition[26]~84_combout\,
	cout => \vposition[26]~85\);

-- Location: FF_X29_Y17_N21
\vposition[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[26]~84_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(26));

-- Location: LCCOMB_X29_Y17_N22
\vposition[27]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[27]~86_combout\ = (vposition(27) & (!\vposition[26]~85\)) # (!vposition(27) & ((\vposition[26]~85\) # (GND)))
-- \vposition[27]~87\ = CARRY((!\vposition[26]~85\) # (!vposition(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(27),
	datad => VCC,
	cin => \vposition[26]~85\,
	combout => \vposition[27]~86_combout\,
	cout => \vposition[27]~87\);

-- Location: FF_X29_Y17_N23
\vposition[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[27]~86_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(27));

-- Location: LCCOMB_X29_Y17_N24
\vposition[28]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[28]~88_combout\ = (vposition(28) & (\vposition[27]~87\ $ (GND))) # (!vposition(28) & (!\vposition[27]~87\ & VCC))
-- \vposition[28]~89\ = CARRY((vposition(28) & !\vposition[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(28),
	datad => VCC,
	cin => \vposition[27]~87\,
	combout => \vposition[28]~88_combout\,
	cout => \vposition[28]~89\);

-- Location: FF_X29_Y17_N25
\vposition[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[28]~88_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(28));

-- Location: LCCOMB_X29_Y17_N26
\vposition[29]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[29]~90_combout\ = (vposition(29) & (!\vposition[28]~89\)) # (!vposition(29) & ((\vposition[28]~89\) # (GND)))
-- \vposition[29]~91\ = CARRY((!\vposition[28]~89\) # (!vposition(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(29),
	datad => VCC,
	cin => \vposition[28]~89\,
	combout => \vposition[29]~90_combout\,
	cout => \vposition[29]~91\);

-- Location: FF_X29_Y17_N27
\vposition[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[29]~90_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(29));

-- Location: LCCOMB_X29_Y17_N28
\vposition[30]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[30]~92_combout\ = (vposition(30) & (\vposition[29]~91\ $ (GND))) # (!vposition(30) & (!\vposition[29]~91\ & VCC))
-- \vposition[30]~93\ = CARRY((vposition(30) & !\vposition[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(30),
	datad => VCC,
	cin => \vposition[29]~91\,
	combout => \vposition[30]~92_combout\,
	cout => \vposition[30]~93\);

-- Location: FF_X29_Y17_N29
\vposition[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[30]~92_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(30));

-- Location: LCCOMB_X30_Y17_N12
\LessThan4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~3_combout\ = (!vposition(23) & (!vposition(25) & (!vposition(24) & !vposition(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(23),
	datab => vposition(25),
	datac => vposition(24),
	datad => vposition(22),
	combout => \LessThan4~3_combout\);

-- Location: LCCOMB_X30_Y17_N0
\LessThan4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~1_combout\ = (!vposition(17) & (!vposition(15) & (!vposition(16) & !vposition(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(17),
	datab => vposition(15),
	datac => vposition(16),
	datad => vposition(14),
	combout => \LessThan4~1_combout\);

-- Location: LCCOMB_X30_Y17_N30
\LessThan4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~2_combout\ = (!vposition(21) & (!vposition(19) & (!vposition(18) & !vposition(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(21),
	datab => vposition(19),
	datac => vposition(18),
	datad => vposition(20),
	combout => \LessThan4~2_combout\);

-- Location: LCCOMB_X30_Y17_N6
\LessThan4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (!vposition(13) & (!vposition(11) & (!vposition(12) & !vposition(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(13),
	datab => vposition(11),
	datac => vposition(12),
	datad => vposition(10),
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X30_Y17_N14
\LessThan4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~4_combout\ = (\LessThan4~3_combout\ & (\LessThan4~1_combout\ & (\LessThan4~2_combout\ & \LessThan4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~3_combout\,
	datab => \LessThan4~1_combout\,
	datac => \LessThan4~2_combout\,
	datad => \LessThan4~0_combout\,
	combout => \LessThan4~4_combout\);

-- Location: LCCOMB_X30_Y17_N28
\LessThan4~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~5_combout\ = (!vposition(28) & (!vposition(26) & (!vposition(29) & !vposition(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(28),
	datab => vposition(26),
	datac => vposition(29),
	datad => vposition(27),
	combout => \LessThan4~5_combout\);

-- Location: LCCOMB_X30_Y17_N26
\LessThan4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~6_combout\ = (!vposition(30) & (\LessThan4~4_combout\ & \LessThan4~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => vposition(30),
	datac => \LessThan4~4_combout\,
	datad => \LessThan4~5_combout\,
	combout => \LessThan4~6_combout\);

-- Location: LCCOMB_X29_Y17_N30
\vposition[31]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[31]~94_combout\ = vposition(31) $ (\vposition[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(31),
	cin => \vposition[30]~93\,
	combout => \vposition[31]~94_combout\);

-- Location: FF_X29_Y17_N31
\vposition[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[31]~94_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(31));

-- Location: LCCOMB_X30_Y17_N8
\LessThan4~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~9_combout\ = (!vposition(8)) # (!vposition(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(9),
	datac => vposition(8),
	combout => \LessThan4~9_combout\);

-- Location: LCCOMB_X30_Y20_N14
\LessThan4~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~7_combout\ = (!vposition(3) & (!vposition(4) & ((!vposition(1)) # (!vposition(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => vposition(3),
	datac => vposition(4),
	datad => vposition(1),
	combout => \LessThan4~7_combout\);

-- Location: LCCOMB_X30_Y17_N18
\LessThan4~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~8_combout\ = (!vposition(6) & (!vposition(7) & ((\LessThan4~7_combout\) # (!vposition(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datab => vposition(6),
	datac => vposition(7),
	datad => \LessThan4~7_combout\,
	combout => \LessThan4~8_combout\);

-- Location: LCCOMB_X30_Y17_N2
\LessThan4~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~10_combout\ = (!vposition(31) & (((!\LessThan4~9_combout\ & !\LessThan4~8_combout\)) # (!\LessThan4~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~6_combout\,
	datab => vposition(31),
	datac => \LessThan4~9_combout\,
	datad => \LessThan4~8_combout\,
	combout => \LessThan4~10_combout\);

-- Location: FF_X29_Y18_N1
\vposition[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[0]~32_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(0));

-- Location: LCCOMB_X29_Y18_N2
\vposition[1]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[1]~34_combout\ = (vposition(1) & (!\vposition[0]~33\)) # (!vposition(1) & ((\vposition[0]~33\) # (GND)))
-- \vposition[1]~35\ = CARRY((!\vposition[0]~33\) # (!vposition(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(1),
	datad => VCC,
	cin => \vposition[0]~33\,
	combout => \vposition[1]~34_combout\,
	cout => \vposition[1]~35\);

-- Location: FF_X29_Y18_N3
\vposition[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[1]~34_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(1));

-- Location: LCCOMB_X29_Y18_N4
\vposition[2]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[2]~36_combout\ = (vposition(2) & (\vposition[1]~35\ $ (GND))) # (!vposition(2) & (!\vposition[1]~35\ & VCC))
-- \vposition[2]~37\ = CARRY((vposition(2) & !\vposition[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(2),
	datad => VCC,
	cin => \vposition[1]~35\,
	combout => \vposition[2]~36_combout\,
	cout => \vposition[2]~37\);

-- Location: FF_X29_Y18_N5
\vposition[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[2]~36_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(2));

-- Location: LCCOMB_X29_Y18_N6
\vposition[3]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[3]~38_combout\ = (vposition(3) & (!\vposition[2]~37\)) # (!vposition(3) & ((\vposition[2]~37\) # (GND)))
-- \vposition[3]~39\ = CARRY((!\vposition[2]~37\) # (!vposition(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(3),
	datad => VCC,
	cin => \vposition[2]~37\,
	combout => \vposition[3]~38_combout\,
	cout => \vposition[3]~39\);

-- Location: FF_X29_Y18_N7
\vposition[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[3]~38_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(3));

-- Location: LCCOMB_X29_Y18_N8
\vposition[4]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \vposition[4]~40_combout\ = (vposition(4) & (\vposition[3]~39\ $ (GND))) # (!vposition(4) & (!\vposition[3]~39\ & VCC))
-- \vposition[4]~41\ = CARRY((vposition(4) & !\vposition[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(4),
	datad => VCC,
	cin => \vposition[3]~39\,
	combout => \vposition[4]~40_combout\,
	cout => \vposition[4]~41\);

-- Location: FF_X29_Y18_N9
\vposition[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[4]~40_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(4));

-- Location: FF_X29_Y18_N11
\vposition[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[5]~42_combout\,
	sclr => \LessThan4~10_combout\,
	ena => \LessThan3~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(5));

-- Location: LCCOMB_X29_Y21_N28
\bg_hstart[14]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[14]~feeder_combout\ = \bg_hstart~21_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~21_combout\,
	combout => \bg_hstart[14]~feeder_combout\);

-- Location: FF_X29_Y21_N29
\bg_hstart[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[14]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(14));

-- Location: LCCOMB_X31_Y22_N0
\count[0]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[0]~32_combout\ = count(0) $ (VCC)
-- \count[0]~33\ = CARRY(count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(0),
	datad => VCC,
	combout => \count[0]~32_combout\,
	cout => \count[0]~33\);

-- Location: FF_X31_Y22_N1
\count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[0]~32_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(0));

-- Location: LCCOMB_X31_Y22_N2
\count[1]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[1]~34_combout\ = (count(1) & (!\count[0]~33\)) # (!count(1) & ((\count[0]~33\) # (GND)))
-- \count[1]~35\ = CARRY((!\count[0]~33\) # (!count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(1),
	datad => VCC,
	cin => \count[0]~33\,
	combout => \count[1]~34_combout\,
	cout => \count[1]~35\);

-- Location: FF_X31_Y22_N3
\count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[1]~34_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(1));

-- Location: LCCOMB_X31_Y22_N4
\count[2]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[2]~36_combout\ = (count(2) & (\count[1]~35\ $ (GND))) # (!count(2) & (!\count[1]~35\ & VCC))
-- \count[2]~37\ = CARRY((count(2) & !\count[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(2),
	datad => VCC,
	cin => \count[1]~35\,
	combout => \count[2]~36_combout\,
	cout => \count[2]~37\);

-- Location: FF_X31_Y22_N5
\count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[2]~36_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(2));

-- Location: LCCOMB_X31_Y22_N6
\count[3]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[3]~38_combout\ = (count(3) & (!\count[2]~37\)) # (!count(3) & ((\count[2]~37\) # (GND)))
-- \count[3]~39\ = CARRY((!\count[2]~37\) # (!count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(3),
	datad => VCC,
	cin => \count[2]~37\,
	combout => \count[3]~38_combout\,
	cout => \count[3]~39\);

-- Location: FF_X31_Y22_N7
\count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[3]~38_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(3));

-- Location: LCCOMB_X31_Y22_N8
\count[4]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[4]~40_combout\ = (count(4) & (\count[3]~39\ $ (GND))) # (!count(4) & (!\count[3]~39\ & VCC))
-- \count[4]~41\ = CARRY((count(4) & !\count[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(4),
	datad => VCC,
	cin => \count[3]~39\,
	combout => \count[4]~40_combout\,
	cout => \count[4]~41\);

-- Location: FF_X31_Y22_N9
\count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[4]~40_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(4));

-- Location: LCCOMB_X31_Y22_N10
\count[5]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[5]~42_combout\ = (count(5) & (!\count[4]~41\)) # (!count(5) & ((\count[4]~41\) # (GND)))
-- \count[5]~43\ = CARRY((!\count[4]~41\) # (!count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(5),
	datad => VCC,
	cin => \count[4]~41\,
	combout => \count[5]~42_combout\,
	cout => \count[5]~43\);

-- Location: FF_X31_Y22_N11
\count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[5]~42_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(5));

-- Location: LCCOMB_X31_Y22_N12
\count[6]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[6]~44_combout\ = (count(6) & (\count[5]~43\ $ (GND))) # (!count(6) & (!\count[5]~43\ & VCC))
-- \count[6]~45\ = CARRY((count(6) & !\count[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(6),
	datad => VCC,
	cin => \count[5]~43\,
	combout => \count[6]~44_combout\,
	cout => \count[6]~45\);

-- Location: FF_X30_Y21_N13
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \count[6]~44_combout\,
	sclr => \LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: LCCOMB_X31_Y22_N14
\count[7]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[7]~46_combout\ = (count(7) & (!\count[6]~45\)) # (!count(7) & ((\count[6]~45\) # (GND)))
-- \count[7]~47\ = CARRY((!\count[6]~45\) # (!count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(7),
	datad => VCC,
	cin => \count[6]~45\,
	combout => \count[7]~46_combout\,
	cout => \count[7]~47\);

-- Location: FF_X30_Y21_N19
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \count[7]~46_combout\,
	sclr => \LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LCCOMB_X31_Y22_N16
\count[8]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[8]~48_combout\ = (count(8) & (\count[7]~47\ $ (GND))) # (!count(8) & (!\count[7]~47\ & VCC))
-- \count[8]~49\ = CARRY((count(8) & !\count[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(8),
	datad => VCC,
	cin => \count[7]~47\,
	combout => \count[8]~48_combout\,
	cout => \count[8]~49\);

-- Location: FF_X31_Y22_N17
\count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[8]~48_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(8));

-- Location: LCCOMB_X31_Y22_N18
\count[9]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[9]~50_combout\ = (count(9) & (!\count[8]~49\)) # (!count(9) & ((\count[8]~49\) # (GND)))
-- \count[9]~51\ = CARRY((!\count[8]~49\) # (!count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(9),
	datad => VCC,
	cin => \count[8]~49\,
	combout => \count[9]~50_combout\,
	cout => \count[9]~51\);

-- Location: FF_X30_Y21_N21
\count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \count[9]~50_combout\,
	sclr => \LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(9));

-- Location: LCCOMB_X31_Y22_N20
\count[10]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[10]~52_combout\ = (count(10) & (\count[9]~51\ $ (GND))) # (!count(10) & (!\count[9]~51\ & VCC))
-- \count[10]~53\ = CARRY((count(10) & !\count[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(10),
	datad => VCC,
	cin => \count[9]~51\,
	combout => \count[10]~52_combout\,
	cout => \count[10]~53\);

-- Location: FF_X30_Y21_N3
\count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \count[10]~52_combout\,
	sclr => \LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(10));

-- Location: LCCOMB_X31_Y22_N22
\count[11]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[11]~54_combout\ = (count(11) & (!\count[10]~53\)) # (!count(11) & ((\count[10]~53\) # (GND)))
-- \count[11]~55\ = CARRY((!\count[10]~53\) # (!count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(11),
	datad => VCC,
	cin => \count[10]~53\,
	combout => \count[11]~54_combout\,
	cout => \count[11]~55\);

-- Location: FF_X31_Y22_N23
\count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[11]~54_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(11));

-- Location: LCCOMB_X31_Y22_N24
\count[12]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[12]~56_combout\ = (count(12) & (\count[11]~55\ $ (GND))) # (!count(12) & (!\count[11]~55\ & VCC))
-- \count[12]~57\ = CARRY((count(12) & !\count[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(12),
	datad => VCC,
	cin => \count[11]~55\,
	combout => \count[12]~56_combout\,
	cout => \count[12]~57\);

-- Location: FF_X31_Y22_N25
\count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[12]~56_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(12));

-- Location: LCCOMB_X31_Y22_N26
\count[13]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[13]~58_combout\ = (count(13) & (!\count[12]~57\)) # (!count(13) & ((\count[12]~57\) # (GND)))
-- \count[13]~59\ = CARRY((!\count[12]~57\) # (!count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(13),
	datad => VCC,
	cin => \count[12]~57\,
	combout => \count[13]~58_combout\,
	cout => \count[13]~59\);

-- Location: FF_X31_Y22_N27
\count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[13]~58_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(13));

-- Location: LCCOMB_X31_Y22_N28
\count[14]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[14]~60_combout\ = (count(14) & (\count[13]~59\ $ (GND))) # (!count(14) & (!\count[13]~59\ & VCC))
-- \count[14]~61\ = CARRY((count(14) & !\count[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(14),
	datad => VCC,
	cin => \count[13]~59\,
	combout => \count[14]~60_combout\,
	cout => \count[14]~61\);

-- Location: FF_X31_Y22_N29
\count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[14]~60_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(14));

-- Location: LCCOMB_X31_Y22_N30
\count[15]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[15]~62_combout\ = (count(15) & (!\count[14]~61\)) # (!count(15) & ((\count[14]~61\) # (GND)))
-- \count[15]~63\ = CARRY((!\count[14]~61\) # (!count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(15),
	datad => VCC,
	cin => \count[14]~61\,
	combout => \count[15]~62_combout\,
	cout => \count[15]~63\);

-- Location: FF_X31_Y22_N31
\count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[15]~62_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(15));

-- Location: LCCOMB_X31_Y21_N0
\count[16]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[16]~64_combout\ = (count(16) & (\count[15]~63\ $ (GND))) # (!count(16) & (!\count[15]~63\ & VCC))
-- \count[16]~65\ = CARRY((count(16) & !\count[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(16),
	datad => VCC,
	cin => \count[15]~63\,
	combout => \count[16]~64_combout\,
	cout => \count[16]~65\);

-- Location: FF_X31_Y21_N1
\count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[16]~64_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(16));

-- Location: LCCOMB_X31_Y21_N2
\count[17]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[17]~66_combout\ = (count(17) & (!\count[16]~65\)) # (!count(17) & ((\count[16]~65\) # (GND)))
-- \count[17]~67\ = CARRY((!\count[16]~65\) # (!count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(17),
	datad => VCC,
	cin => \count[16]~65\,
	combout => \count[17]~66_combout\,
	cout => \count[17]~67\);

-- Location: FF_X31_Y21_N3
\count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[17]~66_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(17));

-- Location: LCCOMB_X31_Y21_N4
\count[18]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[18]~68_combout\ = (count(18) & (\count[17]~67\ $ (GND))) # (!count(18) & (!\count[17]~67\ & VCC))
-- \count[18]~69\ = CARRY((count(18) & !\count[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(18),
	datad => VCC,
	cin => \count[17]~67\,
	combout => \count[18]~68_combout\,
	cout => \count[18]~69\);

-- Location: FF_X31_Y21_N5
\count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[18]~68_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(18));

-- Location: LCCOMB_X31_Y21_N6
\count[19]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[19]~70_combout\ = (count(19) & (!\count[18]~69\)) # (!count(19) & ((\count[18]~69\) # (GND)))
-- \count[19]~71\ = CARRY((!\count[18]~69\) # (!count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(19),
	datad => VCC,
	cin => \count[18]~69\,
	combout => \count[19]~70_combout\,
	cout => \count[19]~71\);

-- Location: FF_X31_Y21_N7
\count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[19]~70_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(19));

-- Location: LCCOMB_X31_Y21_N8
\count[20]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[20]~72_combout\ = (count(20) & (\count[19]~71\ $ (GND))) # (!count(20) & (!\count[19]~71\ & VCC))
-- \count[20]~73\ = CARRY((count(20) & !\count[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(20),
	datad => VCC,
	cin => \count[19]~71\,
	combout => \count[20]~72_combout\,
	cout => \count[20]~73\);

-- Location: FF_X31_Y21_N9
\count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[20]~72_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(20));

-- Location: LCCOMB_X31_Y21_N10
\count[21]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[21]~74_combout\ = (count(21) & (!\count[20]~73\)) # (!count(21) & ((\count[20]~73\) # (GND)))
-- \count[21]~75\ = CARRY((!\count[20]~73\) # (!count(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(21),
	datad => VCC,
	cin => \count[20]~73\,
	combout => \count[21]~74_combout\,
	cout => \count[21]~75\);

-- Location: FF_X31_Y21_N11
\count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[21]~74_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(21));

-- Location: LCCOMB_X31_Y21_N12
\count[22]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[22]~76_combout\ = (count(22) & (\count[21]~75\ $ (GND))) # (!count(22) & (!\count[21]~75\ & VCC))
-- \count[22]~77\ = CARRY((count(22) & !\count[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(22),
	datad => VCC,
	cin => \count[21]~75\,
	combout => \count[22]~76_combout\,
	cout => \count[22]~77\);

-- Location: FF_X31_Y21_N13
\count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[22]~76_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(22));

-- Location: LCCOMB_X31_Y21_N14
\count[23]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[23]~78_combout\ = (count(23) & (!\count[22]~77\)) # (!count(23) & ((\count[22]~77\) # (GND)))
-- \count[23]~79\ = CARRY((!\count[22]~77\) # (!count(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(23),
	datad => VCC,
	cin => \count[22]~77\,
	combout => \count[23]~78_combout\,
	cout => \count[23]~79\);

-- Location: FF_X31_Y21_N15
\count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[23]~78_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(23));

-- Location: LCCOMB_X31_Y21_N16
\count[24]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[24]~80_combout\ = (count(24) & (\count[23]~79\ $ (GND))) # (!count(24) & (!\count[23]~79\ & VCC))
-- \count[24]~81\ = CARRY((count(24) & !\count[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(24),
	datad => VCC,
	cin => \count[23]~79\,
	combout => \count[24]~80_combout\,
	cout => \count[24]~81\);

-- Location: FF_X31_Y21_N17
\count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[24]~80_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(24));

-- Location: LCCOMB_X31_Y21_N18
\count[25]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[25]~82_combout\ = (count(25) & (!\count[24]~81\)) # (!count(25) & ((\count[24]~81\) # (GND)))
-- \count[25]~83\ = CARRY((!\count[24]~81\) # (!count(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(25),
	datad => VCC,
	cin => \count[24]~81\,
	combout => \count[25]~82_combout\,
	cout => \count[25]~83\);

-- Location: FF_X31_Y21_N19
\count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[25]~82_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(25));

-- Location: LCCOMB_X31_Y21_N20
\count[26]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[26]~84_combout\ = (count(26) & (\count[25]~83\ $ (GND))) # (!count(26) & (!\count[25]~83\ & VCC))
-- \count[26]~85\ = CARRY((count(26) & !\count[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(26),
	datad => VCC,
	cin => \count[25]~83\,
	combout => \count[26]~84_combout\,
	cout => \count[26]~85\);

-- Location: FF_X31_Y21_N21
\count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[26]~84_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(26));

-- Location: LCCOMB_X31_Y21_N22
\count[27]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[27]~86_combout\ = (count(27) & (!\count[26]~85\)) # (!count(27) & ((\count[26]~85\) # (GND)))
-- \count[27]~87\ = CARRY((!\count[26]~85\) # (!count(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(27),
	datad => VCC,
	cin => \count[26]~85\,
	combout => \count[27]~86_combout\,
	cout => \count[27]~87\);

-- Location: FF_X31_Y21_N23
\count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[27]~86_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(27));

-- Location: LCCOMB_X31_Y21_N24
\count[28]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[28]~88_combout\ = (count(28) & (\count[27]~87\ $ (GND))) # (!count(28) & (!\count[27]~87\ & VCC))
-- \count[28]~89\ = CARRY((count(28) & !\count[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(28),
	datad => VCC,
	cin => \count[27]~87\,
	combout => \count[28]~88_combout\,
	cout => \count[28]~89\);

-- Location: FF_X31_Y21_N25
\count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[28]~88_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(28));

-- Location: LCCOMB_X31_Y21_N26
\count[29]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[29]~90_combout\ = (count(29) & (!\count[28]~89\)) # (!count(29) & ((\count[28]~89\) # (GND)))
-- \count[29]~91\ = CARRY((!\count[28]~89\) # (!count(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(29),
	datad => VCC,
	cin => \count[28]~89\,
	combout => \count[29]~90_combout\,
	cout => \count[29]~91\);

-- Location: FF_X31_Y21_N27
\count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[29]~90_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(29));

-- Location: LCCOMB_X31_Y21_N28
\count[30]~92\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[30]~92_combout\ = (count(30) & (\count[29]~91\ $ (GND))) # (!count(30) & (!\count[29]~91\ & VCC))
-- \count[30]~93\ = CARRY((count(30) & !\count[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(30),
	datad => VCC,
	cin => \count[29]~91\,
	combout => \count[30]~92_combout\,
	cout => \count[30]~93\);

-- Location: FF_X31_Y21_N29
\count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[30]~92_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(30));

-- Location: LCCOMB_X31_Y21_N30
\count[31]~94\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[31]~94_combout\ = count(31) $ (\count[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => count(31),
	cin => \count[30]~93\,
	combout => \count[31]~94_combout\);

-- Location: FF_X31_Y21_N31
\count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[31]~94_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(31));

-- Location: LCCOMB_X30_Y21_N22
\LessThan0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (!count(27) & (!count(25) & (!count(26) & !count(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(27),
	datab => count(25),
	datac => count(26),
	datad => count(24),
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X30_Y21_N28
\LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = (\LessThan0~6_combout\ & (!count(28) & (!count(29) & !count(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~6_combout\,
	datab => count(28),
	datac => count(29),
	datad => count(30),
	combout => \LessThan0~7_combout\);

-- Location: LCCOMB_X30_Y21_N4
\LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!count(23) & (!count(20) & (!count(22) & !count(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(23),
	datab => count(20),
	datac => count(22),
	datad => count(21),
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X30_Y21_N12
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ((!count(8) & (!count(6) & !count(7)))) # (!count(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(9),
	datab => count(8),
	datac => count(6),
	datad => count(7),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X30_Y21_N0
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (((!count(15) & !count(14))) # (!count(16))) # (!count(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(17),
	datab => count(15),
	datac => count(16),
	datad => count(14),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X30_Y21_N2
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!count(12) & (!count(11) & (!count(10) & !count(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(12),
	datab => count(11),
	datac => count(10),
	datad => count(13),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X30_Y21_N6
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\LessThan0~0_combout\) # ((\LessThan0~1_combout\ & (!count(15) & \LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~1_combout\,
	datab => \LessThan0~0_combout\,
	datac => count(15),
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X30_Y21_N20
\LessThan0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ((\LessThan0~3_combout\) # (!count(19))) # (!count(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(18),
	datab => count(19),
	datad => \LessThan0~3_combout\,
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X30_Y21_N10
\LessThan0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (!count(31) & (((!\LessThan0~4_combout\) # (!\LessThan0~5_combout\)) # (!\LessThan0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(31),
	datab => \LessThan0~7_combout\,
	datac => \LessThan0~5_combout\,
	datad => \LessThan0~4_combout\,
	combout => \LessThan0~8_combout\);

-- Location: LCCOMB_X29_Y20_N28
\Add10~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~28_combout\ = (bg_hstart(14) & ((GND) # (!\Add10~27\))) # (!bg_hstart(14) & (\Add10~27\ $ (GND)))
-- \Add10~29\ = CARRY((bg_hstart(14)) # (!\Add10~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(14),
	datad => VCC,
	cin => \Add10~27\,
	combout => \Add10~28_combout\,
	cout => \Add10~29\);

-- Location: LCCOMB_X29_Y20_N30
\Add10~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~30_combout\ = (bg_hstart(15) & (\Add10~29\ & VCC)) # (!bg_hstart(15) & (!\Add10~29\))
-- \Add10~31\ = CARRY((!bg_hstart(15) & !\Add10~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(15),
	datad => VCC,
	cin => \Add10~29\,
	combout => \Add10~30_combout\,
	cout => \Add10~31\);

-- Location: LCCOMB_X29_Y21_N4
\bg_hstart~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~20_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~30_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(15),
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~24_combout\,
	datad => \Add10~30_combout\,
	combout => \bg_hstart~20_combout\);

-- Location: LCCOMB_X29_Y21_N6
\bg_hstart[15]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[15]~feeder_combout\ = \bg_hstart~20_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstart~20_combout\,
	combout => \bg_hstart[15]~feeder_combout\);

-- Location: FF_X29_Y21_N7
\bg_hstart[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(15));

-- Location: LCCOMB_X29_Y19_N0
\Add10~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~32_combout\ = (bg_hstart(16) & ((GND) # (!\Add10~31\))) # (!bg_hstart(16) & (\Add10~31\ $ (GND)))
-- \Add10~33\ = CARRY((bg_hstart(16)) # (!\Add10~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(16),
	datad => VCC,
	cin => \Add10~31\,
	combout => \Add10~32_combout\,
	cout => \Add10~33\);

-- Location: LCCOMB_X29_Y21_N10
\bg_hstart~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~19_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~32_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(16),
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~24_combout\,
	datad => \Add10~32_combout\,
	combout => \bg_hstart~19_combout\);

-- Location: LCCOMB_X29_Y21_N12
\bg_hstart[16]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[16]~feeder_combout\ = \bg_hstart~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~19_combout\,
	combout => \bg_hstart[16]~feeder_combout\);

-- Location: FF_X29_Y21_N13
\bg_hstart[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[16]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(16));

-- Location: LCCOMB_X29_Y19_N2
\Add10~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~34_combout\ = (bg_hstart(17) & (\Add10~33\ & VCC)) # (!bg_hstart(17) & (!\Add10~33\))
-- \Add10~35\ = CARRY((!bg_hstart(17) & !\Add10~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(17),
	datad => VCC,
	cin => \Add10~33\,
	combout => \Add10~34_combout\,
	cout => \Add10~35\);

-- Location: LCCOMB_X31_Y19_N0
\bg_hstart~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~18_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~34_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(17),
	datac => \Add10~34_combout\,
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~18_combout\);

-- Location: FF_X31_Y19_N19
\bg_hstart[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~18_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(17));

-- Location: LCCOMB_X29_Y19_N4
\Add10~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~36_combout\ = (bg_hstart(18) & ((GND) # (!\Add10~35\))) # (!bg_hstart(18) & (\Add10~35\ $ (GND)))
-- \Add10~37\ = CARRY((bg_hstart(18)) # (!\Add10~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(18),
	datad => VCC,
	cin => \Add10~35\,
	combout => \Add10~36_combout\,
	cout => \Add10~37\);

-- Location: LCCOMB_X31_Y19_N20
\bg_hstart~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~17_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~36_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~36_combout\,
	datac => bg_hstart(18),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~17_combout\);

-- Location: FF_X31_Y19_N21
\bg_hstart[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(18));

-- Location: LCCOMB_X29_Y19_N6
\Add10~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~38_combout\ = (bg_hstart(19) & (\Add10~37\ & VCC)) # (!bg_hstart(19) & (!\Add10~37\))
-- \Add10~39\ = CARRY((!bg_hstart(19) & !\Add10~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(19),
	datad => VCC,
	cin => \Add10~37\,
	combout => \Add10~38_combout\,
	cout => \Add10~39\);

-- Location: LCCOMB_X31_Y19_N14
\bg_hstart~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~16_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~38_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(19))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~38_combout\,
	datac => bg_hstart(19),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~16_combout\);

-- Location: FF_X31_Y19_N15
\bg_hstart[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(19));

-- Location: LCCOMB_X29_Y19_N8
\Add10~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~40_combout\ = (bg_hstart(20) & ((GND) # (!\Add10~39\))) # (!bg_hstart(20) & (\Add10~39\ $ (GND)))
-- \Add10~41\ = CARRY((bg_hstart(20)) # (!\Add10~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(20),
	datad => VCC,
	cin => \Add10~39\,
	combout => \Add10~40_combout\,
	cout => \Add10~41\);

-- Location: LCCOMB_X31_Y19_N4
\bg_hstart~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~15_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~40_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~40_combout\,
	datac => bg_hstart(20),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~15_combout\);

-- Location: FF_X31_Y19_N5
\bg_hstart[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(20));

-- Location: LCCOMB_X29_Y19_N10
\Add10~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~42_combout\ = (bg_hstart(21) & (\Add10~41\ & VCC)) # (!bg_hstart(21) & (!\Add10~41\))
-- \Add10~43\ = CARRY((!bg_hstart(21) & !\Add10~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(21),
	datad => VCC,
	cin => \Add10~41\,
	combout => \Add10~42_combout\,
	cout => \Add10~43\);

-- Location: LCCOMB_X31_Y19_N2
\bg_hstart~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~14_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~42_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~42_combout\,
	datac => bg_hstart(21),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~14_combout\);

-- Location: FF_X31_Y19_N3
\bg_hstart[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(21));

-- Location: LCCOMB_X29_Y19_N12
\Add10~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~44_combout\ = (bg_hstart(22) & ((GND) # (!\Add10~43\))) # (!bg_hstart(22) & (\Add10~43\ $ (GND)))
-- \Add10~45\ = CARRY((bg_hstart(22)) # (!\Add10~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(22),
	datad => VCC,
	cin => \Add10~43\,
	combout => \Add10~44_combout\,
	cout => \Add10~45\);

-- Location: LCCOMB_X31_Y19_N8
\bg_hstart~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~13_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~44_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(22))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~44_combout\,
	datac => bg_hstart(22),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~13_combout\);

-- Location: FF_X31_Y19_N9
\bg_hstart[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(22));

-- Location: LCCOMB_X29_Y19_N14
\Add10~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~46_combout\ = (bg_hstart(23) & (\Add10~45\ & VCC)) # (!bg_hstart(23) & (!\Add10~45\))
-- \Add10~47\ = CARRY((!bg_hstart(23) & !\Add10~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(23),
	datad => VCC,
	cin => \Add10~45\,
	combout => \Add10~46_combout\,
	cout => \Add10~47\);

-- Location: LCCOMB_X32_Y19_N26
\bg_hstart~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~12_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~46_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan1~24_combout\,
	datac => bg_hstart(23),
	datad => \Add10~46_combout\,
	combout => \bg_hstart~12_combout\);

-- Location: FF_X32_Y19_N27
\bg_hstart[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(23));

-- Location: LCCOMB_X29_Y19_N16
\Add10~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~48_combout\ = (bg_hstart(24) & ((GND) # (!\Add10~47\))) # (!bg_hstart(24) & (\Add10~47\ $ (GND)))
-- \Add10~49\ = CARRY((bg_hstart(24)) # (!\Add10~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(24),
	datad => VCC,
	cin => \Add10~47\,
	combout => \Add10~48_combout\,
	cout => \Add10~49\);

-- Location: LCCOMB_X32_Y19_N16
\bg_hstart~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~11_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~48_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(24),
	datac => \LessThan1~24_combout\,
	datad => \Add10~48_combout\,
	combout => \bg_hstart~11_combout\);

-- Location: FF_X32_Y19_N25
\bg_hstart[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~11_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(24));

-- Location: LCCOMB_X29_Y19_N18
\Add10~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~50_combout\ = (bg_hstart(25) & (\Add10~49\ & VCC)) # (!bg_hstart(25) & (!\Add10~49\))
-- \Add10~51\ = CARRY((!bg_hstart(25) & !\Add10~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(25),
	datad => VCC,
	cin => \Add10~49\,
	combout => \Add10~50_combout\,
	cout => \Add10~51\);

-- Location: LCCOMB_X32_Y19_N10
\bg_hstart~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~10_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~50_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(25),
	datac => \LessThan1~24_combout\,
	datad => \Add10~50_combout\,
	combout => \bg_hstart~10_combout\);

-- Location: LCCOMB_X32_Y19_N18
\bg_hstart[25]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[25]~feeder_combout\ = \bg_hstart~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~10_combout\,
	combout => \bg_hstart[25]~feeder_combout\);

-- Location: FF_X32_Y19_N19
\bg_hstart[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[25]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(25));

-- Location: LCCOMB_X29_Y19_N20
\Add10~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~52_combout\ = (bg_hstart(26) & ((GND) # (!\Add10~51\))) # (!bg_hstart(26) & (\Add10~51\ $ (GND)))
-- \Add10~53\ = CARRY((bg_hstart(26)) # (!\Add10~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(26),
	datad => VCC,
	cin => \Add10~51\,
	combout => \Add10~52_combout\,
	cout => \Add10~53\);

-- Location: LCCOMB_X32_Y19_N8
\bg_hstart~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~9_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~52_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(26),
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~24_combout\,
	datad => \Add10~52_combout\,
	combout => \bg_hstart~9_combout\);

-- Location: FF_X32_Y19_N1
\bg_hstart[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(26));

-- Location: LCCOMB_X29_Y19_N22
\Add10~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~54_combout\ = (bg_hstart(27) & (\Add10~53\ & VCC)) # (!bg_hstart(27) & (!\Add10~53\))
-- \Add10~55\ = CARRY((!bg_hstart(27) & !\Add10~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(27),
	datad => VCC,
	cin => \Add10~53\,
	combout => \Add10~54_combout\,
	cout => \Add10~55\);

-- Location: LCCOMB_X32_Y19_N6
\bg_hstart~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~8_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~54_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~54_combout\,
	datab => \LessThan1~24_combout\,
	datac => bg_hstart(27),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~8_combout\);

-- Location: FF_X32_Y19_N7
\bg_hstart[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(27));

-- Location: LCCOMB_X29_Y19_N24
\Add10~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~56_combout\ = (bg_hstart(28) & ((GND) # (!\Add10~55\))) # (!bg_hstart(28) & (\Add10~55\ $ (GND)))
-- \Add10~57\ = CARRY((bg_hstart(28)) # (!\Add10~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(28),
	datad => VCC,
	cin => \Add10~55\,
	combout => \Add10~56_combout\,
	cout => \Add10~57\);

-- Location: LCCOMB_X32_Y19_N2
\bg_hstart~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~7_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~56_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~56_combout\,
	datab => bg_hstart(28),
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~7_combout\);

-- Location: LCCOMB_X32_Y19_N4
\bg_hstart[28]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[28]~feeder_combout\ = \bg_hstart~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~7_combout\,
	combout => \bg_hstart[28]~feeder_combout\);

-- Location: FF_X32_Y19_N5
\bg_hstart[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[28]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(28));

-- Location: LCCOMB_X29_Y19_N26
\Add10~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~58_combout\ = (bg_hstart(29) & (\Add10~57\ & VCC)) # (!bg_hstart(29) & (!\Add10~57\))
-- \Add10~59\ = CARRY((!bg_hstart(29) & !\Add10~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(29),
	datad => VCC,
	cin => \Add10~57\,
	combout => \Add10~58_combout\,
	cout => \Add10~59\);

-- Location: LCCOMB_X32_Y19_N30
\bg_hstart~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~34_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~58_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~58_combout\,
	datab => \LessThan1~24_combout\,
	datac => bg_hstart(29),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~34_combout\);

-- Location: FF_X32_Y19_N31
\bg_hstart[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(29));

-- Location: LCCOMB_X29_Y19_N28
\Add10~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~60_combout\ = (bg_hstart(30) & ((GND) # (!\Add10~59\))) # (!bg_hstart(30) & (\Add10~59\ $ (GND)))
-- \Add10~61\ = CARRY((bg_hstart(30)) # (!\Add10~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(30),
	datad => VCC,
	cin => \Add10~59\,
	combout => \Add10~60_combout\,
	cout => \Add10~61\);

-- Location: LCCOMB_X32_Y19_N20
\bg_hstart~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~6_combout\ = (\LessThan0~8_combout\ & (!\Add10~62_combout\ & ((\Add10~60_combout\)))) # (!\LessThan0~8_combout\ & (((bg_hstart(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~62_combout\,
	datac => bg_hstart(30),
	datad => \Add10~60_combout\,
	combout => \bg_hstart~6_combout\);

-- Location: FF_X32_Y19_N21
\bg_hstart[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(30));

-- Location: LCCOMB_X29_Y19_N30
\Add10~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~62_combout\ = !\Add10~61\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add10~61\,
	combout => \Add10~62_combout\);

-- Location: LCCOMB_X30_Y19_N22
\LessThan1~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~22_combout\ = (\LessThan0~8_combout\ & ((\Add10~54_combout\) # ((\Add10~52_combout\) # (\Add10~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~54_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add10~52_combout\,
	datad => \Add10~56_combout\,
	combout => \LessThan1~22_combout\);

-- Location: LCCOMB_X30_Y19_N24
\LessThan1~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~21_combout\ = (\LessThan0~8_combout\ & ((\Add10~46_combout\) # ((\Add10~48_combout\) # (\Add10~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~46_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add10~48_combout\,
	datad => \Add10~50_combout\,
	combout => \LessThan1~21_combout\);

-- Location: LCCOMB_X31_Y19_N22
\LessThan1~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~18_combout\ = (\LessThan0~8_combout\ & ((\Add10~36_combout\) # ((\Add10~34_combout\) # (\Add10~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~36_combout\,
	datac => \Add10~34_combout\,
	datad => \Add10~38_combout\,
	combout => \LessThan1~18_combout\);

-- Location: LCCOMB_X31_Y19_N16
\LessThan1~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~17_combout\ = (\LessThan0~8_combout\ & ((\Add10~32_combout\) # ((\Add10~30_combout\) # (\Add10~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~32_combout\,
	datab => \Add10~30_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add10~28_combout\,
	combout => \LessThan1~17_combout\);

-- Location: LCCOMB_X29_Y20_N0
\Add10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~0_combout\ = bg_hstart(0) $ (VCC)
-- \Add10~1\ = CARRY(bg_hstart(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(0),
	datad => VCC,
	combout => \Add10~0_combout\,
	cout => \Add10~1\);

-- Location: LCCOMB_X32_Y21_N0
\bg_hstart~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~33_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~0_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(0),
	datab => \Add10~0_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~33_combout\);

-- Location: FF_X29_Y20_N5
\bg_hstart[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~33_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(0));

-- Location: LCCOMB_X29_Y20_N2
\Add10~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~2_combout\ = (bg_hstart(1) & (\Add10~1\ & VCC)) # (!bg_hstart(1) & (!\Add10~1\))
-- \Add10~3\ = CARRY((!bg_hstart(1) & !\Add10~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(1),
	datad => VCC,
	cin => \Add10~1\,
	combout => \Add10~2_combout\,
	cout => \Add10~3\);

-- Location: LCCOMB_X30_Y19_N14
\bg_hstart~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~32_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~2_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(1),
	datab => \LessThan0~8_combout\,
	datac => \Add10~2_combout\,
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~32_combout\);

-- Location: FF_X29_Y20_N3
\bg_hstart[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~32_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(1));

-- Location: LCCOMB_X29_Y20_N4
\Add10~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~4_combout\ = (bg_hstart(2) & ((GND) # (!\Add10~3\))) # (!bg_hstart(2) & (\Add10~3\ $ (GND)))
-- \Add10~5\ = CARRY((bg_hstart(2)) # (!\Add10~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(2),
	datad => VCC,
	cin => \Add10~3\,
	combout => \Add10~4_combout\,
	cout => \Add10~5\);

-- Location: LCCOMB_X30_Y19_N28
\bg_hstart~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~31_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~4_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~24_combout\,
	datab => \Add10~4_combout\,
	datac => bg_hstart(2),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~31_combout\);

-- Location: FF_X29_Y20_N25
\bg_hstart[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~31_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(2));

-- Location: LCCOMB_X29_Y20_N6
\Add10~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~6_combout\ = (bg_hstart(3) & (\Add10~5\ & VCC)) # (!bg_hstart(3) & (!\Add10~5\))
-- \Add10~7\ = CARRY((!bg_hstart(3) & !\Add10~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(3),
	datad => VCC,
	cin => \Add10~5\,
	combout => \Add10~6_combout\,
	cout => \Add10~7\);

-- Location: LCCOMB_X30_Y19_N18
\bg_hstart~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~30_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~6_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(3),
	datab => \LessThan0~8_combout\,
	datac => \Add10~6_combout\,
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~30_combout\);

-- Location: FF_X29_Y20_N17
\bg_hstart[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~30_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(3));

-- Location: LCCOMB_X29_Y20_N8
\Add10~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~8_combout\ = (bg_hstart(4) & ((GND) # (!\Add10~7\))) # (!bg_hstart(4) & (\Add10~7\ $ (GND)))
-- \Add10~9\ = CARRY((bg_hstart(4)) # (!\Add10~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datad => VCC,
	cin => \Add10~7\,
	combout => \Add10~8_combout\,
	cout => \Add10~9\);

-- Location: LCCOMB_X30_Y19_N4
\bg_hstart~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~29_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~8_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datab => \LessThan0~8_combout\,
	datac => \Add10~8_combout\,
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~29_combout\);

-- Location: FF_X29_Y20_N27
\bg_hstart[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~29_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(4));

-- Location: LCCOMB_X29_Y20_N10
\Add10~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~10_combout\ = (bg_hstart(5) & (\Add10~9\ & VCC)) # (!bg_hstart(5) & (!\Add10~9\))
-- \Add10~11\ = CARRY((!bg_hstart(5) & !\Add10~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(5),
	datad => VCC,
	cin => \Add10~9\,
	combout => \Add10~10_combout\,
	cout => \Add10~11\);

-- Location: LCCOMB_X30_Y21_N16
\bg_hstart~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~28_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~10_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~10_combout\,
	datac => bg_hstart(5),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~28_combout\);

-- Location: FF_X30_Y21_N17
\bg_hstart[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(5));

-- Location: LCCOMB_X29_Y20_N12
\Add10~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~12_combout\ = (bg_hstart(6) & ((GND) # (!\Add10~11\))) # (!bg_hstart(6) & (\Add10~11\ $ (GND)))
-- \Add10~13\ = CARRY((bg_hstart(6)) # (!\Add10~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(6),
	datad => VCC,
	cin => \Add10~11\,
	combout => \Add10~12_combout\,
	cout => \Add10~13\);

-- Location: LCCOMB_X30_Y21_N30
\bg_hstart~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~36_combout\ = ((\LessThan0~8_combout\ & (\Add10~12_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(6))))) # (!\LessThan1~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~12_combout\,
	datac => bg_hstart(6),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~36_combout\);

-- Location: FF_X30_Y21_N31
\bg_hstart[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(6));

-- Location: LCCOMB_X29_Y20_N14
\Add10~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~14_combout\ = (bg_hstart(7) & (\Add10~13\ & VCC)) # (!bg_hstart(7) & (!\Add10~13\))
-- \Add10~15\ = CARRY((!bg_hstart(7) & !\Add10~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(7),
	datad => VCC,
	cin => \Add10~13\,
	combout => \Add10~14_combout\,
	cout => \Add10~15\);

-- Location: LCCOMB_X30_Y19_N8
\bg_hstart~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~27_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~14_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~24_combout\,
	datab => \Add10~14_combout\,
	datac => bg_hstart(7),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~27_combout\);

-- Location: FF_X30_Y19_N9
\bg_hstart[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(7));

-- Location: LCCOMB_X29_Y20_N16
\Add10~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~16_combout\ = (bg_hstart(8) & ((GND) # (!\Add10~15\))) # (!bg_hstart(8) & (\Add10~15\ $ (GND)))
-- \Add10~17\ = CARRY((bg_hstart(8)) # (!\Add10~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(8),
	datad => VCC,
	cin => \Add10~15\,
	combout => \Add10~16_combout\,
	cout => \Add10~17\);

-- Location: LCCOMB_X30_Y21_N24
\bg_hstart~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~35_combout\ = ((\LessThan0~8_combout\ & (\Add10~16_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(8))))) # (!\LessThan1~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~16_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(8),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~35_combout\);

-- Location: FF_X30_Y21_N25
\bg_hstart[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(8));

-- Location: LCCOMB_X29_Y20_N18
\Add10~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~18_combout\ = (bg_hstart(9) & (\Add10~17\ & VCC)) # (!bg_hstart(9) & (!\Add10~17\))
-- \Add10~19\ = CARRY((!bg_hstart(9) & !\Add10~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(9),
	datad => VCC,
	cin => \Add10~17\,
	combout => \Add10~18_combout\,
	cout => \Add10~19\);

-- Location: LCCOMB_X32_Y19_N14
\bg_hstart~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~26_combout\ = ((\LessThan0~8_combout\ & (\Add10~18_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(9))))) # (!\LessThan1~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~18_combout\,
	datac => \LessThan1~24_combout\,
	datad => bg_hstart(9),
	combout => \bg_hstart~26_combout\);

-- Location: LCCOMB_X32_Y19_N28
\bg_hstart[9]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[9]~feeder_combout\ = \bg_hstart~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstart~26_combout\,
	combout => \bg_hstart[9]~feeder_combout\);

-- Location: FF_X32_Y19_N29
\bg_hstart[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(9));

-- Location: LCCOMB_X29_Y20_N20
\Add10~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~20_combout\ = (bg_hstart(10) & ((GND) # (!\Add10~19\))) # (!bg_hstart(10) & (\Add10~19\ $ (GND)))
-- \Add10~21\ = CARRY((bg_hstart(10)) # (!\Add10~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(10),
	datad => VCC,
	cin => \Add10~19\,
	combout => \Add10~20_combout\,
	cout => \Add10~21\);

-- Location: LCCOMB_X31_Y19_N6
\bg_hstart~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~25_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~20_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~24_combout\,
	datab => bg_hstart(10),
	datac => \LessThan0~8_combout\,
	datad => \Add10~20_combout\,
	combout => \bg_hstart~25_combout\);

-- Location: FF_X31_Y19_N29
\bg_hstart[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~25_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(10));

-- Location: LCCOMB_X29_Y20_N22
\Add10~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~22_combout\ = (bg_hstart(11) & (\Add10~21\ & VCC)) # (!bg_hstart(11) & (!\Add10~21\))
-- \Add10~23\ = CARRY((!bg_hstart(11) & !\Add10~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datad => VCC,
	cin => \Add10~21\,
	combout => \Add10~22_combout\,
	cout => \Add10~23\);

-- Location: LCCOMB_X31_Y19_N26
\bg_hstart~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~24_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~22_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~22_combout\,
	datac => bg_hstart(11),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~24_combout\);

-- Location: FF_X31_Y19_N27
\bg_hstart[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(11));

-- Location: LCCOMB_X29_Y20_N24
\Add10~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~24_combout\ = (bg_hstart(12) & ((GND) # (!\Add10~23\))) # (!bg_hstart(12) & (\Add10~23\ $ (GND)))
-- \Add10~25\ = CARRY((bg_hstart(12)) # (!\Add10~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(12),
	datad => VCC,
	cin => \Add10~23\,
	combout => \Add10~24_combout\,
	cout => \Add10~25\);

-- Location: LCCOMB_X31_Y19_N24
\bg_hstart~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~23_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~24_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~24_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(12),
	datad => \LessThan1~24_combout\,
	combout => \bg_hstart~23_combout\);

-- Location: FF_X31_Y19_N25
\bg_hstart[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(12));

-- Location: LCCOMB_X29_Y20_N26
\Add10~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~26_combout\ = (bg_hstart(13) & (\Add10~25\ & VCC)) # (!bg_hstart(13) & (!\Add10~25\))
-- \Add10~27\ = CARRY((!bg_hstart(13) & !\Add10~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(13),
	datad => VCC,
	cin => \Add10~25\,
	combout => \Add10~26_combout\,
	cout => \Add10~27\);

-- Location: LCCOMB_X31_Y19_N30
\LessThan1~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~16_combout\ = (\LessThan0~8_combout\ & ((\Add10~26_combout\) # ((\Add10~22_combout\) # (\Add10~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~26_combout\,
	datab => \Add10~22_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add10~24_combout\,
	combout => \LessThan1~16_combout\);

-- Location: LCCOMB_X31_Y19_N12
\LessThan1~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~19_combout\ = (\LessThan0~8_combout\ & ((\Add10~44_combout\) # ((\Add10~42_combout\) # (\Add10~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~44_combout\,
	datac => \Add10~42_combout\,
	datad => \Add10~40_combout\,
	combout => \LessThan1~19_combout\);

-- Location: LCCOMB_X31_Y19_N10
\LessThan1~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~20_combout\ = (\LessThan1~18_combout\) # ((\LessThan1~17_combout\) # ((\LessThan1~16_combout\) # (\LessThan1~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~18_combout\,
	datab => \LessThan1~17_combout\,
	datac => \LessThan1~16_combout\,
	datad => \LessThan1~19_combout\,
	combout => \LessThan1~20_combout\);

-- Location: LCCOMB_X30_Y21_N18
\Add10~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~64_combout\ = (\LessThan0~8_combout\ & ((\Add10~16_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(8),
	datad => \Add10~16_combout\,
	combout => \Add10~64_combout\);

-- Location: LCCOMB_X29_Y21_N20
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (bg_hstart(16)) # ((bg_hstart(14)) # ((bg_hstart(13)) # (bg_hstart(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(16),
	datab => bg_hstart(14),
	datac => bg_hstart(13),
	datad => bg_hstart(15),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X31_Y19_N18
\LessThan1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (bg_hstart(19)) # ((bg_hstart(20)) # ((bg_hstart(17)) # (bg_hstart(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(19),
	datab => bg_hstart(20),
	datac => bg_hstart(17),
	datad => bg_hstart(18),
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X32_Y19_N24
\LessThan1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (bg_hstart(23)) # ((bg_hstart(22)) # ((bg_hstart(24)) # (bg_hstart(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(23),
	datab => bg_hstart(22),
	datac => bg_hstart(24),
	datad => bg_hstart(21),
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X31_Y19_N28
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (bg_hstart(11)) # ((bg_hstart(12)) # ((bg_hstart(10)) # (bg_hstart(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datab => bg_hstart(12),
	datac => bg_hstart(10),
	datad => bg_hstart(9),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X32_Y19_N22
\LessThan1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (\LessThan1~1_combout\) # ((\LessThan1~2_combout\) # ((\LessThan1~3_combout\) # (\LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datab => \LessThan1~2_combout\,
	datac => \LessThan1~3_combout\,
	datad => \LessThan1~0_combout\,
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X32_Y19_N0
\LessThan1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (bg_hstart(27)) # ((bg_hstart(28)) # ((bg_hstart(26)) # (bg_hstart(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(27),
	datab => bg_hstart(28),
	datac => bg_hstart(26),
	datad => bg_hstart(25),
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X32_Y19_N12
\LessThan1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = (\LessThan1~4_combout\) # ((bg_hstart(30)) # ((bg_hstart(29)) # (\LessThan1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~4_combout\,
	datab => bg_hstart(30),
	datac => bg_hstart(29),
	datad => \LessThan1~5_combout\,
	combout => \LessThan1~6_combout\);

-- Location: LCCOMB_X30_Y21_N26
\Add10~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~65_combout\ = (\LessThan0~8_combout\ & ((\Add10~12_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(6),
	datac => \Add10~12_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add10~65_combout\);

-- Location: LCCOMB_X30_Y19_N30
\LessThan1~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~9_combout\ = (\Add10~2_combout\) # ((\Add10~0_combout\) # ((\Add10~6_combout\) # (\Add10~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~2_combout\,
	datab => \Add10~0_combout\,
	datac => \Add10~6_combout\,
	datad => \Add10~4_combout\,
	combout => \LessThan1~9_combout\);

-- Location: LCCOMB_X30_Y21_N8
\LessThan1~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = (bg_hstart(2)) # ((bg_hstart(3)) # ((bg_hstart(1)) # (bg_hstart(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(2),
	datab => bg_hstart(3),
	datac => bg_hstart(1),
	datad => bg_hstart(0),
	combout => \LessThan1~7_combout\);

-- Location: LCCOMB_X30_Y21_N14
\LessThan1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = (!\LessThan0~8_combout\ & ((bg_hstart(4)) # ((bg_hstart(5)) # (\LessThan1~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datab => bg_hstart(5),
	datac => \LessThan1~7_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan1~8_combout\);

-- Location: LCCOMB_X30_Y19_N12
\LessThan1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~10_combout\ = (\Add10~65_combout\ & ((\LessThan1~8_combout\) # ((\LessThan0~8_combout\ & \LessThan1~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~65_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~9_combout\,
	datad => \LessThan1~8_combout\,
	combout => \LessThan1~10_combout\);

-- Location: LCCOMB_X30_Y19_N26
\LessThan1~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~11_combout\ = (\LessThan1~6_combout\) # ((\Add10~64_combout\ & ((bg_hstart(7)) # (\LessThan1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~64_combout\,
	datab => bg_hstart(7),
	datac => \LessThan1~6_combout\,
	datad => \LessThan1~10_combout\,
	combout => \LessThan1~11_combout\);

-- Location: LCCOMB_X30_Y19_N0
\LessThan1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~12_combout\ = (\Add10~64_combout\ & ((\Add10~8_combout\) # ((\Add10~10_combout\) # (\LessThan1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~8_combout\,
	datab => \Add10~10_combout\,
	datac => \Add10~64_combout\,
	datad => \LessThan1~10_combout\,
	combout => \LessThan1~12_combout\);

-- Location: LCCOMB_X30_Y19_N2
\LessThan1~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~13_combout\ = (\Add10~65_combout\ & ((\LessThan1~12_combout\) # ((\Add10~16_combout\ & \Add10~14_combout\)))) # (!\Add10~65_combout\ & (\Add10~16_combout\ & (\Add10~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~65_combout\,
	datab => \Add10~16_combout\,
	datac => \Add10~14_combout\,
	datad => \LessThan1~12_combout\,
	combout => \LessThan1~13_combout\);

-- Location: LCCOMB_X30_Y19_N20
\LessThan1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~14_combout\ = (\Add10~20_combout\) # ((\Add10~18_combout\) # (\LessThan1~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~20_combout\,
	datab => \Add10~18_combout\,
	datad => \LessThan1~13_combout\,
	combout => \LessThan1~14_combout\);

-- Location: LCCOMB_X30_Y19_N6
\LessThan1~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~15_combout\ = (\LessThan0~8_combout\ & (((\Add10~60_combout\) # (\LessThan1~14_combout\)))) # (!\LessThan0~8_combout\ & (\LessThan1~11_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~11_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add10~60_combout\,
	datad => \LessThan1~14_combout\,
	combout => \LessThan1~15_combout\);

-- Location: LCCOMB_X30_Y19_N16
\LessThan1~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~23_combout\ = (\LessThan1~22_combout\) # ((\LessThan1~21_combout\) # ((\LessThan1~20_combout\) # (\LessThan1~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~22_combout\,
	datab => \LessThan1~21_combout\,
	datac => \LessThan1~20_combout\,
	datad => \LessThan1~15_combout\,
	combout => \LessThan1~23_combout\);

-- Location: LCCOMB_X30_Y19_N10
\LessThan1~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~24_combout\ = (\LessThan0~8_combout\ & (!\Add10~62_combout\ & ((\Add10~58_combout\) # (\LessThan1~23_combout\)))) # (!\LessThan0~8_combout\ & (((\LessThan1~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~62_combout\,
	datac => \Add10~58_combout\,
	datad => \LessThan1~23_combout\,
	combout => \LessThan1~24_combout\);

-- Location: LCCOMB_X29_Y21_N24
\bg_hstart~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~22_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & ((\Add10~26_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(13),
	datab => \LessThan1~24_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add10~26_combout\,
	combout => \bg_hstart~22_combout\);

-- Location: LCCOMB_X29_Y21_N30
\bg_hstart[13]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[13]~feeder_combout\ = \bg_hstart~22_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~22_combout\,
	combout => \bg_hstart[13]~feeder_combout\);

-- Location: FF_X29_Y21_N31
\bg_hstart[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(13));

-- Location: LCCOMB_X29_Y21_N2
\bg_hstart~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~21_combout\ = (\LessThan1~24_combout\ & ((\LessThan0~8_combout\ & (\Add10~28_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~28_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~24_combout\,
	datad => bg_hstart(14),
	combout => \bg_hstart~21_combout\);

-- Location: LCCOMB_X31_Y20_N0
\Add16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~0_combout\ = (\bg_hstart~33_combout\ & (hposition(0) $ (VCC))) # (!\bg_hstart~33_combout\ & ((hposition(0)) # (GND)))
-- \Add16~1\ = CARRY((hposition(0)) # (!\bg_hstart~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~33_combout\,
	datab => hposition(0),
	datad => VCC,
	combout => \Add16~0_combout\,
	cout => \Add16~1\);

-- Location: LCCOMB_X31_Y20_N2
\Add16~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~2_combout\ = (\bg_hstart~32_combout\ & ((hposition(1) & (!\Add16~1\)) # (!hposition(1) & ((\Add16~1\) # (GND))))) # (!\bg_hstart~32_combout\ & ((hposition(1) & (\Add16~1\ & VCC)) # (!hposition(1) & (!\Add16~1\))))
-- \Add16~3\ = CARRY((\bg_hstart~32_combout\ & ((!\Add16~1\) # (!hposition(1)))) # (!\bg_hstart~32_combout\ & (!hposition(1) & !\Add16~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~32_combout\,
	datab => hposition(1),
	datad => VCC,
	cin => \Add16~1\,
	combout => \Add16~2_combout\,
	cout => \Add16~3\);

-- Location: LCCOMB_X31_Y20_N4
\Add16~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~4_combout\ = ((\bg_hstart~31_combout\ $ (hposition(2) $ (\Add16~3\)))) # (GND)
-- \Add16~5\ = CARRY((\bg_hstart~31_combout\ & (hposition(2) & !\Add16~3\)) # (!\bg_hstart~31_combout\ & ((hposition(2)) # (!\Add16~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~31_combout\,
	datab => hposition(2),
	datad => VCC,
	cin => \Add16~3\,
	combout => \Add16~4_combout\,
	cout => \Add16~5\);

-- Location: LCCOMB_X31_Y20_N6
\Add16~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~6_combout\ = (hposition(3) & ((\bg_hstart~30_combout\ & (!\Add16~5\)) # (!\bg_hstart~30_combout\ & (\Add16~5\ & VCC)))) # (!hposition(3) & ((\bg_hstart~30_combout\ & ((\Add16~5\) # (GND))) # (!\bg_hstart~30_combout\ & (!\Add16~5\))))
-- \Add16~7\ = CARRY((hposition(3) & (\bg_hstart~30_combout\ & !\Add16~5\)) # (!hposition(3) & ((\bg_hstart~30_combout\) # (!\Add16~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \bg_hstart~30_combout\,
	datad => VCC,
	cin => \Add16~5\,
	combout => \Add16~6_combout\,
	cout => \Add16~7\);

-- Location: LCCOMB_X31_Y20_N8
\Add16~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~8_combout\ = ((\bg_hstart~29_combout\ $ (hposition(4) $ (\Add16~7\)))) # (GND)
-- \Add16~9\ = CARRY((\bg_hstart~29_combout\ & (hposition(4) & !\Add16~7\)) # (!\bg_hstart~29_combout\ & ((hposition(4)) # (!\Add16~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~29_combout\,
	datab => hposition(4),
	datad => VCC,
	cin => \Add16~7\,
	combout => \Add16~8_combout\,
	cout => \Add16~9\);

-- Location: LCCOMB_X31_Y20_N10
\Add16~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~10_combout\ = (hposition(5) & ((\bg_hstart~28_combout\ & (!\Add16~9\)) # (!\bg_hstart~28_combout\ & (\Add16~9\ & VCC)))) # (!hposition(5) & ((\bg_hstart~28_combout\ & ((\Add16~9\) # (GND))) # (!\bg_hstart~28_combout\ & (!\Add16~9\))))
-- \Add16~11\ = CARRY((hposition(5) & (\bg_hstart~28_combout\ & !\Add16~9\)) # (!hposition(5) & ((\bg_hstart~28_combout\) # (!\Add16~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datab => \bg_hstart~28_combout\,
	datad => VCC,
	cin => \Add16~9\,
	combout => \Add16~10_combout\,
	cout => \Add16~11\);

-- Location: LCCOMB_X31_Y20_N12
\Add16~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~12_combout\ = ((\bg_hstart~36_combout\ $ (hposition(6) $ (\Add16~11\)))) # (GND)
-- \Add16~13\ = CARRY((\bg_hstart~36_combout\ & (hposition(6) & !\Add16~11\)) # (!\bg_hstart~36_combout\ & ((hposition(6)) # (!\Add16~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~36_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \Add16~11\,
	combout => \Add16~12_combout\,
	cout => \Add16~13\);

-- Location: LCCOMB_X31_Y20_N14
\Add16~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~14_combout\ = (\bg_hstart~27_combout\ & ((hposition(7) & (!\Add16~13\)) # (!hposition(7) & ((\Add16~13\) # (GND))))) # (!\bg_hstart~27_combout\ & ((hposition(7) & (\Add16~13\ & VCC)) # (!hposition(7) & (!\Add16~13\))))
-- \Add16~15\ = CARRY((\bg_hstart~27_combout\ & ((!\Add16~13\) # (!hposition(7)))) # (!\bg_hstart~27_combout\ & (!hposition(7) & !\Add16~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~27_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \Add16~13\,
	combout => \Add16~14_combout\,
	cout => \Add16~15\);

-- Location: LCCOMB_X31_Y20_N16
\Add16~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~16_combout\ = ((\bg_hstart~35_combout\ $ (hposition(8) $ (\Add16~15\)))) # (GND)
-- \Add16~17\ = CARRY((\bg_hstart~35_combout\ & (hposition(8) & !\Add16~15\)) # (!\bg_hstart~35_combout\ & ((hposition(8)) # (!\Add16~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~35_combout\,
	datab => hposition(8),
	datad => VCC,
	cin => \Add16~15\,
	combout => \Add16~16_combout\,
	cout => \Add16~17\);

-- Location: LCCOMB_X31_Y20_N18
\Add16~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~18_combout\ = (\bg_hstart~26_combout\ & ((hposition(9) & (!\Add16~17\)) # (!hposition(9) & ((\Add16~17\) # (GND))))) # (!\bg_hstart~26_combout\ & ((hposition(9) & (\Add16~17\ & VCC)) # (!hposition(9) & (!\Add16~17\))))
-- \Add16~19\ = CARRY((\bg_hstart~26_combout\ & ((!\Add16~17\) # (!hposition(9)))) # (!\bg_hstart~26_combout\ & (!hposition(9) & !\Add16~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~26_combout\,
	datab => hposition(9),
	datad => VCC,
	cin => \Add16~17\,
	combout => \Add16~18_combout\,
	cout => \Add16~19\);

-- Location: LCCOMB_X31_Y20_N20
\Add16~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~20_combout\ = ((hposition(10) $ (\bg_hstart~25_combout\ $ (\Add16~19\)))) # (GND)
-- \Add16~21\ = CARRY((hposition(10) & ((!\Add16~19\) # (!\bg_hstart~25_combout\))) # (!hposition(10) & (!\bg_hstart~25_combout\ & !\Add16~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \bg_hstart~25_combout\,
	datad => VCC,
	cin => \Add16~19\,
	combout => \Add16~20_combout\,
	cout => \Add16~21\);

-- Location: LCCOMB_X31_Y20_N22
\Add16~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~22_combout\ = (\bg_hstart~24_combout\ & ((hposition(11) & (!\Add16~21\)) # (!hposition(11) & ((\Add16~21\) # (GND))))) # (!\bg_hstart~24_combout\ & ((hposition(11) & (\Add16~21\ & VCC)) # (!hposition(11) & (!\Add16~21\))))
-- \Add16~23\ = CARRY((\bg_hstart~24_combout\ & ((!\Add16~21\) # (!hposition(11)))) # (!\bg_hstart~24_combout\ & (!hposition(11) & !\Add16~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~24_combout\,
	datab => hposition(11),
	datad => VCC,
	cin => \Add16~21\,
	combout => \Add16~22_combout\,
	cout => \Add16~23\);

-- Location: LCCOMB_X31_Y20_N24
\Add16~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~24_combout\ = ((hposition(12) $ (\bg_hstart~23_combout\ $ (\Add16~23\)))) # (GND)
-- \Add16~25\ = CARRY((hposition(12) & ((!\Add16~23\) # (!\bg_hstart~23_combout\))) # (!hposition(12) & (!\bg_hstart~23_combout\ & !\Add16~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \bg_hstart~23_combout\,
	datad => VCC,
	cin => \Add16~23\,
	combout => \Add16~24_combout\,
	cout => \Add16~25\);

-- Location: LCCOMB_X31_Y20_N26
\Add16~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~26_combout\ = (\bg_hstart~22_combout\ & ((hposition(13) & (!\Add16~25\)) # (!hposition(13) & ((\Add16~25\) # (GND))))) # (!\bg_hstart~22_combout\ & ((hposition(13) & (\Add16~25\ & VCC)) # (!hposition(13) & (!\Add16~25\))))
-- \Add16~27\ = CARRY((\bg_hstart~22_combout\ & ((!\Add16~25\) # (!hposition(13)))) # (!\bg_hstart~22_combout\ & (!hposition(13) & !\Add16~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~22_combout\,
	datab => hposition(13),
	datad => VCC,
	cin => \Add16~25\,
	combout => \Add16~26_combout\,
	cout => \Add16~27\);

-- Location: LCCOMB_X31_Y20_N28
\Add16~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add16~28_combout\ = hposition(14) $ (\Add16~27\ $ (\bg_hstart~21_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datad => \bg_hstart~21_combout\,
	cin => \Add16~27\,
	combout => \Add16~28_combout\);

-- Location: LCCOMB_X30_Y20_N2
\Add17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add17~0_combout\ = (vposition(0) & (\Add16~18_combout\ $ (VCC))) # (!vposition(0) & (\Add16~18_combout\ & VCC))
-- \Add17~1\ = CARRY((vposition(0) & \Add16~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(0),
	datab => \Add16~18_combout\,
	datad => VCC,
	combout => \Add17~0_combout\,
	cout => \Add17~1\);

-- Location: LCCOMB_X30_Y20_N4
\Add17~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add17~2_combout\ = (\Add16~20_combout\ & ((vposition(1) & (\Add17~1\ & VCC)) # (!vposition(1) & (!\Add17~1\)))) # (!\Add16~20_combout\ & ((vposition(1) & (!\Add17~1\)) # (!vposition(1) & ((\Add17~1\) # (GND)))))
-- \Add17~3\ = CARRY((\Add16~20_combout\ & (!vposition(1) & !\Add17~1\)) # (!\Add16~20_combout\ & ((!\Add17~1\) # (!vposition(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add16~20_combout\,
	datab => vposition(1),
	datad => VCC,
	cin => \Add17~1\,
	combout => \Add17~2_combout\,
	cout => \Add17~3\);

-- Location: LCCOMB_X30_Y20_N6
\Add17~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add17~4_combout\ = ((vposition(2) $ (\Add16~22_combout\ $ (!\Add17~3\)))) # (GND)
-- \Add17~5\ = CARRY((vposition(2) & ((\Add16~22_combout\) # (!\Add17~3\))) # (!vposition(2) & (\Add16~22_combout\ & !\Add17~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => \Add16~22_combout\,
	datad => VCC,
	cin => \Add17~3\,
	combout => \Add17~4_combout\,
	cout => \Add17~5\);

-- Location: LCCOMB_X30_Y20_N8
\Add17~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add17~6_combout\ = (\Add16~24_combout\ & ((vposition(3) & (\Add17~5\ & VCC)) # (!vposition(3) & (!\Add17~5\)))) # (!\Add16~24_combout\ & ((vposition(3) & (!\Add17~5\)) # (!vposition(3) & ((\Add17~5\) # (GND)))))
-- \Add17~7\ = CARRY((\Add16~24_combout\ & (!vposition(3) & !\Add17~5\)) # (!\Add16~24_combout\ & ((!\Add17~5\) # (!vposition(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add16~24_combout\,
	datab => vposition(3),
	datad => VCC,
	cin => \Add17~5\,
	combout => \Add17~6_combout\,
	cout => \Add17~7\);

-- Location: LCCOMB_X30_Y20_N10
\Add17~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add17~8_combout\ = ((\Add16~26_combout\ $ (vposition(4) $ (!\Add17~7\)))) # (GND)
-- \Add17~9\ = CARRY((\Add16~26_combout\ & ((vposition(4)) # (!\Add17~7\))) # (!\Add16~26_combout\ & (vposition(4) & !\Add17~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add16~26_combout\,
	datab => vposition(4),
	datad => VCC,
	cin => \Add17~7\,
	combout => \Add17~8_combout\,
	cout => \Add17~9\);

-- Location: LCCOMB_X30_Y20_N12
\Add17~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add17~10_combout\ = vposition(5) $ (\Add17~9\ $ (\Add16~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(5),
	datad => \Add16~28_combout\,
	cin => \Add17~9\,
	combout => \Add17~10_combout\);

-- Location: LCCOMB_X30_Y20_N18
\bg_address[9]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[9]~6_combout\ = \Add17~0_combout\ $ (VCC)
-- \bg_address[9]~7\ = CARRY(\Add17~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add17~0_combout\,
	datad => VCC,
	combout => \bg_address[9]~6_combout\,
	cout => \bg_address[9]~7\);

-- Location: LCCOMB_X30_Y20_N20
\bg_address[10]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[10]~8_combout\ = (\Add17~2_combout\ & (\bg_address[9]~7\ & VCC)) # (!\Add17~2_combout\ & (!\bg_address[9]~7\))
-- \bg_address[10]~9\ = CARRY((!\Add17~2_combout\ & !\bg_address[9]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add17~2_combout\,
	datad => VCC,
	cin => \bg_address[9]~7\,
	combout => \bg_address[10]~8_combout\,
	cout => \bg_address[10]~9\);

-- Location: LCCOMB_X30_Y20_N22
\bg_address[11]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[11]~10_combout\ = (\Add17~4_combout\ & ((GND) # (!\bg_address[10]~9\))) # (!\Add17~4_combout\ & (\bg_address[10]~9\ $ (GND)))
-- \bg_address[11]~11\ = CARRY((\Add17~4_combout\) # (!\bg_address[10]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add17~4_combout\,
	datad => VCC,
	cin => \bg_address[10]~9\,
	combout => \bg_address[11]~10_combout\,
	cout => \bg_address[11]~11\);

-- Location: LCCOMB_X30_Y20_N24
\bg_address[12]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[12]~12_combout\ = (\Add17~6_combout\ & (!\bg_address[11]~11\)) # (!\Add17~6_combout\ & ((\bg_address[11]~11\) # (GND)))
-- \bg_address[12]~13\ = CARRY((!\bg_address[11]~11\) # (!\Add17~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add17~6_combout\,
	datad => VCC,
	cin => \bg_address[11]~11\,
	combout => \bg_address[12]~12_combout\,
	cout => \bg_address[12]~13\);

-- Location: LCCOMB_X30_Y20_N26
\bg_address[13]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[13]~14_combout\ = (\Add17~8_combout\ & (\bg_address[12]~13\ $ (GND))) # (!\Add17~8_combout\ & (!\bg_address[12]~13\ & VCC))
-- \bg_address[13]~15\ = CARRY((\Add17~8_combout\ & !\bg_address[12]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add17~8_combout\,
	datad => VCC,
	cin => \bg_address[12]~13\,
	combout => \bg_address[13]~14_combout\,
	cout => \bg_address[13]~15\);

-- Location: LCCOMB_X30_Y20_N28
\bg_address[14]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[14]~16_combout\ = \bg_address[13]~15\ $ (\Add17~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Add17~10_combout\,
	cin => \bg_address[13]~15\,
	combout => \bg_address[14]~16_combout\);

-- Location: LCCOMB_X30_Y20_N0
\process_0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~7_combout\ = (vposition(7) & ((vposition(1)) # ((vposition(0)) # (vposition(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(1),
	datab => vposition(7),
	datac => vposition(0),
	datad => vposition(2),
	combout => \process_0~7_combout\);

-- Location: LCCOMB_X30_Y20_N30
\process_0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~8_combout\ = (vposition(6) & (!vposition(8) & (vposition(3) & \process_0~7_combout\))) # (!vposition(6) & (vposition(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datab => vposition(8),
	datac => vposition(3),
	datad => \process_0~7_combout\,
	combout => \process_0~8_combout\);

-- Location: LCCOMB_X31_Y18_N20
\process_0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = (!vposition(2) & (!vposition(1) & !vposition(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datac => vposition(1),
	datad => vposition(3),
	combout => \process_0~2_combout\);

-- Location: LCCOMB_X30_Y17_N24
\process_0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~6_combout\ = (vposition(5) & ((vposition(4) & (vposition(6))) # (!vposition(4) & (!vposition(6) & \process_0~2_combout\)))) # (!vposition(5) & (((!vposition(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011110000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datab => vposition(4),
	datac => vposition(6),
	datad => \process_0~2_combout\,
	combout => \process_0~6_combout\);

-- Location: LCCOMB_X30_Y17_N22
\process_0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~9_combout\ = (\process_0~8_combout\ & (\process_0~6_combout\ & ((vposition(6)) # (!vposition(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => vposition(6),
	datac => vposition(7),
	datad => \process_0~6_combout\,
	combout => \process_0~9_combout\);

-- Location: LCCOMB_X30_Y17_N20
\process_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (\LessThan4~6_combout\ & (!vposition(31) & (vposition(9) & !hposition(31))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~6_combout\,
	datab => vposition(31),
	datac => vposition(9),
	datad => hposition(31),
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X32_Y21_N2
\LessThan9~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~1_cout\ = CARRY((!hposition(0) & \bg_hstart~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => \bg_hstart~33_combout\,
	datad => VCC,
	cout => \LessThan9~1_cout\);

-- Location: LCCOMB_X32_Y21_N4
\LessThan9~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~3_cout\ = CARRY((hposition(1) & ((!\LessThan9~1_cout\) # (!\bg_hstart~32_combout\))) # (!hposition(1) & (!\bg_hstart~32_combout\ & !\LessThan9~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => \bg_hstart~32_combout\,
	datad => VCC,
	cin => \LessThan9~1_cout\,
	cout => \LessThan9~3_cout\);

-- Location: LCCOMB_X32_Y21_N6
\LessThan9~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~5_cout\ = CARRY((hposition(2) & (\bg_hstart~31_combout\ & !\LessThan9~3_cout\)) # (!hposition(2) & ((\bg_hstart~31_combout\) # (!\LessThan9~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => \bg_hstart~31_combout\,
	datad => VCC,
	cin => \LessThan9~3_cout\,
	cout => \LessThan9~5_cout\);

-- Location: LCCOMB_X32_Y21_N8
\LessThan9~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~7_cout\ = CARRY((\bg_hstart~30_combout\ & (hposition(3) & !\LessThan9~5_cout\)) # (!\bg_hstart~30_combout\ & ((hposition(3)) # (!\LessThan9~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~30_combout\,
	datab => hposition(3),
	datad => VCC,
	cin => \LessThan9~5_cout\,
	cout => \LessThan9~7_cout\);

-- Location: LCCOMB_X32_Y21_N10
\LessThan9~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~9_cout\ = CARRY((hposition(4) & (\bg_hstart~29_combout\ & !\LessThan9~7_cout\)) # (!hposition(4) & ((\bg_hstart~29_combout\) # (!\LessThan9~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \bg_hstart~29_combout\,
	datad => VCC,
	cin => \LessThan9~7_cout\,
	cout => \LessThan9~9_cout\);

-- Location: LCCOMB_X32_Y21_N12
\LessThan9~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~11_cout\ = CARRY((\bg_hstart~28_combout\ & (hposition(5) & !\LessThan9~9_cout\)) # (!\bg_hstart~28_combout\ & ((hposition(5)) # (!\LessThan9~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~28_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan9~9_cout\,
	cout => \LessThan9~11_cout\);

-- Location: LCCOMB_X32_Y21_N14
\LessThan9~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~13_cout\ = CARRY((\bg_hstart~36_combout\ & ((!\LessThan9~11_cout\) # (!hposition(6)))) # (!\bg_hstart~36_combout\ & (!hposition(6) & !\LessThan9~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~36_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan9~11_cout\,
	cout => \LessThan9~13_cout\);

-- Location: LCCOMB_X32_Y21_N16
\LessThan9~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~15_cout\ = CARRY((\bg_hstart~27_combout\ & (hposition(7) & !\LessThan9~13_cout\)) # (!\bg_hstart~27_combout\ & ((hposition(7)) # (!\LessThan9~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~27_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan9~13_cout\,
	cout => \LessThan9~15_cout\);

-- Location: LCCOMB_X32_Y21_N18
\LessThan9~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~17_cout\ = CARRY((\bg_hstart~35_combout\ & ((!\LessThan9~15_cout\) # (!hposition(8)))) # (!\bg_hstart~35_combout\ & (!hposition(8) & !\LessThan9~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~35_combout\,
	datab => hposition(8),
	datad => VCC,
	cin => \LessThan9~15_cout\,
	cout => \LessThan9~17_cout\);

-- Location: LCCOMB_X32_Y21_N20
\LessThan9~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~19_cout\ = CARRY((hposition(9) & ((!\LessThan9~17_cout\) # (!\bg_hstart~26_combout\))) # (!hposition(9) & (!\bg_hstart~26_combout\ & !\LessThan9~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => \bg_hstart~26_combout\,
	datad => VCC,
	cin => \LessThan9~17_cout\,
	cout => \LessThan9~19_cout\);

-- Location: LCCOMB_X32_Y21_N22
\LessThan9~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~21_cout\ = CARRY((hposition(10) & (\bg_hstart~25_combout\ & !\LessThan9~19_cout\)) # (!hposition(10) & ((\bg_hstart~25_combout\) # (!\LessThan9~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \bg_hstart~25_combout\,
	datad => VCC,
	cin => \LessThan9~19_cout\,
	cout => \LessThan9~21_cout\);

-- Location: LCCOMB_X32_Y21_N24
\LessThan9~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~23_cout\ = CARRY((\bg_hstart~24_combout\ & (hposition(11) & !\LessThan9~21_cout\)) # (!\bg_hstart~24_combout\ & ((hposition(11)) # (!\LessThan9~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~24_combout\,
	datab => hposition(11),
	datad => VCC,
	cin => \LessThan9~21_cout\,
	cout => \LessThan9~23_cout\);

-- Location: LCCOMB_X32_Y21_N26
\LessThan9~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~25_cout\ = CARRY((hposition(12) & (\bg_hstart~23_combout\ & !\LessThan9~23_cout\)) # (!hposition(12) & ((\bg_hstart~23_combout\) # (!\LessThan9~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \bg_hstart~23_combout\,
	datad => VCC,
	cin => \LessThan9~23_cout\,
	cout => \LessThan9~25_cout\);

-- Location: LCCOMB_X32_Y21_N28
\LessThan9~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~27_cout\ = CARRY((\bg_hstart~22_combout\ & (hposition(13) & !\LessThan9~25_cout\)) # (!\bg_hstart~22_combout\ & ((hposition(13)) # (!\LessThan9~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~22_combout\,
	datab => hposition(13),
	datad => VCC,
	cin => \LessThan9~25_cout\,
	cout => \LessThan9~27_cout\);

-- Location: LCCOMB_X32_Y21_N30
\LessThan9~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~29_cout\ = CARRY((\bg_hstart~21_combout\ & ((!\LessThan9~27_cout\) # (!hposition(14)))) # (!\bg_hstart~21_combout\ & (!hposition(14) & !\LessThan9~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~21_combout\,
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan9~27_cout\,
	cout => \LessThan9~29_cout\);

-- Location: LCCOMB_X32_Y20_N0
\LessThan9~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~31_cout\ = CARRY((\bg_hstart~20_combout\ & (hposition(15) & !\LessThan9~29_cout\)) # (!\bg_hstart~20_combout\ & ((hposition(15)) # (!\LessThan9~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~20_combout\,
	datab => hposition(15),
	datad => VCC,
	cin => \LessThan9~29_cout\,
	cout => \LessThan9~31_cout\);

-- Location: LCCOMB_X32_Y20_N2
\LessThan9~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~33_cout\ = CARRY((\bg_hstart~19_combout\ & ((!\LessThan9~31_cout\) # (!hposition(16)))) # (!\bg_hstart~19_combout\ & (!hposition(16) & !\LessThan9~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~19_combout\,
	datab => hposition(16),
	datad => VCC,
	cin => \LessThan9~31_cout\,
	cout => \LessThan9~33_cout\);

-- Location: LCCOMB_X32_Y20_N4
\LessThan9~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~35_cout\ = CARRY((\bg_hstart~18_combout\ & (hposition(17) & !\LessThan9~33_cout\)) # (!\bg_hstart~18_combout\ & ((hposition(17)) # (!\LessThan9~33_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~18_combout\,
	datab => hposition(17),
	datad => VCC,
	cin => \LessThan9~33_cout\,
	cout => \LessThan9~35_cout\);

-- Location: LCCOMB_X32_Y20_N6
\LessThan9~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~37_cout\ = CARRY((\bg_hstart~17_combout\ & ((!\LessThan9~35_cout\) # (!hposition(18)))) # (!\bg_hstart~17_combout\ & (!hposition(18) & !\LessThan9~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~17_combout\,
	datab => hposition(18),
	datad => VCC,
	cin => \LessThan9~35_cout\,
	cout => \LessThan9~37_cout\);

-- Location: LCCOMB_X32_Y20_N8
\LessThan9~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~39_cout\ = CARRY((hposition(19) & ((!\LessThan9~37_cout\) # (!\bg_hstart~16_combout\))) # (!hposition(19) & (!\bg_hstart~16_combout\ & !\LessThan9~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datab => \bg_hstart~16_combout\,
	datad => VCC,
	cin => \LessThan9~37_cout\,
	cout => \LessThan9~39_cout\);

-- Location: LCCOMB_X32_Y20_N10
\LessThan9~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~41_cout\ = CARRY((hposition(20) & (\bg_hstart~15_combout\ & !\LessThan9~39_cout\)) # (!hposition(20) & ((\bg_hstart~15_combout\) # (!\LessThan9~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \bg_hstart~15_combout\,
	datad => VCC,
	cin => \LessThan9~39_cout\,
	cout => \LessThan9~41_cout\);

-- Location: LCCOMB_X32_Y20_N12
\LessThan9~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~43_cout\ = CARRY((hposition(21) & ((!\LessThan9~41_cout\) # (!\bg_hstart~14_combout\))) # (!hposition(21) & (!\bg_hstart~14_combout\ & !\LessThan9~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => \bg_hstart~14_combout\,
	datad => VCC,
	cin => \LessThan9~41_cout\,
	cout => \LessThan9~43_cout\);

-- Location: LCCOMB_X32_Y20_N14
\LessThan9~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~45_cout\ = CARRY((\bg_hstart~13_combout\ & ((!\LessThan9~43_cout\) # (!hposition(22)))) # (!\bg_hstart~13_combout\ & (!hposition(22) & !\LessThan9~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~13_combout\,
	datab => hposition(22),
	datad => VCC,
	cin => \LessThan9~43_cout\,
	cout => \LessThan9~45_cout\);

-- Location: LCCOMB_X32_Y20_N16
\LessThan9~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~47_cout\ = CARRY((hposition(23) & ((!\LessThan9~45_cout\) # (!\bg_hstart~12_combout\))) # (!hposition(23) & (!\bg_hstart~12_combout\ & !\LessThan9~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \bg_hstart~12_combout\,
	datad => VCC,
	cin => \LessThan9~45_cout\,
	cout => \LessThan9~47_cout\);

-- Location: LCCOMB_X32_Y20_N18
\LessThan9~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~49_cout\ = CARRY((hposition(24) & (\bg_hstart~11_combout\ & !\LessThan9~47_cout\)) # (!hposition(24) & ((\bg_hstart~11_combout\) # (!\LessThan9~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \bg_hstart~11_combout\,
	datad => VCC,
	cin => \LessThan9~47_cout\,
	cout => \LessThan9~49_cout\);

-- Location: LCCOMB_X32_Y20_N20
\LessThan9~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~51_cout\ = CARRY((\bg_hstart~10_combout\ & (hposition(25) & !\LessThan9~49_cout\)) # (!\bg_hstart~10_combout\ & ((hposition(25)) # (!\LessThan9~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~10_combout\,
	datab => hposition(25),
	datad => VCC,
	cin => \LessThan9~49_cout\,
	cout => \LessThan9~51_cout\);

-- Location: LCCOMB_X32_Y20_N22
\LessThan9~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~53_cout\ = CARRY((\bg_hstart~9_combout\ & ((!\LessThan9~51_cout\) # (!hposition(26)))) # (!\bg_hstart~9_combout\ & (!hposition(26) & !\LessThan9~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~9_combout\,
	datab => hposition(26),
	datad => VCC,
	cin => \LessThan9~51_cout\,
	cout => \LessThan9~53_cout\);

-- Location: LCCOMB_X32_Y20_N24
\LessThan9~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~55_cout\ = CARRY((\bg_hstart~8_combout\ & (hposition(27) & !\LessThan9~53_cout\)) # (!\bg_hstart~8_combout\ & ((hposition(27)) # (!\LessThan9~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~8_combout\,
	datab => hposition(27),
	datad => VCC,
	cin => \LessThan9~53_cout\,
	cout => \LessThan9~55_cout\);

-- Location: LCCOMB_X32_Y20_N26
\LessThan9~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~57_cout\ = CARRY((hposition(28) & (\bg_hstart~7_combout\ & !\LessThan9~55_cout\)) # (!hposition(28) & ((\bg_hstart~7_combout\) # (!\LessThan9~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => \bg_hstart~7_combout\,
	datad => VCC,
	cin => \LessThan9~55_cout\,
	cout => \LessThan9~57_cout\);

-- Location: LCCOMB_X32_Y20_N28
\LessThan9~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~59_cout\ = CARRY((hposition(29) & ((!\LessThan9~57_cout\) # (!\bg_hstart~34_combout\))) # (!hposition(29) & (!\bg_hstart~34_combout\ & !\LessThan9~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(29),
	datab => \bg_hstart~34_combout\,
	datad => VCC,
	cin => \LessThan9~57_cout\,
	cout => \LessThan9~59_cout\);

-- Location: LCCOMB_X32_Y20_N30
\LessThan9~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan9~60_combout\ = (hposition(30) & (!\LessThan9~59_cout\ & \bg_hstart~6_combout\)) # (!hposition(30) & ((\bg_hstart~6_combout\) # (!\LessThan9~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(30),
	datad => \bg_hstart~6_combout\,
	cin => \LessThan9~59_cout\,
	combout => \LessThan9~60_combout\);

-- Location: LCCOMB_X34_Y23_N28
\bg_hstop[30]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[30]~feeder_combout\ = \bg_hstop~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~6_combout\,
	combout => \bg_hstop[30]~feeder_combout\);

-- Location: FF_X34_Y23_N29
\bg_hstop[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[30]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(30));

-- Location: LCCOMB_X30_Y24_N0
\bg_hstop~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~27_combout\ = ((\LessThan0~8_combout\ & (\Add11~20_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(10))))) # (!\LessThan2~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~20_combout\,
	datab => \LessThan2~23_combout\,
	datac => bg_hstop(10),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~27_combout\);

-- Location: FF_X30_Y24_N1
\bg_hstop[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(10));

-- Location: LCCOMB_X29_Y24_N0
\Add11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~0_combout\ = bg_hstop(0) $ (VCC)
-- \Add11~1\ = CARRY(bg_hstop(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(0),
	datad => VCC,
	combout => \Add11~0_combout\,
	cout => \Add11~1\);

-- Location: LCCOMB_X30_Y24_N16
\bg_hstop~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~34_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~0_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~0_combout\,
	datab => \LessThan2~23_combout\,
	datac => bg_hstop(0),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~34_combout\);

-- Location: FF_X30_Y24_N17
\bg_hstop[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(0));

-- Location: LCCOMB_X29_Y24_N2
\Add11~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~2_combout\ = (bg_hstop(1) & (\Add11~1\ & VCC)) # (!bg_hstop(1) & (!\Add11~1\))
-- \Add11~3\ = CARRY((!bg_hstop(1) & !\Add11~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(1),
	datad => VCC,
	cin => \Add11~1\,
	combout => \Add11~2_combout\,
	cout => \Add11~3\);

-- Location: LCCOMB_X30_Y24_N6
\bg_hstop~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~33_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~2_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~2_combout\,
	datab => \LessThan2~23_combout\,
	datac => bg_hstop(1),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~33_combout\);

-- Location: FF_X30_Y24_N7
\bg_hstop[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(1));

-- Location: LCCOMB_X29_Y24_N4
\Add11~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~4_combout\ = (bg_hstop(2) & ((GND) # (!\Add11~3\))) # (!bg_hstop(2) & (\Add11~3\ $ (GND)))
-- \Add11~5\ = CARRY((bg_hstop(2)) # (!\Add11~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(2),
	datad => VCC,
	cin => \Add11~3\,
	combout => \Add11~4_combout\,
	cout => \Add11~5\);

-- Location: LCCOMB_X30_Y24_N8
\bg_hstop~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~32_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~4_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~4_combout\,
	datac => bg_hstop(2),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~32_combout\);

-- Location: FF_X30_Y24_N9
\bg_hstop[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(2));

-- Location: LCCOMB_X29_Y24_N6
\Add11~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~6_combout\ = (bg_hstop(3) & (\Add11~5\ & VCC)) # (!bg_hstop(3) & (!\Add11~5\))
-- \Add11~7\ = CARRY((!bg_hstop(3) & !\Add11~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(3),
	datad => VCC,
	cin => \Add11~5\,
	combout => \Add11~6_combout\,
	cout => \Add11~7\);

-- Location: LCCOMB_X30_Y24_N22
\bg_hstop~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~31_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~6_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~6_combout\,
	datac => bg_hstop(3),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~31_combout\);

-- Location: FF_X30_Y24_N23
\bg_hstop[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(3));

-- Location: LCCOMB_X29_Y24_N8
\Add11~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~8_combout\ = (bg_hstop(4) & ((GND) # (!\Add11~7\))) # (!bg_hstop(4) & (\Add11~7\ $ (GND)))
-- \Add11~9\ = CARRY((bg_hstop(4)) # (!\Add11~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(4),
	datad => VCC,
	cin => \Add11~7\,
	combout => \Add11~8_combout\,
	cout => \Add11~9\);

-- Location: LCCOMB_X30_Y24_N4
\bg_hstop~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~30_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~8_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~8_combout\,
	datac => bg_hstop(4),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~30_combout\);

-- Location: FF_X30_Y24_N5
\bg_hstop[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(4));

-- Location: LCCOMB_X29_Y24_N10
\Add11~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~10_combout\ = (bg_hstop(5) & (\Add11~9\ & VCC)) # (!bg_hstop(5) & (!\Add11~9\))
-- \Add11~11\ = CARRY((!bg_hstop(5) & !\Add11~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(5),
	datad => VCC,
	cin => \Add11~9\,
	combout => \Add11~10_combout\,
	cout => \Add11~11\);

-- Location: LCCOMB_X32_Y24_N26
\bg_hstop~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~29_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~10_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~10_combout\,
	datab => bg_hstop(5),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~29_combout\);

-- Location: LCCOMB_X32_Y24_N16
\bg_hstop[5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[5]~feeder_combout\ = \bg_hstop~29_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~29_combout\,
	combout => \bg_hstop[5]~feeder_combout\);

-- Location: FF_X32_Y24_N17
\bg_hstop[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(5));

-- Location: LCCOMB_X29_Y24_N12
\Add11~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~12_combout\ = (bg_hstop(6) & ((GND) # (!\Add11~11\))) # (!bg_hstop(6) & (\Add11~11\ $ (GND)))
-- \Add11~13\ = CARRY((bg_hstop(6)) # (!\Add11~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(6),
	datad => VCC,
	cin => \Add11~11\,
	combout => \Add11~12_combout\,
	cout => \Add11~13\);

-- Location: LCCOMB_X32_Y24_N30
\bg_hstop~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~37_combout\ = ((\LessThan0~8_combout\ & (\Add11~12_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(6))))) # (!\LessThan2~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~12_combout\,
	datab => bg_hstop(6),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~37_combout\);

-- Location: LCCOMB_X32_Y24_N2
\bg_hstop[6]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[6]~feeder_combout\ = \bg_hstop~37_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~37_combout\,
	combout => \bg_hstop[6]~feeder_combout\);

-- Location: FF_X32_Y24_N3
\bg_hstop[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(6));

-- Location: LCCOMB_X29_Y24_N14
\Add11~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~14_combout\ = (bg_hstop(7) & (\Add11~13\ & VCC)) # (!bg_hstop(7) & (!\Add11~13\))
-- \Add11~15\ = CARRY((!bg_hstop(7) & !\Add11~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(7),
	datad => VCC,
	cin => \Add11~13\,
	combout => \Add11~14_combout\,
	cout => \Add11~15\);

-- Location: LCCOMB_X32_Y24_N20
\bg_hstop~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~36_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~14_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~14_combout\,
	datab => bg_hstop(7),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~36_combout\);

-- Location: LCCOMB_X32_Y24_N24
\bg_hstop[7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[7]~feeder_combout\ = \bg_hstop~36_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~36_combout\,
	combout => \bg_hstop[7]~feeder_combout\);

-- Location: FF_X32_Y24_N25
\bg_hstop[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(7));

-- Location: LCCOMB_X29_Y24_N16
\Add11~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~16_combout\ = (bg_hstop(8) & ((GND) # (!\Add11~15\))) # (!bg_hstop(8) & (\Add11~15\ $ (GND)))
-- \Add11~17\ = CARRY((bg_hstop(8)) # (!\Add11~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(8),
	datad => VCC,
	cin => \Add11~15\,
	combout => \Add11~16_combout\,
	cout => \Add11~17\);

-- Location: LCCOMB_X29_Y24_N18
\Add11~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~18_combout\ = (bg_hstop(9) & (\Add11~17\ & VCC)) # (!bg_hstop(9) & (!\Add11~17\))
-- \Add11~19\ = CARRY((!bg_hstop(9) & !\Add11~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(9),
	datad => VCC,
	cin => \Add11~17\,
	combout => \Add11~18_combout\,
	cout => \Add11~19\);

-- Location: LCCOMB_X31_Y24_N0
\bg_hstop~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~28_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~18_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~18_combout\,
	datac => bg_hstop(9),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~28_combout\);

-- Location: FF_X31_Y24_N1
\bg_hstop[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(9));

-- Location: LCCOMB_X29_Y24_N20
\Add11~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~20_combout\ = (bg_hstop(10) & ((GND) # (!\Add11~19\))) # (!bg_hstop(10) & (\Add11~19\ $ (GND)))
-- \Add11~21\ = CARRY((bg_hstop(10)) # (!\Add11~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(10),
	datad => VCC,
	cin => \Add11~19\,
	combout => \Add11~20_combout\,
	cout => \Add11~21\);

-- Location: LCCOMB_X30_Y24_N2
\bg_hstop~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~11_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~52_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~52_combout\,
	datab => \LessThan2~23_combout\,
	datac => bg_hstop(26),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~11_combout\);

-- Location: FF_X30_Y24_N3
\bg_hstop[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(26));

-- Location: LCCOMB_X29_Y24_N22
\Add11~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~22_combout\ = (bg_hstop(11) & (\Add11~21\ & VCC)) # (!bg_hstop(11) & (!\Add11~21\))
-- \Add11~23\ = CARRY((!bg_hstop(11) & !\Add11~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(11),
	datad => VCC,
	cin => \Add11~21\,
	combout => \Add11~22_combout\,
	cout => \Add11~23\);

-- Location: LCCOMB_X30_Y25_N22
\bg_hstop~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~26_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~22_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~22_combout\,
	datac => \LessThan2~23_combout\,
	datad => bg_hstop(11),
	combout => \bg_hstop~26_combout\);

-- Location: LCCOMB_X30_Y25_N24
\bg_hstop[11]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[11]~feeder_combout\ = \bg_hstop~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~26_combout\,
	combout => \bg_hstop[11]~feeder_combout\);

-- Location: FF_X30_Y25_N25
\bg_hstop[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(11));

-- Location: LCCOMB_X29_Y24_N24
\Add11~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~24_combout\ = (bg_hstop(12) & ((GND) # (!\Add11~23\))) # (!bg_hstop(12) & (\Add11~23\ $ (GND)))
-- \Add11~25\ = CARRY((bg_hstop(12)) # (!\Add11~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(12),
	datad => VCC,
	cin => \Add11~23\,
	combout => \Add11~24_combout\,
	cout => \Add11~25\);

-- Location: LCCOMB_X30_Y25_N12
\bg_hstop~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~25_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~24_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(12),
	datab => \Add11~24_combout\,
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~25_combout\);

-- Location: FF_X30_Y25_N31
\bg_hstop[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~25_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(12));

-- Location: LCCOMB_X29_Y24_N26
\Add11~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~26_combout\ = (bg_hstop(13) & (\Add11~25\ & VCC)) # (!bg_hstop(13) & (!\Add11~25\))
-- \Add11~27\ = CARRY((!bg_hstop(13) & !\Add11~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(13),
	datad => VCC,
	cin => \Add11~25\,
	combout => \Add11~26_combout\,
	cout => \Add11~27\);

-- Location: LCCOMB_X30_Y23_N14
\bg_hstop~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~24_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~26_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(13),
	datab => \LessThan0~8_combout\,
	datac => \Add11~26_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~24_combout\);

-- Location: LCCOMB_X30_Y23_N6
\bg_hstop[13]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[13]~feeder_combout\ = \bg_hstop~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~24_combout\,
	combout => \bg_hstop[13]~feeder_combout\);

-- Location: FF_X30_Y23_N7
\bg_hstop[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(13));

-- Location: LCCOMB_X29_Y24_N28
\Add11~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~28_combout\ = (bg_hstop(14) & ((GND) # (!\Add11~27\))) # (!bg_hstop(14) & (\Add11~27\ $ (GND)))
-- \Add11~29\ = CARRY((bg_hstop(14)) # (!\Add11~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(14),
	datad => VCC,
	cin => \Add11~27\,
	combout => \Add11~28_combout\,
	cout => \Add11~29\);

-- Location: LCCOMB_X32_Y24_N4
\bg_hstop~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~23_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~28_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~28_combout\,
	datab => bg_hstop(14),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~23_combout\);

-- Location: FF_X29_Y24_N15
\bg_hstop[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~23_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(14));

-- Location: LCCOMB_X29_Y24_N30
\Add11~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~30_combout\ = (bg_hstop(15) & (\Add11~29\ & VCC)) # (!bg_hstop(15) & (!\Add11~29\))
-- \Add11~31\ = CARRY((!bg_hstop(15) & !\Add11~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(15),
	datad => VCC,
	cin => \Add11~29\,
	combout => \Add11~30_combout\,
	cout => \Add11~31\);

-- Location: LCCOMB_X30_Y23_N4
\bg_hstop~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~22_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~30_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(15),
	datab => \Add11~30_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~22_combout\);

-- Location: FF_X30_Y23_N1
\bg_hstop[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~22_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(15));

-- Location: LCCOMB_X29_Y23_N0
\Add11~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~32_combout\ = (bg_hstop(16) & ((GND) # (!\Add11~31\))) # (!bg_hstop(16) & (\Add11~31\ $ (GND)))
-- \Add11~33\ = CARRY((bg_hstop(16)) # (!\Add11~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(16),
	datad => VCC,
	cin => \Add11~31\,
	combout => \Add11~32_combout\,
	cout => \Add11~33\);

-- Location: LCCOMB_X30_Y23_N18
\bg_hstop~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~21_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~32_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(16),
	datab => \LessThan0~8_combout\,
	datac => \Add11~32_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~21_combout\);

-- Location: FF_X29_Y23_N1
\bg_hstop[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~21_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(16));

-- Location: LCCOMB_X29_Y23_N2
\Add11~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~34_combout\ = (bg_hstop(17) & (\Add11~33\ & VCC)) # (!bg_hstop(17) & (!\Add11~33\))
-- \Add11~35\ = CARRY((!bg_hstop(17) & !\Add11~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(17),
	datad => VCC,
	cin => \Add11~33\,
	combout => \Add11~34_combout\,
	cout => \Add11~35\);

-- Location: LCCOMB_X30_Y23_N16
\bg_hstop~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~20_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~34_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(17),
	datab => \LessThan0~8_combout\,
	datac => \Add11~34_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~20_combout\);

-- Location: FF_X29_Y23_N21
\bg_hstop[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~20_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(17));

-- Location: LCCOMB_X29_Y23_N4
\Add11~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~36_combout\ = (bg_hstop(18) & ((GND) # (!\Add11~35\))) # (!bg_hstop(18) & (\Add11~35\ $ (GND)))
-- \Add11~37\ = CARRY((bg_hstop(18)) # (!\Add11~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(18),
	datad => VCC,
	cin => \Add11~35\,
	combout => \Add11~36_combout\,
	cout => \Add11~37\);

-- Location: LCCOMB_X30_Y23_N22
\bg_hstop~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~19_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~36_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(18),
	datab => \Add11~36_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~19_combout\);

-- Location: FF_X29_Y23_N11
\bg_hstop[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~19_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(18));

-- Location: LCCOMB_X29_Y23_N6
\Add11~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~38_combout\ = (bg_hstop(19) & (\Add11~37\ & VCC)) # (!bg_hstop(19) & (!\Add11~37\))
-- \Add11~39\ = CARRY((!bg_hstop(19) & !\Add11~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(19),
	datad => VCC,
	cin => \Add11~37\,
	combout => \Add11~38_combout\,
	cout => \Add11~39\);

-- Location: LCCOMB_X30_Y23_N8
\bg_hstop~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~18_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~38_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(19),
	datab => \Add11~38_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~18_combout\);

-- Location: FF_X29_Y23_N7
\bg_hstop[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~18_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(19));

-- Location: LCCOMB_X29_Y23_N8
\Add11~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~40_combout\ = (bg_hstop(20) & ((GND) # (!\Add11~39\))) # (!bg_hstop(20) & (\Add11~39\ $ (GND)))
-- \Add11~41\ = CARRY((bg_hstop(20)) # (!\Add11~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(20),
	datad => VCC,
	cin => \Add11~39\,
	combout => \Add11~40_combout\,
	cout => \Add11~41\);

-- Location: LCCOMB_X30_Y23_N2
\bg_hstop~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~17_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~40_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~40_combout\,
	datab => bg_hstop(20),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~17_combout\);

-- Location: FF_X29_Y23_N9
\bg_hstop[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~17_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(20));

-- Location: LCCOMB_X29_Y23_N10
\Add11~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~42_combout\ = (bg_hstop(21) & (\Add11~41\ & VCC)) # (!bg_hstop(21) & (!\Add11~41\))
-- \Add11~43\ = CARRY((!bg_hstop(21) & !\Add11~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(21),
	datad => VCC,
	cin => \Add11~41\,
	combout => \Add11~42_combout\,
	cout => \Add11~43\);

-- Location: LCCOMB_X30_Y25_N14
\bg_hstop~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~16_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~42_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~42_combout\,
	datab => bg_hstop(21),
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~16_combout\);

-- Location: LCCOMB_X30_Y25_N20
\bg_hstop[21]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[21]~feeder_combout\ = \bg_hstop~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~16_combout\,
	combout => \bg_hstop[21]~feeder_combout\);

-- Location: FF_X30_Y25_N21
\bg_hstop[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[21]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(21));

-- Location: LCCOMB_X29_Y23_N12
\Add11~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~44_combout\ = (bg_hstop(22) & ((GND) # (!\Add11~43\))) # (!bg_hstop(22) & (\Add11~43\ $ (GND)))
-- \Add11~45\ = CARRY((bg_hstop(22)) # (!\Add11~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(22),
	datad => VCC,
	cin => \Add11~43\,
	combout => \Add11~44_combout\,
	cout => \Add11~45\);

-- Location: LCCOMB_X30_Y25_N0
\bg_hstop~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~15_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~44_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(22),
	datab => \Add11~44_combout\,
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~15_combout\);

-- Location: LCCOMB_X30_Y25_N6
\bg_hstop[22]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[22]~feeder_combout\ = \bg_hstop~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~15_combout\,
	combout => \bg_hstop[22]~feeder_combout\);

-- Location: FF_X30_Y25_N7
\bg_hstop[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[22]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(22));

-- Location: LCCOMB_X29_Y23_N14
\Add11~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~46_combout\ = (bg_hstop(23) & (\Add11~45\ & VCC)) # (!bg_hstop(23) & (!\Add11~45\))
-- \Add11~47\ = CARRY((!bg_hstop(23) & !\Add11~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(23),
	datad => VCC,
	cin => \Add11~45\,
	combout => \Add11~46_combout\,
	cout => \Add11~47\);

-- Location: LCCOMB_X30_Y25_N18
\bg_hstop~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~14_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~46_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(23),
	datab => \Add11~46_combout\,
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~14_combout\);

-- Location: LCCOMB_X30_Y25_N4
\bg_hstop[23]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[23]~feeder_combout\ = \bg_hstop~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~14_combout\,
	combout => \bg_hstop[23]~feeder_combout\);

-- Location: FF_X30_Y25_N5
\bg_hstop[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[23]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(23));

-- Location: LCCOMB_X29_Y23_N16
\Add11~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~48_combout\ = (bg_hstop(24) & ((GND) # (!\Add11~47\))) # (!bg_hstop(24) & (\Add11~47\ $ (GND)))
-- \Add11~49\ = CARRY((bg_hstop(24)) # (!\Add11~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(24),
	datad => VCC,
	cin => \Add11~47\,
	combout => \Add11~48_combout\,
	cout => \Add11~49\);

-- Location: LCCOMB_X30_Y25_N28
\bg_hstop~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~13_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~48_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(24),
	datab => \Add11~48_combout\,
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~13_combout\);

-- Location: FF_X30_Y25_N11
\bg_hstop[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~13_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(24));

-- Location: LCCOMB_X29_Y23_N18
\Add11~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~50_combout\ = (bg_hstop(25) & (\Add11~49\ & VCC)) # (!bg_hstop(25) & (!\Add11~49\))
-- \Add11~51\ = CARRY((!bg_hstop(25) & !\Add11~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(25),
	datad => VCC,
	cin => \Add11~49\,
	combout => \Add11~50_combout\,
	cout => \Add11~51\);

-- Location: LCCOMB_X30_Y25_N26
\bg_hstop~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~12_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~50_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(25))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~50_combout\,
	datab => bg_hstop(25),
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~12_combout\);

-- Location: FF_X30_Y25_N9
\bg_hstop[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~12_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(25));

-- Location: LCCOMB_X29_Y23_N20
\Add11~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~52_combout\ = (bg_hstop(26) & ((GND) # (!\Add11~51\))) # (!bg_hstop(26) & (\Add11~51\ $ (GND)))
-- \Add11~53\ = CARRY((bg_hstop(26)) # (!\Add11~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(26),
	datad => VCC,
	cin => \Add11~51\,
	combout => \Add11~52_combout\,
	cout => \Add11~53\);

-- Location: LCCOMB_X29_Y23_N22
\Add11~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~54_combout\ = (bg_hstop(27) & (\Add11~53\ & VCC)) # (!bg_hstop(27) & (!\Add11~53\))
-- \Add11~55\ = CARRY((!bg_hstop(27) & !\Add11~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(27),
	datad => VCC,
	cin => \Add11~53\,
	combout => \Add11~54_combout\,
	cout => \Add11~55\);

-- Location: LCCOMB_X30_Y24_N10
\LessThan2~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~13_combout\ = (\Add11~48_combout\) # ((\Add11~54_combout\) # ((\Add11~58_combout\) # (\Add11~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~48_combout\,
	datab => \Add11~54_combout\,
	datac => \Add11~58_combout\,
	datad => \Add11~22_combout\,
	combout => \LessThan2~13_combout\);

-- Location: LCCOMB_X30_Y24_N28
\LessThan2~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~14_combout\ = (\Add11~20_combout\) # ((\Add11~56_combout\) # ((\Add11~52_combout\) # (\LessThan2~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~20_combout\,
	datab => \Add11~56_combout\,
	datac => \Add11~52_combout\,
	datad => \LessThan2~13_combout\,
	combout => \LessThan2~14_combout\);

-- Location: LCCOMB_X30_Y24_N14
\LessThan2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (\LessThan0~8_combout\ & ((\Add11~24_combout\) # ((\Add11~26_combout\) # (\Add11~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~24_combout\,
	datac => \Add11~26_combout\,
	datad => \Add11~28_combout\,
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X30_Y23_N10
\LessThan2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (\LessThan0~8_combout\ & ((\Add11~38_combout\) # ((\Add11~36_combout\) # (\Add11~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~38_combout\,
	datac => \Add11~36_combout\,
	datad => \Add11~40_combout\,
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X30_Y23_N24
\LessThan2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (\LessThan0~8_combout\ & ((\Add11~32_combout\) # ((\Add11~34_combout\) # (\Add11~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~32_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add11~34_combout\,
	datad => \Add11~30_combout\,
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X30_Y25_N30
\LessThan2~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~9_combout\ = (bg_hstop(10)) # ((bg_hstop(11)) # ((bg_hstop(12)) # (bg_hstop(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(10),
	datab => bg_hstop(11),
	datac => bg_hstop(12),
	datad => bg_hstop(29),
	combout => \LessThan2~9_combout\);

-- Location: LCCOMB_X30_Y23_N26
\LessThan2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~6_combout\ = (bg_hstop(18)) # ((bg_hstop(20)) # ((bg_hstop(17)) # (bg_hstop(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(18),
	datab => bg_hstop(20),
	datac => bg_hstop(17),
	datad => bg_hstop(19),
	combout => \LessThan2~6_combout\);

-- Location: LCCOMB_X30_Y25_N10
\LessThan2~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~5_combout\ = (bg_hstop(22)) # ((bg_hstop(23)) # ((bg_hstop(24)) # (bg_hstop(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(22),
	datab => bg_hstop(23),
	datac => bg_hstop(24),
	datad => bg_hstop(21),
	combout => \LessThan2~5_combout\);

-- Location: LCCOMB_X30_Y25_N8
\LessThan2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~4_combout\ = (bg_hstop(26)) # ((bg_hstop(28)) # ((bg_hstop(25)) # (bg_hstop(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(26),
	datab => bg_hstop(28),
	datac => bg_hstop(25),
	datad => bg_hstop(27),
	combout => \LessThan2~4_combout\);

-- Location: LCCOMB_X30_Y23_N0
\LessThan2~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~7_combout\ = (bg_hstop(16)) # ((bg_hstop(14)) # ((bg_hstop(15)) # (bg_hstop(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(16),
	datab => bg_hstop(14),
	datac => bg_hstop(15),
	datad => bg_hstop(13),
	combout => \LessThan2~7_combout\);

-- Location: LCCOMB_X30_Y23_N12
\LessThan2~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~8_combout\ = (\LessThan2~6_combout\) # ((\LessThan2~5_combout\) # ((\LessThan2~4_combout\) # (\LessThan2~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~6_combout\,
	datab => \LessThan2~5_combout\,
	datac => \LessThan2~4_combout\,
	datad => \LessThan2~7_combout\,
	combout => \LessThan2~8_combout\);

-- Location: LCCOMB_X30_Y23_N30
\LessThan2~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~10_combout\ = (!\LessThan0~8_combout\ & ((bg_hstop(30)) # ((\LessThan2~9_combout\) # (\LessThan2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(30),
	datab => \LessThan0~8_combout\,
	datac => \LessThan2~9_combout\,
	datad => \LessThan2~8_combout\,
	combout => \LessThan2~10_combout\);

-- Location: LCCOMB_X30_Y23_N28
\LessThan2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = (\LessThan0~8_combout\ & ((\Add11~44_combout\) # ((\Add11~42_combout\) # (\Add11~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~44_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add11~42_combout\,
	datad => \Add11~46_combout\,
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X30_Y23_N20
\LessThan2~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~11_combout\ = (\LessThan2~2_combout\) # ((\LessThan2~1_combout\) # ((\LessThan2~10_combout\) # (\LessThan2~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~2_combout\,
	datab => \LessThan2~1_combout\,
	datac => \LessThan2~10_combout\,
	datad => \LessThan2~3_combout\,
	combout => \LessThan2~11_combout\);

-- Location: LCCOMB_X30_Y24_N24
\LessThan2~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~12_combout\ = (\LessThan2~0_combout\) # ((\LessThan2~11_combout\) # ((\LessThan0~8_combout\ & \Add11~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan2~0_combout\,
	datac => \Add11~50_combout\,
	datad => \LessThan2~11_combout\,
	combout => \LessThan2~12_combout\);

-- Location: LCCOMB_X30_Y24_N30
\LessThan2~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~15_combout\ = (\LessThan2~12_combout\) # ((\LessThan0~8_combout\ & ((\LessThan2~14_combout\) # (\Add11~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan2~14_combout\,
	datac => \Add11~60_combout\,
	datad => \LessThan2~12_combout\,
	combout => \LessThan2~15_combout\);

-- Location: LCCOMB_X29_Y23_N28
\Add11~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~60_combout\ = (bg_hstop(30) & ((GND) # (!\Add11~59\))) # (!bg_hstop(30) & (\Add11~59\ $ (GND)))
-- \Add11~61\ = CARRY((bg_hstop(30)) # (!\Add11~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(30),
	datad => VCC,
	cin => \Add11~59\,
	combout => \Add11~60_combout\,
	cout => \Add11~61\);

-- Location: LCCOMB_X29_Y23_N30
\Add11~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~62_combout\ = !\Add11~61\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add11~61\,
	combout => \Add11~62_combout\);

-- Location: LCCOMB_X30_Y24_N26
\bg_hstop~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~35_combout\ = (((\Add11~62_combout\ & \LessThan0~8_combout\)) # (!\bg_hstop~7_combout\)) # (!\LessThan2~15_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~15_combout\,
	datab => \Add11~62_combout\,
	datac => \bg_hstop~7_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~35_combout\);

-- Location: FF_X30_Y24_N27
\bg_hstop[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(8));

-- Location: LCCOMB_X32_Y24_N22
\bg_hstop~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~7_combout\ = (\LessThan0~8_combout\ & ((!\Add11~16_combout\))) # (!\LessThan0~8_combout\ & (!bg_hstop(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(8),
	datac => \LessThan0~8_combout\,
	datad => \Add11~16_combout\,
	combout => \bg_hstop~7_combout\);

-- Location: LCCOMB_X30_Y24_N20
\Add11~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~65_combout\ = (\LessThan0~8_combout\ & \Add11~62_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datad => \Add11~62_combout\,
	combout => \Add11~65_combout\);

-- Location: LCCOMB_X32_Y24_N0
\LessThan2~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~16_combout\ = (bg_hstop(3)) # ((bg_hstop(4)) # ((bg_hstop(2)) # (bg_hstop(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(3),
	datab => bg_hstop(4),
	datac => bg_hstop(2),
	datad => bg_hstop(5),
	combout => \LessThan2~16_combout\);

-- Location: LCCOMB_X32_Y24_N10
\LessThan2~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~17_combout\ = (!\LessThan0~8_combout\ & ((bg_hstop(1)) # ((bg_hstop(0)) # (\LessThan2~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(1),
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(0),
	datad => \LessThan2~16_combout\,
	combout => \LessThan2~17_combout\);

-- Location: LCCOMB_X32_Y24_N8
\LessThan2~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~20_combout\ = (\LessThan0~8_combout\ & ((!\Add11~14_combout\))) # (!\LessThan0~8_combout\ & (!bg_hstop(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(7),
	datac => \LessThan0~8_combout\,
	datad => \Add11~14_combout\,
	combout => \LessThan2~20_combout\);

-- Location: LCCOMB_X32_Y24_N28
\LessThan2~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~18_combout\ = (\Add11~6_combout\) # ((\Add11~0_combout\) # ((\Add11~2_combout\) # (\Add11~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~6_combout\,
	datab => \Add11~0_combout\,
	datac => \Add11~2_combout\,
	datad => \Add11~4_combout\,
	combout => \LessThan2~18_combout\);

-- Location: LCCOMB_X32_Y24_N14
\LessThan2~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~19_combout\ = (\LessThan0~8_combout\ & ((\Add11~10_combout\) # ((\Add11~8_combout\) # (\LessThan2~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~10_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add11~8_combout\,
	datad => \LessThan2~18_combout\,
	combout => \LessThan2~19_combout\);

-- Location: LCCOMB_X32_Y24_N18
\Add11~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~64_combout\ = (\LessThan0~8_combout\ & ((\Add11~12_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(6),
	datac => \LessThan0~8_combout\,
	datad => \Add11~12_combout\,
	combout => \Add11~64_combout\);

-- Location: LCCOMB_X32_Y24_N6
\LessThan2~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~21_combout\ = ((\Add11~64_combout\ & ((\LessThan2~17_combout\) # (\LessThan2~19_combout\)))) # (!\LessThan2~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~17_combout\,
	datab => \LessThan2~20_combout\,
	datac => \LessThan2~19_combout\,
	datad => \Add11~64_combout\,
	combout => \LessThan2~21_combout\);

-- Location: LCCOMB_X32_Y24_N12
\LessThan2~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~22_combout\ = (\LessThan2~21_combout\ & ((\LessThan0~8_combout\ & ((\Add11~18_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(9),
	datab => \LessThan0~8_combout\,
	datac => \Add11~18_combout\,
	datad => \LessThan2~21_combout\,
	combout => \LessThan2~22_combout\);

-- Location: LCCOMB_X30_Y24_N18
\LessThan2~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~23_combout\ = (!\Add11~65_combout\ & ((\LessThan2~15_combout\) # ((!\bg_hstop~7_combout\ & \LessThan2~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~7_combout\,
	datab => \Add11~65_combout\,
	datac => \LessThan2~15_combout\,
	datad => \LessThan2~22_combout\,
	combout => \LessThan2~23_combout\);

-- Location: LCCOMB_X30_Y25_N2
\bg_hstop~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~10_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add11~54_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan2~23_combout\,
	datac => bg_hstop(27),
	datad => \Add11~54_combout\,
	combout => \bg_hstop~10_combout\);

-- Location: FF_X30_Y25_N3
\bg_hstop[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(27));

-- Location: LCCOMB_X29_Y23_N24
\Add11~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~56_combout\ = (bg_hstop(28) & ((GND) # (!\Add11~55\))) # (!bg_hstop(28) & (\Add11~55\ $ (GND)))
-- \Add11~57\ = CARRY((bg_hstop(28)) # (!\Add11~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(28),
	datad => VCC,
	cin => \Add11~55\,
	combout => \Add11~56_combout\,
	cout => \Add11~57\);

-- Location: LCCOMB_X30_Y24_N12
\bg_hstop~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~9_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~56_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~56_combout\,
	datac => bg_hstop(28),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~9_combout\);

-- Location: FF_X30_Y24_N13
\bg_hstop[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(28));

-- Location: LCCOMB_X29_Y23_N26
\Add11~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~58_combout\ = (bg_hstop(29) & (\Add11~57\ & VCC)) # (!bg_hstop(29) & (!\Add11~57\))
-- \Add11~59\ = CARRY((!bg_hstop(29) & !\Add11~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(29),
	datad => VCC,
	cin => \Add11~57\,
	combout => \Add11~58_combout\,
	cout => \Add11~59\);

-- Location: LCCOMB_X30_Y25_N16
\bg_hstop~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~8_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add11~58_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~58_combout\,
	datab => \LessThan2~23_combout\,
	datac => bg_hstop(29),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~8_combout\);

-- Location: FF_X30_Y25_N17
\bg_hstop[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(29));

-- Location: LCCOMB_X34_Y23_N6
\bg_hstop~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~6_combout\ = (\LessThan0~8_combout\ & (((\Add11~60_combout\ & !\Add11~62_combout\)))) # (!\LessThan0~8_combout\ & (bg_hstop(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(30),
	datac => \Add11~60_combout\,
	datad => \Add11~62_combout\,
	combout => \bg_hstop~6_combout\);

-- Location: LCCOMB_X31_Y24_N2
\LessThan10~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~1_cout\ = CARRY((!\bg_hstop~34_combout\ & hposition(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~34_combout\,
	datab => hposition(0),
	datad => VCC,
	cout => \LessThan10~1_cout\);

-- Location: LCCOMB_X31_Y24_N4
\LessThan10~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~3_cout\ = CARRY((hposition(1) & (\bg_hstop~33_combout\ & !\LessThan10~1_cout\)) # (!hposition(1) & ((\bg_hstop~33_combout\) # (!\LessThan10~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => \bg_hstop~33_combout\,
	datad => VCC,
	cin => \LessThan10~1_cout\,
	cout => \LessThan10~3_cout\);

-- Location: LCCOMB_X31_Y24_N6
\LessThan10~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~5_cout\ = CARRY((\bg_hstop~32_combout\ & (hposition(2) & !\LessThan10~3_cout\)) # (!\bg_hstop~32_combout\ & ((hposition(2)) # (!\LessThan10~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~32_combout\,
	datab => hposition(2),
	datad => VCC,
	cin => \LessThan10~3_cout\,
	cout => \LessThan10~5_cout\);

-- Location: LCCOMB_X31_Y24_N8
\LessThan10~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~7_cout\ = CARRY((hposition(3) & (\bg_hstop~31_combout\ & !\LessThan10~5_cout\)) # (!hposition(3) & ((\bg_hstop~31_combout\) # (!\LessThan10~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \bg_hstop~31_combout\,
	datad => VCC,
	cin => \LessThan10~5_cout\,
	cout => \LessThan10~7_cout\);

-- Location: LCCOMB_X31_Y24_N10
\LessThan10~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~9_cout\ = CARRY((hposition(4) & ((!\LessThan10~7_cout\) # (!\bg_hstop~30_combout\))) # (!hposition(4) & (!\bg_hstop~30_combout\ & !\LessThan10~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \bg_hstop~30_combout\,
	datad => VCC,
	cin => \LessThan10~7_cout\,
	cout => \LessThan10~9_cout\);

-- Location: LCCOMB_X31_Y24_N12
\LessThan10~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~11_cout\ = CARRY((hposition(5) & (\bg_hstop~29_combout\ & !\LessThan10~9_cout\)) # (!hposition(5) & ((\bg_hstop~29_combout\) # (!\LessThan10~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datab => \bg_hstop~29_combout\,
	datad => VCC,
	cin => \LessThan10~9_cout\,
	cout => \LessThan10~11_cout\);

-- Location: LCCOMB_X31_Y24_N14
\LessThan10~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~13_cout\ = CARRY((\bg_hstop~37_combout\ & (hposition(6) & !\LessThan10~11_cout\)) # (!\bg_hstop~37_combout\ & ((hposition(6)) # (!\LessThan10~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~37_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan10~11_cout\,
	cout => \LessThan10~13_cout\);

-- Location: LCCOMB_X31_Y24_N16
\LessThan10~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~15_cout\ = CARRY((\bg_hstop~36_combout\ & ((!\LessThan10~13_cout\) # (!hposition(7)))) # (!\bg_hstop~36_combout\ & (!hposition(7) & !\LessThan10~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~36_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan10~13_cout\,
	cout => \LessThan10~15_cout\);

-- Location: LCCOMB_X31_Y24_N18
\LessThan10~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~17_cout\ = CARRY((\bg_hstop~35_combout\ & (hposition(8) & !\LessThan10~15_cout\)) # (!\bg_hstop~35_combout\ & ((hposition(8)) # (!\LessThan10~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~35_combout\,
	datab => hposition(8),
	datad => VCC,
	cin => \LessThan10~15_cout\,
	cout => \LessThan10~17_cout\);

-- Location: LCCOMB_X31_Y24_N20
\LessThan10~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~19_cout\ = CARRY((hposition(9) & (\bg_hstop~28_combout\ & !\LessThan10~17_cout\)) # (!hposition(9) & ((\bg_hstop~28_combout\) # (!\LessThan10~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => \bg_hstop~28_combout\,
	datad => VCC,
	cin => \LessThan10~17_cout\,
	cout => \LessThan10~19_cout\);

-- Location: LCCOMB_X31_Y24_N22
\LessThan10~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~21_cout\ = CARRY((\bg_hstop~27_combout\ & (hposition(10) & !\LessThan10~19_cout\)) # (!\bg_hstop~27_combout\ & ((hposition(10)) # (!\LessThan10~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~27_combout\,
	datab => hposition(10),
	datad => VCC,
	cin => \LessThan10~19_cout\,
	cout => \LessThan10~21_cout\);

-- Location: LCCOMB_X31_Y24_N24
\LessThan10~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~23_cout\ = CARRY((hposition(11) & (\bg_hstop~26_combout\ & !\LessThan10~21_cout\)) # (!hposition(11) & ((\bg_hstop~26_combout\) # (!\LessThan10~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \bg_hstop~26_combout\,
	datad => VCC,
	cin => \LessThan10~21_cout\,
	cout => \LessThan10~23_cout\);

-- Location: LCCOMB_X31_Y24_N26
\LessThan10~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~25_cout\ = CARRY((\bg_hstop~25_combout\ & (hposition(12) & !\LessThan10~23_cout\)) # (!\bg_hstop~25_combout\ & ((hposition(12)) # (!\LessThan10~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~25_combout\,
	datab => hposition(12),
	datad => VCC,
	cin => \LessThan10~23_cout\,
	cout => \LessThan10~25_cout\);

-- Location: LCCOMB_X31_Y24_N28
\LessThan10~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~27_cout\ = CARRY((\bg_hstop~24_combout\ & ((!\LessThan10~25_cout\) # (!hposition(13)))) # (!\bg_hstop~24_combout\ & (!hposition(13) & !\LessThan10~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~24_combout\,
	datab => hposition(13),
	datad => VCC,
	cin => \LessThan10~25_cout\,
	cout => \LessThan10~27_cout\);

-- Location: LCCOMB_X31_Y24_N30
\LessThan10~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~29_cout\ = CARRY((\bg_hstop~23_combout\ & (hposition(14) & !\LessThan10~27_cout\)) # (!\bg_hstop~23_combout\ & ((hposition(14)) # (!\LessThan10~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~23_combout\,
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan10~27_cout\,
	cout => \LessThan10~29_cout\);

-- Location: LCCOMB_X31_Y23_N0
\LessThan10~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~31_cout\ = CARRY((hposition(15) & (\bg_hstop~22_combout\ & !\LessThan10~29_cout\)) # (!hposition(15) & ((\bg_hstop~22_combout\) # (!\LessThan10~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datab => \bg_hstop~22_combout\,
	datad => VCC,
	cin => \LessThan10~29_cout\,
	cout => \LessThan10~31_cout\);

-- Location: LCCOMB_X31_Y23_N2
\LessThan10~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~33_cout\ = CARRY((hposition(16) & ((!\LessThan10~31_cout\) # (!\bg_hstop~21_combout\))) # (!hposition(16) & (!\bg_hstop~21_combout\ & !\LessThan10~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(16),
	datab => \bg_hstop~21_combout\,
	datad => VCC,
	cin => \LessThan10~31_cout\,
	cout => \LessThan10~33_cout\);

-- Location: LCCOMB_X31_Y23_N4
\LessThan10~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~35_cout\ = CARRY((\bg_hstop~20_combout\ & ((!\LessThan10~33_cout\) # (!hposition(17)))) # (!\bg_hstop~20_combout\ & (!hposition(17) & !\LessThan10~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~20_combout\,
	datab => hposition(17),
	datad => VCC,
	cin => \LessThan10~33_cout\,
	cout => \LessThan10~35_cout\);

-- Location: LCCOMB_X31_Y23_N6
\LessThan10~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~37_cout\ = CARRY((hposition(18) & ((!\LessThan10~35_cout\) # (!\bg_hstop~19_combout\))) # (!hposition(18) & (!\bg_hstop~19_combout\ & !\LessThan10~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(18),
	datab => \bg_hstop~19_combout\,
	datad => VCC,
	cin => \LessThan10~35_cout\,
	cout => \LessThan10~37_cout\);

-- Location: LCCOMB_X31_Y23_N8
\LessThan10~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~39_cout\ = CARRY((\bg_hstop~18_combout\ & ((!\LessThan10~37_cout\) # (!hposition(19)))) # (!\bg_hstop~18_combout\ & (!hposition(19) & !\LessThan10~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~18_combout\,
	datab => hposition(19),
	datad => VCC,
	cin => \LessThan10~37_cout\,
	cout => \LessThan10~39_cout\);

-- Location: LCCOMB_X31_Y23_N10
\LessThan10~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~41_cout\ = CARRY((\bg_hstop~17_combout\ & (hposition(20) & !\LessThan10~39_cout\)) # (!\bg_hstop~17_combout\ & ((hposition(20)) # (!\LessThan10~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~17_combout\,
	datab => hposition(20),
	datad => VCC,
	cin => \LessThan10~39_cout\,
	cout => \LessThan10~41_cout\);

-- Location: LCCOMB_X31_Y23_N12
\LessThan10~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~43_cout\ = CARRY((hposition(21) & (\bg_hstop~16_combout\ & !\LessThan10~41_cout\)) # (!hposition(21) & ((\bg_hstop~16_combout\) # (!\LessThan10~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => \bg_hstop~16_combout\,
	datad => VCC,
	cin => \LessThan10~41_cout\,
	cout => \LessThan10~43_cout\);

-- Location: LCCOMB_X31_Y23_N14
\LessThan10~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~45_cout\ = CARRY((hposition(22) & ((!\LessThan10~43_cout\) # (!\bg_hstop~15_combout\))) # (!hposition(22) & (!\bg_hstop~15_combout\ & !\LessThan10~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(22),
	datab => \bg_hstop~15_combout\,
	datad => VCC,
	cin => \LessThan10~43_cout\,
	cout => \LessThan10~45_cout\);

-- Location: LCCOMB_X31_Y23_N16
\LessThan10~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~47_cout\ = CARRY((\bg_hstop~14_combout\ & ((!\LessThan10~45_cout\) # (!hposition(23)))) # (!\bg_hstop~14_combout\ & (!hposition(23) & !\LessThan10~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~14_combout\,
	datab => hposition(23),
	datad => VCC,
	cin => \LessThan10~45_cout\,
	cout => \LessThan10~47_cout\);

-- Location: LCCOMB_X31_Y23_N18
\LessThan10~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~49_cout\ = CARRY((\bg_hstop~13_combout\ & (hposition(24) & !\LessThan10~47_cout\)) # (!\bg_hstop~13_combout\ & ((hposition(24)) # (!\LessThan10~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~13_combout\,
	datab => hposition(24),
	datad => VCC,
	cin => \LessThan10~47_cout\,
	cout => \LessThan10~49_cout\);

-- Location: LCCOMB_X31_Y23_N20
\LessThan10~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~51_cout\ = CARRY((hposition(25) & (\bg_hstop~12_combout\ & !\LessThan10~49_cout\)) # (!hposition(25) & ((\bg_hstop~12_combout\) # (!\LessThan10~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(25),
	datab => \bg_hstop~12_combout\,
	datad => VCC,
	cin => \LessThan10~49_cout\,
	cout => \LessThan10~51_cout\);

-- Location: LCCOMB_X31_Y23_N22
\LessThan10~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~53_cout\ = CARRY((\bg_hstop~11_combout\ & (hposition(26) & !\LessThan10~51_cout\)) # (!\bg_hstop~11_combout\ & ((hposition(26)) # (!\LessThan10~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~11_combout\,
	datab => hposition(26),
	datad => VCC,
	cin => \LessThan10~51_cout\,
	cout => \LessThan10~53_cout\);

-- Location: LCCOMB_X31_Y23_N24
\LessThan10~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~55_cout\ = CARRY((hposition(27) & (\bg_hstop~10_combout\ & !\LessThan10~53_cout\)) # (!hposition(27) & ((\bg_hstop~10_combout\) # (!\LessThan10~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => \bg_hstop~10_combout\,
	datad => VCC,
	cin => \LessThan10~53_cout\,
	cout => \LessThan10~55_cout\);

-- Location: LCCOMB_X31_Y23_N26
\LessThan10~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~57_cout\ = CARRY((hposition(28) & ((!\LessThan10~55_cout\) # (!\bg_hstop~9_combout\))) # (!hposition(28) & (!\bg_hstop~9_combout\ & !\LessThan10~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => \bg_hstop~9_combout\,
	datad => VCC,
	cin => \LessThan10~55_cout\,
	cout => \LessThan10~57_cout\);

-- Location: LCCOMB_X31_Y23_N28
\LessThan10~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~59_cout\ = CARRY((\bg_hstop~8_combout\ & ((!\LessThan10~57_cout\) # (!hposition(29)))) # (!\bg_hstop~8_combout\ & (!hposition(29) & !\LessThan10~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~8_combout\,
	datab => hposition(29),
	datad => VCC,
	cin => \LessThan10~57_cout\,
	cout => \LessThan10~59_cout\);

-- Location: LCCOMB_X31_Y23_N30
\LessThan10~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan10~60_combout\ = (hposition(30) & ((!\bg_hstop~6_combout\) # (!\LessThan10~59_cout\))) # (!hposition(30) & (!\LessThan10~59_cout\ & !\bg_hstop~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(30),
	datad => \bg_hstop~6_combout\,
	cin => \LessThan10~59_cout\,
	combout => \LessThan10~60_combout\);

-- Location: LCCOMB_X31_Y20_N30
\process_0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~10_combout\ = (\process_0~9_combout\ & (\process_0~0_combout\ & (!\LessThan9~60_combout\ & !\LessThan10~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~9_combout\,
	datab => \process_0~0_combout\,
	datac => \LessThan9~60_combout\,
	datad => \LessThan10~60_combout\,
	combout => \process_0~10_combout\);

-- Location: FF_X30_Y20_N29
\bg_address[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[14]~16_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(14));

-- Location: FF_X30_Y20_N27
\bg_address[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[13]~14_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(13));

-- Location: LCCOMB_X35_Y20_N8
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\ = (!bg_address(14) & bg_address(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(14),
	datad => bg_address(13),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\);

-- Location: FF_X31_Y20_N1
\bg_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~0_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(0));

-- Location: FF_X31_Y20_N3
\bg_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~2_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(1));

-- Location: FF_X31_Y20_N5
\bg_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~4_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(2));

-- Location: FF_X31_Y20_N7
\bg_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~6_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(3));

-- Location: FF_X31_Y20_N9
\bg_address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~8_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(4));

-- Location: FF_X31_Y20_N11
\bg_address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~10_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(5));

-- Location: FF_X31_Y20_N13
\bg_address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~12_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(6));

-- Location: FF_X31_Y20_N15
\bg_address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~14_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(7));

-- Location: FF_X31_Y20_N17
\bg_address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add16~16_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(8));

-- Location: FF_X30_Y20_N19
\bg_address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[9]~6_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(9));

-- Location: FF_X30_Y20_N21
\bg_address[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[10]~8_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(10));

-- Location: FF_X30_Y20_N23
\bg_address[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[11]~10_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(11));

-- Location: FF_X30_Y20_N25
\bg_address[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[12]~12_combout\,
	ena => \process_0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(12));

-- Location: M9K_X33_Y27_N0
\bgread|altsyncram_component|auto_generated|ram_block1a20\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a20_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a20_PORTADATAOUT_bus\);

-- Location: LCCOMB_X35_Y20_N10
\bgread|altsyncram_component|auto_generated|address_reg_a[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|address_reg_a[0]~feeder_combout\ = bg_address(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => bg_address(13),
	combout => \bgread|altsyncram_component|auto_generated|address_reg_a[0]~feeder_combout\);

-- Location: FF_X35_Y20_N11
\bgread|altsyncram_component|auto_generated|address_reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bgread|altsyncram_component|auto_generated|address_reg_a[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|address_reg_a\(0));

-- Location: FF_X34_Y20_N5
\bgread|altsyncram_component|auto_generated|out_address_reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bgread|altsyncram_component|auto_generated|address_reg_a\(0),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0));

-- Location: LCCOMB_X35_Y20_N26
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\ = (bg_address(14) & bg_address(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(14),
	datad => bg_address(13),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\);

-- Location: M9K_X53_Y14_N0
\bgread|altsyncram_component|auto_generated|ram_block1a44\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a44_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a44_PORTADATAOUT_bus\);

-- Location: FF_X35_Y20_N15
\bgread|altsyncram_component|auto_generated|address_reg_a[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => bg_address(14),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|address_reg_a\(1));

-- Location: LCCOMB_X36_Y20_N6
\bgread|altsyncram_component|auto_generated|out_address_reg_a[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|out_address_reg_a[1]~feeder_combout\ = \bgread|altsyncram_component|auto_generated|address_reg_a\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bgread|altsyncram_component|auto_generated|address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|out_address_reg_a[1]~feeder_combout\);

-- Location: FF_X36_Y20_N7
\bgread|altsyncram_component|auto_generated|out_address_reg_a[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bgread|altsyncram_component|auto_generated|out_address_reg_a[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1));

-- Location: LCCOMB_X35_Y20_N28
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\ = (bg_address(14) & !bg_address(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(14),
	datad => bg_address(13),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\);

-- Location: M9K_X5_Y17_N0
\bgread|altsyncram_component|auto_generated|ram_block1a32\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a32_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a32_PORTADATAOUT_bus\);

-- Location: LCCOMB_X35_Y20_N4
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2) = (!bg_address(14) & !bg_address(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(14),
	datad => bg_address(13),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2));

-- Location: M9K_X53_Y17_N0
\bgread|altsyncram_component|auto_generated|ram_block1a8\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 8,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a8_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a8_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N18
\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\);

-- Location: LCCOMB_X32_Y16_N28
\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\);

-- Location: LCCOMB_X30_Y17_N10
\LessThan13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan13~0_combout\ = (!vposition(5) & (!vposition(6) & (!vposition(7) & !vposition(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datab => vposition(6),
	datac => vposition(7),
	datad => vposition(4),
	combout => \LessThan13~0_combout\);

-- Location: LCCOMB_X31_Y18_N18
\process_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~1_combout\ = (vposition(8) & ((hposition(8)) # ((hposition(9)) # (hposition(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(8),
	datab => hposition(8),
	datac => hposition(9),
	datad => hposition(10),
	combout => \process_0~1_combout\);

-- Location: LCCOMB_X31_Y18_N26
\LessThan15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan15~0_combout\ = (!hposition(10) & (!hposition(6) & (!hposition(9) & !hposition(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => hposition(6),
	datac => hposition(9),
	datad => hposition(7),
	combout => \LessThan15~0_combout\);

-- Location: LCCOMB_X31_Y18_N8
\process_0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~3_combout\ = (\LessThan13~0_combout\ & (\process_0~1_combout\ & (!\LessThan15~0_combout\ & !\process_0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan13~0_combout\,
	datab => \process_0~1_combout\,
	datac => \LessThan15~0_combout\,
	datad => \process_0~2_combout\,
	combout => \process_0~3_combout\);

-- Location: LCCOMB_X31_Y18_N6
\process_0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~4_combout\ = (!vposition(2) & (!vposition(3) & (\process_0~3_combout\ & \LessThan3~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => vposition(3),
	datac => \process_0~3_combout\,
	datad => \LessThan3~6_combout\,
	combout => \process_0~4_combout\);

-- Location: LCCOMB_X31_Y18_N16
\LessThan16~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan16~0_combout\ = (hposition(2)) # ((hposition(1)) # ((hposition(0)) # (hposition(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => hposition(1),
	datac => hposition(0),
	datad => hposition(3),
	combout => \LessThan16~0_combout\);

-- Location: LCCOMB_X31_Y18_N10
\LessThan16~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan16~1_combout\ = (hposition(6) & ((hposition(4)) # ((\LessThan16~0_combout\) # (hposition(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \LessThan16~0_combout\,
	datac => hposition(5),
	datad => hposition(6),
	combout => \LessThan16~1_combout\);

-- Location: LCCOMB_X31_Y18_N28
\LessThan16~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan16~2_combout\ = (hposition(9)) # ((hposition(8) & ((\LessThan16~1_combout\) # (hposition(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan16~1_combout\,
	datab => hposition(8),
	datac => hposition(9),
	datad => hposition(7),
	combout => \LessThan16~2_combout\);

-- Location: LCCOMB_X31_Y18_N22
\process_0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~5_combout\ = (\process_0~4_combout\ & (\process_0~0_combout\ & ((!hposition(10)) # (!\LessThan16~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~4_combout\,
	datab => \LessThan16~2_combout\,
	datac => \process_0~0_combout\,
	datad => hposition(10),
	combout => \process_0~5_combout\);

-- Location: LCCOMB_X32_Y16_N24
\r~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~0_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \r~0_combout\);

-- Location: FF_X32_Y16_N25
\r[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[0]~reg0_q\);

-- Location: M9K_X33_Y25_N0
\bgread|altsyncram_component|auto_generated|ram_block1a21\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a21_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a21_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y25_N0
\bgread|altsyncram_component|auto_generated|ram_block1a9\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a9_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a9_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y20_N24
\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\);

-- Location: M9K_X33_Y9_N0
\bgread|altsyncram_component|auto_generated|ram_block1a45\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a45_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a45_PORTADATAOUT_bus\);

-- Location: M9K_X73_Y19_N0
\bgread|altsyncram_component|auto_generated|ram_block1a33\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a33_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a33_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y20_N18
\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\);

-- Location: LCCOMB_X36_Y20_N12
\r~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~1_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \r~1_combout\);

-- Location: FF_X36_Y20_N13
\r[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[1]~reg0_q\);

-- Location: M9K_X53_Y9_N0
\bgread|altsyncram_component|auto_generated|ram_block1a46\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a46_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a46_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y18_N0
\bgread|altsyncram_component|auto_generated|ram_block1a22\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a22_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a22_PORTADATAOUT_bus\);

-- Location: M9K_X5_Y12_N0
\bgread|altsyncram_component|auto_generated|ram_block1a34\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a34_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a34_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y14_N0
\bgread|altsyncram_component|auto_generated|ram_block1a10\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 10,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a10_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a10_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N2
\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\);

-- Location: LCCOMB_X32_Y16_N0
\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\);

-- Location: LCCOMB_X32_Y16_N26
\r~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~2_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \r~2_combout\);

-- Location: FF_X32_Y16_N27
\r[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[2]~reg0_q\);

-- Location: M9K_X33_Y29_N0
\bgread|altsyncram_component|auto_generated|ram_block1a23\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a23_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a23_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y20_N0
\bgread|altsyncram_component|auto_generated|ram_block1a11\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a11_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a11_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y20_N28
\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\);

-- Location: M9K_X73_Y21_N0
\bgread|altsyncram_component|auto_generated|ram_block1a47\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a47_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a47_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y22_N0
\bgread|altsyncram_component|auto_generated|ram_block1a35\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 11,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a35_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a35_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y20_N26
\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\);

-- Location: LCCOMB_X36_Y20_N10
\r~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~3_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \r~3_combout\);

-- Location: FF_X36_Y20_N11
\r[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[3]~reg0_q\);

-- Location: M9K_X33_Y16_N0
\bgread|altsyncram_component|auto_generated|ram_block1a4\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a4_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a4_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y12_N0
\bgread|altsyncram_component|auto_generated|ram_block1a28\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a28_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a28_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N10
\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\);

-- Location: M9K_X5_Y15_N0
\bgread|altsyncram_component|auto_generated|ram_block1a16\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y11_N0
\bgread|altsyncram_component|auto_generated|ram_block1a40\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 4,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a40_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a40_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N4
\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\);

-- Location: LCCOMB_X32_Y16_N16
\g~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~0_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \g~0_combout\);

-- Location: FF_X32_Y16_N17
\g[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[0]~reg0_q\);

-- Location: M9K_X53_Y19_N0
\bgread|altsyncram_component|auto_generated|ram_block1a29\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a29_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a29_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y21_N0
\bgread|altsyncram_component|auto_generated|ram_block1a41\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a41_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a41_PORTADATAOUT_bus\);

-- Location: M9K_X5_Y27_N0
\bgread|altsyncram_component|auto_generated|ram_block1a17\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a17_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a17_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y26_N0
\bgread|altsyncram_component|auto_generated|ram_block1a5\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 5,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a5_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a5_PORTADATAOUT_bus\);

-- Location: LCCOMB_X36_Y20_N16
\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\);

-- Location: LCCOMB_X36_Y20_N22
\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\);

-- Location: LCCOMB_X36_Y20_N20
\g~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~1_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \g~1_combout\);

-- Location: FF_X36_Y20_N21
\g[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[1]~reg0_q\);

-- Location: M9K_X33_Y15_N0
\bgread|altsyncram_component|auto_generated|ram_block1a6\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a6_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a6_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y13_N0
\bgread|altsyncram_component|auto_generated|ram_block1a30\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a30_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a30_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N6
\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\ & 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\);

-- Location: M9K_X5_Y18_N0
\bgread|altsyncram_component|auto_generated|ram_block1a18\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a18_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a18_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y12_N0
\bgread|altsyncram_component|auto_generated|ram_block1a42\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 6,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a42_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a42_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N8
\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a42~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a18~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a18~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a42~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\);

-- Location: LCCOMB_X32_Y16_N30
\g~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~2_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \g~2_combout\);

-- Location: FF_X32_Y16_N31
\g[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[2]~reg0_q\);

-- Location: M9K_X33_Y26_N0
\bgread|altsyncram_component|auto_generated|ram_block1a19\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a19_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a19_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y20_N0
\bgread|altsyncram_component|auto_generated|ram_block1a7\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a7_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a7_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N22
\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\);

-- Location: M9K_X33_Y22_N0
\bgread|altsyncram_component|auto_generated|ram_block1a31\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a31_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a31_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y19_N0
\bgread|altsyncram_component|auto_generated|ram_block1a43\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 7,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a43_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a43_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N0
\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\ & 
-- (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\,
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\);

-- Location: LCCOMB_X34_Y20_N24
\g~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~3_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~5_combout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\,
	datac => \process_0~10_combout\,
	combout => \g~3_combout\);

-- Location: FF_X34_Y20_N25
\g[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[3]~reg0_q\);

-- Location: M9K_X33_Y17_N0
\bgread|altsyncram_component|auto_generated|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y16_N0
\bgread|altsyncram_component|auto_generated|ram_block1a24\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a24_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a24_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N22
\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\);

-- Location: M9K_X33_Y11_N0
\bgread|altsyncram_component|auto_generated|ram_block1a36\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a36_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a36_PORTADATAOUT_bus\);

-- Location: M9K_X5_Y16_N0
\bgread|altsyncram_component|auto_generated|ram_block1a12\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a12_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a12_PORTADATAOUT_bus\);

-- Location: LCCOMB_X32_Y16_N20
\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\) # 
-- ((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- \bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\,
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\);

-- Location: LCCOMB_X32_Y16_N12
\b~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~0_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\,
	datac => \process_0~5_combout\,
	datad => \process_0~10_combout\,
	combout => \b~0_combout\);

-- Location: FF_X32_Y16_N13
\b[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[0]~reg0_q\);

-- Location: M9K_X33_Y13_N0
\bgread|altsyncram_component|auto_generated|ram_block1a25\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a25_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a25_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y28_N0
\bgread|altsyncram_component|auto_generated|ram_block1a13\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a13_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a13_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y23_N0
\bgread|altsyncram_component|auto_generated|ram_block1a1\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a1_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a1_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N30
\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\);

-- Location: M9K_X73_Y20_N0
\bgread|altsyncram_component|auto_generated|ram_block1a37\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 1,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a37_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a37_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N8
\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a37~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a25~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a25~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a37~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\);

-- Location: LCCOMB_X34_Y20_N18
\b~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~1_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~5_combout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\,
	datac => \process_0~10_combout\,
	combout => \b~1_combout\);

-- Location: FF_X34_Y20_N19
\b[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[1]~reg0_q\);

-- Location: M9K_X33_Y21_N0
\bgread|altsyncram_component|auto_generated|ram_block1a38\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a38_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a38_PORTADATAOUT_bus\);

-- Location: M9K_X33_Y23_N0
\bgread|altsyncram_component|auto_generated|ram_block1a2\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a2_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a2_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y24_N0
\bgread|altsyncram_component|auto_generated|ram_block1a26\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a26_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a26_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N26
\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\);

-- Location: M9K_X33_Y10_N0
\bgread|altsyncram_component|auto_generated|ram_block1a14\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 2,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a14_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a14_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N16
\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\);

-- Location: LCCOMB_X34_Y20_N20
\b~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~2_combout\ = (\process_0~5_combout\) # ((\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\ & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~5_combout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\,
	datac => \process_0~10_combout\,
	combout => \b~2_combout\);

-- Location: FF_X34_Y20_N21
\b[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[2]~reg0_q\);

-- Location: M9K_X5_Y20_N0
\bgread|altsyncram_component|auto_generated|ram_block1a15\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"0000000FFFFC000007C00000000000000000000001F000000000000000000000000000000000000000000000000000FC0000000000000000000000000000000000000000000000000000000000000000000000007E0000000000000000000000000000000000000001000000000001000000000000000000000000000000000000000000000000FF006000000000000000000007800000000003F0000000000000000000000000000000003F800000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020004000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FC10000000000000000010000000000000000000000000000000000300000000000000",
	mem_init1 => X"00000000000000000000000000004000002000000000000000000000000000000000002000000000000000000000000000000200000004000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FF00003C00000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0FC0000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000010000080001800000000000000000000000000000000000000000000000000000000000000001E000000000000000000000000000000000000000000000000001000000000100000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a15_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a15_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y18_N0
\bgread|altsyncram_component|auto_generated|ram_block1a3\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000001800000000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018000000",
	mem_init2 => X"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003FFFE00000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001FE000001F00000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000C000000000000000100001E00000000000000000000000000000000000000000000000000000000000000001000400000000200300000000000000000000C0010000000000000000180007000000000",
	mem_init1 => X"000000000000000000000000000000000000000000000000000000001800800000000300200000000000000000000400200000000000000000600040000000000000000000000100000000000000000000000000000000000000000008018000000001006000000000000000000006002000000000000000002000C000000000000000000000018000000000000000000000000000000000000000000C02000000000181C000000000000000000003004000000000000000003801800000000000000000000000801E0000000000000000000000000000000000000004020000000000FF000000000000000000000100C000000000000000000C030000000000",
	mem_init0 => X"0000000000000080E000000000000000000000000000000000000000060C0000000000000000000000000000000001FF80000000000000000007FE000000000000000000000000C1000000000000000000000000000000000000000001F80000000000000000000000000000000000000000000000000000000000000000000000000000000000420000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2),
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a3_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a3_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N10
\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\) # 
-- ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & 
-- \bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\);

-- Location: M9K_X33_Y24_N0
\bgread|altsyncram_component|auto_generated|ram_block1a27\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"0000000000000001C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"000000000000000000000000000000000020000000002000000000000000000000004000000000000000000000000000000000000003E00000000000000000000000000000000000000000000000000000200000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000C000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000070000000000000000000F00000000000000000000000000000003FFE0000000000000000200000000000000000000000000780000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a27_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a27_PORTADATAOUT_bus\);

-- Location: M9K_X53_Y15_N0
\bgread|altsyncram_component|auto_generated|ram_block1a39\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "../mif/bg4_512x40.mif",
	init_file_layout => "port_a",
	logical_ram_name => "bg_spry:bgread|altsyncram:altsyncram_component|altsyncram_l9r3:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 13,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 1,
	port_a_first_address => 0,
	port_a_first_bit_number => 3,
	port_a_last_address => 8191,
	port_a_logical_ram_depth => 32768,
	port_a_logical_ram_width => 12,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 13,
	port_b_data_width => 1,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	ena0 => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\,
	portaaddr => \bgread|altsyncram_component|auto_generated|ram_block1a39_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \bgread|altsyncram_component|auto_generated|ram_block1a39_PORTADATAOUT_bus\);

-- Location: LCCOMB_X34_Y20_N12
\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\);

-- Location: LCCOMB_X34_Y20_N6
\b~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~3_combout\ = (\process_0~5_combout\) # ((\process_0~10_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~5_combout\,
	datac => \process_0~10_combout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\,
	combout => \b~3_combout\);

-- Location: FF_X34_Y20_N7
\b[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[3]~reg0_q\);

-- Location: LCCOMB_X31_Y18_N24
\process_0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~13_combout\ = (!hposition(6) & (!hposition(7) & ((!hposition(3)) # (!hposition(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => hposition(6),
	datac => hposition(3),
	datad => hposition(7),
	combout => \process_0~13_combout\);

-- Location: LCCOMB_X31_Y18_N12
\process_0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~11_combout\ = (hposition(31)) # ((hposition(7) & ((hposition(6)) # (hposition(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(31),
	datab => hposition(6),
	datac => hposition(5),
	datad => hposition(7),
	combout => \process_0~11_combout\);

-- Location: LCCOMB_X31_Y18_N2
\process_0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~12_combout\ = (\process_0~11_combout\) # ((hposition(8)) # ((hposition(9)) # (hposition(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~11_combout\,
	datab => hposition(8),
	datac => hposition(9),
	datad => hposition(10),
	combout => \process_0~12_combout\);

-- Location: LCCOMB_X31_Y18_N4
\process_0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~14_combout\ = ((\process_0~12_combout\) # ((\process_0~13_combout\ & !hposition(5)))) # (!\LessThan3~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~6_combout\,
	datab => \process_0~13_combout\,
	datac => hposition(5),
	datad => \process_0~12_combout\,
	combout => \process_0~14_combout\);

-- Location: FF_X31_Y18_N5
\hsync~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \process_0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hsync~reg0_q\);

-- Location: LCCOMB_X30_Y20_N16
\process_0~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~15_combout\ = (vposition(2) & (vposition(3))) # (!vposition(2) & ((vposition(3) & ((vposition(0)) # (vposition(1)))) # (!vposition(3) & ((!vposition(1)) # (!vposition(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => vposition(3),
	datac => vposition(0),
	datad => vposition(1),
	combout => \process_0~15_combout\);

-- Location: LCCOMB_X30_Y17_N16
\process_0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~16_combout\ = (vposition(9)) # ((\process_0~15_combout\) # ((vposition(8)) # (!\LessThan13~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(9),
	datab => \process_0~15_combout\,
	datac => vposition(8),
	datad => \LessThan13~0_combout\,
	combout => \process_0~16_combout\);

-- Location: LCCOMB_X30_Y17_N4
\process_0~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~17_combout\ = (vposition(31)) # ((\process_0~16_combout\) # (!\LessThan4~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => vposition(31),
	datac => \LessThan4~6_combout\,
	datad => \process_0~16_combout\,
	combout => \process_0~17_combout\);

-- Location: FF_X30_Y17_N5
\vsync~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \process_0~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \vsync~reg0_q\);

-- Location: IOIBUF_X51_Y54_N29
\chooseRes~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_chooseRes,
	o => \chooseRes~input_o\);

-- Location: IOIBUF_X60_Y54_N8
\moveleft~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_moveleft,
	o => \moveleft~input_o\);

-- Location: IOIBUF_X0_Y35_N22
\moveright~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_moveright,
	o => \moveright~input_o\);

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
END structure;


