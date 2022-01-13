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

-- DATE "01/13/2022 22:52:35"

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
	moveUp : IN std_logic;
	moveDown : IN std_logic;
	r : OUT std_logic_vector(3 DOWNTO 0);
	g : OUT std_logic_vector(3 DOWNTO 0);
	b : OUT std_logic_vector(3 DOWNTO 0);
	hsync : OUT std_logic;
	vsync : OUT std_logic
	);
END vga_lab1;

-- Design Ports Information
-- chooseRes	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- moveDown	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
-- moveUp	=>  Location: PIN_C11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
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
SIGNAL ww_moveUp : std_logic;
SIGNAL ww_moveDown : std_logic;
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
SIGNAL \moveDown~input_o\ : std_logic;
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
SIGNAL \LessThan25~1_combout\ : std_logic;
SIGNAL \LessThan6~2_combout\ : std_logic;
SIGNAL \LessThan6~3_combout\ : std_logic;
SIGNAL \LessThan6~4_combout\ : std_logic;
SIGNAL \LessThan23~3_combout\ : std_logic;
SIGNAL \LessThan23~0_combout\ : std_logic;
SIGNAL \LessThan23~1_combout\ : std_logic;
SIGNAL \LessThan23~2_combout\ : std_logic;
SIGNAL \LessThan23~4_combout\ : std_logic;
SIGNAL \LessThan6~0_combout\ : std_logic;
SIGNAL \LessThan6~1_combout\ : std_logic;
SIGNAL \LessThan6~5_combout\ : std_logic;
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
SIGNAL \LessThan5~2_combout\ : std_logic;
SIGNAL \LessThan5~1_combout\ : std_logic;
SIGNAL \LessThan5~3_combout\ : std_logic;
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
SIGNAL \hposition[26]~85\ : std_logic;
SIGNAL \hposition[27]~86_combout\ : std_logic;
SIGNAL \hposition[27]~87\ : std_logic;
SIGNAL \hposition[28]~88_combout\ : std_logic;
SIGNAL \hposition[28]~89\ : std_logic;
SIGNAL \hposition[29]~90_combout\ : std_logic;
SIGNAL \hposition[29]~91\ : std_logic;
SIGNAL \hposition[30]~92_combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \LessThan5~5_combout\ : std_logic;
SIGNAL \LessThan5~4_combout\ : std_logic;
SIGNAL \LessThan5~6_combout\ : std_logic;
SIGNAL \LessThan5~7_combout\ : std_logic;
SIGNAL \hposition[30]~93\ : std_logic;
SIGNAL \hposition[31]~94_combout\ : std_logic;
SIGNAL \LessThan5~8_combout\ : std_logic;
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
SIGNAL \vposition[5]~43\ : std_logic;
SIGNAL \vposition[6]~44_combout\ : std_logic;
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
SIGNAL \vposition[30]~93\ : std_logic;
SIGNAL \vposition[31]~94_combout\ : std_logic;
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \LessThan22~0_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \process_0~6_combout\ : std_logic;
SIGNAL \process_0~7_combout\ : std_logic;
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
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~3_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \Add15~61\ : std_logic;
SIGNAL \Add15~62_combout\ : std_logic;
SIGNAL \Add15~0_combout\ : std_logic;
SIGNAL \bg_hstop~31_combout\ : std_logic;
SIGNAL \Add15~1\ : std_logic;
SIGNAL \Add15~2_combout\ : std_logic;
SIGNAL \bg_hstop~30_combout\ : std_logic;
SIGNAL \Add15~3\ : std_logic;
SIGNAL \Add15~4_combout\ : std_logic;
SIGNAL \bg_hstop~29_combout\ : std_logic;
SIGNAL \Add15~5\ : std_logic;
SIGNAL \Add15~6_combout\ : std_logic;
SIGNAL \bg_hstop~28_combout\ : std_logic;
SIGNAL \Add15~7\ : std_logic;
SIGNAL \Add15~8_combout\ : std_logic;
SIGNAL \bg_hstop~27_combout\ : std_logic;
SIGNAL \Add15~9\ : std_logic;
SIGNAL \Add15~10_combout\ : std_logic;
SIGNAL \bg_hstop~26_combout\ : std_logic;
SIGNAL \Add15~11\ : std_logic;
SIGNAL \Add15~12_combout\ : std_logic;
SIGNAL \Add15~64_combout\ : std_logic;
SIGNAL \bg_hstop~25_combout\ : std_logic;
SIGNAL \Add15~13\ : std_logic;
SIGNAL \Add15~14_combout\ : std_logic;
SIGNAL \LessThan2~19_combout\ : std_logic;
SIGNAL \bg_hstop~24_combout\ : std_logic;
SIGNAL \Add15~15\ : std_logic;
SIGNAL \Add15~16_combout\ : std_logic;
SIGNAL \bg_hstop~1_combout\ : std_logic;
SIGNAL \bg_hstop~23_combout\ : std_logic;
SIGNAL \Add15~17\ : std_logic;
SIGNAL \Add15~18_combout\ : std_logic;
SIGNAL \bg_hstop~22_combout\ : std_logic;
SIGNAL \LessThan2~17_combout\ : std_logic;
SIGNAL \LessThan2~18_combout\ : std_logic;
SIGNAL \LessThan2~15_combout\ : std_logic;
SIGNAL \LessThan2~16_combout\ : std_logic;
SIGNAL \LessThan2~20_combout\ : std_logic;
SIGNAL \LessThan2~21_combout\ : std_logic;
SIGNAL \LessThan2~9_combout\ : std_logic;
SIGNAL \Add15~19\ : std_logic;
SIGNAL \Add15~20_combout\ : std_logic;
SIGNAL \bg_hstop~21_combout\ : std_logic;
SIGNAL \bg_hstop[10]~feeder_combout\ : std_logic;
SIGNAL \Add15~21\ : std_logic;
SIGNAL \Add15~22_combout\ : std_logic;
SIGNAL \bg_hstop~20_combout\ : std_logic;
SIGNAL \Add15~23\ : std_logic;
SIGNAL \Add15~24_combout\ : std_logic;
SIGNAL \bg_hstop~19_combout\ : std_logic;
SIGNAL \Add15~25\ : std_logic;
SIGNAL \Add15~26_combout\ : std_logic;
SIGNAL \bg_hstop~18_combout\ : std_logic;
SIGNAL \bg_hstop[13]~feeder_combout\ : std_logic;
SIGNAL \Add15~27\ : std_logic;
SIGNAL \Add15~28_combout\ : std_logic;
SIGNAL \bg_hstop~17_combout\ : std_logic;
SIGNAL \Add15~29\ : std_logic;
SIGNAL \Add15~30_combout\ : std_logic;
SIGNAL \bg_hstop~16_combout\ : std_logic;
SIGNAL \bg_hstop[15]~feeder_combout\ : std_logic;
SIGNAL \Add15~31\ : std_logic;
SIGNAL \Add15~32_combout\ : std_logic;
SIGNAL \bg_hstop~15_combout\ : std_logic;
SIGNAL \bg_hstop[16]~feeder_combout\ : std_logic;
SIGNAL \Add15~33\ : std_logic;
SIGNAL \Add15~34_combout\ : std_logic;
SIGNAL \bg_hstop~14_combout\ : std_logic;
SIGNAL \Add15~35\ : std_logic;
SIGNAL \Add15~36_combout\ : std_logic;
SIGNAL \bg_hstop~13_combout\ : std_logic;
SIGNAL \Add15~37\ : std_logic;
SIGNAL \Add15~38_combout\ : std_logic;
SIGNAL \bg_hstop~12_combout\ : std_logic;
SIGNAL \Add15~39\ : std_logic;
SIGNAL \Add15~40_combout\ : std_logic;
SIGNAL \bg_hstop~11_combout\ : std_logic;
SIGNAL \bg_hstop[20]~feeder_combout\ : std_logic;
SIGNAL \Add15~41\ : std_logic;
SIGNAL \Add15~42_combout\ : std_logic;
SIGNAL \bg_hstop~10_combout\ : std_logic;
SIGNAL \bg_hstop[21]~feeder_combout\ : std_logic;
SIGNAL \LessThan2~6_combout\ : std_logic;
SIGNAL \Add15~43\ : std_logic;
SIGNAL \Add15~44_combout\ : std_logic;
SIGNAL \bg_hstop~9_combout\ : std_logic;
SIGNAL \Add15~45\ : std_logic;
SIGNAL \Add15~46_combout\ : std_logic;
SIGNAL \bg_hstop~8_combout\ : std_logic;
SIGNAL \Add15~47\ : std_logic;
SIGNAL \Add15~48_combout\ : std_logic;
SIGNAL \bg_hstop~7_combout\ : std_logic;
SIGNAL \LessThan2~7_combout\ : std_logic;
SIGNAL \LessThan2~4_combout\ : std_logic;
SIGNAL \LessThan2~5_combout\ : std_logic;
SIGNAL \LessThan2~8_combout\ : std_logic;
SIGNAL \LessThan2~10_combout\ : std_logic;
SIGNAL \Add15~49\ : std_logic;
SIGNAL \Add15~50_combout\ : std_logic;
SIGNAL \LessThan2~11_combout\ : std_logic;
SIGNAL \LessThan2~12_combout\ : std_logic;
SIGNAL \LessThan2~13_combout\ : std_logic;
SIGNAL \LessThan2~14_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \LessThan2~22_combout\ : std_logic;
SIGNAL \LessThan2~23_combout\ : std_logic;
SIGNAL \bg_hstop~6_combout\ : std_logic;
SIGNAL \Add15~51\ : std_logic;
SIGNAL \Add15~52_combout\ : std_logic;
SIGNAL \bg_hstop~5_combout\ : std_logic;
SIGNAL \Add15~53\ : std_logic;
SIGNAL \Add15~54_combout\ : std_logic;
SIGNAL \bg_hstop~4_combout\ : std_logic;
SIGNAL \Add15~55\ : std_logic;
SIGNAL \Add15~56_combout\ : std_logic;
SIGNAL \bg_hstop~3_combout\ : std_logic;
SIGNAL \Add15~57\ : std_logic;
SIGNAL \Add15~58_combout\ : std_logic;
SIGNAL \bg_hstop~2_combout\ : std_logic;
SIGNAL \Add15~59\ : std_logic;
SIGNAL \Add15~60_combout\ : std_logic;
SIGNAL \bg_hstop~0_combout\ : std_logic;
SIGNAL \LessThan12~1_cout\ : std_logic;
SIGNAL \LessThan12~3_cout\ : std_logic;
SIGNAL \LessThan12~5_cout\ : std_logic;
SIGNAL \LessThan12~7_cout\ : std_logic;
SIGNAL \LessThan12~9_cout\ : std_logic;
SIGNAL \LessThan12~11_cout\ : std_logic;
SIGNAL \LessThan12~13_cout\ : std_logic;
SIGNAL \LessThan12~15_cout\ : std_logic;
SIGNAL \LessThan12~17_cout\ : std_logic;
SIGNAL \LessThan12~19_cout\ : std_logic;
SIGNAL \LessThan12~21_cout\ : std_logic;
SIGNAL \LessThan12~23_cout\ : std_logic;
SIGNAL \LessThan12~25_cout\ : std_logic;
SIGNAL \LessThan12~27_cout\ : std_logic;
SIGNAL \LessThan12~29_cout\ : std_logic;
SIGNAL \LessThan12~31_cout\ : std_logic;
SIGNAL \LessThan12~33_cout\ : std_logic;
SIGNAL \LessThan12~35_cout\ : std_logic;
SIGNAL \LessThan12~37_cout\ : std_logic;
SIGNAL \LessThan12~39_cout\ : std_logic;
SIGNAL \LessThan12~41_cout\ : std_logic;
SIGNAL \LessThan12~43_cout\ : std_logic;
SIGNAL \LessThan12~45_cout\ : std_logic;
SIGNAL \LessThan12~47_cout\ : std_logic;
SIGNAL \LessThan12~49_cout\ : std_logic;
SIGNAL \LessThan12~51_cout\ : std_logic;
SIGNAL \LessThan12~53_cout\ : std_logic;
SIGNAL \LessThan12~55_cout\ : std_logic;
SIGNAL \LessThan12~57_cout\ : std_logic;
SIGNAL \LessThan12~59_cout\ : std_logic;
SIGNAL \LessThan12~60_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \Add14~0_combout\ : std_logic;
SIGNAL \bg_hstart~32_combout\ : std_logic;
SIGNAL \Add14~1\ : std_logic;
SIGNAL \Add14~2_combout\ : std_logic;
SIGNAL \bg_hstart~31_combout\ : std_logic;
SIGNAL \Add14~3\ : std_logic;
SIGNAL \Add14~4_combout\ : std_logic;
SIGNAL \bg_hstart~30_combout\ : std_logic;
SIGNAL \Add14~5\ : std_logic;
SIGNAL \Add14~6_combout\ : std_logic;
SIGNAL \bg_hstart~29_combout\ : std_logic;
SIGNAL \Add14~7\ : std_logic;
SIGNAL \Add14~8_combout\ : std_logic;
SIGNAL \bg_hstart~28_combout\ : std_logic;
SIGNAL \Add14~9\ : std_logic;
SIGNAL \Add14~10_combout\ : std_logic;
SIGNAL \bg_hstart~27_combout\ : std_logic;
SIGNAL \bg_hstart[5]~feeder_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \Add14~11\ : std_logic;
SIGNAL \Add14~12_combout\ : std_logic;
SIGNAL \bg_hstart~34_combout\ : std_logic;
SIGNAL \Add14~65_combout\ : std_logic;
SIGNAL \Add14~13\ : std_logic;
SIGNAL \Add14~14_combout\ : std_logic;
SIGNAL \bg_hstart~26_combout\ : std_logic;
SIGNAL \Add14~15\ : std_logic;
SIGNAL \Add14~16_combout\ : std_logic;
SIGNAL \Add14~64_combout\ : std_logic;
SIGNAL \LessThan1~9_combout\ : std_logic;
SIGNAL \LessThan1~10_combout\ : std_logic;
SIGNAL \LessThan1~11_combout\ : std_logic;
SIGNAL \LessThan1~12_combout\ : std_logic;
SIGNAL \LessThan1~13_combout\ : std_logic;
SIGNAL \LessThan1~18_combout\ : std_logic;
SIGNAL \LessThan1~20_combout\ : std_logic;
SIGNAL \LessThan1~21_combout\ : std_logic;
SIGNAL \LessThan1~19_combout\ : std_logic;
SIGNAL \Add14~60_combout\ : std_logic;
SIGNAL \LessThan1~14_combout\ : std_logic;
SIGNAL \LessThan1~15_combout\ : std_logic;
SIGNAL \LessThan1~16_combout\ : std_logic;
SIGNAL \LessThan1~17_combout\ : std_logic;
SIGNAL \LessThan1~22_combout\ : std_logic;
SIGNAL \LessThan1~23_combout\ : std_logic;
SIGNAL \bg_hstart~33_combout\ : std_logic;
SIGNAL \bg_hstart[8]~feeder_combout\ : std_logic;
SIGNAL \Add14~17\ : std_logic;
SIGNAL \Add14~18_combout\ : std_logic;
SIGNAL \bg_hstart~25_combout\ : std_logic;
SIGNAL \Add14~19\ : std_logic;
SIGNAL \Add14~20_combout\ : std_logic;
SIGNAL \bg_hstart~24_combout\ : std_logic;
SIGNAL \Add14~21\ : std_logic;
SIGNAL \Add14~22_combout\ : std_logic;
SIGNAL \bg_hstart~23_combout\ : std_logic;
SIGNAL \bg_hstart[11]~feeder_combout\ : std_logic;
SIGNAL \Add14~23\ : std_logic;
SIGNAL \Add14~24_combout\ : std_logic;
SIGNAL \bg_hstart~22_combout\ : std_logic;
SIGNAL \Add14~25\ : std_logic;
SIGNAL \Add14~26_combout\ : std_logic;
SIGNAL \bg_hstart~21_combout\ : std_logic;
SIGNAL \bg_hstart[13]~feeder_combout\ : std_logic;
SIGNAL \Add14~27\ : std_logic;
SIGNAL \Add14~28_combout\ : std_logic;
SIGNAL \bg_hstart~20_combout\ : std_logic;
SIGNAL \Add14~29\ : std_logic;
SIGNAL \Add14~30_combout\ : std_logic;
SIGNAL \bg_hstart~19_combout\ : std_logic;
SIGNAL \bg_hstart[15]~feeder_combout\ : std_logic;
SIGNAL \Add14~31\ : std_logic;
SIGNAL \Add14~32_combout\ : std_logic;
SIGNAL \bg_hstart~18_combout\ : std_logic;
SIGNAL \bg_hstart[16]~feeder_combout\ : std_logic;
SIGNAL \Add14~33\ : std_logic;
SIGNAL \Add14~34_combout\ : std_logic;
SIGNAL \bg_hstart~17_combout\ : std_logic;
SIGNAL \Add14~35\ : std_logic;
SIGNAL \Add14~36_combout\ : std_logic;
SIGNAL \bg_hstart~16_combout\ : std_logic;
SIGNAL \Add14~37\ : std_logic;
SIGNAL \Add14~38_combout\ : std_logic;
SIGNAL \bg_hstart~15_combout\ : std_logic;
SIGNAL \Add14~39\ : std_logic;
SIGNAL \Add14~40_combout\ : std_logic;
SIGNAL \bg_hstart~14_combout\ : std_logic;
SIGNAL \Add14~41\ : std_logic;
SIGNAL \Add14~42_combout\ : std_logic;
SIGNAL \bg_hstart~13_combout\ : std_logic;
SIGNAL \Add14~43\ : std_logic;
SIGNAL \Add14~44_combout\ : std_logic;
SIGNAL \bg_hstart~12_combout\ : std_logic;
SIGNAL \Add14~45\ : std_logic;
SIGNAL \Add14~46_combout\ : std_logic;
SIGNAL \bg_hstart~11_combout\ : std_logic;
SIGNAL \Add14~47\ : std_logic;
SIGNAL \Add14~48_combout\ : std_logic;
SIGNAL \bg_hstart~10_combout\ : std_logic;
SIGNAL \Add14~49\ : std_logic;
SIGNAL \Add14~50_combout\ : std_logic;
SIGNAL \bg_hstart~9_combout\ : std_logic;
SIGNAL \Add14~51\ : std_logic;
SIGNAL \Add14~52_combout\ : std_logic;
SIGNAL \bg_hstart~8_combout\ : std_logic;
SIGNAL \Add14~53\ : std_logic;
SIGNAL \Add14~54_combout\ : std_logic;
SIGNAL \bg_hstart~7_combout\ : std_logic;
SIGNAL \Add14~55\ : std_logic;
SIGNAL \Add14~56_combout\ : std_logic;
SIGNAL \bg_hstart~6_combout\ : std_logic;
SIGNAL \Add14~57\ : std_logic;
SIGNAL \Add14~58_combout\ : std_logic;
SIGNAL \bg_hstart~5_combout\ : std_logic;
SIGNAL \Add14~59\ : std_logic;
SIGNAL \Add14~61\ : std_logic;
SIGNAL \Add14~62_combout\ : std_logic;
SIGNAL \bg_hstart~4_combout\ : std_logic;
SIGNAL \LessThan11~1_cout\ : std_logic;
SIGNAL \LessThan11~3_cout\ : std_logic;
SIGNAL \LessThan11~5_cout\ : std_logic;
SIGNAL \LessThan11~7_cout\ : std_logic;
SIGNAL \LessThan11~9_cout\ : std_logic;
SIGNAL \LessThan11~11_cout\ : std_logic;
SIGNAL \LessThan11~13_cout\ : std_logic;
SIGNAL \LessThan11~15_cout\ : std_logic;
SIGNAL \LessThan11~17_cout\ : std_logic;
SIGNAL \LessThan11~19_cout\ : std_logic;
SIGNAL \LessThan11~21_cout\ : std_logic;
SIGNAL \LessThan11~23_cout\ : std_logic;
SIGNAL \LessThan11~25_cout\ : std_logic;
SIGNAL \LessThan11~27_cout\ : std_logic;
SIGNAL \LessThan11~29_cout\ : std_logic;
SIGNAL \LessThan11~31_cout\ : std_logic;
SIGNAL \LessThan11~33_cout\ : std_logic;
SIGNAL \LessThan11~35_cout\ : std_logic;
SIGNAL \LessThan11~37_cout\ : std_logic;
SIGNAL \LessThan11~39_cout\ : std_logic;
SIGNAL \LessThan11~41_cout\ : std_logic;
SIGNAL \LessThan11~43_cout\ : std_logic;
SIGNAL \LessThan11~45_cout\ : std_logic;
SIGNAL \LessThan11~47_cout\ : std_logic;
SIGNAL \LessThan11~49_cout\ : std_logic;
SIGNAL \LessThan11~51_cout\ : std_logic;
SIGNAL \LessThan11~53_cout\ : std_logic;
SIGNAL \LessThan11~55_cout\ : std_logic;
SIGNAL \LessThan11~57_cout\ : std_logic;
SIGNAL \LessThan11~59_cout\ : std_logic;
SIGNAL \LessThan11~60_combout\ : std_logic;
SIGNAL \process_0~8_combout\ : std_logic;
SIGNAL \Add22~1\ : std_logic;
SIGNAL \Add22~3\ : std_logic;
SIGNAL \Add22~5\ : std_logic;
SIGNAL \Add22~7\ : std_logic;
SIGNAL \Add22~9\ : std_logic;
SIGNAL \Add22~11\ : std_logic;
SIGNAL \Add22~13\ : std_logic;
SIGNAL \Add22~15\ : std_logic;
SIGNAL \Add22~17\ : std_logic;
SIGNAL \Add22~19\ : std_logic;
SIGNAL \Add22~21\ : std_logic;
SIGNAL \Add22~23\ : std_logic;
SIGNAL \Add22~25\ : std_logic;
SIGNAL \Add22~26_combout\ : std_logic;
SIGNAL \Add22~24_combout\ : std_logic;
SIGNAL \Add22~22_combout\ : std_logic;
SIGNAL \Add22~20_combout\ : std_logic;
SIGNAL \Add22~18_combout\ : std_logic;
SIGNAL \Add23~1\ : std_logic;
SIGNAL \Add23~3\ : std_logic;
SIGNAL \Add23~5\ : std_logic;
SIGNAL \Add23~7\ : std_logic;
SIGNAL \Add23~8_combout\ : std_logic;
SIGNAL \Add23~6_combout\ : std_logic;
SIGNAL \Add23~4_combout\ : std_logic;
SIGNAL \Add23~2_combout\ : std_logic;
SIGNAL \Add23~0_combout\ : std_logic;
SIGNAL \bg_address[9]~7\ : std_logic;
SIGNAL \bg_address[10]~9\ : std_logic;
SIGNAL \bg_address[11]~11\ : std_logic;
SIGNAL \bg_address[12]~13\ : std_logic;
SIGNAL \bg_address[13]~14_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|out_address_reg_a[0]~feeder_combout\ : std_logic;
SIGNAL \Add22~27\ : std_logic;
SIGNAL \Add22~28_combout\ : std_logic;
SIGNAL \Add23~9\ : std_logic;
SIGNAL \Add23~10_combout\ : std_logic;
SIGNAL \bg_address[13]~15\ : std_logic;
SIGNAL \bg_address[14]~16_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\ : std_logic;
SIGNAL \Add22~0_combout\ : std_logic;
SIGNAL \Add22~2_combout\ : std_logic;
SIGNAL \Add22~4_combout\ : std_logic;
SIGNAL \Add22~6_combout\ : std_logic;
SIGNAL \Add22~8_combout\ : std_logic;
SIGNAL \Add22~10_combout\ : std_logic;
SIGNAL \Add22~12_combout\ : std_logic;
SIGNAL \Add22~14_combout\ : std_logic;
SIGNAL \Add22~16_combout\ : std_logic;
SIGNAL \bg_address[9]~6_combout\ : std_logic;
SIGNAL \bg_address[10]~8_combout\ : std_logic;
SIGNAL \bg_address[11]~10_combout\ : std_logic;
SIGNAL \bg_address[12]~12_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|address_reg_a[1]~feeder_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\ : std_logic;
SIGNAL \Add12~61\ : std_logic;
SIGNAL \Add12~62_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \Add27~1\ : std_logic;
SIGNAL \Add27~2_combout\ : std_logic;
SIGNAL \Add27~3\ : std_logic;
SIGNAL \Add27~4_combout\ : std_logic;
SIGNAL \o_count~28_combout\ : std_logic;
SIGNAL \Add27~5\ : std_logic;
SIGNAL \Add27~6_combout\ : std_logic;
SIGNAL \o_count~21_combout\ : std_logic;
SIGNAL \Add27~7\ : std_logic;
SIGNAL \Add27~8_combout\ : std_logic;
SIGNAL \o_count~20_combout\ : std_logic;
SIGNAL \Add27~9\ : std_logic;
SIGNAL \Add27~10_combout\ : std_logic;
SIGNAL \o_count~13_combout\ : std_logic;
SIGNAL \Add27~11\ : std_logic;
SIGNAL \Add27~12_combout\ : std_logic;
SIGNAL \o_count~22_combout\ : std_logic;
SIGNAL \Add27~13\ : std_logic;
SIGNAL \Add27~14_combout\ : std_logic;
SIGNAL \o_count~29_combout\ : std_logic;
SIGNAL \Add27~15\ : std_logic;
SIGNAL \Add27~16_combout\ : std_logic;
SIGNAL \o_count~24_combout\ : std_logic;
SIGNAL \Add27~17\ : std_logic;
SIGNAL \Add27~18_combout\ : std_logic;
SIGNAL \o_count~23_combout\ : std_logic;
SIGNAL \Add27~19\ : std_logic;
SIGNAL \Add27~20_combout\ : std_logic;
SIGNAL \o_count~25_combout\ : std_logic;
SIGNAL \Add27~21\ : std_logic;
SIGNAL \Add27~22_combout\ : std_logic;
SIGNAL \o_count~26_combout\ : std_logic;
SIGNAL \Add27~23\ : std_logic;
SIGNAL \Add27~24_combout\ : std_logic;
SIGNAL \o_count~0_combout\ : std_logic;
SIGNAL \Add27~25\ : std_logic;
SIGNAL \Add27~26_combout\ : std_logic;
SIGNAL \o_count~1_combout\ : std_logic;
SIGNAL \Add27~27\ : std_logic;
SIGNAL \Add27~28_combout\ : std_logic;
SIGNAL \o_count~2_combout\ : std_logic;
SIGNAL \Add27~29\ : std_logic;
SIGNAL \Add27~30_combout\ : std_logic;
SIGNAL \o_count~3_combout\ : std_logic;
SIGNAL \Add27~31\ : std_logic;
SIGNAL \Add27~32_combout\ : std_logic;
SIGNAL \o_count~4_combout\ : std_logic;
SIGNAL \Add27~33\ : std_logic;
SIGNAL \Add27~34_combout\ : std_logic;
SIGNAL \o_count~5_combout\ : std_logic;
SIGNAL \Add27~35\ : std_logic;
SIGNAL \Add27~36_combout\ : std_logic;
SIGNAL \o_count~6_combout\ : std_logic;
SIGNAL \Add27~37\ : std_logic;
SIGNAL \Add27~38_combout\ : std_logic;
SIGNAL \o_count~7_combout\ : std_logic;
SIGNAL \Add27~39\ : std_logic;
SIGNAL \Add27~40_combout\ : std_logic;
SIGNAL \o_count~8_combout\ : std_logic;
SIGNAL \Add27~41\ : std_logic;
SIGNAL \Add27~42_combout\ : std_logic;
SIGNAL \o_count~9_combout\ : std_logic;
SIGNAL \Add27~43\ : std_logic;
SIGNAL \Add27~44_combout\ : std_logic;
SIGNAL \o_count~10_combout\ : std_logic;
SIGNAL \Add27~45\ : std_logic;
SIGNAL \Add27~46_combout\ : std_logic;
SIGNAL \o_count~11_combout\ : std_logic;
SIGNAL \Add27~47\ : std_logic;
SIGNAL \Add27~48_combout\ : std_logic;
SIGNAL \o_count~12_combout\ : std_logic;
SIGNAL \Add27~49\ : std_logic;
SIGNAL \Add27~50_combout\ : std_logic;
SIGNAL \o_count~27_combout\ : std_logic;
SIGNAL \Add27~51\ : std_logic;
SIGNAL \Add27~52_combout\ : std_logic;
SIGNAL \o_count~14_combout\ : std_logic;
SIGNAL \Add27~53\ : std_logic;
SIGNAL \Add27~54_combout\ : std_logic;
SIGNAL \o_count~15_combout\ : std_logic;
SIGNAL \Add27~55\ : std_logic;
SIGNAL \Add27~56_combout\ : std_logic;
SIGNAL \o_count~16_combout\ : std_logic;
SIGNAL \Add27~57\ : std_logic;
SIGNAL \Add27~58_combout\ : std_logic;
SIGNAL \o_count~17_combout\ : std_logic;
SIGNAL \Add27~59\ : std_logic;
SIGNAL \Add27~60_combout\ : std_logic;
SIGNAL \o_count~18_combout\ : std_logic;
SIGNAL \Add27~61\ : std_logic;
SIGNAL \Add27~62_combout\ : std_logic;
SIGNAL \process_0~27_combout\ : std_logic;
SIGNAL \process_0~28_combout\ : std_logic;
SIGNAL \process_0~25_combout\ : std_logic;
SIGNAL \process_0~21_combout\ : std_logic;
SIGNAL \process_0~22_combout\ : std_logic;
SIGNAL \process_0~23_combout\ : std_logic;
SIGNAL \process_0~20_combout\ : std_logic;
SIGNAL \process_0~24_combout\ : std_logic;
SIGNAL \process_0~26_combout\ : std_logic;
SIGNAL \process_0~29_combout\ : std_logic;
SIGNAL \o_count~19_combout\ : std_logic;
SIGNAL \process_0~30_combout\ : std_logic;
SIGNAL \o_count~30_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \obstacle_width[2]~2_combout\ : std_logic;
SIGNAL \obstacle_width[2]~1_combout\ : std_logic;
SIGNAL \Add12~0_combout\ : std_logic;
SIGNAL \obstacle_hstart~27_combout\ : std_logic;
SIGNAL \Add12~1\ : std_logic;
SIGNAL \Add12~2_combout\ : std_logic;
SIGNAL \obstacle_hstart~9_combout\ : std_logic;
SIGNAL \Add12~3\ : std_logic;
SIGNAL \Add12~4_combout\ : std_logic;
SIGNAL \obstacle_hstart~10_combout\ : std_logic;
SIGNAL \obstacle_hstart~11_combout\ : std_logic;
SIGNAL \Add12~5\ : std_logic;
SIGNAL \Add12~6_combout\ : std_logic;
SIGNAL \obstacle_hstart~8_combout\ : std_logic;
SIGNAL \obstacle_hstart~25_combout\ : std_logic;
SIGNAL \Add12~7\ : std_logic;
SIGNAL \Add12~8_combout\ : std_logic;
SIGNAL \obstacle_hstart~7_combout\ : std_logic;
SIGNAL \obstacle_hstart~26_combout\ : std_logic;
SIGNAL \Add12~9\ : std_logic;
SIGNAL \Add12~10_combout\ : std_logic;
SIGNAL \obstacle_hstart~12_combout\ : std_logic;
SIGNAL \Add12~11\ : std_logic;
SIGNAL \Add12~13\ : std_logic;
SIGNAL \Add12~14_combout\ : std_logic;
SIGNAL \obstacle_hstart~18_combout\ : std_logic;
SIGNAL \obstacle_hstart~19_combout\ : std_logic;
SIGNAL \Add12~15\ : std_logic;
SIGNAL \Add12~16_combout\ : std_logic;
SIGNAL \Add12~65_combout\ : std_logic;
SIGNAL \obstacle_hstart~13_combout\ : std_logic;
SIGNAL \Add12~17\ : std_logic;
SIGNAL \Add12~18_combout\ : std_logic;
SIGNAL \obstacle_hstart~16_combout\ : std_logic;
SIGNAL \Add12~19\ : std_logic;
SIGNAL \Add12~20_combout\ : std_logic;
SIGNAL \obstacle_hstart~17_combout\ : std_logic;
SIGNAL \Add12~21\ : std_logic;
SIGNAL \Add12~22_combout\ : std_logic;
SIGNAL \obstacle_hstart~15_combout\ : std_logic;
SIGNAL \LessThan20~3_combout\ : std_logic;
SIGNAL \LessThan20~4_combout\ : std_logic;
SIGNAL \LessThan20~0_combout\ : std_logic;
SIGNAL \LessThan20~1_combout\ : std_logic;
SIGNAL \LessThan20~2_combout\ : std_logic;
SIGNAL \LessThan20~5_combout\ : std_logic;
SIGNAL \Add27~0_combout\ : std_logic;
SIGNAL \o_count~31_combout\ : std_logic;
SIGNAL \obstacle_width~0_combout\ : std_logic;
SIGNAL \obstacle_hstart~14_combout\ : std_logic;
SIGNAL \Add12~12_combout\ : std_logic;
SIGNAL \Add12~66_combout\ : std_logic;
SIGNAL \LessThan3~7_combout\ : std_logic;
SIGNAL \LessThan3~8_combout\ : std_logic;
SIGNAL \LessThan3~5_combout\ : std_logic;
SIGNAL \LessThan3~6_combout\ : std_logic;
SIGNAL \LessThan3~9_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \LessThan3~3_combout\ : std_logic;
SIGNAL \LessThan3~4_combout\ : std_logic;
SIGNAL \LessThan3~10_combout\ : std_logic;
SIGNAL \LessThan3~22_combout\ : std_logic;
SIGNAL \Add12~23\ : std_logic;
SIGNAL \Add12~24_combout\ : std_logic;
SIGNAL \Add12~67_combout\ : std_logic;
SIGNAL \obstacle_hstart~34_combout\ : std_logic;
SIGNAL \Add12~25\ : std_logic;
SIGNAL \Add12~26_combout\ : std_logic;
SIGNAL \obstacle_hstart~28_combout\ : std_logic;
SIGNAL \Add12~27\ : std_logic;
SIGNAL \Add12~28_combout\ : std_logic;
SIGNAL \Add12~68_combout\ : std_logic;
SIGNAL \obstacle_hstart~29_combout\ : std_logic;
SIGNAL \Add12~29\ : std_logic;
SIGNAL \Add12~30_combout\ : std_logic;
SIGNAL \obstacle_hstart~24_combout\ : std_logic;
SIGNAL \Add12~31\ : std_logic;
SIGNAL \Add12~32_combout\ : std_logic;
SIGNAL \Add12~69_combout\ : std_logic;
SIGNAL \obstacle_hstart~33_combout\ : std_logic;
SIGNAL \Add12~33\ : std_logic;
SIGNAL \Add12~34_combout\ : std_logic;
SIGNAL \obstacle_hstart~23_combout\ : std_logic;
SIGNAL \Add12~35\ : std_logic;
SIGNAL \Add12~36_combout\ : std_logic;
SIGNAL \Add12~70_combout\ : std_logic;
SIGNAL \obstacle_hstart~30_combout\ : std_logic;
SIGNAL \Add12~37\ : std_logic;
SIGNAL \Add12~38_combout\ : std_logic;
SIGNAL \obstacle_hstart~22_combout\ : std_logic;
SIGNAL \Add12~39\ : std_logic;
SIGNAL \Add12~40_combout\ : std_logic;
SIGNAL \Add12~71_combout\ : std_logic;
SIGNAL \obstacle_hstart~20_combout\ : std_logic;
SIGNAL \Add12~41\ : std_logic;
SIGNAL \Add12~42_combout\ : std_logic;
SIGNAL \obstacle_hstart~21_combout\ : std_logic;
SIGNAL \Add12~43\ : std_logic;
SIGNAL \Add12~44_combout\ : std_logic;
SIGNAL \Add12~72_combout\ : std_logic;
SIGNAL \obstacle_hstart~31_combout\ : std_logic;
SIGNAL \Add12~45\ : std_logic;
SIGNAL \Add12~46_combout\ : std_logic;
SIGNAL \obstacle_hstart~6_combout\ : std_logic;
SIGNAL \Add12~47\ : std_logic;
SIGNAL \Add12~48_combout\ : std_logic;
SIGNAL \Add12~73_combout\ : std_logic;
SIGNAL \obstacle_hstart~5_combout\ : std_logic;
SIGNAL \Add12~49\ : std_logic;
SIGNAL \Add12~50_combout\ : std_logic;
SIGNAL \obstacle_hstart~4_combout\ : std_logic;
SIGNAL \Add12~51\ : std_logic;
SIGNAL \Add12~52_combout\ : std_logic;
SIGNAL \Add12~74_combout\ : std_logic;
SIGNAL \obstacle_hstart~32_combout\ : std_logic;
SIGNAL \Add12~53\ : std_logic;
SIGNAL \Add12~54_combout\ : std_logic;
SIGNAL \obstacle_hstart~2_combout\ : std_logic;
SIGNAL \Add12~55\ : std_logic;
SIGNAL \Add12~56_combout\ : std_logic;
SIGNAL \Add12~75_combout\ : std_logic;
SIGNAL \LessThan3~19_combout\ : std_logic;
SIGNAL \LessThan3~17_combout\ : std_logic;
SIGNAL \LessThan3~18_combout\ : std_logic;
SIGNAL \LessThan3~16_combout\ : std_logic;
SIGNAL \LessThan3~20_combout\ : std_logic;
SIGNAL \LessThan3~12_combout\ : std_logic;
SIGNAL \LessThan3~11_combout\ : std_logic;
SIGNAL \LessThan3~14_combout\ : std_logic;
SIGNAL \LessThan3~13_combout\ : std_logic;
SIGNAL \LessThan3~15_combout\ : std_logic;
SIGNAL \LessThan3~21_combout\ : std_logic;
SIGNAL \obstacle_hstart~3_combout\ : std_logic;
SIGNAL \Add12~57\ : std_logic;
SIGNAL \Add12~58_combout\ : std_logic;
SIGNAL \Add12~64_combout\ : std_logic;
SIGNAL \obstacle_hstart~0_combout\ : std_logic;
SIGNAL \Add12~59\ : std_logic;
SIGNAL \Add12~60_combout\ : std_logic;
SIGNAL \obstacle_hstart~1_combout\ : std_logic;
SIGNAL \LessThan26~2_combout\ : std_logic;
SIGNAL \Add13~60_combout\ : std_logic;
SIGNAL \Add13~0_combout\ : std_logic;
SIGNAL \obstacle_hstop~49_combout\ : std_logic;
SIGNAL \Add13~1\ : std_logic;
SIGNAL \Add13~2_combout\ : std_logic;
SIGNAL \obstacle_hstop~48_combout\ : std_logic;
SIGNAL \Add13~3\ : std_logic;
SIGNAL \Add13~4_combout\ : std_logic;
SIGNAL \obstacle_hstop~47_combout\ : std_logic;
SIGNAL \obstacle_hstop[2]~feeder_combout\ : std_logic;
SIGNAL \Add13~5\ : std_logic;
SIGNAL \Add13~6_combout\ : std_logic;
SIGNAL \obstacle_hstop~46_combout\ : std_logic;
SIGNAL \obstacle_hstop[3]~feeder_combout\ : std_logic;
SIGNAL \Add13~7\ : std_logic;
SIGNAL \Add13~8_combout\ : std_logic;
SIGNAL \obstacle_hstop~45_combout\ : std_logic;
SIGNAL \Add13~9\ : std_logic;
SIGNAL \Add13~10_combout\ : std_logic;
SIGNAL \obstacle_hstop~44_combout\ : std_logic;
SIGNAL \Add13~11\ : std_logic;
SIGNAL \Add13~12_combout\ : std_logic;
SIGNAL \obstacle_hstop~43_combout\ : std_logic;
SIGNAL \Add13~13\ : std_logic;
SIGNAL \Add13~14_combout\ : std_logic;
SIGNAL \obstacle_hstop~42_combout\ : std_logic;
SIGNAL \Add13~15\ : std_logic;
SIGNAL \Add13~16_combout\ : std_logic;
SIGNAL \obstacle_hstop~41_combout\ : std_logic;
SIGNAL \Add13~17\ : std_logic;
SIGNAL \Add13~18_combout\ : std_logic;
SIGNAL \obstacle_hstop~40_combout\ : std_logic;
SIGNAL \Add13~19\ : std_logic;
SIGNAL \Add13~20_combout\ : std_logic;
SIGNAL \obstacle_hstop~39_combout\ : std_logic;
SIGNAL \Add13~21\ : std_logic;
SIGNAL \Add13~22_combout\ : std_logic;
SIGNAL \obstacle_hstop~38_combout\ : std_logic;
SIGNAL \Add13~23\ : std_logic;
SIGNAL \Add13~24_combout\ : std_logic;
SIGNAL \obstacle_hstop~37_combout\ : std_logic;
SIGNAL \Add13~25\ : std_logic;
SIGNAL \Add13~26_combout\ : std_logic;
SIGNAL \obstacle_hstop~36_combout\ : std_logic;
SIGNAL \Add13~27\ : std_logic;
SIGNAL \Add13~28_combout\ : std_logic;
SIGNAL \obstacle_hstop~35_combout\ : std_logic;
SIGNAL \Add13~29\ : std_logic;
SIGNAL \Add13~30_combout\ : std_logic;
SIGNAL \obstacle_hstop~34_combout\ : std_logic;
SIGNAL \Add13~31\ : std_logic;
SIGNAL \Add13~32_combout\ : std_logic;
SIGNAL \obstacle_hstop~33_combout\ : std_logic;
SIGNAL \Add13~33\ : std_logic;
SIGNAL \Add13~34_combout\ : std_logic;
SIGNAL \obstacle_hstop~32_combout\ : std_logic;
SIGNAL \Add13~35\ : std_logic;
SIGNAL \Add13~36_combout\ : std_logic;
SIGNAL \obstacle_hstop~31_combout\ : std_logic;
SIGNAL \Add13~37\ : std_logic;
SIGNAL \Add13~38_combout\ : std_logic;
SIGNAL \obstacle_hstop~30_combout\ : std_logic;
SIGNAL \Add13~39\ : std_logic;
SIGNAL \Add13~40_combout\ : std_logic;
SIGNAL \obstacle_hstop~29_combout\ : std_logic;
SIGNAL \Add13~41\ : std_logic;
SIGNAL \Add13~42_combout\ : std_logic;
SIGNAL \obstacle_hstop~28_combout\ : std_logic;
SIGNAL \Add13~43\ : std_logic;
SIGNAL \Add13~44_combout\ : std_logic;
SIGNAL \obstacle_hstop~27_combout\ : std_logic;
SIGNAL \Add13~45\ : std_logic;
SIGNAL \Add13~46_combout\ : std_logic;
SIGNAL \obstacle_hstop~26_combout\ : std_logic;
SIGNAL \Add13~47\ : std_logic;
SIGNAL \Add13~48_combout\ : std_logic;
SIGNAL \obstacle_hstop~25_combout\ : std_logic;
SIGNAL \Add13~49\ : std_logic;
SIGNAL \Add13~50_combout\ : std_logic;
SIGNAL \obstacle_hstop~24_combout\ : std_logic;
SIGNAL \Add13~51\ : std_logic;
SIGNAL \Add13~52_combout\ : std_logic;
SIGNAL \obstacle_hstop~23_combout\ : std_logic;
SIGNAL \Add13~53\ : std_logic;
SIGNAL \Add13~54_combout\ : std_logic;
SIGNAL \obstacle_hstop~22_combout\ : std_logic;
SIGNAL \Add13~55\ : std_logic;
SIGNAL \Add13~56_combout\ : std_logic;
SIGNAL \obstacle_hstop~21_combout\ : std_logic;
SIGNAL \LessThan4~13_combout\ : std_logic;
SIGNAL \LessThan4~11_combout\ : std_logic;
SIGNAL \LessThan4~8_combout\ : std_logic;
SIGNAL \LessThan4~10_combout\ : std_logic;
SIGNAL \LessThan4~9_combout\ : std_logic;
SIGNAL \LessThan4~12_combout\ : std_logic;
SIGNAL \LessThan4~14_combout\ : std_logic;
SIGNAL \obstacle_hstop~19_combout\ : std_logic;
SIGNAL \Add13~64_combout\ : std_logic;
SIGNAL \Add13~65_combout\ : std_logic;
SIGNAL \Add13~66_combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \Add13~71_combout\ : std_logic;
SIGNAL \Add13~70_combout\ : std_logic;
SIGNAL \Add13~69_combout\ : std_logic;
SIGNAL \Add13~67_combout\ : std_logic;
SIGNAL \Add13~68_combout\ : std_logic;
SIGNAL \LessThan4~1_combout\ : std_logic;
SIGNAL \LessThan4~2_combout\ : std_logic;
SIGNAL \LessThan4~3_combout\ : std_logic;
SIGNAL \LessThan4~4_combout\ : std_logic;
SIGNAL \LessThan4~20_combout\ : std_logic;
SIGNAL \LessThan4~21_combout\ : std_logic;
SIGNAL \LessThan4~7_combout\ : std_logic;
SIGNAL \LessThan4~15_combout\ : std_logic;
SIGNAL \LessThan4~16_combout\ : std_logic;
SIGNAL \LessThan4~17_combout\ : std_logic;
SIGNAL \LessThan4~18_combout\ : std_logic;
SIGNAL \LessThan4~5_combout\ : std_logic;
SIGNAL \Add13~57\ : std_logic;
SIGNAL \Add13~58_combout\ : std_logic;
SIGNAL \LessThan4~6_combout\ : std_logic;
SIGNAL \LessThan4~19_combout\ : std_logic;
SIGNAL \LessThan4~22_combout\ : std_logic;
SIGNAL \obstacle_hstop~20_combout\ : std_logic;
SIGNAL \Add13~59\ : std_logic;
SIGNAL \Add13~61\ : std_logic;
SIGNAL \Add13~62_combout\ : std_logic;
SIGNAL \obstacle_hstop~18_combout\ : std_logic;
SIGNAL \LessThan27~1_cout\ : std_logic;
SIGNAL \LessThan27~3_cout\ : std_logic;
SIGNAL \LessThan27~5_cout\ : std_logic;
SIGNAL \LessThan27~7_cout\ : std_logic;
SIGNAL \LessThan27~9_cout\ : std_logic;
SIGNAL \LessThan27~11_cout\ : std_logic;
SIGNAL \LessThan27~13_cout\ : std_logic;
SIGNAL \LessThan27~15_cout\ : std_logic;
SIGNAL \LessThan27~17_cout\ : std_logic;
SIGNAL \LessThan27~19_cout\ : std_logic;
SIGNAL \LessThan27~21_cout\ : std_logic;
SIGNAL \LessThan27~23_cout\ : std_logic;
SIGNAL \LessThan27~25_cout\ : std_logic;
SIGNAL \LessThan27~27_cout\ : std_logic;
SIGNAL \LessThan27~29_cout\ : std_logic;
SIGNAL \LessThan27~31_cout\ : std_logic;
SIGNAL \LessThan27~33_cout\ : std_logic;
SIGNAL \LessThan27~35_cout\ : std_logic;
SIGNAL \LessThan27~37_cout\ : std_logic;
SIGNAL \LessThan27~39_cout\ : std_logic;
SIGNAL \LessThan27~41_cout\ : std_logic;
SIGNAL \LessThan27~43_cout\ : std_logic;
SIGNAL \LessThan27~45_cout\ : std_logic;
SIGNAL \LessThan27~47_cout\ : std_logic;
SIGNAL \LessThan27~49_cout\ : std_logic;
SIGNAL \LessThan27~51_cout\ : std_logic;
SIGNAL \LessThan27~53_cout\ : std_logic;
SIGNAL \LessThan27~55_cout\ : std_logic;
SIGNAL \LessThan27~57_cout\ : std_logic;
SIGNAL \LessThan27~59_cout\ : std_logic;
SIGNAL \LessThan27~60_combout\ : std_logic;
SIGNAL \LessThan26~13_combout\ : std_logic;
SIGNAL \LessThan26~3_combout\ : std_logic;
SIGNAL \LessThan26~8_combout\ : std_logic;
SIGNAL \LessThan26~54_combout\ : std_logic;
SIGNAL \LessThan26~9_combout\ : std_logic;
SIGNAL \LessThan26~10_combout\ : std_logic;
SIGNAL \LessThan26~6_combout\ : std_logic;
SIGNAL \LessThan26~4_combout\ : std_logic;
SIGNAL \LessThan26~5_combout\ : std_logic;
SIGNAL \LessThan26~7_combout\ : std_logic;
SIGNAL \LessThan26~11_combout\ : std_logic;
SIGNAL \LessThan26~12_combout\ : std_logic;
SIGNAL \LessThan26~14_combout\ : std_logic;
SIGNAL \LessThan26~15_combout\ : std_logic;
SIGNAL \r[2]~1_combout\ : std_logic;
SIGNAL \LessThan22~1_combout\ : std_logic;
SIGNAL \LessThan22~2_combout\ : std_logic;
SIGNAL \LessThan22~3_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \LessThan26~47_combout\ : std_logic;
SIGNAL \LessThan26~16_combout\ : std_logic;
SIGNAL \LessThan26~17_combout\ : std_logic;
SIGNAL \LessThan26~18_combout\ : std_logic;
SIGNAL \LessThan26~48_combout\ : std_logic;
SIGNAL \LessThan26~19_combout\ : std_logic;
SIGNAL \LessThan26~20_combout\ : std_logic;
SIGNAL \LessThan26~46_combout\ : std_logic;
SIGNAL \LessThan26~49_combout\ : std_logic;
SIGNAL \LessThan26~50_combout\ : std_logic;
SIGNAL \LessThan26~51_combout\ : std_logic;
SIGNAL \LessThan26~21_combout\ : std_logic;
SIGNAL \LessThan26~44_combout\ : std_logic;
SIGNAL \LessThan26~41_combout\ : std_logic;
SIGNAL \LessThan26~34_combout\ : std_logic;
SIGNAL \LessThan26~42_combout\ : std_logic;
SIGNAL \LessThan26~43_combout\ : std_logic;
SIGNAL \LessThan26~39_combout\ : std_logic;
SIGNAL \LessThan26~35_combout\ : std_logic;
SIGNAL \LessThan26~36_combout\ : std_logic;
SIGNAL \LessThan26~40_combout\ : std_logic;
SIGNAL \LessThan26~45_combout\ : std_logic;
SIGNAL \LessThan26~22_combout\ : std_logic;
SIGNAL \LessThan26~31_combout\ : std_logic;
SIGNAL \LessThan26~32_combout\ : std_logic;
SIGNAL \LessThan26~24_combout\ : std_logic;
SIGNAL \LessThan26~25_combout\ : std_logic;
SIGNAL \LessThan26~26_combout\ : std_logic;
SIGNAL \LessThan26~27_combout\ : std_logic;
SIGNAL \LessThan26~23_combout\ : std_logic;
SIGNAL \LessThan26~28_combout\ : std_logic;
SIGNAL \LessThan26~29_combout\ : std_logic;
SIGNAL \LessThan26~30_combout\ : std_logic;
SIGNAL \LessThan26~33_combout\ : std_logic;
SIGNAL \LessThan26~37_combout\ : std_logic;
SIGNAL \LessThan26~38_combout\ : std_logic;
SIGNAL \LessThan26~55_combout\ : std_logic;
SIGNAL \LessThan26~56_combout\ : std_logic;
SIGNAL \LessThan26~52_combout\ : std_logic;
SIGNAL \LessThan26~53_combout\ : std_logic;
SIGNAL \r[2]~2_combout\ : std_logic;
SIGNAL \LessThan24~1_combout\ : std_logic;
SIGNAL \LessThan24~2_combout\ : std_logic;
SIGNAL \LessThan25~0_combout\ : std_logic;
SIGNAL \LessThan23~5_combout\ : std_logic;
SIGNAL \LessThan23~6_combout\ : std_logic;
SIGNAL \LessThan23~7_combout\ : std_logic;
SIGNAL \LessThan24~3_combout\ : std_logic;
SIGNAL \LessThan24~0_combout\ : std_logic;
SIGNAL \LessThan24~4_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \r[2]~3_combout\ : std_logic;
SIGNAL \r[2]~4_combout\ : std_logic;
SIGNAL \r[2]~5_combout\ : std_logic;
SIGNAL \process_0~9_combout\ : std_logic;
SIGNAL \process_0~10_combout\ : std_logic;
SIGNAL \process_0~11_combout\ : std_logic;
SIGNAL \LessThan18~0_combout\ : std_logic;
SIGNAL \LessThan18~1_combout\ : std_logic;
SIGNAL \LessThan18~2_combout\ : std_logic;
SIGNAL \LessThan17~0_combout\ : std_logic;
SIGNAL \process_0~13_combout\ : std_logic;
SIGNAL \process_0~14_combout\ : std_logic;
SIGNAL \process_0~12_combout\ : std_logic;
SIGNAL \process_0~15_combout\ : std_logic;
SIGNAL \process_0~17_combout\ : std_logic;
SIGNAL \process_0~16_combout\ : std_logic;
SIGNAL \process_0~18_combout\ : std_logic;
SIGNAL \moveUp~input_o\ : std_logic;
SIGNAL \object_vstart[1]~90_combout\ : std_logic;
SIGNAL \object_vstart[2]~30_combout\ : std_logic;
SIGNAL \object_vstart[2]~31\ : std_logic;
SIGNAL \object_vstart[3]~32_combout\ : std_logic;
SIGNAL \object_vstart[3]~33\ : std_logic;
SIGNAL \object_vstart[4]~34_combout\ : std_logic;
SIGNAL \object_vstart[4]~35\ : std_logic;
SIGNAL \object_vstart[5]~36_combout\ : std_logic;
SIGNAL \object_vstart[5]~37\ : std_logic;
SIGNAL \object_vstart[6]~38_combout\ : std_logic;
SIGNAL \object_vstart[6]~39\ : std_logic;
SIGNAL \object_vstart[7]~40_combout\ : std_logic;
SIGNAL \object_vstart[7]~41\ : std_logic;
SIGNAL \object_vstart[8]~42_combout\ : std_logic;
SIGNAL \object_vstart[8]~43\ : std_logic;
SIGNAL \object_vstart[9]~44_combout\ : std_logic;
SIGNAL \object_vstart[9]~45\ : std_logic;
SIGNAL \object_vstart[10]~46_combout\ : std_logic;
SIGNAL \object_vstart[10]~47\ : std_logic;
SIGNAL \object_vstart[11]~48_combout\ : std_logic;
SIGNAL \object_vstart[11]~49\ : std_logic;
SIGNAL \object_vstart[12]~50_combout\ : std_logic;
SIGNAL \object_vstart[12]~51\ : std_logic;
SIGNAL \object_vstart[13]~52_combout\ : std_logic;
SIGNAL \object_vstart[13]~53\ : std_logic;
SIGNAL \object_vstart[14]~54_combout\ : std_logic;
SIGNAL \object_vstart[14]~55\ : std_logic;
SIGNAL \object_vstart[15]~56_combout\ : std_logic;
SIGNAL \object_vstart[15]~57\ : std_logic;
SIGNAL \object_vstart[16]~58_combout\ : std_logic;
SIGNAL \object_vstart[16]~59\ : std_logic;
SIGNAL \object_vstart[17]~60_combout\ : std_logic;
SIGNAL \object_vstart[17]~61\ : std_logic;
SIGNAL \object_vstart[18]~62_combout\ : std_logic;
SIGNAL \object_vstart[18]~63\ : std_logic;
SIGNAL \object_vstart[19]~64_combout\ : std_logic;
SIGNAL \object_vstart[19]~65\ : std_logic;
SIGNAL \object_vstart[20]~66_combout\ : std_logic;
SIGNAL \object_vstart[20]~67\ : std_logic;
SIGNAL \object_vstart[21]~68_combout\ : std_logic;
SIGNAL \object_vstart[21]~69\ : std_logic;
SIGNAL \object_vstart[22]~70_combout\ : std_logic;
SIGNAL \object_vstart[22]~71\ : std_logic;
SIGNAL \object_vstart[23]~72_combout\ : std_logic;
SIGNAL \object_vstart[23]~73\ : std_logic;
SIGNAL \object_vstart[24]~74_combout\ : std_logic;
SIGNAL \object_vstart[24]~75\ : std_logic;
SIGNAL \object_vstart[25]~76_combout\ : std_logic;
SIGNAL \object_vstart[25]~77\ : std_logic;
SIGNAL \object_vstart[26]~78_combout\ : std_logic;
SIGNAL \object_vstart[26]~79\ : std_logic;
SIGNAL \object_vstart[27]~80_combout\ : std_logic;
SIGNAL \object_vstart[27]~81\ : std_logic;
SIGNAL \object_vstart[28]~82_combout\ : std_logic;
SIGNAL \object_vstart[28]~83\ : std_logic;
SIGNAL \object_vstart[29]~84_combout\ : std_logic;
SIGNAL \object_vstart[29]~85\ : std_logic;
SIGNAL \object_vstart[30]~86_combout\ : std_logic;
SIGNAL \object_vstart[30]~87\ : std_logic;
SIGNAL \object_vstart[31]~88_combout\ : std_logic;
SIGNAL \LessThan28~1_cout\ : std_logic;
SIGNAL \LessThan28~3_cout\ : std_logic;
SIGNAL \LessThan28~5_cout\ : std_logic;
SIGNAL \LessThan28~7_cout\ : std_logic;
SIGNAL \LessThan28~9_cout\ : std_logic;
SIGNAL \LessThan28~11_cout\ : std_logic;
SIGNAL \LessThan28~13_cout\ : std_logic;
SIGNAL \LessThan28~15_cout\ : std_logic;
SIGNAL \LessThan28~17_cout\ : std_logic;
SIGNAL \LessThan28~19_cout\ : std_logic;
SIGNAL \LessThan28~21_cout\ : std_logic;
SIGNAL \LessThan28~23_cout\ : std_logic;
SIGNAL \LessThan28~25_cout\ : std_logic;
SIGNAL \LessThan28~27_cout\ : std_logic;
SIGNAL \LessThan28~29_cout\ : std_logic;
SIGNAL \LessThan28~31_cout\ : std_logic;
SIGNAL \LessThan28~33_cout\ : std_logic;
SIGNAL \LessThan28~35_cout\ : std_logic;
SIGNAL \LessThan28~37_cout\ : std_logic;
SIGNAL \LessThan28~39_cout\ : std_logic;
SIGNAL \LessThan28~41_cout\ : std_logic;
SIGNAL \LessThan28~43_cout\ : std_logic;
SIGNAL \LessThan28~45_cout\ : std_logic;
SIGNAL \LessThan28~47_cout\ : std_logic;
SIGNAL \LessThan28~49_cout\ : std_logic;
SIGNAL \LessThan28~51_cout\ : std_logic;
SIGNAL \LessThan28~53_cout\ : std_logic;
SIGNAL \LessThan28~55_cout\ : std_logic;
SIGNAL \LessThan28~57_cout\ : std_logic;
SIGNAL \LessThan28~59_cout\ : std_logic;
SIGNAL \LessThan28~60_combout\ : std_logic;
SIGNAL \process_0~36_combout\ : std_logic;
SIGNAL \Add9~1\ : std_logic;
SIGNAL \Add9~3\ : std_logic;
SIGNAL \Add9~5\ : std_logic;
SIGNAL \Add9~7\ : std_logic;
SIGNAL \Add9~9\ : std_logic;
SIGNAL \Add9~11\ : std_logic;
SIGNAL \Add9~13\ : std_logic;
SIGNAL \Add9~15\ : std_logic;
SIGNAL \Add9~17\ : std_logic;
SIGNAL \Add9~19\ : std_logic;
SIGNAL \Add9~21\ : std_logic;
SIGNAL \Add9~23\ : std_logic;
SIGNAL \Add9~25\ : std_logic;
SIGNAL \Add9~27\ : std_logic;
SIGNAL \Add9~29\ : std_logic;
SIGNAL \Add9~31\ : std_logic;
SIGNAL \Add9~33\ : std_logic;
SIGNAL \Add9~35\ : std_logic;
SIGNAL \Add9~37\ : std_logic;
SIGNAL \Add9~39\ : std_logic;
SIGNAL \Add9~41\ : std_logic;
SIGNAL \Add9~43\ : std_logic;
SIGNAL \Add9~45\ : std_logic;
SIGNAL \Add9~47\ : std_logic;
SIGNAL \Add9~49\ : std_logic;
SIGNAL \Add9~51\ : std_logic;
SIGNAL \Add9~53\ : std_logic;
SIGNAL \Add9~55\ : std_logic;
SIGNAL \Add9~57\ : std_logic;
SIGNAL \Add9~58_combout\ : std_logic;
SIGNAL \Add9~56_combout\ : std_logic;
SIGNAL \Add9~54_combout\ : std_logic;
SIGNAL \Add9~52_combout\ : std_logic;
SIGNAL \Add9~50_combout\ : std_logic;
SIGNAL \Add9~48_combout\ : std_logic;
SIGNAL \Add9~46_combout\ : std_logic;
SIGNAL \Add9~44_combout\ : std_logic;
SIGNAL \Add9~42_combout\ : std_logic;
SIGNAL \Add9~40_combout\ : std_logic;
SIGNAL \Add9~38_combout\ : std_logic;
SIGNAL \Add9~36_combout\ : std_logic;
SIGNAL \Add9~34_combout\ : std_logic;
SIGNAL \Add9~32_combout\ : std_logic;
SIGNAL \Add9~30_combout\ : std_logic;
SIGNAL \Add9~28_combout\ : std_logic;
SIGNAL \Add9~26_combout\ : std_logic;
SIGNAL \Add9~24_combout\ : std_logic;
SIGNAL \Add9~22_combout\ : std_logic;
SIGNAL \Add9~20_combout\ : std_logic;
SIGNAL \Add9~18_combout\ : std_logic;
SIGNAL \Add9~16_combout\ : std_logic;
SIGNAL \Add9~14_combout\ : std_logic;
SIGNAL \Add9~12_combout\ : std_logic;
SIGNAL \Add9~10_combout\ : std_logic;
SIGNAL \Add9~8_combout\ : std_logic;
SIGNAL \Add9~6_combout\ : std_logic;
SIGNAL \Add9~4_combout\ : std_logic;
SIGNAL \Add9~2_combout\ : std_logic;
SIGNAL \Add9~0_combout\ : std_logic;
SIGNAL \LessThan29~1_cout\ : std_logic;
SIGNAL \LessThan29~3_cout\ : std_logic;
SIGNAL \LessThan29~5_cout\ : std_logic;
SIGNAL \LessThan29~7_cout\ : std_logic;
SIGNAL \LessThan29~9_cout\ : std_logic;
SIGNAL \LessThan29~11_cout\ : std_logic;
SIGNAL \LessThan29~13_cout\ : std_logic;
SIGNAL \LessThan29~15_cout\ : std_logic;
SIGNAL \LessThan29~17_cout\ : std_logic;
SIGNAL \LessThan29~19_cout\ : std_logic;
SIGNAL \LessThan29~21_cout\ : std_logic;
SIGNAL \LessThan29~23_cout\ : std_logic;
SIGNAL \LessThan29~25_cout\ : std_logic;
SIGNAL \LessThan29~27_cout\ : std_logic;
SIGNAL \LessThan29~29_cout\ : std_logic;
SIGNAL \LessThan29~31_cout\ : std_logic;
SIGNAL \LessThan29~33_cout\ : std_logic;
SIGNAL \LessThan29~35_cout\ : std_logic;
SIGNAL \LessThan29~37_cout\ : std_logic;
SIGNAL \LessThan29~39_cout\ : std_logic;
SIGNAL \LessThan29~41_cout\ : std_logic;
SIGNAL \LessThan29~43_cout\ : std_logic;
SIGNAL \LessThan29~45_cout\ : std_logic;
SIGNAL \LessThan29~47_cout\ : std_logic;
SIGNAL \LessThan29~49_cout\ : std_logic;
SIGNAL \LessThan29~51_cout\ : std_logic;
SIGNAL \LessThan29~53_cout\ : std_logic;
SIGNAL \LessThan29~55_cout\ : std_logic;
SIGNAL \LessThan29~57_cout\ : std_logic;
SIGNAL \LessThan29~59_cout\ : std_logic;
SIGNAL \LessThan29~60_combout\ : std_logic;
SIGNAL \process_0~19_combout\ : std_logic;
SIGNAL \r[2]~0_combout\ : std_logic;
SIGNAL \r[2]~6_combout\ : std_logic;
SIGNAL \r~7_combout\ : std_logic;
SIGNAL \r[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\ : std_logic;
SIGNAL \r~8_combout\ : std_logic;
SIGNAL \r[1]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\ : std_logic;
SIGNAL \r~9_combout\ : std_logic;
SIGNAL \r[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\ : std_logic;
SIGNAL \r~10_combout\ : std_logic;
SIGNAL \r[3]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\ : std_logic;
SIGNAL \g~0_combout\ : std_logic;
SIGNAL \g[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\ : std_logic;
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
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\ : std_logic;
SIGNAL \g~3_combout\ : std_logic;
SIGNAL \g[3]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ : std_logic;
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
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\ : std_logic;
SIGNAL \b~2_combout\ : std_logic;
SIGNAL \b[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\ : std_logic;
SIGNAL \b~3_combout\ : std_logic;
SIGNAL \b[3]~reg0_q\ : std_logic;
SIGNAL \process_0~32_combout\ : std_logic;
SIGNAL \process_0~31_combout\ : std_logic;
SIGNAL \process_0~33_combout\ : std_logic;
SIGNAL \hsync~reg0_q\ : std_logic;
SIGNAL \process_0~34_combout\ : std_logic;
SIGNAL \process_0~35_combout\ : std_logic;
SIGNAL \vsync~reg0_q\ : std_logic;
SIGNAL bg_hstop : std_logic_vector(31 DOWNTO 0);
SIGNAL vposition : std_logic_vector(31 DOWNTO 0);
SIGNAL hposition : std_logic_vector(31 DOWNTO 0);
SIGNAL \disp_clk|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL count : std_logic_vector(31 DOWNTO 0);
SIGNAL object_vstart : std_logic_vector(31 DOWNTO 0);
SIGNAL bg_address : std_logic_vector(14 DOWNTO 0);
SIGNAL bg_hstart : std_logic_vector(31 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|out_address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL obstacle_hstart : std_logic_vector(31 DOWNTO 0);
SIGNAL obstacle_hstop : std_logic_vector(31 DOWNTO 0);
SIGNAL obstacle_width : std_logic_vector(31 DOWNTO 0);
SIGNAL o_count : std_logic_vector(31 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_clk50MHz <= clk50MHz;
ww_chooseRes <= chooseRes;
ww_moveUp <= moveUp;
ww_moveDown <= moveDown;
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

-- Location: LCCOMB_X44_Y47_N24
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

-- Location: LCCOMB_X40_Y32_N0
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

-- Location: LCCOMB_X39_Y30_N12
\LessThan25~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~1_combout\ = (vposition(8) & vposition(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => vposition(8),
	datad => vposition(9),
	combout => \LessThan25~1_combout\);

-- Location: LCCOMB_X39_Y30_N22
\LessThan6~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~2_combout\ = (!vposition(6) & !vposition(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datac => vposition(7),
	combout => \LessThan6~2_combout\);

-- Location: LCCOMB_X39_Y30_N28
\LessThan6~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~3_combout\ = (!vposition(4) & (!vposition(3) & ((!vposition(1)) # (!vposition(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => vposition(4),
	datac => vposition(1),
	datad => vposition(3),
	combout => \LessThan6~3_combout\);

-- Location: LCCOMB_X39_Y30_N18
\LessThan6~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~4_combout\ = ((\LessThan6~2_combout\ & ((\LessThan6~3_combout\) # (!vposition(5))))) # (!\LessThan25~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan25~1_combout\,
	datab => vposition(5),
	datac => \LessThan6~2_combout\,
	datad => \LessThan6~3_combout\,
	combout => \LessThan6~4_combout\);

-- Location: LCCOMB_X41_Y31_N10
\LessThan23~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~3_combout\ = (!vposition(23) & (!vposition(24) & !vposition(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(23),
	datac => vposition(24),
	datad => vposition(22),
	combout => \LessThan23~3_combout\);

-- Location: LCCOMB_X36_Y32_N0
\LessThan23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~0_combout\ = (!vposition(10) & (!vposition(11) & (!vposition(12) & !vposition(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(10),
	datab => vposition(11),
	datac => vposition(12),
	datad => vposition(13),
	combout => \LessThan23~0_combout\);

-- Location: LCCOMB_X38_Y31_N30
\LessThan23~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~1_combout\ = (!vposition(15) & (!vposition(16) & (!vposition(17) & !vposition(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(15),
	datab => vposition(16),
	datac => vposition(17),
	datad => vposition(14),
	combout => \LessThan23~1_combout\);

-- Location: LCCOMB_X41_Y31_N12
\LessThan23~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~2_combout\ = (!vposition(21) & (!vposition(19) & (!vposition(18) & !vposition(20))))

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
	combout => \LessThan23~2_combout\);

-- Location: LCCOMB_X41_Y31_N28
\LessThan23~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~4_combout\ = (\LessThan23~3_combout\ & (\LessThan23~0_combout\ & (\LessThan23~1_combout\ & \LessThan23~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan23~3_combout\,
	datab => \LessThan23~0_combout\,
	datac => \LessThan23~1_combout\,
	datad => \LessThan23~2_combout\,
	combout => \LessThan23~4_combout\);

-- Location: LCCOMB_X41_Y31_N6
\LessThan6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~0_combout\ = (!vposition(30) & (!vposition(28) & (!vposition(29) & !vposition(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(30),
	datab => vposition(28),
	datac => vposition(29),
	datad => vposition(27),
	combout => \LessThan6~0_combout\);

-- Location: LCCOMB_X40_Y29_N16
\LessThan6~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~1_combout\ = (!vposition(25) & (\LessThan23~4_combout\ & (\LessThan6~0_combout\ & !vposition(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(25),
	datab => \LessThan23~4_combout\,
	datac => \LessThan6~0_combout\,
	datad => vposition(26),
	combout => \LessThan6~1_combout\);

-- Location: LCCOMB_X40_Y29_N30
\LessThan6~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~5_combout\ = (!vposition(31) & ((!\LessThan6~1_combout\) # (!\LessThan6~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~4_combout\,
	datac => vposition(31),
	datad => \LessThan6~1_combout\,
	combout => \LessThan6~5_combout\);

-- Location: LCCOMB_X42_Y26_N0
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

-- Location: FF_X42_Y26_N1
\hposition[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[0]~32_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(0));

-- Location: LCCOMB_X42_Y26_N2
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

-- Location: FF_X42_Y26_N3
\hposition[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[1]~34_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(1));

-- Location: LCCOMB_X42_Y26_N4
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

-- Location: FF_X42_Y26_N5
\hposition[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[2]~36_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(2));

-- Location: LCCOMB_X42_Y26_N6
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

-- Location: FF_X42_Y26_N7
\hposition[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[3]~38_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(3));

-- Location: LCCOMB_X42_Y26_N8
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

-- Location: FF_X42_Y26_N9
\hposition[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[4]~40_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(4));

-- Location: LCCOMB_X42_Y26_N10
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

-- Location: FF_X42_Y26_N11
\hposition[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[5]~42_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(5));

-- Location: LCCOMB_X42_Y26_N12
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

-- Location: FF_X42_Y26_N13
\hposition[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[6]~44_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(6));

-- Location: LCCOMB_X42_Y26_N14
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

-- Location: FF_X42_Y26_N15
\hposition[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[7]~46_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(7));

-- Location: LCCOMB_X42_Y26_N16
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

-- Location: FF_X42_Y26_N17
\hposition[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[8]~48_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(8));

-- Location: LCCOMB_X42_Y26_N18
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

-- Location: FF_X42_Y26_N19
\hposition[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[9]~50_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(9));

-- Location: LCCOMB_X42_Y26_N20
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

-- Location: FF_X42_Y26_N21
\hposition[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[10]~52_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(10));

-- Location: LCCOMB_X42_Y26_N22
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

-- Location: FF_X42_Y26_N23
\hposition[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[11]~54_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(11));

-- Location: LCCOMB_X42_Y26_N24
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

-- Location: FF_X42_Y26_N25
\hposition[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[12]~56_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(12));

-- Location: LCCOMB_X42_Y26_N26
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

-- Location: FF_X42_Y26_N27
\hposition[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[13]~58_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(13));

-- Location: LCCOMB_X42_Y26_N28
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

-- Location: FF_X42_Y26_N29
\hposition[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[14]~60_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(14));

-- Location: LCCOMB_X42_Y26_N30
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

-- Location: FF_X42_Y26_N31
\hposition[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[15]~62_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(15));

-- Location: LCCOMB_X42_Y25_N0
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

-- Location: FF_X42_Y25_N1
\hposition[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[16]~64_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(16));

-- Location: LCCOMB_X42_Y25_N2
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

-- Location: FF_X42_Y25_N3
\hposition[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[17]~66_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(17));

-- Location: LCCOMB_X42_Y25_N4
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

-- Location: FF_X42_Y25_N5
\hposition[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[18]~68_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(18));

-- Location: LCCOMB_X40_Y25_N6
\LessThan5~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~2_combout\ = (!hposition(17) & !hposition(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => hposition(17),
	datad => hposition(18),
	combout => \LessThan5~2_combout\);

-- Location: LCCOMB_X43_Y26_N0
\LessThan5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~1_combout\ = (!hposition(14) & (!hposition(12) & (!hposition(13) & !hposition(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datab => hposition(12),
	datac => hposition(13),
	datad => hposition(11),
	combout => \LessThan5~1_combout\);

-- Location: LCCOMB_X40_Y25_N12
\LessThan5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~3_combout\ = (\LessThan5~2_combout\ & (!hposition(16) & (!hposition(15) & \LessThan5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~2_combout\,
	datab => hposition(16),
	datac => hposition(15),
	datad => \LessThan5~1_combout\,
	combout => \LessThan5~3_combout\);

-- Location: LCCOMB_X42_Y25_N6
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

-- Location: FF_X42_Y25_N7
\hposition[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[19]~70_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(19));

-- Location: LCCOMB_X42_Y25_N8
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

-- Location: FF_X42_Y25_N9
\hposition[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[20]~72_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(20));

-- Location: LCCOMB_X42_Y25_N10
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

-- Location: FF_X42_Y25_N11
\hposition[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[21]~74_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(21));

-- Location: LCCOMB_X42_Y25_N12
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

-- Location: FF_X42_Y25_N13
\hposition[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[22]~76_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(22));

-- Location: LCCOMB_X42_Y25_N14
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

-- Location: FF_X42_Y25_N15
\hposition[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[23]~78_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(23));

-- Location: LCCOMB_X42_Y25_N16
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

-- Location: FF_X42_Y25_N17
\hposition[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[24]~80_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(24));

-- Location: LCCOMB_X42_Y25_N18
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

-- Location: FF_X42_Y25_N19
\hposition[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[25]~82_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(25));

-- Location: LCCOMB_X42_Y25_N20
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

-- Location: FF_X42_Y25_N21
\hposition[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[26]~84_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(26));

-- Location: LCCOMB_X42_Y25_N22
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

-- Location: FF_X42_Y25_N23
\hposition[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[27]~86_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(27));

-- Location: LCCOMB_X42_Y25_N24
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

-- Location: FF_X42_Y25_N25
\hposition[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[28]~88_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(28));

-- Location: LCCOMB_X42_Y25_N26
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

-- Location: FF_X42_Y25_N27
\hposition[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[29]~90_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(29));

-- Location: LCCOMB_X42_Y25_N28
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

-- Location: FF_X42_Y25_N29
\hposition[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[30]~92_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(30));

-- Location: LCCOMB_X40_Y25_N28
\LessThan5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (!hposition(27) & (!hposition(29) & (!hposition(30) & !hposition(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => hposition(29),
	datac => hposition(30),
	datad => hposition(28),
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X40_Y25_N8
\LessThan5~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~5_combout\ = (!hposition(25) & (!hposition(26) & (!hposition(24) & !hposition(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(25),
	datab => hposition(26),
	datac => hposition(24),
	datad => hposition(23),
	combout => \LessThan5~5_combout\);

-- Location: LCCOMB_X40_Y25_N10
\LessThan5~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~4_combout\ = (!hposition(21) & (!hposition(22) & (!hposition(19) & !hposition(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => hposition(22),
	datac => hposition(19),
	datad => hposition(20),
	combout => \LessThan5~4_combout\);

-- Location: LCCOMB_X40_Y25_N26
\LessThan5~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~6_combout\ = (\LessThan5~3_combout\ & (\LessThan5~0_combout\ & (\LessThan5~5_combout\ & \LessThan5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~3_combout\,
	datab => \LessThan5~0_combout\,
	datac => \LessThan5~5_combout\,
	datad => \LessThan5~4_combout\,
	combout => \LessThan5~6_combout\);

-- Location: LCCOMB_X41_Y26_N14
\LessThan5~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~7_combout\ = (!hposition(9) & (((!hposition(6) & !hposition(7))) # (!hposition(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datab => hposition(7),
	datac => hposition(9),
	datad => hposition(8),
	combout => \LessThan5~7_combout\);

-- Location: LCCOMB_X42_Y25_N30
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

-- Location: FF_X42_Y25_N31
\hposition[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \hposition[31]~94_combout\,
	sclr => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => hposition(31));

-- Location: LCCOMB_X41_Y26_N8
\LessThan5~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~8_combout\ = (!hposition(31) & (((!\LessThan5~7_combout\ & hposition(10))) # (!\LessThan5~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~6_combout\,
	datab => \LessThan5~7_combout\,
	datac => hposition(10),
	datad => hposition(31),
	combout => \LessThan5~8_combout\);

-- Location: FF_X40_Y32_N1
\vposition[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[0]~32_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(0));

-- Location: LCCOMB_X40_Y32_N2
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

-- Location: FF_X40_Y32_N3
\vposition[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[1]~34_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(1));

-- Location: LCCOMB_X40_Y32_N4
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

-- Location: FF_X40_Y32_N5
\vposition[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[2]~36_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(2));

-- Location: LCCOMB_X40_Y32_N6
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

-- Location: FF_X40_Y32_N7
\vposition[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[3]~38_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(3));

-- Location: LCCOMB_X40_Y32_N8
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

-- Location: FF_X40_Y32_N9
\vposition[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[4]~40_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(4));

-- Location: LCCOMB_X40_Y32_N10
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

-- Location: FF_X40_Y32_N11
\vposition[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[5]~42_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(5));

-- Location: LCCOMB_X40_Y32_N12
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

-- Location: FF_X40_Y32_N13
\vposition[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[6]~44_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(6));

-- Location: LCCOMB_X40_Y32_N14
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

-- Location: FF_X40_Y32_N15
\vposition[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[7]~46_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(7));

-- Location: LCCOMB_X40_Y32_N16
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

-- Location: FF_X40_Y32_N17
\vposition[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[8]~48_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(8));

-- Location: LCCOMB_X40_Y32_N18
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

-- Location: FF_X40_Y32_N19
\vposition[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[9]~50_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(9));

-- Location: LCCOMB_X40_Y32_N20
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

-- Location: FF_X40_Y32_N21
\vposition[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[10]~52_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(10));

-- Location: LCCOMB_X40_Y32_N22
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

-- Location: FF_X40_Y32_N23
\vposition[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[11]~54_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(11));

-- Location: LCCOMB_X40_Y32_N24
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

-- Location: FF_X40_Y32_N25
\vposition[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[12]~56_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(12));

-- Location: LCCOMB_X40_Y32_N26
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

-- Location: FF_X40_Y32_N27
\vposition[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[13]~58_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(13));

-- Location: LCCOMB_X40_Y32_N28
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

-- Location: FF_X40_Y32_N29
\vposition[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[14]~60_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(14));

-- Location: LCCOMB_X40_Y32_N30
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

-- Location: FF_X40_Y32_N31
\vposition[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[15]~62_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(15));

-- Location: LCCOMB_X40_Y31_N0
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

-- Location: FF_X40_Y31_N1
\vposition[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[16]~64_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(16));

-- Location: LCCOMB_X40_Y31_N2
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

-- Location: FF_X40_Y31_N3
\vposition[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[17]~66_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(17));

-- Location: LCCOMB_X40_Y31_N4
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

-- Location: FF_X40_Y31_N5
\vposition[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[18]~68_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(18));

-- Location: LCCOMB_X40_Y31_N6
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

-- Location: FF_X40_Y31_N7
\vposition[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[19]~70_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(19));

-- Location: LCCOMB_X40_Y31_N8
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

-- Location: FF_X40_Y31_N9
\vposition[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[20]~72_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(20));

-- Location: LCCOMB_X40_Y31_N10
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

-- Location: FF_X40_Y31_N11
\vposition[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[21]~74_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(21));

-- Location: LCCOMB_X40_Y31_N12
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

-- Location: FF_X40_Y31_N13
\vposition[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[22]~76_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(22));

-- Location: LCCOMB_X40_Y31_N14
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

-- Location: FF_X40_Y31_N15
\vposition[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[23]~78_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(23));

-- Location: LCCOMB_X40_Y31_N16
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

-- Location: FF_X40_Y31_N17
\vposition[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[24]~80_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(24));

-- Location: LCCOMB_X40_Y31_N18
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

-- Location: FF_X40_Y31_N19
\vposition[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[25]~82_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(25));

-- Location: LCCOMB_X40_Y31_N20
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

-- Location: FF_X40_Y31_N21
\vposition[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[26]~84_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(26));

-- Location: LCCOMB_X40_Y31_N22
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

-- Location: FF_X40_Y31_N23
\vposition[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[27]~86_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(27));

-- Location: LCCOMB_X40_Y31_N24
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

-- Location: FF_X40_Y31_N25
\vposition[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[28]~88_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(28));

-- Location: LCCOMB_X40_Y31_N26
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

-- Location: FF_X40_Y31_N27
\vposition[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[29]~90_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(29));

-- Location: LCCOMB_X40_Y31_N28
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

-- Location: FF_X40_Y31_N29
\vposition[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[30]~92_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(30));

-- Location: LCCOMB_X40_Y31_N30
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

-- Location: FF_X40_Y31_N31
\vposition[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[31]~94_combout\,
	sclr => \LessThan6~5_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(31));

-- Location: LCCOMB_X41_Y29_N0
\process_0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = (!vposition(31) & (\LessThan6~1_combout\ & !hposition(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => vposition(31),
	datac => \LessThan6~1_combout\,
	datad => hposition(31),
	combout => \process_0~2_combout\);

-- Location: LCCOMB_X39_Y30_N24
\LessThan22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~0_combout\ = (!vposition(2) & (!vposition(1) & !vposition(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datac => vposition(1),
	datad => vposition(0),
	combout => \LessThan22~0_combout\);

-- Location: LCCOMB_X39_Y30_N26
\process_0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~5_combout\ = (!\LessThan22~0_combout\ & (vposition(3) & (vposition(6) & vposition(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan22~0_combout\,
	datab => vposition(3),
	datac => vposition(6),
	datad => vposition(4),
	combout => \process_0~5_combout\);

-- Location: LCCOMB_X39_Y30_N16
\process_0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~3_combout\ = (!vposition(2) & (!vposition(4) & (!vposition(1) & !vposition(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => vposition(4),
	datac => vposition(1),
	datad => vposition(3),
	combout => \process_0~3_combout\);

-- Location: LCCOMB_X39_Y30_N6
\process_0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~4_combout\ = (vposition(5) & ((vposition(8) & ((\process_0~3_combout\))) # (!vposition(8) & (vposition(7))))) # (!vposition(5) & (((vposition(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => vposition(5),
	datac => vposition(8),
	datad => \process_0~3_combout\,
	combout => \process_0~4_combout\);

-- Location: LCCOMB_X39_Y30_N4
\process_0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~6_combout\ = (\process_0~4_combout\ & ((vposition(8) & ((\LessThan6~2_combout\))) # (!vposition(8) & (\process_0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~5_combout\,
	datab => vposition(8),
	datac => \LessThan6~2_combout\,
	datad => \process_0~4_combout\,
	combout => \process_0~6_combout\);

-- Location: LCCOMB_X39_Y30_N30
\process_0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~7_combout\ = (\process_0~6_combout\ & vposition(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \process_0~6_combout\,
	datad => vposition(9),
	combout => \process_0~7_combout\);

-- Location: FF_X39_Y20_N1
\bg_hstop[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(30));

-- Location: LCCOMB_X42_Y23_N0
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

-- Location: FF_X42_Y23_N1
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

-- Location: LCCOMB_X42_Y23_N2
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

-- Location: FF_X42_Y23_N3
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

-- Location: LCCOMB_X42_Y23_N4
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

-- Location: FF_X42_Y23_N5
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

-- Location: LCCOMB_X42_Y23_N6
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

-- Location: FF_X42_Y23_N7
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

-- Location: LCCOMB_X42_Y23_N8
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

-- Location: FF_X42_Y23_N9
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

-- Location: LCCOMB_X42_Y23_N10
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

-- Location: FF_X42_Y23_N11
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

-- Location: LCCOMB_X42_Y23_N12
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

-- Location: FF_X42_Y23_N13
\count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[6]~44_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(6));

-- Location: LCCOMB_X42_Y23_N14
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

-- Location: FF_X42_Y23_N15
\count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[7]~46_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(7));

-- Location: LCCOMB_X42_Y23_N16
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

-- Location: FF_X42_Y23_N17
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

-- Location: LCCOMB_X42_Y23_N18
\count[9]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[9]~50_combout\ = (count(9) & (!\count[8]~49\)) # (!count(9) & ((\count[8]~49\) # (GND)))
-- \count[9]~51\ = CARRY((!\count[8]~49\) # (!count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(9),
	datad => VCC,
	cin => \count[8]~49\,
	combout => \count[9]~50_combout\,
	cout => \count[9]~51\);

-- Location: FF_X42_Y23_N19
\count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[9]~50_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(9));

-- Location: LCCOMB_X42_Y23_N20
\count[10]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \count[10]~52_combout\ = (count(10) & (\count[9]~51\ $ (GND))) # (!count(10) & (!\count[9]~51\ & VCC))
-- \count[10]~53\ = CARRY((count(10) & !\count[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => count(10),
	datad => VCC,
	cin => \count[9]~51\,
	combout => \count[10]~52_combout\,
	cout => \count[10]~53\);

-- Location: FF_X42_Y23_N21
\count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \count[10]~52_combout\,
	sclr => \LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => count(10));

-- Location: LCCOMB_X42_Y23_N22
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

-- Location: FF_X42_Y23_N23
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

-- Location: LCCOMB_X42_Y23_N24
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

-- Location: FF_X42_Y23_N25
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

-- Location: LCCOMB_X42_Y23_N26
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

-- Location: FF_X42_Y23_N27
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

-- Location: LCCOMB_X42_Y23_N28
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

-- Location: FF_X42_Y23_N29
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

-- Location: LCCOMB_X42_Y23_N30
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

-- Location: FF_X42_Y23_N31
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

-- Location: LCCOMB_X42_Y22_N0
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

-- Location: FF_X42_Y22_N1
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

-- Location: LCCOMB_X42_Y22_N2
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

-- Location: FF_X42_Y22_N3
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

-- Location: LCCOMB_X42_Y22_N4
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

-- Location: FF_X42_Y22_N5
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

-- Location: LCCOMB_X42_Y22_N6
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

-- Location: FF_X42_Y22_N7
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

-- Location: LCCOMB_X42_Y22_N8
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

-- Location: FF_X42_Y22_N9
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

-- Location: LCCOMB_X42_Y22_N10
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

-- Location: FF_X42_Y22_N11
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

-- Location: LCCOMB_X42_Y22_N12
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

-- Location: FF_X42_Y22_N13
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

-- Location: LCCOMB_X42_Y22_N14
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

-- Location: FF_X42_Y22_N15
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

-- Location: LCCOMB_X42_Y22_N16
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

-- Location: FF_X42_Y22_N17
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

-- Location: LCCOMB_X42_Y22_N18
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

-- Location: FF_X42_Y22_N19
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

-- Location: LCCOMB_X42_Y22_N20
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

-- Location: FF_X42_Y22_N21
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

-- Location: LCCOMB_X42_Y22_N22
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

-- Location: FF_X42_Y22_N23
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

-- Location: LCCOMB_X42_Y22_N24
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

-- Location: FF_X42_Y22_N25
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

-- Location: LCCOMB_X42_Y22_N26
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

-- Location: FF_X42_Y22_N27
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

-- Location: LCCOMB_X42_Y22_N28
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

-- Location: FF_X42_Y22_N29
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

-- Location: LCCOMB_X42_Y22_N30
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

-- Location: FF_X42_Y22_N31
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

-- Location: LCCOMB_X41_Y22_N28
\LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!count(20) & (!count(21) & (!count(23) & !count(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(20),
	datab => count(21),
	datac => count(23),
	datad => count(22),
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X41_Y22_N20
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (((!count(15) & !count(14))) # (!count(17))) # (!count(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(15),
	datab => count(16),
	datac => count(17),
	datad => count(14),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X41_Y23_N12
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = ((!count(7) & (!count(8) & !count(6)))) # (!count(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(7),
	datab => count(8),
	datac => count(6),
	datad => count(9),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X41_Y22_N2
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!count(13) & (!count(12) & (!count(10) & !count(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(13),
	datab => count(12),
	datac => count(10),
	datad => count(11),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X41_Y22_N8
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (\LessThan0~0_combout\) # ((!count(15) & (\LessThan0~1_combout\ & \LessThan0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(15),
	datab => \LessThan0~0_combout\,
	datac => \LessThan0~1_combout\,
	datad => \LessThan0~2_combout\,
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X41_Y22_N14
\LessThan0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ((\LessThan0~3_combout\) # (!count(19))) # (!count(18))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(18),
	datac => \LessThan0~3_combout\,
	datad => count(19),
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X41_Y22_N26
\LessThan0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (!count(26) & (!count(24) & (!count(27) & !count(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datab => count(24),
	datac => count(27),
	datad => count(25),
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X41_Y22_N24
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

-- Location: LCCOMB_X41_Y22_N22
\LessThan0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (!count(31) & (((!\LessThan0~7_combout\) # (!\LessThan0~4_combout\)) # (!\LessThan0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(31),
	datab => \LessThan0~5_combout\,
	datac => \LessThan0~4_combout\,
	datad => \LessThan0~7_combout\,
	combout => \LessThan0~8_combout\);

-- Location: LCCOMB_X38_Y20_N28
\Add15~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~60_combout\ = (bg_hstop(30) & ((GND) # (!\Add15~59\))) # (!bg_hstop(30) & (\Add15~59\ $ (GND)))
-- \Add15~61\ = CARRY((bg_hstop(30)) # (!\Add15~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(30),
	datad => VCC,
	cin => \Add15~59\,
	combout => \Add15~60_combout\,
	cout => \Add15~61\);

-- Location: LCCOMB_X38_Y20_N30
\Add15~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~62_combout\ = !\Add15~61\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add15~61\,
	combout => \Add15~62_combout\);

-- Location: LCCOMB_X38_Y21_N0
\Add15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~0_combout\ = bg_hstop(0) $ (VCC)
-- \Add15~1\ = CARRY(bg_hstop(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(0),
	datad => VCC,
	combout => \Add15~0_combout\,
	cout => \Add15~1\);

-- Location: LCCOMB_X37_Y20_N18
\bg_hstop~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~31_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~0_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add15~0_combout\,
	datac => bg_hstop(0),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~31_combout\);

-- Location: FF_X37_Y20_N15
\bg_hstop[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~31_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(0));

-- Location: LCCOMB_X38_Y21_N2
\Add15~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~2_combout\ = (bg_hstop(1) & (\Add15~1\ & VCC)) # (!bg_hstop(1) & (!\Add15~1\))
-- \Add15~3\ = CARRY((!bg_hstop(1) & !\Add15~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(1),
	datad => VCC,
	cin => \Add15~1\,
	combout => \Add15~2_combout\,
	cout => \Add15~3\);

-- Location: LCCOMB_X37_Y21_N14
\bg_hstop~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~30_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~2_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~2_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(1),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~30_combout\);

-- Location: FF_X38_Y21_N19
\bg_hstop[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~30_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(1));

-- Location: LCCOMB_X38_Y21_N4
\Add15~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~4_combout\ = (bg_hstop(2) & ((GND) # (!\Add15~3\))) # (!bg_hstop(2) & (\Add15~3\ $ (GND)))
-- \Add15~5\ = CARRY((bg_hstop(2)) # (!\Add15~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(2),
	datad => VCC,
	cin => \Add15~3\,
	combout => \Add15~4_combout\,
	cout => \Add15~5\);

-- Location: LCCOMB_X38_Y23_N0
\bg_hstop~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~29_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~4_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~4_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(2),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~29_combout\);

-- Location: FF_X38_Y23_N1
\bg_hstop[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(2));

-- Location: LCCOMB_X38_Y21_N6
\Add15~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~6_combout\ = (bg_hstop(3) & (\Add15~5\ & VCC)) # (!bg_hstop(3) & (!\Add15~5\))
-- \Add15~7\ = CARRY((!bg_hstop(3) & !\Add15~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(3),
	datad => VCC,
	cin => \Add15~5\,
	combout => \Add15~6_combout\,
	cout => \Add15~7\);

-- Location: LCCOMB_X37_Y21_N16
\bg_hstop~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~28_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~6_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(3),
	datab => \LessThan0~8_combout\,
	datac => \Add15~6_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~28_combout\);

-- Location: FF_X38_Y21_N7
\bg_hstop[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(3));

-- Location: LCCOMB_X38_Y21_N8
\Add15~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~8_combout\ = (bg_hstop(4) & ((GND) # (!\Add15~7\))) # (!bg_hstop(4) & (\Add15~7\ $ (GND)))
-- \Add15~9\ = CARRY((bg_hstop(4)) # (!\Add15~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(4),
	datad => VCC,
	cin => \Add15~7\,
	combout => \Add15~8_combout\,
	cout => \Add15~9\);

-- Location: LCCOMB_X37_Y21_N10
\bg_hstop~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~27_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~8_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(4),
	datac => \Add15~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~27_combout\);

-- Location: FF_X38_Y21_N25
\bg_hstop[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~27_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(4));

-- Location: LCCOMB_X38_Y21_N10
\Add15~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~10_combout\ = (bg_hstop(5) & (\Add15~9\ & VCC)) # (!bg_hstop(5) & (!\Add15~9\))
-- \Add15~11\ = CARRY((!bg_hstop(5) & !\Add15~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(5),
	datad => VCC,
	cin => \Add15~9\,
	combout => \Add15~10_combout\,
	cout => \Add15~11\);

-- Location: LCCOMB_X37_Y21_N20
\bg_hstop~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~26_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~10_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(5),
	datab => \LessThan0~8_combout\,
	datac => \Add15~10_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~26_combout\);

-- Location: FF_X38_Y21_N21
\bg_hstop[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~26_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(5));

-- Location: LCCOMB_X38_Y21_N12
\Add15~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~12_combout\ = (bg_hstop(6) & ((GND) # (!\Add15~11\))) # (!bg_hstop(6) & (\Add15~11\ $ (GND)))
-- \Add15~13\ = CARRY((bg_hstop(6)) # (!\Add15~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(6),
	datad => VCC,
	cin => \Add15~11\,
	combout => \Add15~12_combout\,
	cout => \Add15~13\);

-- Location: LCCOMB_X37_Y21_N12
\Add15~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~64_combout\ = (\LessThan0~8_combout\ & ((\Add15~12_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(6),
	datac => \Add15~12_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add15~64_combout\);

-- Location: LCCOMB_X37_Y20_N28
\bg_hstop~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~25_combout\ = (\Add15~64_combout\) # (((\LessThan0~8_combout\ & \Add15~62_combout\)) # (!\LessThan2~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~64_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add15~62_combout\,
	datad => \LessThan2~22_combout\,
	combout => \bg_hstop~25_combout\);

-- Location: FF_X37_Y20_N29
\bg_hstop[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(6));

-- Location: LCCOMB_X38_Y21_N14
\Add15~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~14_combout\ = (bg_hstop(7) & (\Add15~13\ & VCC)) # (!bg_hstop(7) & (!\Add15~13\))
-- \Add15~15\ = CARRY((!bg_hstop(7) & !\Add15~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(7),
	datad => VCC,
	cin => \Add15~13\,
	combout => \Add15~14_combout\,
	cout => \Add15~15\);

-- Location: LCCOMB_X37_Y21_N18
\LessThan2~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~19_combout\ = (\LessThan0~8_combout\ & ((!\Add15~14_combout\))) # (!\LessThan0~8_combout\ & (!bg_hstop(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(7),
	datac => \Add15~14_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~19_combout\);

-- Location: LCCOMB_X37_Y20_N6
\bg_hstop~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~24_combout\ = (!\LessThan2~19_combout\ & (\LessThan2~22_combout\ & ((!\Add15~62_combout\) # (!\LessThan0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan2~19_combout\,
	datac => \Add15~62_combout\,
	datad => \LessThan2~22_combout\,
	combout => \bg_hstop~24_combout\);

-- Location: FF_X37_Y20_N7
\bg_hstop[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(7));

-- Location: LCCOMB_X38_Y21_N16
\Add15~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~16_combout\ = (bg_hstop(8) & ((GND) # (!\Add15~15\))) # (!bg_hstop(8) & (\Add15~15\ $ (GND)))
-- \Add15~17\ = CARRY((bg_hstop(8)) # (!\Add15~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(8),
	datad => VCC,
	cin => \Add15~15\,
	combout => \Add15~16_combout\,
	cout => \Add15~17\);

-- Location: LCCOMB_X37_Y21_N24
\bg_hstop~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~1_combout\ = (\LessThan0~8_combout\ & ((!\Add15~16_combout\))) # (!\LessThan0~8_combout\ & (!bg_hstop(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(8),
	datac => \LessThan0~8_combout\,
	datad => \Add15~16_combout\,
	combout => \bg_hstop~1_combout\);

-- Location: LCCOMB_X37_Y20_N12
\bg_hstop~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~23_combout\ = (((\Add15~62_combout\ & \LessThan0~8_combout\)) # (!\LessThan2~22_combout\)) # (!\bg_hstop~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~62_combout\,
	datab => \bg_hstop~1_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~22_combout\,
	combout => \bg_hstop~23_combout\);

-- Location: FF_X37_Y20_N13
\bg_hstop[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(8));

-- Location: LCCOMB_X38_Y21_N18
\Add15~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~18_combout\ = (bg_hstop(9) & (\Add15~17\ & VCC)) # (!bg_hstop(9) & (!\Add15~17\))
-- \Add15~19\ = CARRY((!bg_hstop(9) & !\Add15~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(9),
	datad => VCC,
	cin => \Add15~17\,
	combout => \Add15~18_combout\,
	cout => \Add15~19\);

-- Location: LCCOMB_X37_Y21_N26
\bg_hstop~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~22_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~18_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(9),
	datab => \Add15~18_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~22_combout\);

-- Location: FF_X38_Y21_N3
\bg_hstop[9]\ : dffeas
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
	q => bg_hstop(9));

-- Location: LCCOMB_X37_Y21_N6
\LessThan2~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~17_combout\ = (\Add15~2_combout\) # ((\Add15~4_combout\) # ((\Add15~0_combout\) # (\Add15~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~2_combout\,
	datab => \Add15~4_combout\,
	datac => \Add15~0_combout\,
	datad => \Add15~6_combout\,
	combout => \LessThan2~17_combout\);

-- Location: LCCOMB_X37_Y21_N28
\LessThan2~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~18_combout\ = (\LessThan0~8_combout\ & ((\LessThan2~17_combout\) # ((\Add15~10_combout\) # (\Add15~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~17_combout\,
	datab => \Add15~10_combout\,
	datac => \Add15~8_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~18_combout\);

-- Location: LCCOMB_X37_Y21_N22
\LessThan2~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~15_combout\ = (bg_hstop(2)) # ((bg_hstop(0)) # ((bg_hstop(1)) # (bg_hstop(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(2),
	datab => bg_hstop(0),
	datac => bg_hstop(1),
	datad => bg_hstop(3),
	combout => \LessThan2~15_combout\);

-- Location: LCCOMB_X37_Y21_N8
\LessThan2~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~16_combout\ = (!\LessThan0~8_combout\ & ((\LessThan2~15_combout\) # ((bg_hstop(4)) # (bg_hstop(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~15_combout\,
	datab => bg_hstop(4),
	datac => bg_hstop(5),
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~16_combout\);

-- Location: LCCOMB_X37_Y21_N4
\LessThan2~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~20_combout\ = ((\Add15~64_combout\ & ((\LessThan2~18_combout\) # (\LessThan2~16_combout\)))) # (!\LessThan2~19_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~64_combout\,
	datab => \LessThan2~18_combout\,
	datac => \LessThan2~16_combout\,
	datad => \LessThan2~19_combout\,
	combout => \LessThan2~20_combout\);

-- Location: LCCOMB_X37_Y21_N30
\LessThan2~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~21_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add15~18_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(9),
	datab => \Add15~18_combout\,
	datac => \LessThan2~20_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~21_combout\);

-- Location: LCCOMB_X39_Y20_N20
\LessThan2~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~9_combout\ = (bg_hstop(26)) # ((bg_hstop(28)) # ((bg_hstop(27)) # (bg_hstop(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(26),
	datab => bg_hstop(28),
	datac => bg_hstop(27),
	datad => bg_hstop(29),
	combout => \LessThan2~9_combout\);

-- Location: LCCOMB_X38_Y21_N20
\Add15~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~20_combout\ = (bg_hstop(10) & ((GND) # (!\Add15~19\))) # (!bg_hstop(10) & (\Add15~19\ $ (GND)))
-- \Add15~21\ = CARRY((bg_hstop(10)) # (!\Add15~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(10),
	datad => VCC,
	cin => \Add15~19\,
	combout => \Add15~20_combout\,
	cout => \Add15~21\);

-- Location: LCCOMB_X36_Y20_N30
\bg_hstop~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~21_combout\ = ((\LessThan0~8_combout\ & ((\Add15~20_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(10)))) # (!\LessThan2~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(10),
	datab => \LessThan0~8_combout\,
	datac => \LessThan2~23_combout\,
	datad => \Add15~20_combout\,
	combout => \bg_hstop~21_combout\);

-- Location: LCCOMB_X36_Y20_N10
\bg_hstop[10]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[10]~feeder_combout\ = \bg_hstop~21_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~21_combout\,
	combout => \bg_hstop[10]~feeder_combout\);

-- Location: FF_X36_Y20_N11
\bg_hstop[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(10));

-- Location: LCCOMB_X38_Y21_N22
\Add15~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~22_combout\ = (bg_hstop(11) & (\Add15~21\ & VCC)) # (!bg_hstop(11) & (!\Add15~21\))
-- \Add15~23\ = CARRY((!bg_hstop(11) & !\Add15~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(11),
	datad => VCC,
	cin => \Add15~21\,
	combout => \Add15~22_combout\,
	cout => \Add15~23\);

-- Location: LCCOMB_X36_Y20_N24
\bg_hstop~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~20_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~22_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~22_combout\,
	datab => bg_hstop(11),
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~20_combout\);

-- Location: FF_X36_Y20_N1
\bg_hstop[11]\ : dffeas
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
	q => bg_hstop(11));

-- Location: LCCOMB_X38_Y21_N24
\Add15~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~24_combout\ = (bg_hstop(12) & ((GND) # (!\Add15~23\))) # (!bg_hstop(12) & (\Add15~23\ $ (GND)))
-- \Add15~25\ = CARRY((bg_hstop(12)) # (!\Add15~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(12),
	datad => VCC,
	cin => \Add15~23\,
	combout => \Add15~24_combout\,
	cout => \Add15~25\);

-- Location: LCCOMB_X36_Y20_N26
\bg_hstop~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~19_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~24_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(12),
	datab => \LessThan0~8_combout\,
	datac => \LessThan2~23_combout\,
	datad => \Add15~24_combout\,
	combout => \bg_hstop~19_combout\);

-- Location: FF_X37_Y20_N3
\bg_hstop[12]\ : dffeas
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
	q => bg_hstop(12));

-- Location: LCCOMB_X38_Y21_N26
\Add15~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~26_combout\ = (bg_hstop(13) & (\Add15~25\ & VCC)) # (!bg_hstop(13) & (!\Add15~25\))
-- \Add15~27\ = CARRY((!bg_hstop(13) & !\Add15~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(13),
	datad => VCC,
	cin => \Add15~25\,
	combout => \Add15~26_combout\,
	cout => \Add15~27\);

-- Location: LCCOMB_X36_Y20_N16
\bg_hstop~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~18_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~26_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~26_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan2~23_combout\,
	datad => bg_hstop(13),
	combout => \bg_hstop~18_combout\);

-- Location: LCCOMB_X36_Y20_N6
\bg_hstop[13]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[13]~feeder_combout\ = \bg_hstop~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~18_combout\,
	combout => \bg_hstop[13]~feeder_combout\);

-- Location: FF_X36_Y20_N7
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

-- Location: LCCOMB_X38_Y21_N28
\Add15~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~28_combout\ = (bg_hstop(14) & ((GND) # (!\Add15~27\))) # (!bg_hstop(14) & (\Add15~27\ $ (GND)))
-- \Add15~29\ = CARRY((bg_hstop(14)) # (!\Add15~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(14),
	datad => VCC,
	cin => \Add15~27\,
	combout => \Add15~28_combout\,
	cout => \Add15~29\);

-- Location: LCCOMB_X36_Y20_N22
\bg_hstop~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~17_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~28_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~28_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan2~23_combout\,
	datad => bg_hstop(14),
	combout => \bg_hstop~17_combout\);

-- Location: FF_X36_Y20_N13
\bg_hstop[14]\ : dffeas
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
	q => bg_hstop(14));

-- Location: LCCOMB_X38_Y21_N30
\Add15~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~30_combout\ = (bg_hstop(15) & (\Add15~29\ & VCC)) # (!bg_hstop(15) & (!\Add15~29\))
-- \Add15~31\ = CARRY((!bg_hstop(15) & !\Add15~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(15),
	datad => VCC,
	cin => \Add15~29\,
	combout => \Add15~30_combout\,
	cout => \Add15~31\);

-- Location: LCCOMB_X36_Y20_N20
\bg_hstop~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~16_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~30_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(15),
	datab => \Add15~30_combout\,
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~16_combout\);

-- Location: LCCOMB_X36_Y20_N14
\bg_hstop[15]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[15]~feeder_combout\ = \bg_hstop~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~16_combout\,
	combout => \bg_hstop[15]~feeder_combout\);

-- Location: FF_X36_Y20_N15
\bg_hstop[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[15]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(15));

-- Location: LCCOMB_X38_Y20_N0
\Add15~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~32_combout\ = (bg_hstop(16) & ((GND) # (!\Add15~31\))) # (!bg_hstop(16) & (\Add15~31\ $ (GND)))
-- \Add15~33\ = CARRY((bg_hstop(16)) # (!\Add15~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(16),
	datad => VCC,
	cin => \Add15~31\,
	combout => \Add15~32_combout\,
	cout => \Add15~33\);

-- Location: LCCOMB_X36_Y20_N2
\bg_hstop~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~15_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~32_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(16))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~32_combout\,
	datab => bg_hstop(16),
	datac => \LessThan2~23_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~15_combout\);

-- Location: LCCOMB_X36_Y20_N4
\bg_hstop[16]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[16]~feeder_combout\ = \bg_hstop~15_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~15_combout\,
	combout => \bg_hstop[16]~feeder_combout\);

-- Location: FF_X36_Y20_N5
\bg_hstop[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[16]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(16));

-- Location: LCCOMB_X38_Y20_N2
\Add15~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~34_combout\ = (bg_hstop(17) & (\Add15~33\ & VCC)) # (!bg_hstop(17) & (!\Add15~33\))
-- \Add15~35\ = CARRY((!bg_hstop(17) & !\Add15~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(17),
	datad => VCC,
	cin => \Add15~33\,
	combout => \Add15~34_combout\,
	cout => \Add15~35\);

-- Location: LCCOMB_X39_Y20_N30
\bg_hstop~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~14_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~34_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~23_combout\,
	datab => bg_hstop(17),
	datac => \Add15~34_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~14_combout\);

-- Location: FF_X38_Y20_N29
\bg_hstop[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~14_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(17));

-- Location: LCCOMB_X38_Y20_N4
\Add15~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~36_combout\ = (bg_hstop(18) & ((GND) # (!\Add15~35\))) # (!bg_hstop(18) & (\Add15~35\ $ (GND)))
-- \Add15~37\ = CARRY((bg_hstop(18)) # (!\Add15~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(18),
	datad => VCC,
	cin => \Add15~35\,
	combout => \Add15~36_combout\,
	cout => \Add15~37\);

-- Location: LCCOMB_X39_Y20_N16
\bg_hstop~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~13_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~36_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~23_combout\,
	datab => bg_hstop(18),
	datac => \Add15~36_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~13_combout\);

-- Location: FF_X39_Y20_N5
\bg_hstop[18]\ : dffeas
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
	q => bg_hstop(18));

-- Location: LCCOMB_X38_Y20_N6
\Add15~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~38_combout\ = (bg_hstop(19) & (\Add15~37\ & VCC)) # (!bg_hstop(19) & (!\Add15~37\))
-- \Add15~39\ = CARRY((!bg_hstop(19) & !\Add15~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(19),
	datad => VCC,
	cin => \Add15~37\,
	combout => \Add15~38_combout\,
	cout => \Add15~39\);

-- Location: LCCOMB_X39_Y20_N14
\bg_hstop~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~12_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~38_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(19),
	datab => \Add15~38_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~12_combout\);

-- Location: FF_X39_Y20_N23
\bg_hstop[19]\ : dffeas
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
	q => bg_hstop(19));

-- Location: LCCOMB_X38_Y20_N8
\Add15~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~40_combout\ = (bg_hstop(20) & ((GND) # (!\Add15~39\))) # (!bg_hstop(20) & (\Add15~39\ $ (GND)))
-- \Add15~41\ = CARRY((bg_hstop(20)) # (!\Add15~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(20),
	datad => VCC,
	cin => \Add15~39\,
	combout => \Add15~40_combout\,
	cout => \Add15~41\);

-- Location: LCCOMB_X39_Y20_N12
\bg_hstop~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~11_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~40_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~40_combout\,
	datab => bg_hstop(20),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~11_combout\);

-- Location: LCCOMB_X39_Y20_N28
\bg_hstop[20]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[20]~feeder_combout\ = \bg_hstop~11_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~11_combout\,
	combout => \bg_hstop[20]~feeder_combout\);

-- Location: FF_X39_Y20_N29
\bg_hstop[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[20]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(20));

-- Location: LCCOMB_X38_Y20_N10
\Add15~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~42_combout\ = (bg_hstop(21) & (\Add15~41\ & VCC)) # (!bg_hstop(21) & (!\Add15~41\))
-- \Add15~43\ = CARRY((!bg_hstop(21) & !\Add15~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(21),
	datad => VCC,
	cin => \Add15~41\,
	combout => \Add15~42_combout\,
	cout => \Add15~43\);

-- Location: LCCOMB_X39_Y20_N6
\bg_hstop~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~10_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~42_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~23_combout\,
	datab => bg_hstop(21),
	datac => \Add15~42_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~10_combout\);

-- Location: LCCOMB_X39_Y20_N18
\bg_hstop[21]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[21]~feeder_combout\ = \bg_hstop~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~10_combout\,
	combout => \bg_hstop[21]~feeder_combout\);

-- Location: FF_X39_Y20_N19
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

-- Location: LCCOMB_X39_Y20_N22
\LessThan2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~6_combout\ = (bg_hstop(21)) # ((bg_hstop(18)) # ((bg_hstop(19)) # (bg_hstop(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(21),
	datab => bg_hstop(18),
	datac => bg_hstop(19),
	datad => bg_hstop(20),
	combout => \LessThan2~6_combout\);

-- Location: LCCOMB_X38_Y20_N12
\Add15~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~44_combout\ = (bg_hstop(22) & ((GND) # (!\Add15~43\))) # (!bg_hstop(22) & (\Add15~43\ $ (GND)))
-- \Add15~45\ = CARRY((bg_hstop(22)) # (!\Add15~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(22),
	datad => VCC,
	cin => \Add15~43\,
	combout => \Add15~44_combout\,
	cout => \Add15~45\);

-- Location: LCCOMB_X39_Y20_N24
\bg_hstop~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~9_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~44_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(22))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~44_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(22),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~9_combout\);

-- Location: FF_X39_Y20_N9
\bg_hstop[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(22));

-- Location: LCCOMB_X38_Y20_N14
\Add15~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~46_combout\ = (bg_hstop(23) & (\Add15~45\ & VCC)) # (!bg_hstop(23) & (!\Add15~45\))
-- \Add15~47\ = CARRY((!bg_hstop(23) & !\Add15~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(23),
	datad => VCC,
	cin => \Add15~45\,
	combout => \Add15~46_combout\,
	cout => \Add15~47\);

-- Location: LCCOMB_X39_Y20_N26
\bg_hstop~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~8_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~46_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(23),
	datad => \Add15~46_combout\,
	combout => \bg_hstop~8_combout\);

-- Location: FF_X38_Y20_N17
\bg_hstop[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(23));

-- Location: LCCOMB_X38_Y20_N16
\Add15~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~48_combout\ = (bg_hstop(24) & ((GND) # (!\Add15~47\))) # (!bg_hstop(24) & (\Add15~47\ $ (GND)))
-- \Add15~49\ = CARRY((bg_hstop(24)) # (!\Add15~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(24),
	datad => VCC,
	cin => \Add15~47\,
	combout => \Add15~48_combout\,
	cout => \Add15~49\);

-- Location: LCCOMB_X37_Y20_N16
\bg_hstop~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~7_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~48_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(24))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add15~48_combout\,
	datac => bg_hstop(24),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~7_combout\);

-- Location: FF_X37_Y20_N17
\bg_hstop[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(24));

-- Location: LCCOMB_X39_Y20_N8
\LessThan2~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~7_combout\ = (bg_hstop(23)) # ((bg_hstop(24)) # ((bg_hstop(22)) # (bg_hstop(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(23),
	datab => bg_hstop(24),
	datac => bg_hstop(22),
	datad => bg_hstop(25),
	combout => \LessThan2~7_combout\);

-- Location: LCCOMB_X36_Y20_N0
\LessThan2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~4_combout\ = (bg_hstop(12)) # ((bg_hstop(10)) # ((bg_hstop(11)) # (bg_hstop(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(12),
	datab => bg_hstop(10),
	datac => bg_hstop(11),
	datad => bg_hstop(13),
	combout => \LessThan2~4_combout\);

-- Location: LCCOMB_X36_Y20_N12
\LessThan2~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~5_combout\ = (bg_hstop(17)) # ((bg_hstop(16)) # ((bg_hstop(14)) # (bg_hstop(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(17),
	datab => bg_hstop(16),
	datac => bg_hstop(14),
	datad => bg_hstop(15),
	combout => \LessThan2~5_combout\);

-- Location: LCCOMB_X39_Y20_N2
\LessThan2~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~8_combout\ = (\LessThan2~6_combout\) # ((\LessThan2~7_combout\) # ((\LessThan2~4_combout\) # (\LessThan2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~6_combout\,
	datab => \LessThan2~7_combout\,
	datac => \LessThan2~4_combout\,
	datad => \LessThan2~5_combout\,
	combout => \LessThan2~8_combout\);

-- Location: LCCOMB_X39_Y20_N4
\LessThan2~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~10_combout\ = (\LessThan2~9_combout\) # ((\LessThan2~8_combout\) # (bg_hstop(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~9_combout\,
	datab => \LessThan2~8_combout\,
	datad => bg_hstop(30),
	combout => \LessThan2~10_combout\);

-- Location: LCCOMB_X38_Y20_N18
\Add15~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~50_combout\ = (bg_hstop(25) & (\Add15~49\ & VCC)) # (!bg_hstop(25) & (!\Add15~49\))
-- \Add15~51\ = CARRY((!bg_hstop(25) & !\Add15~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(25),
	datad => VCC,
	cin => \Add15~49\,
	combout => \Add15~50_combout\,
	cout => \Add15~51\);

-- Location: LCCOMB_X37_Y20_N14
\LessThan2~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~11_combout\ = (\Add15~46_combout\) # ((\Add15~42_combout\) # (\Add15~44_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~46_combout\,
	datab => \Add15~42_combout\,
	datad => \Add15~44_combout\,
	combout => \LessThan2~11_combout\);

-- Location: LCCOMB_X37_Y20_N2
\LessThan2~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~12_combout\ = (\Add15~52_combout\) # ((\Add15~58_combout\) # (\Add15~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~52_combout\,
	datab => \Add15~58_combout\,
	datad => \Add15~48_combout\,
	combout => \LessThan2~12_combout\);

-- Location: LCCOMB_X37_Y20_N26
\LessThan2~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~13_combout\ = (\Add15~50_combout\) # ((\Add15~54_combout\) # ((\LessThan2~11_combout\) # (\LessThan2~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~50_combout\,
	datab => \Add15~54_combout\,
	datac => \LessThan2~11_combout\,
	datad => \LessThan2~12_combout\,
	combout => \LessThan2~13_combout\);

-- Location: LCCOMB_X37_Y20_N4
\LessThan2~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~14_combout\ = (\LessThan0~8_combout\ & ((\Add15~56_combout\) # ((\LessThan2~13_combout\)))) # (!\LessThan0~8_combout\ & (((\LessThan2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~56_combout\,
	datab => \LessThan2~10_combout\,
	datac => \LessThan2~13_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~14_combout\);

-- Location: LCCOMB_X36_Y20_N28
\LessThan2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (\Add15~26_combout\) # ((\Add15~34_combout\) # ((\Add15~28_combout\) # (\Add15~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~26_combout\,
	datab => \Add15~34_combout\,
	datac => \Add15~28_combout\,
	datad => \Add15~24_combout\,
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X36_Y20_N18
\LessThan2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (\Add15~32_combout\) # ((\Add15~30_combout\) # ((\Add15~40_combout\) # (\LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~32_combout\,
	datab => \Add15~30_combout\,
	datac => \Add15~40_combout\,
	datad => \LessThan2~0_combout\,
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X36_Y20_N8
\LessThan2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (\Add15~22_combout\) # ((\Add15~36_combout\) # ((\Add15~38_combout\) # (\LessThan2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~22_combout\,
	datab => \Add15~36_combout\,
	datac => \Add15~38_combout\,
	datad => \LessThan2~1_combout\,
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X37_Y20_N20
\LessThan2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = (\LessThan0~8_combout\ & ((\Add15~60_combout\) # ((\Add15~20_combout\) # (\LessThan2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add15~60_combout\,
	datac => \Add15~20_combout\,
	datad => \LessThan2~2_combout\,
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X37_Y20_N10
\LessThan2~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~22_combout\ = (\LessThan2~14_combout\) # ((\LessThan2~3_combout\) # ((\LessThan2~21_combout\ & !\bg_hstop~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~21_combout\,
	datab => \bg_hstop~1_combout\,
	datac => \LessThan2~14_combout\,
	datad => \LessThan2~3_combout\,
	combout => \LessThan2~22_combout\);

-- Location: LCCOMB_X37_Y20_N0
\LessThan2~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~23_combout\ = (\LessThan2~22_combout\ & ((!\Add15~62_combout\) # (!\LessThan0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datac => \Add15~62_combout\,
	datad => \LessThan2~22_combout\,
	combout => \LessThan2~23_combout\);

-- Location: LCCOMB_X39_Y20_N10
\bg_hstop~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~6_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & ((\Add15~50_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(25),
	datad => \Add15~50_combout\,
	combout => \bg_hstop~6_combout\);

-- Location: FF_X39_Y20_N11
\bg_hstop[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(25));

-- Location: LCCOMB_X38_Y20_N20
\Add15~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~52_combout\ = (bg_hstop(26) & ((GND) # (!\Add15~51\))) # (!bg_hstop(26) & (\Add15~51\ $ (GND)))
-- \Add15~53\ = CARRY((bg_hstop(26)) # (!\Add15~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(26),
	datad => VCC,
	cin => \Add15~51\,
	combout => \Add15~52_combout\,
	cout => \Add15~53\);

-- Location: LCCOMB_X37_Y20_N22
\bg_hstop~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~5_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~52_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~52_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(26),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~5_combout\);

-- Location: FF_X37_Y20_N23
\bg_hstop[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(26));

-- Location: LCCOMB_X38_Y20_N22
\Add15~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~54_combout\ = (bg_hstop(27) & (\Add15~53\ & VCC)) # (!bg_hstop(27) & (!\Add15~53\))
-- \Add15~55\ = CARRY((!bg_hstop(27) & !\Add15~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(27),
	datad => VCC,
	cin => \Add15~53\,
	combout => \Add15~54_combout\,
	cout => \Add15~55\);

-- Location: LCCOMB_X37_Y20_N8
\bg_hstop~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~4_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~54_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add15~54_combout\,
	datac => bg_hstop(27),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~4_combout\);

-- Location: FF_X37_Y20_N9
\bg_hstop[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(27));

-- Location: LCCOMB_X38_Y20_N24
\Add15~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~56_combout\ = (bg_hstop(28) & ((GND) # (!\Add15~55\))) # (!bg_hstop(28) & (\Add15~55\ $ (GND)))
-- \Add15~57\ = CARRY((bg_hstop(28)) # (!\Add15~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(28),
	datad => VCC,
	cin => \Add15~55\,
	combout => \Add15~56_combout\,
	cout => \Add15~57\);

-- Location: LCCOMB_X37_Y20_N30
\bg_hstop~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~3_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~56_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~56_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(28),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~3_combout\);

-- Location: FF_X37_Y20_N31
\bg_hstop[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(28));

-- Location: LCCOMB_X38_Y20_N26
\Add15~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add15~58_combout\ = (bg_hstop(29) & (\Add15~57\ & VCC)) # (!bg_hstop(29) & (!\Add15~57\))
-- \Add15~59\ = CARRY((!bg_hstop(29) & !\Add15~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(29),
	datad => VCC,
	cin => \Add15~57\,
	combout => \Add15~58_combout\,
	cout => \Add15~59\);

-- Location: LCCOMB_X37_Y20_N24
\bg_hstop~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~2_combout\ = (\LessThan2~23_combout\ & ((\LessThan0~8_combout\ & (\Add15~58_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add15~58_combout\,
	datac => bg_hstop(29),
	datad => \LessThan2~23_combout\,
	combout => \bg_hstop~2_combout\);

-- Location: FF_X37_Y20_N25
\bg_hstop[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(29));

-- Location: LCCOMB_X39_Y20_N0
\bg_hstop~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~0_combout\ = (\LessThan0~8_combout\ & (\Add15~60_combout\ & ((!\Add15~62_combout\)))) # (!\LessThan0~8_combout\ & (((bg_hstop(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add15~60_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(30),
	datad => \Add15~62_combout\,
	combout => \bg_hstop~0_combout\);

-- Location: LCCOMB_X38_Y23_N2
\LessThan12~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~1_cout\ = CARRY((!\bg_hstop~31_combout\ & hposition(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~31_combout\,
	datab => hposition(0),
	datad => VCC,
	cout => \LessThan12~1_cout\);

-- Location: LCCOMB_X38_Y23_N4
\LessThan12~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~3_cout\ = CARRY((hposition(1) & (\bg_hstop~30_combout\ & !\LessThan12~1_cout\)) # (!hposition(1) & ((\bg_hstop~30_combout\) # (!\LessThan12~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => \bg_hstop~30_combout\,
	datad => VCC,
	cin => \LessThan12~1_cout\,
	cout => \LessThan12~3_cout\);

-- Location: LCCOMB_X38_Y23_N6
\LessThan12~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~5_cout\ = CARRY((hposition(2) & ((!\LessThan12~3_cout\) # (!\bg_hstop~29_combout\))) # (!hposition(2) & (!\bg_hstop~29_combout\ & !\LessThan12~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => \bg_hstop~29_combout\,
	datad => VCC,
	cin => \LessThan12~3_cout\,
	cout => \LessThan12~5_cout\);

-- Location: LCCOMB_X38_Y23_N8
\LessThan12~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~7_cout\ = CARRY((hposition(3) & (\bg_hstop~28_combout\ & !\LessThan12~5_cout\)) # (!hposition(3) & ((\bg_hstop~28_combout\) # (!\LessThan12~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \bg_hstop~28_combout\,
	datad => VCC,
	cin => \LessThan12~5_cout\,
	cout => \LessThan12~7_cout\);

-- Location: LCCOMB_X38_Y23_N10
\LessThan12~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~9_cout\ = CARRY((\bg_hstop~27_combout\ & (hposition(4) & !\LessThan12~7_cout\)) # (!\bg_hstop~27_combout\ & ((hposition(4)) # (!\LessThan12~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~27_combout\,
	datab => hposition(4),
	datad => VCC,
	cin => \LessThan12~7_cout\,
	cout => \LessThan12~9_cout\);

-- Location: LCCOMB_X38_Y23_N12
\LessThan12~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~11_cout\ = CARRY((\bg_hstop~26_combout\ & ((!\LessThan12~9_cout\) # (!hposition(5)))) # (!\bg_hstop~26_combout\ & (!hposition(5) & !\LessThan12~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~26_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan12~9_cout\,
	cout => \LessThan12~11_cout\);

-- Location: LCCOMB_X38_Y23_N14
\LessThan12~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~13_cout\ = CARRY((\bg_hstop~25_combout\ & (hposition(6) & !\LessThan12~11_cout\)) # (!\bg_hstop~25_combout\ & ((hposition(6)) # (!\LessThan12~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~25_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan12~11_cout\,
	cout => \LessThan12~13_cout\);

-- Location: LCCOMB_X38_Y23_N16
\LessThan12~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~15_cout\ = CARRY((\bg_hstop~24_combout\ & ((!\LessThan12~13_cout\) # (!hposition(7)))) # (!\bg_hstop~24_combout\ & (!hposition(7) & !\LessThan12~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~24_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan12~13_cout\,
	cout => \LessThan12~15_cout\);

-- Location: LCCOMB_X38_Y23_N18
\LessThan12~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~17_cout\ = CARRY((hposition(8) & ((!\LessThan12~15_cout\) # (!\bg_hstop~23_combout\))) # (!hposition(8) & (!\bg_hstop~23_combout\ & !\LessThan12~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \bg_hstop~23_combout\,
	datad => VCC,
	cin => \LessThan12~15_cout\,
	cout => \LessThan12~17_cout\);

-- Location: LCCOMB_X38_Y23_N20
\LessThan12~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~19_cout\ = CARRY((\bg_hstop~22_combout\ & ((!\LessThan12~17_cout\) # (!hposition(9)))) # (!\bg_hstop~22_combout\ & (!hposition(9) & !\LessThan12~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~22_combout\,
	datab => hposition(9),
	datad => VCC,
	cin => \LessThan12~17_cout\,
	cout => \LessThan12~19_cout\);

-- Location: LCCOMB_X38_Y23_N22
\LessThan12~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~21_cout\ = CARRY((hposition(10) & ((!\LessThan12~19_cout\) # (!\bg_hstop~21_combout\))) # (!hposition(10) & (!\bg_hstop~21_combout\ & !\LessThan12~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \bg_hstop~21_combout\,
	datad => VCC,
	cin => \LessThan12~19_cout\,
	cout => \LessThan12~21_cout\);

-- Location: LCCOMB_X38_Y23_N24
\LessThan12~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~23_cout\ = CARRY((hposition(11) & (\bg_hstop~20_combout\ & !\LessThan12~21_cout\)) # (!hposition(11) & ((\bg_hstop~20_combout\) # (!\LessThan12~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \bg_hstop~20_combout\,
	datad => VCC,
	cin => \LessThan12~21_cout\,
	cout => \LessThan12~23_cout\);

-- Location: LCCOMB_X38_Y23_N26
\LessThan12~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~25_cout\ = CARRY((\bg_hstop~19_combout\ & (hposition(12) & !\LessThan12~23_cout\)) # (!\bg_hstop~19_combout\ & ((hposition(12)) # (!\LessThan12~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~19_combout\,
	datab => hposition(12),
	datad => VCC,
	cin => \LessThan12~23_cout\,
	cout => \LessThan12~25_cout\);

-- Location: LCCOMB_X38_Y23_N28
\LessThan12~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~27_cout\ = CARRY((\bg_hstop~18_combout\ & ((!\LessThan12~25_cout\) # (!hposition(13)))) # (!\bg_hstop~18_combout\ & (!hposition(13) & !\LessThan12~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~18_combout\,
	datab => hposition(13),
	datad => VCC,
	cin => \LessThan12~25_cout\,
	cout => \LessThan12~27_cout\);

-- Location: LCCOMB_X38_Y23_N30
\LessThan12~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~29_cout\ = CARRY((\bg_hstop~17_combout\ & (hposition(14) & !\LessThan12~27_cout\)) # (!\bg_hstop~17_combout\ & ((hposition(14)) # (!\LessThan12~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~17_combout\,
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan12~27_cout\,
	cout => \LessThan12~29_cout\);

-- Location: LCCOMB_X38_Y22_N0
\LessThan12~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~31_cout\ = CARRY((hposition(15) & (\bg_hstop~16_combout\ & !\LessThan12~29_cout\)) # (!hposition(15) & ((\bg_hstop~16_combout\) # (!\LessThan12~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datab => \bg_hstop~16_combout\,
	datad => VCC,
	cin => \LessThan12~29_cout\,
	cout => \LessThan12~31_cout\);

-- Location: LCCOMB_X38_Y22_N2
\LessThan12~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~33_cout\ = CARRY((\bg_hstop~15_combout\ & (hposition(16) & !\LessThan12~31_cout\)) # (!\bg_hstop~15_combout\ & ((hposition(16)) # (!\LessThan12~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~15_combout\,
	datab => hposition(16),
	datad => VCC,
	cin => \LessThan12~31_cout\,
	cout => \LessThan12~33_cout\);

-- Location: LCCOMB_X38_Y22_N4
\LessThan12~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~35_cout\ = CARRY((\bg_hstop~14_combout\ & ((!\LessThan12~33_cout\) # (!hposition(17)))) # (!\bg_hstop~14_combout\ & (!hposition(17) & !\LessThan12~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~14_combout\,
	datab => hposition(17),
	datad => VCC,
	cin => \LessThan12~33_cout\,
	cout => \LessThan12~35_cout\);

-- Location: LCCOMB_X38_Y22_N6
\LessThan12~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~37_cout\ = CARRY((hposition(18) & ((!\LessThan12~35_cout\) # (!\bg_hstop~13_combout\))) # (!hposition(18) & (!\bg_hstop~13_combout\ & !\LessThan12~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(18),
	datab => \bg_hstop~13_combout\,
	datad => VCC,
	cin => \LessThan12~35_cout\,
	cout => \LessThan12~37_cout\);

-- Location: LCCOMB_X38_Y22_N8
\LessThan12~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~39_cout\ = CARRY((hposition(19) & (\bg_hstop~12_combout\ & !\LessThan12~37_cout\)) # (!hposition(19) & ((\bg_hstop~12_combout\) # (!\LessThan12~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datab => \bg_hstop~12_combout\,
	datad => VCC,
	cin => \LessThan12~37_cout\,
	cout => \LessThan12~39_cout\);

-- Location: LCCOMB_X38_Y22_N10
\LessThan12~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~41_cout\ = CARRY((hposition(20) & ((!\LessThan12~39_cout\) # (!\bg_hstop~11_combout\))) # (!hposition(20) & (!\bg_hstop~11_combout\ & !\LessThan12~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \bg_hstop~11_combout\,
	datad => VCC,
	cin => \LessThan12~39_cout\,
	cout => \LessThan12~41_cout\);

-- Location: LCCOMB_X38_Y22_N12
\LessThan12~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~43_cout\ = CARRY((\bg_hstop~10_combout\ & ((!\LessThan12~41_cout\) # (!hposition(21)))) # (!\bg_hstop~10_combout\ & (!hposition(21) & !\LessThan12~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~10_combout\,
	datab => hposition(21),
	datad => VCC,
	cin => \LessThan12~41_cout\,
	cout => \LessThan12~43_cout\);

-- Location: LCCOMB_X38_Y22_N14
\LessThan12~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~45_cout\ = CARRY((hposition(22) & ((!\LessThan12~43_cout\) # (!\bg_hstop~9_combout\))) # (!hposition(22) & (!\bg_hstop~9_combout\ & !\LessThan12~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(22),
	datab => \bg_hstop~9_combout\,
	datad => VCC,
	cin => \LessThan12~43_cout\,
	cout => \LessThan12~45_cout\);

-- Location: LCCOMB_X38_Y22_N16
\LessThan12~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~47_cout\ = CARRY((hposition(23) & (\bg_hstop~8_combout\ & !\LessThan12~45_cout\)) # (!hposition(23) & ((\bg_hstop~8_combout\) # (!\LessThan12~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \bg_hstop~8_combout\,
	datad => VCC,
	cin => \LessThan12~45_cout\,
	cout => \LessThan12~47_cout\);

-- Location: LCCOMB_X38_Y22_N18
\LessThan12~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~49_cout\ = CARRY((hposition(24) & ((!\LessThan12~47_cout\) # (!\bg_hstop~7_combout\))) # (!hposition(24) & (!\bg_hstop~7_combout\ & !\LessThan12~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \bg_hstop~7_combout\,
	datad => VCC,
	cin => \LessThan12~47_cout\,
	cout => \LessThan12~49_cout\);

-- Location: LCCOMB_X38_Y22_N20
\LessThan12~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~51_cout\ = CARRY((hposition(25) & (\bg_hstop~6_combout\ & !\LessThan12~49_cout\)) # (!hposition(25) & ((\bg_hstop~6_combout\) # (!\LessThan12~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(25),
	datab => \bg_hstop~6_combout\,
	datad => VCC,
	cin => \LessThan12~49_cout\,
	cout => \LessThan12~51_cout\);

-- Location: LCCOMB_X38_Y22_N22
\LessThan12~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~53_cout\ = CARRY((\bg_hstop~5_combout\ & (hposition(26) & !\LessThan12~51_cout\)) # (!\bg_hstop~5_combout\ & ((hposition(26)) # (!\LessThan12~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~5_combout\,
	datab => hposition(26),
	datad => VCC,
	cin => \LessThan12~51_cout\,
	cout => \LessThan12~53_cout\);

-- Location: LCCOMB_X38_Y22_N24
\LessThan12~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~55_cout\ = CARRY((hposition(27) & (\bg_hstop~4_combout\ & !\LessThan12~53_cout\)) # (!hposition(27) & ((\bg_hstop~4_combout\) # (!\LessThan12~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => \bg_hstop~4_combout\,
	datad => VCC,
	cin => \LessThan12~53_cout\,
	cout => \LessThan12~55_cout\);

-- Location: LCCOMB_X38_Y22_N26
\LessThan12~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~57_cout\ = CARRY((\bg_hstop~3_combout\ & (hposition(28) & !\LessThan12~55_cout\)) # (!\bg_hstop~3_combout\ & ((hposition(28)) # (!\LessThan12~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~3_combout\,
	datab => hposition(28),
	datad => VCC,
	cin => \LessThan12~55_cout\,
	cout => \LessThan12~57_cout\);

-- Location: LCCOMB_X38_Y22_N28
\LessThan12~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~59_cout\ = CARRY((\bg_hstop~2_combout\ & ((!\LessThan12~57_cout\) # (!hposition(29)))) # (!\bg_hstop~2_combout\ & (!hposition(29) & !\LessThan12~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~2_combout\,
	datab => hposition(29),
	datad => VCC,
	cin => \LessThan12~57_cout\,
	cout => \LessThan12~59_cout\);

-- Location: LCCOMB_X38_Y22_N30
\LessThan12~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~60_combout\ = (hposition(30) & ((!\bg_hstop~0_combout\) # (!\LessThan12~59_cout\))) # (!hposition(30) & (!\LessThan12~59_cout\ & !\bg_hstop~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(30),
	datad => \bg_hstop~0_combout\,
	cin => \LessThan12~59_cout\,
	combout => \LessThan12~60_combout\);

-- Location: FF_X44_Y25_N5
\bg_hstart[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(30));

-- Location: LCCOMB_X46_Y25_N6
\LessThan1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (bg_hstart(23)) # ((bg_hstart(24)) # ((bg_hstart(21)) # (bg_hstart(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(23),
	datab => bg_hstart(24),
	datac => bg_hstart(21),
	datad => bg_hstart(22),
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X46_Y25_N24
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (bg_hstart(9)) # ((bg_hstart(10)) # ((bg_hstart(12)) # (bg_hstart(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(9),
	datab => bg_hstart(10),
	datac => bg_hstart(12),
	datad => bg_hstart(11),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X44_Y25_N24
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (bg_hstart(13)) # ((bg_hstart(16)) # ((bg_hstart(14)) # (bg_hstart(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(13),
	datab => bg_hstart(16),
	datac => bg_hstart(14),
	datad => bg_hstart(15),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X46_Y25_N18
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

-- Location: LCCOMB_X46_Y25_N12
\LessThan1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (\LessThan1~3_combout\) # ((\LessThan1~0_combout\) # ((\LessThan1~1_combout\) # (\LessThan1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~3_combout\,
	datab => \LessThan1~0_combout\,
	datac => \LessThan1~1_combout\,
	datad => \LessThan1~2_combout\,
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X44_Y25_N6
\LessThan1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (bg_hstart(27)) # ((bg_hstart(26)) # ((bg_hstart(25)) # (bg_hstart(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(27),
	datab => bg_hstart(26),
	datac => bg_hstart(25),
	datad => bg_hstart(28),
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X44_Y25_N12
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

-- Location: LCCOMB_X45_Y26_N0
\Add14~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~0_combout\ = bg_hstart(0) $ (VCC)
-- \Add14~1\ = CARRY(bg_hstart(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(0),
	datad => VCC,
	combout => \Add14~0_combout\,
	cout => \Add14~1\);

-- Location: LCCOMB_X44_Y26_N26
\bg_hstart~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~32_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~0_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(0),
	datab => \LessThan0~8_combout\,
	datac => \Add14~0_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~32_combout\);

-- Location: FF_X45_Y26_N3
\bg_hstart[0]\ : dffeas
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
	q => bg_hstart(0));

-- Location: LCCOMB_X45_Y26_N2
\Add14~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~2_combout\ = (bg_hstart(1) & (\Add14~1\ & VCC)) # (!bg_hstart(1) & (!\Add14~1\))
-- \Add14~3\ = CARRY((!bg_hstart(1) & !\Add14~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(1),
	datad => VCC,
	cin => \Add14~1\,
	combout => \Add14~2_combout\,
	cout => \Add14~3\);

-- Location: LCCOMB_X46_Y26_N0
\bg_hstart~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~31_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~2_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~2_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(1),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~31_combout\);

-- Location: FF_X45_Y26_N27
\bg_hstart[1]\ : dffeas
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
	q => bg_hstart(1));

-- Location: LCCOMB_X45_Y26_N4
\Add14~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~4_combout\ = (bg_hstart(2) & ((GND) # (!\Add14~3\))) # (!bg_hstart(2) & (\Add14~3\ $ (GND)))
-- \Add14~5\ = CARRY((bg_hstart(2)) # (!\Add14~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(2),
	datad => VCC,
	cin => \Add14~3\,
	combout => \Add14~4_combout\,
	cout => \Add14~5\);

-- Location: LCCOMB_X44_Y26_N8
\bg_hstart~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~30_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~4_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~4_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(2),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~30_combout\);

-- Location: FF_X45_Y26_N31
\bg_hstart[2]\ : dffeas
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
	q => bg_hstart(2));

-- Location: LCCOMB_X45_Y26_N6
\Add14~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~6_combout\ = (bg_hstart(3) & (\Add14~5\ & VCC)) # (!bg_hstart(3) & (!\Add14~5\))
-- \Add14~7\ = CARRY((!bg_hstart(3) & !\Add14~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(3),
	datad => VCC,
	cin => \Add14~5\,
	combout => \Add14~6_combout\,
	cout => \Add14~7\);

-- Location: LCCOMB_X46_Y26_N22
\bg_hstart~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~29_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~6_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(3),
	datab => \Add14~6_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~29_combout\);

-- Location: FF_X45_Y26_N15
\bg_hstart[3]\ : dffeas
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
	q => bg_hstart(3));

-- Location: LCCOMB_X45_Y26_N8
\Add14~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~8_combout\ = (bg_hstart(4) & ((GND) # (!\Add14~7\))) # (!bg_hstart(4) & (\Add14~7\ $ (GND)))
-- \Add14~9\ = CARRY((bg_hstart(4)) # (!\Add14~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datad => VCC,
	cin => \Add14~7\,
	combout => \Add14~8_combout\,
	cout => \Add14~9\);

-- Location: LCCOMB_X46_Y26_N16
\bg_hstart~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~28_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~8_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~8_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(4),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~28_combout\);

-- Location: FF_X45_Y26_N13
\bg_hstart[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(4));

-- Location: LCCOMB_X45_Y26_N10
\Add14~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~10_combout\ = (bg_hstart(5) & (\Add14~9\ & VCC)) # (!bg_hstart(5) & (!\Add14~9\))
-- \Add14~11\ = CARRY((!bg_hstart(5) & !\Add14~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(5),
	datad => VCC,
	cin => \Add14~9\,
	combout => \Add14~10_combout\,
	cout => \Add14~11\);

-- Location: LCCOMB_X44_Y26_N2
\bg_hstart~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~27_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~10_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(5),
	datab => \Add14~10_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~27_combout\);

-- Location: LCCOMB_X44_Y26_N6
\bg_hstart[5]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[5]~feeder_combout\ = \bg_hstart~27_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~27_combout\,
	combout => \bg_hstart[5]~feeder_combout\);

-- Location: FF_X44_Y26_N7
\bg_hstart[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(5));

-- Location: LCCOMB_X46_Y26_N4
\LessThan1~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = (bg_hstart(0)) # ((bg_hstart(2)) # ((bg_hstart(1)) # (bg_hstart(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(0),
	datab => bg_hstart(2),
	datac => bg_hstart(1),
	datad => bg_hstart(3),
	combout => \LessThan1~7_combout\);

-- Location: LCCOMB_X44_Y26_N12
\LessThan1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = (bg_hstart(5)) # ((bg_hstart(4)) # (\LessThan1~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(5),
	datab => bg_hstart(4),
	datad => \LessThan1~7_combout\,
	combout => \LessThan1~8_combout\);

-- Location: LCCOMB_X45_Y26_N12
\Add14~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~12_combout\ = (bg_hstart(6) & ((GND) # (!\Add14~11\))) # (!bg_hstart(6) & (\Add14~11\ $ (GND)))
-- \Add14~13\ = CARRY((bg_hstart(6)) # (!\Add14~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(6),
	datad => VCC,
	cin => \Add14~11\,
	combout => \Add14~12_combout\,
	cout => \Add14~13\);

-- Location: LCCOMB_X44_Y26_N30
\bg_hstart~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~34_combout\ = ((\LessThan0~8_combout\ & (\Add14~12_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(6))))) # (!\LessThan1~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add14~12_combout\,
	datac => bg_hstart(6),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~34_combout\);

-- Location: FF_X44_Y26_N13
\bg_hstart[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~34_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(6));

-- Location: LCCOMB_X44_Y26_N18
\Add14~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~65_combout\ = (\LessThan0~8_combout\ & ((\Add14~12_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(6),
	datad => \Add14~12_combout\,
	combout => \Add14~65_combout\);

-- Location: LCCOMB_X45_Y26_N14
\Add14~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~14_combout\ = (bg_hstart(7) & (\Add14~13\ & VCC)) # (!bg_hstart(7) & (!\Add14~13\))
-- \Add14~15\ = CARRY((!bg_hstart(7) & !\Add14~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(7),
	datad => VCC,
	cin => \Add14~13\,
	combout => \Add14~14_combout\,
	cout => \Add14~15\);

-- Location: LCCOMB_X44_Y26_N16
\bg_hstart~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~26_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~14_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(7),
	datab => \LessThan0~8_combout\,
	datac => \Add14~14_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~26_combout\);

-- Location: FF_X44_Y26_N19
\bg_hstart[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~26_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(7));

-- Location: LCCOMB_X45_Y26_N16
\Add14~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~16_combout\ = (bg_hstart(8) & ((GND) # (!\Add14~15\))) # (!bg_hstart(8) & (\Add14~15\ $ (GND)))
-- \Add14~17\ = CARRY((bg_hstart(8)) # (!\Add14~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(8),
	datad => VCC,
	cin => \Add14~15\,
	combout => \Add14~16_combout\,
	cout => \Add14~17\);

-- Location: LCCOMB_X44_Y26_N24
\Add14~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~64_combout\ = (\LessThan0~8_combout\ & ((\Add14~16_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(8),
	datac => \LessThan0~8_combout\,
	datad => \Add14~16_combout\,
	combout => \Add14~64_combout\);

-- Location: LCCOMB_X44_Y26_N14
\LessThan1~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~9_combout\ = (\Add14~64_combout\ & ((bg_hstart(7)) # ((\LessThan1~8_combout\ & \Add14~65_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~8_combout\,
	datab => \Add14~65_combout\,
	datac => bg_hstart(7),
	datad => \Add14~64_combout\,
	combout => \LessThan1~9_combout\);

-- Location: LCCOMB_X44_Y26_N28
\LessThan1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~10_combout\ = (\Add14~4_combout\) # ((\Add14~2_combout\) # ((\Add14~0_combout\) # (\Add14~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~4_combout\,
	datab => \Add14~2_combout\,
	datac => \Add14~0_combout\,
	datad => \Add14~6_combout\,
	combout => \LessThan1~10_combout\);

-- Location: LCCOMB_X44_Y26_N10
\LessThan1~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~11_combout\ = (\Add14~65_combout\ & ((\Add14~8_combout\) # ((\LessThan1~10_combout\) # (\Add14~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~8_combout\,
	datab => \LessThan1~10_combout\,
	datac => \Add14~10_combout\,
	datad => \Add14~65_combout\,
	combout => \LessThan1~11_combout\);

-- Location: LCCOMB_X44_Y26_N20
\LessThan1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~12_combout\ = (\LessThan1~11_combout\ & ((\Add14~64_combout\) # ((\Add14~16_combout\ & \Add14~14_combout\)))) # (!\LessThan1~11_combout\ & (\Add14~16_combout\ & (\Add14~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~11_combout\,
	datab => \Add14~16_combout\,
	datac => \Add14~14_combout\,
	datad => \Add14~64_combout\,
	combout => \LessThan1~12_combout\);

-- Location: LCCOMB_X44_Y26_N22
\LessThan1~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~13_combout\ = (\LessThan0~8_combout\ & (((\LessThan1~12_combout\)))) # (!\LessThan0~8_combout\ & ((\LessThan1~6_combout\) # ((\LessThan1~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~6_combout\,
	datab => \LessThan1~9_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~12_combout\,
	combout => \LessThan1~13_combout\);

-- Location: LCCOMB_X46_Y26_N26
\LessThan1~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~18_combout\ = (\LessThan0~8_combout\ & ((\Add14~40_combout\) # ((\Add14~42_combout\) # (\Add14~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~40_combout\,
	datab => \Add14~42_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add14~44_combout\,
	combout => \LessThan1~18_combout\);

-- Location: LCCOMB_X46_Y26_N14
\LessThan1~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~20_combout\ = (\Add14~54_combout\) # (\Add14~52_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add14~54_combout\,
	datad => \Add14~52_combout\,
	combout => \LessThan1~20_combout\);

-- Location: LCCOMB_X46_Y26_N24
\LessThan1~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~21_combout\ = (\LessThan0~8_combout\ & ((\Add14~58_combout\) # ((\LessThan1~20_combout\) # (\Add14~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~58_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~20_combout\,
	datad => \Add14~56_combout\,
	combout => \LessThan1~21_combout\);

-- Location: LCCOMB_X46_Y26_N8
\LessThan1~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~19_combout\ = (\LessThan0~8_combout\ & ((\Add14~48_combout\) # ((\Add14~50_combout\) # (\Add14~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~48_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add14~50_combout\,
	datad => \Add14~46_combout\,
	combout => \LessThan1~19_combout\);

-- Location: LCCOMB_X45_Y25_N28
\Add14~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~60_combout\ = (bg_hstart(30) & ((GND) # (!\Add14~59\))) # (!bg_hstart(30) & (\Add14~59\ $ (GND)))
-- \Add14~61\ = CARRY((bg_hstart(30)) # (!\Add14~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(30),
	datad => VCC,
	cin => \Add14~59\,
	combout => \Add14~60_combout\,
	cout => \Add14~61\);

-- Location: LCCOMB_X46_Y26_N30
\LessThan1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~14_combout\ = (\Add14~26_combout\) # ((\Add14~22_combout\) # ((\Add14~32_combout\) # (\Add14~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~26_combout\,
	datab => \Add14~22_combout\,
	datac => \Add14~32_combout\,
	datad => \Add14~24_combout\,
	combout => \LessThan1~14_combout\);

-- Location: LCCOMB_X46_Y26_N12
\LessThan1~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~15_combout\ = (\Add14~38_combout\) # ((\Add14~28_combout\) # ((\LessThan1~14_combout\) # (\Add14~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~38_combout\,
	datab => \Add14~28_combout\,
	datac => \LessThan1~14_combout\,
	datad => \Add14~30_combout\,
	combout => \LessThan1~15_combout\);

-- Location: LCCOMB_X46_Y26_N6
\LessThan1~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~16_combout\ = (\LessThan1~15_combout\) # ((\Add14~20_combout\) # ((\Add14~36_combout\) # (\Add14~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~15_combout\,
	datab => \Add14~20_combout\,
	datac => \Add14~36_combout\,
	datad => \Add14~34_combout\,
	combout => \LessThan1~16_combout\);

-- Location: LCCOMB_X46_Y26_N28
\LessThan1~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~17_combout\ = (\LessThan0~8_combout\ & ((\Add14~60_combout\) # ((\Add14~18_combout\) # (\LessThan1~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~60_combout\,
	datab => \Add14~18_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~16_combout\,
	combout => \LessThan1~17_combout\);

-- Location: LCCOMB_X46_Y26_N18
\LessThan1~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~22_combout\ = (\LessThan1~18_combout\) # ((\LessThan1~21_combout\) # ((\LessThan1~19_combout\) # (\LessThan1~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~18_combout\,
	datab => \LessThan1~21_combout\,
	datac => \LessThan1~19_combout\,
	datad => \LessThan1~17_combout\,
	combout => \LessThan1~22_combout\);

-- Location: LCCOMB_X46_Y26_N20
\LessThan1~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~23_combout\ = (\LessThan1~13_combout\ & (((!\LessThan0~8_combout\)) # (!\Add14~62_combout\))) # (!\LessThan1~13_combout\ & (\LessThan1~22_combout\ & ((!\LessThan0~8_combout\) # (!\Add14~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~13_combout\,
	datab => \Add14~62_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~22_combout\,
	combout => \LessThan1~23_combout\);

-- Location: LCCOMB_X44_Y26_N4
\bg_hstart~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~33_combout\ = ((\LessThan0~8_combout\ & ((\Add14~16_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(8)))) # (!\LessThan1~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(8),
	datac => \LessThan1~23_combout\,
	datad => \Add14~16_combout\,
	combout => \bg_hstart~33_combout\);

-- Location: LCCOMB_X44_Y26_N0
\bg_hstart[8]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[8]~feeder_combout\ = \bg_hstart~33_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstart~33_combout\,
	combout => \bg_hstart[8]~feeder_combout\);

-- Location: FF_X44_Y26_N1
\bg_hstart[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(8));

-- Location: LCCOMB_X45_Y26_N18
\Add14~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~18_combout\ = (bg_hstart(9) & (\Add14~17\ & VCC)) # (!bg_hstart(9) & (!\Add14~17\))
-- \Add14~19\ = CARRY((!bg_hstart(9) & !\Add14~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(9),
	datad => VCC,
	cin => \Add14~17\,
	combout => \Add14~18_combout\,
	cout => \Add14~19\);

-- Location: LCCOMB_X46_Y25_N2
\bg_hstart~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~25_combout\ = ((\LessThan0~8_combout\ & (\Add14~18_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(9))))) # (!\LessThan1~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~18_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(9),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~25_combout\);

-- Location: FF_X46_Y25_N3
\bg_hstart[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(9));

-- Location: LCCOMB_X45_Y26_N20
\Add14~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~20_combout\ = (bg_hstart(10) & ((GND) # (!\Add14~19\))) # (!bg_hstart(10) & (\Add14~19\ $ (GND)))
-- \Add14~21\ = CARRY((bg_hstart(10)) # (!\Add14~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(10),
	datad => VCC,
	cin => \Add14~19\,
	combout => \Add14~20_combout\,
	cout => \Add14~21\);

-- Location: LCCOMB_X46_Y25_N0
\bg_hstart~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~24_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~20_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add14~20_combout\,
	datac => bg_hstart(10),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~24_combout\);

-- Location: FF_X46_Y25_N1
\bg_hstart[10]\ : dffeas
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
	q => bg_hstart(10));

-- Location: LCCOMB_X45_Y26_N22
\Add14~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~22_combout\ = (bg_hstart(11) & (\Add14~21\ & VCC)) # (!bg_hstart(11) & (!\Add14~21\))
-- \Add14~23\ = CARRY((!bg_hstart(11) & !\Add14~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datad => VCC,
	cin => \Add14~21\,
	combout => \Add14~22_combout\,
	cout => \Add14~23\);

-- Location: LCCOMB_X46_Y25_N14
\bg_hstart~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~23_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~22_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datab => \LessThan0~8_combout\,
	datac => \Add14~22_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~23_combout\);

-- Location: LCCOMB_X46_Y25_N10
\bg_hstart[11]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[11]~feeder_combout\ = \bg_hstart~23_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstart~23_combout\,
	combout => \bg_hstart[11]~feeder_combout\);

-- Location: FF_X46_Y25_N11
\bg_hstart[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(11));

-- Location: LCCOMB_X45_Y26_N24
\Add14~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~24_combout\ = (bg_hstart(12) & ((GND) # (!\Add14~23\))) # (!bg_hstart(12) & (\Add14~23\ $ (GND)))
-- \Add14~25\ = CARRY((bg_hstart(12)) # (!\Add14~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(12),
	datad => VCC,
	cin => \Add14~23\,
	combout => \Add14~24_combout\,
	cout => \Add14~25\);

-- Location: LCCOMB_X46_Y26_N2
\bg_hstart~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~22_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~24_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(12),
	datab => \Add14~24_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~22_combout\);

-- Location: FF_X46_Y25_N25
\bg_hstart[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~22_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(12));

-- Location: LCCOMB_X45_Y26_N26
\Add14~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~26_combout\ = (bg_hstart(13) & (\Add14~25\ & VCC)) # (!bg_hstart(13) & (!\Add14~25\))
-- \Add14~27\ = CARRY((!bg_hstart(13) & !\Add14~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(13),
	datad => VCC,
	cin => \Add14~25\,
	combout => \Add14~26_combout\,
	cout => \Add14~27\);

-- Location: LCCOMB_X44_Y25_N2
\bg_hstart~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~21_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~26_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(13),
	datab => \LessThan0~8_combout\,
	datac => \Add14~26_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~21_combout\);

-- Location: LCCOMB_X44_Y25_N10
\bg_hstart[13]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[13]~feeder_combout\ = \bg_hstart~21_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~21_combout\,
	combout => \bg_hstart[13]~feeder_combout\);

-- Location: FF_X44_Y25_N11
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

-- Location: LCCOMB_X45_Y26_N28
\Add14~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~28_combout\ = (bg_hstart(14) & ((GND) # (!\Add14~27\))) # (!bg_hstart(14) & (\Add14~27\ $ (GND)))
-- \Add14~29\ = CARRY((bg_hstart(14)) # (!\Add14~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(14),
	datad => VCC,
	cin => \Add14~27\,
	combout => \Add14~28_combout\,
	cout => \Add14~29\);

-- Location: LCCOMB_X44_Y25_N0
\bg_hstart~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~20_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~28_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~28_combout\,
	datab => bg_hstart(14),
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~20_combout\);

-- Location: FF_X44_Y25_N25
\bg_hstart[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~20_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(14));

-- Location: LCCOMB_X45_Y26_N30
\Add14~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~30_combout\ = (bg_hstart(15) & (\Add14~29\ & VCC)) # (!bg_hstart(15) & (!\Add14~29\))
-- \Add14~31\ = CARRY((!bg_hstart(15) & !\Add14~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(15),
	datad => VCC,
	cin => \Add14~29\,
	combout => \Add14~30_combout\,
	cout => \Add14~31\);

-- Location: LCCOMB_X44_Y25_N22
\bg_hstart~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~19_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~30_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(15),
	datac => \Add14~30_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~19_combout\);

-- Location: LCCOMB_X44_Y25_N18
\bg_hstart[15]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[15]~feeder_combout\ = \bg_hstart~19_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstart~19_combout\,
	combout => \bg_hstart[15]~feeder_combout\);

-- Location: FF_X44_Y25_N19
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

-- Location: LCCOMB_X45_Y25_N0
\Add14~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~32_combout\ = (bg_hstart(16) & ((GND) # (!\Add14~31\))) # (!bg_hstart(16) & (\Add14~31\ $ (GND)))
-- \Add14~33\ = CARRY((bg_hstart(16)) # (!\Add14~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(16),
	datad => VCC,
	cin => \Add14~31\,
	combout => \Add14~32_combout\,
	cout => \Add14~33\);

-- Location: LCCOMB_X44_Y25_N28
\bg_hstart~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~18_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~32_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(16))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~32_combout\,
	datab => bg_hstart(16),
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~18_combout\);

-- Location: LCCOMB_X44_Y25_N16
\bg_hstart[16]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart[16]~feeder_combout\ = \bg_hstart~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstart~18_combout\,
	combout => \bg_hstart[16]~feeder_combout\);

-- Location: FF_X44_Y25_N17
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

-- Location: LCCOMB_X45_Y25_N2
\Add14~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~34_combout\ = (bg_hstart(17) & (\Add14~33\ & VCC)) # (!bg_hstart(17) & (!\Add14~33\))
-- \Add14~35\ = CARRY((!bg_hstart(17) & !\Add14~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(17),
	datad => VCC,
	cin => \Add14~33\,
	combout => \Add14~34_combout\,
	cout => \Add14~35\);

-- Location: LCCOMB_X46_Y25_N8
\bg_hstart~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~17_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~34_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~34_combout\,
	datab => bg_hstart(17),
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~17_combout\);

-- Location: FF_X46_Y25_N19
\bg_hstart[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~17_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(17));

-- Location: LCCOMB_X45_Y25_N4
\Add14~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~36_combout\ = (bg_hstart(18) & ((GND) # (!\Add14~35\))) # (!bg_hstart(18) & (\Add14~35\ $ (GND)))
-- \Add14~37\ = CARRY((bg_hstart(18)) # (!\Add14~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(18),
	datad => VCC,
	cin => \Add14~35\,
	combout => \Add14~36_combout\,
	cout => \Add14~37\);

-- Location: LCCOMB_X46_Y25_N16
\bg_hstart~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~16_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~36_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add14~36_combout\,
	datac => bg_hstart(18),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~16_combout\);

-- Location: FF_X46_Y25_N17
\bg_hstart[18]\ : dffeas
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
	q => bg_hstart(18));

-- Location: LCCOMB_X45_Y25_N6
\Add14~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~38_combout\ = (bg_hstart(19) & (\Add14~37\ & VCC)) # (!bg_hstart(19) & (!\Add14~37\))
-- \Add14~39\ = CARRY((!bg_hstart(19) & !\Add14~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(19),
	datad => VCC,
	cin => \Add14~37\,
	combout => \Add14~38_combout\,
	cout => \Add14~39\);

-- Location: LCCOMB_X46_Y25_N22
\bg_hstart~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~15_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~38_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(19))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add14~38_combout\,
	datac => bg_hstart(19),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~15_combout\);

-- Location: FF_X46_Y25_N23
\bg_hstart[19]\ : dffeas
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
	q => bg_hstart(19));

-- Location: LCCOMB_X45_Y25_N8
\Add14~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~40_combout\ = (bg_hstart(20) & ((GND) # (!\Add14~39\))) # (!bg_hstart(20) & (\Add14~39\ $ (GND)))
-- \Add14~41\ = CARRY((bg_hstart(20)) # (!\Add14~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(20),
	datad => VCC,
	cin => \Add14~39\,
	combout => \Add14~40_combout\,
	cout => \Add14~41\);

-- Location: LCCOMB_X46_Y25_N4
\bg_hstart~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~14_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~40_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add14~40_combout\,
	datac => bg_hstart(20),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~14_combout\);

-- Location: FF_X46_Y25_N5
\bg_hstart[20]\ : dffeas
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
	q => bg_hstart(20));

-- Location: LCCOMB_X45_Y25_N10
\Add14~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~42_combout\ = (bg_hstart(21) & (\Add14~41\ & VCC)) # (!bg_hstart(21) & (!\Add14~41\))
-- \Add14~43\ = CARRY((!bg_hstart(21) & !\Add14~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(21),
	datad => VCC,
	cin => \Add14~41\,
	combout => \Add14~42_combout\,
	cout => \Add14~43\);

-- Location: LCCOMB_X46_Y25_N26
\bg_hstart~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~13_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~42_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~42_combout\,
	datab => bg_hstart(21),
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~13_combout\);

-- Location: FF_X46_Y25_N7
\bg_hstart[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~13_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(21));

-- Location: LCCOMB_X45_Y25_N12
\Add14~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~44_combout\ = (bg_hstart(22) & ((GND) # (!\Add14~43\))) # (!bg_hstart(22) & (\Add14~43\ $ (GND)))
-- \Add14~45\ = CARRY((bg_hstart(22)) # (!\Add14~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(22),
	datad => VCC,
	cin => \Add14~43\,
	combout => \Add14~44_combout\,
	cout => \Add14~45\);

-- Location: LCCOMB_X46_Y25_N28
\bg_hstart~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~12_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~44_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(22))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~44_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(22),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~12_combout\);

-- Location: FF_X46_Y25_N29
\bg_hstart[22]\ : dffeas
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
	q => bg_hstart(22));

-- Location: LCCOMB_X45_Y25_N14
\Add14~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~46_combout\ = (bg_hstart(23) & (\Add14~45\ & VCC)) # (!bg_hstart(23) & (!\Add14~45\))
-- \Add14~47\ = CARRY((!bg_hstart(23) & !\Add14~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(23),
	datad => VCC,
	cin => \Add14~45\,
	combout => \Add14~46_combout\,
	cout => \Add14~47\);

-- Location: LCCOMB_X46_Y25_N30
\bg_hstart~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~11_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~46_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~46_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(23),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~11_combout\);

-- Location: FF_X46_Y25_N31
\bg_hstart[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(23));

-- Location: LCCOMB_X45_Y25_N16
\Add14~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~48_combout\ = (bg_hstart(24) & ((GND) # (!\Add14~47\))) # (!bg_hstart(24) & (\Add14~47\ $ (GND)))
-- \Add14~49\ = CARRY((bg_hstart(24)) # (!\Add14~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(24),
	datad => VCC,
	cin => \Add14~47\,
	combout => \Add14~48_combout\,
	cout => \Add14~49\);

-- Location: LCCOMB_X46_Y25_N20
\bg_hstart~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~10_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~48_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(24))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~48_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(24),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~10_combout\);

-- Location: FF_X46_Y25_N21
\bg_hstart[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(24));

-- Location: LCCOMB_X45_Y25_N18
\Add14~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~50_combout\ = (bg_hstart(25) & (\Add14~49\ & VCC)) # (!bg_hstart(25) & (!\Add14~49\))
-- \Add14~51\ = CARRY((!bg_hstart(25) & !\Add14~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(25),
	datad => VCC,
	cin => \Add14~49\,
	combout => \Add14~50_combout\,
	cout => \Add14~51\);

-- Location: LCCOMB_X44_Y25_N14
\bg_hstart~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~9_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add14~50_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(25),
	datab => \Add14~50_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~9_combout\);

-- Location: FF_X44_Y25_N7
\bg_hstart[25]\ : dffeas
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
	q => bg_hstart(25));

-- Location: LCCOMB_X45_Y25_N20
\Add14~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~52_combout\ = (bg_hstart(26) & ((GND) # (!\Add14~51\))) # (!bg_hstart(26) & (\Add14~51\ $ (GND)))
-- \Add14~53\ = CARRY((bg_hstart(26)) # (!\Add14~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(26),
	datad => VCC,
	cin => \Add14~51\,
	combout => \Add14~52_combout\,
	cout => \Add14~53\);

-- Location: LCCOMB_X44_Y25_N8
\bg_hstart~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~8_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~52_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~52_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(26),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~8_combout\);

-- Location: FF_X44_Y25_N9
\bg_hstart[26]\ : dffeas
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
	q => bg_hstart(26));

-- Location: LCCOMB_X45_Y25_N22
\Add14~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~54_combout\ = (bg_hstart(27) & (\Add14~53\ & VCC)) # (!bg_hstart(27) & (!\Add14~53\))
-- \Add14~55\ = CARRY((!bg_hstart(27) & !\Add14~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(27),
	datad => VCC,
	cin => \Add14~53\,
	combout => \Add14~54_combout\,
	cout => \Add14~55\);

-- Location: LCCOMB_X44_Y25_N30
\bg_hstart~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~7_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~54_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~54_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(27),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~7_combout\);

-- Location: FF_X44_Y25_N31
\bg_hstart[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(27));

-- Location: LCCOMB_X45_Y25_N24
\Add14~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~56_combout\ = (bg_hstart(28) & ((GND) # (!\Add14~55\))) # (!bg_hstart(28) & (\Add14~55\ $ (GND)))
-- \Add14~57\ = CARRY((bg_hstart(28)) # (!\Add14~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(28),
	datad => VCC,
	cin => \Add14~55\,
	combout => \Add14~56_combout\,
	cout => \Add14~57\);

-- Location: LCCOMB_X44_Y25_N20
\bg_hstart~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~6_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~56_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~56_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(28),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~6_combout\);

-- Location: FF_X44_Y25_N21
\bg_hstart[28]\ : dffeas
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
	q => bg_hstart(28));

-- Location: LCCOMB_X45_Y25_N26
\Add14~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~58_combout\ = (bg_hstart(29) & (\Add14~57\ & VCC)) # (!bg_hstart(29) & (!\Add14~57\))
-- \Add14~59\ = CARRY((!bg_hstart(29) & !\Add14~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(29),
	datad => VCC,
	cin => \Add14~57\,
	combout => \Add14~58_combout\,
	cout => \Add14~59\);

-- Location: LCCOMB_X44_Y25_N26
\bg_hstart~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~5_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add14~58_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add14~58_combout\,
	datac => bg_hstart(29),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~5_combout\);

-- Location: FF_X44_Y25_N27
\bg_hstart[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(29));

-- Location: LCCOMB_X45_Y25_N30
\Add14~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add14~62_combout\ = !\Add14~61\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add14~61\,
	combout => \Add14~62_combout\);

-- Location: LCCOMB_X44_Y25_N4
\bg_hstart~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~4_combout\ = (\LessThan0~8_combout\ & (!\Add14~62_combout\ & (\Add14~60_combout\))) # (!\LessThan0~8_combout\ & (((bg_hstart(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add14~62_combout\,
	datab => \Add14~60_combout\,
	datac => bg_hstart(30),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~4_combout\);

-- Location: LCCOMB_X43_Y26_N2
\LessThan11~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~1_cout\ = CARRY((!hposition(0) & \bg_hstart~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => \bg_hstart~32_combout\,
	datad => VCC,
	cout => \LessThan11~1_cout\);

-- Location: LCCOMB_X43_Y26_N4
\LessThan11~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~3_cout\ = CARRY((hposition(1) & ((!\LessThan11~1_cout\) # (!\bg_hstart~31_combout\))) # (!hposition(1) & (!\bg_hstart~31_combout\ & !\LessThan11~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => \bg_hstart~31_combout\,
	datad => VCC,
	cin => \LessThan11~1_cout\,
	cout => \LessThan11~3_cout\);

-- Location: LCCOMB_X43_Y26_N6
\LessThan11~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~5_cout\ = CARRY((hposition(2) & (\bg_hstart~30_combout\ & !\LessThan11~3_cout\)) # (!hposition(2) & ((\bg_hstart~30_combout\) # (!\LessThan11~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => \bg_hstart~30_combout\,
	datad => VCC,
	cin => \LessThan11~3_cout\,
	cout => \LessThan11~5_cout\);

-- Location: LCCOMB_X43_Y26_N8
\LessThan11~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~7_cout\ = CARRY((\bg_hstart~29_combout\ & (hposition(3) & !\LessThan11~5_cout\)) # (!\bg_hstart~29_combout\ & ((hposition(3)) # (!\LessThan11~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~29_combout\,
	datab => hposition(3),
	datad => VCC,
	cin => \LessThan11~5_cout\,
	cout => \LessThan11~7_cout\);

-- Location: LCCOMB_X43_Y26_N10
\LessThan11~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~9_cout\ = CARRY((\bg_hstart~28_combout\ & ((!\LessThan11~7_cout\) # (!hposition(4)))) # (!\bg_hstart~28_combout\ & (!hposition(4) & !\LessThan11~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~28_combout\,
	datab => hposition(4),
	datad => VCC,
	cin => \LessThan11~7_cout\,
	cout => \LessThan11~9_cout\);

-- Location: LCCOMB_X43_Y26_N12
\LessThan11~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~11_cout\ = CARRY((\bg_hstart~27_combout\ & (hposition(5) & !\LessThan11~9_cout\)) # (!\bg_hstart~27_combout\ & ((hposition(5)) # (!\LessThan11~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~27_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan11~9_cout\,
	cout => \LessThan11~11_cout\);

-- Location: LCCOMB_X43_Y26_N14
\LessThan11~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~13_cout\ = CARRY((\bg_hstart~34_combout\ & ((!\LessThan11~11_cout\) # (!hposition(6)))) # (!\bg_hstart~34_combout\ & (!hposition(6) & !\LessThan11~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~34_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan11~11_cout\,
	cout => \LessThan11~13_cout\);

-- Location: LCCOMB_X43_Y26_N16
\LessThan11~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~15_cout\ = CARRY((hposition(7) & ((!\LessThan11~13_cout\) # (!\bg_hstart~26_combout\))) # (!hposition(7) & (!\bg_hstart~26_combout\ & !\LessThan11~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(7),
	datab => \bg_hstart~26_combout\,
	datad => VCC,
	cin => \LessThan11~13_cout\,
	cout => \LessThan11~15_cout\);

-- Location: LCCOMB_X43_Y26_N18
\LessThan11~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~17_cout\ = CARRY((\bg_hstart~33_combout\ & ((!\LessThan11~15_cout\) # (!hposition(8)))) # (!\bg_hstart~33_combout\ & (!hposition(8) & !\LessThan11~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~33_combout\,
	datab => hposition(8),
	datad => VCC,
	cin => \LessThan11~15_cout\,
	cout => \LessThan11~17_cout\);

-- Location: LCCOMB_X43_Y26_N20
\LessThan11~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~19_cout\ = CARRY((hposition(9) & ((!\LessThan11~17_cout\) # (!\bg_hstart~25_combout\))) # (!hposition(9) & (!\bg_hstart~25_combout\ & !\LessThan11~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => \bg_hstart~25_combout\,
	datad => VCC,
	cin => \LessThan11~17_cout\,
	cout => \LessThan11~19_cout\);

-- Location: LCCOMB_X43_Y26_N22
\LessThan11~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~21_cout\ = CARRY((\bg_hstart~24_combout\ & ((!\LessThan11~19_cout\) # (!hposition(10)))) # (!\bg_hstart~24_combout\ & (!hposition(10) & !\LessThan11~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~24_combout\,
	datab => hposition(10),
	datad => VCC,
	cin => \LessThan11~19_cout\,
	cout => \LessThan11~21_cout\);

-- Location: LCCOMB_X43_Y26_N24
\LessThan11~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~23_cout\ = CARRY((\bg_hstart~23_combout\ & (hposition(11) & !\LessThan11~21_cout\)) # (!\bg_hstart~23_combout\ & ((hposition(11)) # (!\LessThan11~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~23_combout\,
	datab => hposition(11),
	datad => VCC,
	cin => \LessThan11~21_cout\,
	cout => \LessThan11~23_cout\);

-- Location: LCCOMB_X43_Y26_N26
\LessThan11~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~25_cout\ = CARRY((\bg_hstart~22_combout\ & ((!\LessThan11~23_cout\) # (!hposition(12)))) # (!\bg_hstart~22_combout\ & (!hposition(12) & !\LessThan11~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~22_combout\,
	datab => hposition(12),
	datad => VCC,
	cin => \LessThan11~23_cout\,
	cout => \LessThan11~25_cout\);

-- Location: LCCOMB_X43_Y26_N28
\LessThan11~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~27_cout\ = CARRY((hposition(13) & ((!\LessThan11~25_cout\) # (!\bg_hstart~21_combout\))) # (!hposition(13) & (!\bg_hstart~21_combout\ & !\LessThan11~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \bg_hstart~21_combout\,
	datad => VCC,
	cin => \LessThan11~25_cout\,
	cout => \LessThan11~27_cout\);

-- Location: LCCOMB_X43_Y26_N30
\LessThan11~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~29_cout\ = CARRY((hposition(14) & (\bg_hstart~20_combout\ & !\LessThan11~27_cout\)) # (!hposition(14) & ((\bg_hstart~20_combout\) # (!\LessThan11~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datab => \bg_hstart~20_combout\,
	datad => VCC,
	cin => \LessThan11~27_cout\,
	cout => \LessThan11~29_cout\);

-- Location: LCCOMB_X43_Y25_N0
\LessThan11~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~31_cout\ = CARRY((hposition(15) & ((!\LessThan11~29_cout\) # (!\bg_hstart~19_combout\))) # (!hposition(15) & (!\bg_hstart~19_combout\ & !\LessThan11~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datab => \bg_hstart~19_combout\,
	datad => VCC,
	cin => \LessThan11~29_cout\,
	cout => \LessThan11~31_cout\);

-- Location: LCCOMB_X43_Y25_N2
\LessThan11~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~33_cout\ = CARRY((hposition(16) & (\bg_hstart~18_combout\ & !\LessThan11~31_cout\)) # (!hposition(16) & ((\bg_hstart~18_combout\) # (!\LessThan11~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(16),
	datab => \bg_hstart~18_combout\,
	datad => VCC,
	cin => \LessThan11~31_cout\,
	cout => \LessThan11~33_cout\);

-- Location: LCCOMB_X43_Y25_N4
\LessThan11~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~35_cout\ = CARRY((hposition(17) & ((!\LessThan11~33_cout\) # (!\bg_hstart~17_combout\))) # (!hposition(17) & (!\bg_hstart~17_combout\ & !\LessThan11~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => \bg_hstart~17_combout\,
	datad => VCC,
	cin => \LessThan11~33_cout\,
	cout => \LessThan11~35_cout\);

-- Location: LCCOMB_X43_Y25_N6
\LessThan11~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~37_cout\ = CARRY((\bg_hstart~16_combout\ & ((!\LessThan11~35_cout\) # (!hposition(18)))) # (!\bg_hstart~16_combout\ & (!hposition(18) & !\LessThan11~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~16_combout\,
	datab => hposition(18),
	datad => VCC,
	cin => \LessThan11~35_cout\,
	cout => \LessThan11~37_cout\);

-- Location: LCCOMB_X43_Y25_N8
\LessThan11~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~39_cout\ = CARRY((hposition(19) & ((!\LessThan11~37_cout\) # (!\bg_hstart~15_combout\))) # (!hposition(19) & (!\bg_hstart~15_combout\ & !\LessThan11~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datab => \bg_hstart~15_combout\,
	datad => VCC,
	cin => \LessThan11~37_cout\,
	cout => \LessThan11~39_cout\);

-- Location: LCCOMB_X43_Y25_N10
\LessThan11~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~41_cout\ = CARRY((hposition(20) & (\bg_hstart~14_combout\ & !\LessThan11~39_cout\)) # (!hposition(20) & ((\bg_hstart~14_combout\) # (!\LessThan11~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \bg_hstart~14_combout\,
	datad => VCC,
	cin => \LessThan11~39_cout\,
	cout => \LessThan11~41_cout\);

-- Location: LCCOMB_X43_Y25_N12
\LessThan11~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~43_cout\ = CARRY((hposition(21) & ((!\LessThan11~41_cout\) # (!\bg_hstart~13_combout\))) # (!hposition(21) & (!\bg_hstart~13_combout\ & !\LessThan11~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => \bg_hstart~13_combout\,
	datad => VCC,
	cin => \LessThan11~41_cout\,
	cout => \LessThan11~43_cout\);

-- Location: LCCOMB_X43_Y25_N14
\LessThan11~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~45_cout\ = CARRY((\bg_hstart~12_combout\ & ((!\LessThan11~43_cout\) # (!hposition(22)))) # (!\bg_hstart~12_combout\ & (!hposition(22) & !\LessThan11~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~12_combout\,
	datab => hposition(22),
	datad => VCC,
	cin => \LessThan11~43_cout\,
	cout => \LessThan11~45_cout\);

-- Location: LCCOMB_X43_Y25_N16
\LessThan11~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~47_cout\ = CARRY((\bg_hstart~11_combout\ & (hposition(23) & !\LessThan11~45_cout\)) # (!\bg_hstart~11_combout\ & ((hposition(23)) # (!\LessThan11~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~11_combout\,
	datab => hposition(23),
	datad => VCC,
	cin => \LessThan11~45_cout\,
	cout => \LessThan11~47_cout\);

-- Location: LCCOMB_X43_Y25_N18
\LessThan11~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~49_cout\ = CARRY((\bg_hstart~10_combout\ & ((!\LessThan11~47_cout\) # (!hposition(24)))) # (!\bg_hstart~10_combout\ & (!hposition(24) & !\LessThan11~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~10_combout\,
	datab => hposition(24),
	datad => VCC,
	cin => \LessThan11~47_cout\,
	cout => \LessThan11~49_cout\);

-- Location: LCCOMB_X43_Y25_N20
\LessThan11~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~51_cout\ = CARRY((hposition(25) & ((!\LessThan11~49_cout\) # (!\bg_hstart~9_combout\))) # (!hposition(25) & (!\bg_hstart~9_combout\ & !\LessThan11~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(25),
	datab => \bg_hstart~9_combout\,
	datad => VCC,
	cin => \LessThan11~49_cout\,
	cout => \LessThan11~51_cout\);

-- Location: LCCOMB_X43_Y25_N22
\LessThan11~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~53_cout\ = CARRY((hposition(26) & (\bg_hstart~8_combout\ & !\LessThan11~51_cout\)) # (!hposition(26) & ((\bg_hstart~8_combout\) # (!\LessThan11~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(26),
	datab => \bg_hstart~8_combout\,
	datad => VCC,
	cin => \LessThan11~51_cout\,
	cout => \LessThan11~53_cout\);

-- Location: LCCOMB_X43_Y25_N24
\LessThan11~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~55_cout\ = CARRY((\bg_hstart~7_combout\ & (hposition(27) & !\LessThan11~53_cout\)) # (!\bg_hstart~7_combout\ & ((hposition(27)) # (!\LessThan11~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~7_combout\,
	datab => hposition(27),
	datad => VCC,
	cin => \LessThan11~53_cout\,
	cout => \LessThan11~55_cout\);

-- Location: LCCOMB_X43_Y25_N26
\LessThan11~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~57_cout\ = CARRY((\bg_hstart~6_combout\ & ((!\LessThan11~55_cout\) # (!hposition(28)))) # (!\bg_hstart~6_combout\ & (!hposition(28) & !\LessThan11~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~6_combout\,
	datab => hposition(28),
	datad => VCC,
	cin => \LessThan11~55_cout\,
	cout => \LessThan11~57_cout\);

-- Location: LCCOMB_X43_Y25_N28
\LessThan11~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~59_cout\ = CARRY((hposition(29) & ((!\LessThan11~57_cout\) # (!\bg_hstart~5_combout\))) # (!hposition(29) & (!\bg_hstart~5_combout\ & !\LessThan11~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(29),
	datab => \bg_hstart~5_combout\,
	datad => VCC,
	cin => \LessThan11~57_cout\,
	cout => \LessThan11~59_cout\);

-- Location: LCCOMB_X43_Y25_N30
\LessThan11~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~60_combout\ = (hposition(30) & (!\LessThan11~59_cout\ & \bg_hstart~4_combout\)) # (!hposition(30) & ((\bg_hstart~4_combout\) # (!\LessThan11~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(30),
	datad => \bg_hstart~4_combout\,
	cin => \LessThan11~59_cout\,
	combout => \LessThan11~60_combout\);

-- Location: LCCOMB_X38_Y28_N28
\process_0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~8_combout\ = (\process_0~2_combout\ & (\process_0~7_combout\ & (!\LessThan12~60_combout\ & !\LessThan11~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datab => \process_0~7_combout\,
	datac => \LessThan12~60_combout\,
	datad => \LessThan11~60_combout\,
	combout => \process_0~8_combout\);

-- Location: LCCOMB_X43_Y28_N2
\Add22~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~0_combout\ = (hposition(0) & ((GND) # (!\bg_hstart~32_combout\))) # (!hposition(0) & (\bg_hstart~32_combout\ $ (GND)))
-- \Add22~1\ = CARRY((hposition(0)) # (!\bg_hstart~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => \bg_hstart~32_combout\,
	datad => VCC,
	combout => \Add22~0_combout\,
	cout => \Add22~1\);

-- Location: LCCOMB_X43_Y28_N4
\Add22~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~2_combout\ = (\bg_hstart~31_combout\ & ((hposition(1) & (!\Add22~1\)) # (!hposition(1) & ((\Add22~1\) # (GND))))) # (!\bg_hstart~31_combout\ & ((hposition(1) & (\Add22~1\ & VCC)) # (!hposition(1) & (!\Add22~1\))))
-- \Add22~3\ = CARRY((\bg_hstart~31_combout\ & ((!\Add22~1\) # (!hposition(1)))) # (!\bg_hstart~31_combout\ & (!hposition(1) & !\Add22~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~31_combout\,
	datab => hposition(1),
	datad => VCC,
	cin => \Add22~1\,
	combout => \Add22~2_combout\,
	cout => \Add22~3\);

-- Location: LCCOMB_X43_Y28_N6
\Add22~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~4_combout\ = ((hposition(2) $ (\bg_hstart~30_combout\ $ (\Add22~3\)))) # (GND)
-- \Add22~5\ = CARRY((hposition(2) & ((!\Add22~3\) # (!\bg_hstart~30_combout\))) # (!hposition(2) & (!\bg_hstart~30_combout\ & !\Add22~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => \bg_hstart~30_combout\,
	datad => VCC,
	cin => \Add22~3\,
	combout => \Add22~4_combout\,
	cout => \Add22~5\);

-- Location: LCCOMB_X43_Y28_N8
\Add22~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~6_combout\ = (hposition(3) & ((\bg_hstart~29_combout\ & (!\Add22~5\)) # (!\bg_hstart~29_combout\ & (\Add22~5\ & VCC)))) # (!hposition(3) & ((\bg_hstart~29_combout\ & ((\Add22~5\) # (GND))) # (!\bg_hstart~29_combout\ & (!\Add22~5\))))
-- \Add22~7\ = CARRY((hposition(3) & (\bg_hstart~29_combout\ & !\Add22~5\)) # (!hposition(3) & ((\bg_hstart~29_combout\) # (!\Add22~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \bg_hstart~29_combout\,
	datad => VCC,
	cin => \Add22~5\,
	combout => \Add22~6_combout\,
	cout => \Add22~7\);

-- Location: LCCOMB_X43_Y28_N10
\Add22~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~8_combout\ = ((\bg_hstart~28_combout\ $ (hposition(4) $ (\Add22~7\)))) # (GND)
-- \Add22~9\ = CARRY((\bg_hstart~28_combout\ & (hposition(4) & !\Add22~7\)) # (!\bg_hstart~28_combout\ & ((hposition(4)) # (!\Add22~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~28_combout\,
	datab => hposition(4),
	datad => VCC,
	cin => \Add22~7\,
	combout => \Add22~8_combout\,
	cout => \Add22~9\);

-- Location: LCCOMB_X43_Y28_N12
\Add22~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~10_combout\ = (\bg_hstart~27_combout\ & ((hposition(5) & (!\Add22~9\)) # (!hposition(5) & ((\Add22~9\) # (GND))))) # (!\bg_hstart~27_combout\ & ((hposition(5) & (\Add22~9\ & VCC)) # (!hposition(5) & (!\Add22~9\))))
-- \Add22~11\ = CARRY((\bg_hstart~27_combout\ & ((!\Add22~9\) # (!hposition(5)))) # (!\bg_hstart~27_combout\ & (!hposition(5) & !\Add22~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~27_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \Add22~9\,
	combout => \Add22~10_combout\,
	cout => \Add22~11\);

-- Location: LCCOMB_X43_Y28_N14
\Add22~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~12_combout\ = ((\bg_hstart~34_combout\ $ (hposition(6) $ (\Add22~11\)))) # (GND)
-- \Add22~13\ = CARRY((\bg_hstart~34_combout\ & (hposition(6) & !\Add22~11\)) # (!\bg_hstart~34_combout\ & ((hposition(6)) # (!\Add22~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~34_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \Add22~11\,
	combout => \Add22~12_combout\,
	cout => \Add22~13\);

-- Location: LCCOMB_X43_Y28_N16
\Add22~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~14_combout\ = (hposition(7) & ((\bg_hstart~26_combout\ & (!\Add22~13\)) # (!\bg_hstart~26_combout\ & (\Add22~13\ & VCC)))) # (!hposition(7) & ((\bg_hstart~26_combout\ & ((\Add22~13\) # (GND))) # (!\bg_hstart~26_combout\ & (!\Add22~13\))))
-- \Add22~15\ = CARRY((hposition(7) & (\bg_hstart~26_combout\ & !\Add22~13\)) # (!hposition(7) & ((\bg_hstart~26_combout\) # (!\Add22~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(7),
	datab => \bg_hstart~26_combout\,
	datad => VCC,
	cin => \Add22~13\,
	combout => \Add22~14_combout\,
	cout => \Add22~15\);

-- Location: LCCOMB_X43_Y28_N18
\Add22~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~16_combout\ = ((hposition(8) $ (\bg_hstart~33_combout\ $ (\Add22~15\)))) # (GND)
-- \Add22~17\ = CARRY((hposition(8) & ((!\Add22~15\) # (!\bg_hstart~33_combout\))) # (!hposition(8) & (!\bg_hstart~33_combout\ & !\Add22~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \bg_hstart~33_combout\,
	datad => VCC,
	cin => \Add22~15\,
	combout => \Add22~16_combout\,
	cout => \Add22~17\);

-- Location: LCCOMB_X43_Y28_N20
\Add22~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~18_combout\ = (\bg_hstart~25_combout\ & ((hposition(9) & (!\Add22~17\)) # (!hposition(9) & ((\Add22~17\) # (GND))))) # (!\bg_hstart~25_combout\ & ((hposition(9) & (\Add22~17\ & VCC)) # (!hposition(9) & (!\Add22~17\))))
-- \Add22~19\ = CARRY((\bg_hstart~25_combout\ & ((!\Add22~17\) # (!hposition(9)))) # (!\bg_hstart~25_combout\ & (!hposition(9) & !\Add22~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~25_combout\,
	datab => hposition(9),
	datad => VCC,
	cin => \Add22~17\,
	combout => \Add22~18_combout\,
	cout => \Add22~19\);

-- Location: LCCOMB_X43_Y28_N22
\Add22~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~20_combout\ = ((hposition(10) $ (\bg_hstart~24_combout\ $ (\Add22~19\)))) # (GND)
-- \Add22~21\ = CARRY((hposition(10) & ((!\Add22~19\) # (!\bg_hstart~24_combout\))) # (!hposition(10) & (!\bg_hstart~24_combout\ & !\Add22~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \bg_hstart~24_combout\,
	datad => VCC,
	cin => \Add22~19\,
	combout => \Add22~20_combout\,
	cout => \Add22~21\);

-- Location: LCCOMB_X43_Y28_N24
\Add22~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~22_combout\ = (\bg_hstart~23_combout\ & ((hposition(11) & (!\Add22~21\)) # (!hposition(11) & ((\Add22~21\) # (GND))))) # (!\bg_hstart~23_combout\ & ((hposition(11) & (\Add22~21\ & VCC)) # (!hposition(11) & (!\Add22~21\))))
-- \Add22~23\ = CARRY((\bg_hstart~23_combout\ & ((!\Add22~21\) # (!hposition(11)))) # (!\bg_hstart~23_combout\ & (!hposition(11) & !\Add22~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~23_combout\,
	datab => hposition(11),
	datad => VCC,
	cin => \Add22~21\,
	combout => \Add22~22_combout\,
	cout => \Add22~23\);

-- Location: LCCOMB_X43_Y28_N26
\Add22~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~24_combout\ = ((hposition(12) $ (\bg_hstart~22_combout\ $ (\Add22~23\)))) # (GND)
-- \Add22~25\ = CARRY((hposition(12) & ((!\Add22~23\) # (!\bg_hstart~22_combout\))) # (!hposition(12) & (!\bg_hstart~22_combout\ & !\Add22~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \bg_hstart~22_combout\,
	datad => VCC,
	cin => \Add22~23\,
	combout => \Add22~24_combout\,
	cout => \Add22~25\);

-- Location: LCCOMB_X43_Y28_N28
\Add22~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~26_combout\ = (\bg_hstart~21_combout\ & ((hposition(13) & (!\Add22~25\)) # (!hposition(13) & ((\Add22~25\) # (GND))))) # (!\bg_hstart~21_combout\ & ((hposition(13) & (\Add22~25\ & VCC)) # (!hposition(13) & (!\Add22~25\))))
-- \Add22~27\ = CARRY((\bg_hstart~21_combout\ & ((!\Add22~25\) # (!hposition(13)))) # (!\bg_hstart~21_combout\ & (!hposition(13) & !\Add22~25\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~21_combout\,
	datab => hposition(13),
	datad => VCC,
	cin => \Add22~25\,
	combout => \Add22~26_combout\,
	cout => \Add22~27\);

-- Location: LCCOMB_X42_Y28_N18
\Add23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add23~0_combout\ = (\Add22~18_combout\ & (vposition(0) $ (VCC))) # (!\Add22~18_combout\ & (vposition(0) & VCC))
-- \Add23~1\ = CARRY((\Add22~18_combout\ & vposition(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add22~18_combout\,
	datab => vposition(0),
	datad => VCC,
	combout => \Add23~0_combout\,
	cout => \Add23~1\);

-- Location: LCCOMB_X42_Y28_N20
\Add23~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add23~2_combout\ = (vposition(1) & ((\Add22~20_combout\ & (\Add23~1\ & VCC)) # (!\Add22~20_combout\ & (!\Add23~1\)))) # (!vposition(1) & ((\Add22~20_combout\ & (!\Add23~1\)) # (!\Add22~20_combout\ & ((\Add23~1\) # (GND)))))
-- \Add23~3\ = CARRY((vposition(1) & (!\Add22~20_combout\ & !\Add23~1\)) # (!vposition(1) & ((!\Add23~1\) # (!\Add22~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(1),
	datab => \Add22~20_combout\,
	datad => VCC,
	cin => \Add23~1\,
	combout => \Add23~2_combout\,
	cout => \Add23~3\);

-- Location: LCCOMB_X42_Y28_N22
\Add23~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add23~4_combout\ = ((vposition(2) $ (\Add22~22_combout\ $ (!\Add23~3\)))) # (GND)
-- \Add23~5\ = CARRY((vposition(2) & ((\Add22~22_combout\) # (!\Add23~3\))) # (!vposition(2) & (\Add22~22_combout\ & !\Add23~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => \Add22~22_combout\,
	datad => VCC,
	cin => \Add23~3\,
	combout => \Add23~4_combout\,
	cout => \Add23~5\);

-- Location: LCCOMB_X42_Y28_N24
\Add23~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add23~6_combout\ = (\Add22~24_combout\ & ((vposition(3) & (\Add23~5\ & VCC)) # (!vposition(3) & (!\Add23~5\)))) # (!\Add22~24_combout\ & ((vposition(3) & (!\Add23~5\)) # (!vposition(3) & ((\Add23~5\) # (GND)))))
-- \Add23~7\ = CARRY((\Add22~24_combout\ & (!vposition(3) & !\Add23~5\)) # (!\Add22~24_combout\ & ((!\Add23~5\) # (!vposition(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add22~24_combout\,
	datab => vposition(3),
	datad => VCC,
	cin => \Add23~5\,
	combout => \Add23~6_combout\,
	cout => \Add23~7\);

-- Location: LCCOMB_X42_Y28_N26
\Add23~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add23~8_combout\ = ((vposition(4) $ (\Add22~26_combout\ $ (!\Add23~7\)))) # (GND)
-- \Add23~9\ = CARRY((vposition(4) & ((\Add22~26_combout\) # (!\Add23~7\))) # (!vposition(4) & (\Add22~26_combout\ & !\Add23~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => \Add22~26_combout\,
	datad => VCC,
	cin => \Add23~7\,
	combout => \Add23~8_combout\,
	cout => \Add23~9\);

-- Location: LCCOMB_X42_Y28_N4
\bg_address[9]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[9]~6_combout\ = \Add23~0_combout\ $ (VCC)
-- \bg_address[9]~7\ = CARRY(\Add23~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add23~0_combout\,
	datad => VCC,
	combout => \bg_address[9]~6_combout\,
	cout => \bg_address[9]~7\);

-- Location: LCCOMB_X42_Y28_N6
\bg_address[10]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[10]~8_combout\ = (\Add23~2_combout\ & (\bg_address[9]~7\ & VCC)) # (!\Add23~2_combout\ & (!\bg_address[9]~7\))
-- \bg_address[10]~9\ = CARRY((!\Add23~2_combout\ & !\bg_address[9]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add23~2_combout\,
	datad => VCC,
	cin => \bg_address[9]~7\,
	combout => \bg_address[10]~8_combout\,
	cout => \bg_address[10]~9\);

-- Location: LCCOMB_X42_Y28_N8
\bg_address[11]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[11]~10_combout\ = (\Add23~4_combout\ & ((GND) # (!\bg_address[10]~9\))) # (!\Add23~4_combout\ & (\bg_address[10]~9\ $ (GND)))
-- \bg_address[11]~11\ = CARRY((\Add23~4_combout\) # (!\bg_address[10]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add23~4_combout\,
	datad => VCC,
	cin => \bg_address[10]~9\,
	combout => \bg_address[11]~10_combout\,
	cout => \bg_address[11]~11\);

-- Location: LCCOMB_X42_Y28_N10
\bg_address[12]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[12]~12_combout\ = (\Add23~6_combout\ & (!\bg_address[11]~11\)) # (!\Add23~6_combout\ & ((\bg_address[11]~11\) # (GND)))
-- \bg_address[12]~13\ = CARRY((!\bg_address[11]~11\) # (!\Add23~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add23~6_combout\,
	datad => VCC,
	cin => \bg_address[11]~11\,
	combout => \bg_address[12]~12_combout\,
	cout => \bg_address[12]~13\);

-- Location: LCCOMB_X42_Y28_N12
\bg_address[13]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[13]~14_combout\ = (\Add23~8_combout\ & (\bg_address[12]~13\ $ (GND))) # (!\Add23~8_combout\ & (!\bg_address[12]~13\ & VCC))
-- \bg_address[13]~15\ = CARRY((\Add23~8_combout\ & !\bg_address[12]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add23~8_combout\,
	datad => VCC,
	cin => \bg_address[12]~13\,
	combout => \bg_address[13]~14_combout\,
	cout => \bg_address[13]~15\);

-- Location: FF_X42_Y28_N13
\bg_address[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[13]~14_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(13));

-- Location: FF_X42_Y28_N25
\bgread|altsyncram_component|auto_generated|address_reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => bg_address(13),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|address_reg_a\(0));

-- Location: LCCOMB_X42_Y24_N16
\bgread|altsyncram_component|auto_generated|out_address_reg_a[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|out_address_reg_a[0]~feeder_combout\ = \bgread|altsyncram_component|auto_generated|address_reg_a\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bgread|altsyncram_component|auto_generated|address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|out_address_reg_a[0]~feeder_combout\);

-- Location: FF_X42_Y24_N17
\bgread|altsyncram_component|auto_generated|out_address_reg_a[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bgread|altsyncram_component|auto_generated|out_address_reg_a[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0));

-- Location: LCCOMB_X43_Y28_N30
\Add22~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add22~28_combout\ = hposition(14) $ (\bg_hstart~20_combout\ $ (\Add22~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datab => \bg_hstart~20_combout\,
	cin => \Add22~27\,
	combout => \Add22~28_combout\);

-- Location: LCCOMB_X42_Y28_N28
\Add23~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add23~10_combout\ = \Add22~28_combout\ $ (vposition(5) $ (\Add23~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add22~28_combout\,
	datab => vposition(5),
	cin => \Add23~9\,
	combout => \Add23~10_combout\);

-- Location: LCCOMB_X42_Y28_N14
\bg_address[14]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[14]~16_combout\ = \bg_address[13]~15\ $ (\Add23~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Add23~10_combout\,
	cin => \bg_address[13]~15\,
	combout => \bg_address[14]~16_combout\);

-- Location: FF_X42_Y28_N15
\bg_address[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[14]~16_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(14));

-- Location: LCCOMB_X42_Y28_N16
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

-- Location: FF_X43_Y28_N3
\bg_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~0_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(0));

-- Location: FF_X43_Y28_N5
\bg_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~2_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(1));

-- Location: FF_X43_Y28_N7
\bg_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~4_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(2));

-- Location: FF_X43_Y28_N9
\bg_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~6_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(3));

-- Location: FF_X43_Y28_N11
\bg_address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~8_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(4));

-- Location: FF_X43_Y28_N13
\bg_address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~10_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(5));

-- Location: FF_X43_Y28_N15
\bg_address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~12_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(6));

-- Location: FF_X43_Y28_N17
\bg_address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~14_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(7));

-- Location: FF_X43_Y28_N19
\bg_address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add22~16_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(8));

-- Location: FF_X42_Y28_N5
\bg_address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[9]~6_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(9));

-- Location: FF_X42_Y28_N7
\bg_address[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[10]~8_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(10));

-- Location: FF_X42_Y28_N9
\bg_address[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[11]~10_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(11));

-- Location: FF_X42_Y28_N11
\bg_address[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[12]~12_combout\,
	ena => \process_0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(12));

-- Location: M9K_X33_Y20_N0
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

-- Location: LCCOMB_X42_Y24_N4
\bgread|altsyncram_component|auto_generated|address_reg_a[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|address_reg_a[1]~feeder_combout\ = bg_address(14)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => bg_address(14),
	combout => \bgread|altsyncram_component|auto_generated|address_reg_a[1]~feeder_combout\);

-- Location: FF_X42_Y24_N5
\bgread|altsyncram_component|auto_generated|address_reg_a[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bgread|altsyncram_component|auto_generated|address_reg_a[1]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|address_reg_a\(1));

-- Location: FF_X42_Y24_N7
\bgread|altsyncram_component|auto_generated|out_address_reg_a[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bgread|altsyncram_component|auto_generated|address_reg_a\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1));

-- Location: LCCOMB_X42_Y28_N0
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

-- Location: M9K_X53_Y11_N0
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

-- Location: LCCOMB_X45_Y28_N28
\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\);

-- Location: LCCOMB_X42_Y28_N30
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

-- Location: M9K_X33_Y29_N0
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

-- Location: LCCOMB_X42_Y28_N2
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

-- Location: M9K_X53_Y32_N0
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

-- Location: LCCOMB_X45_Y28_N22
\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\);

-- Location: FF_X39_Y22_N25
\obstacle_hstart[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~1_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(30));

-- Location: LCCOMB_X40_Y23_N28
\Add12~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~60_combout\ = (obstacle_hstart(30) & ((GND) # (!\Add12~59\))) # (!obstacle_hstart(30) & (\Add12~59\ $ (GND)))
-- \Add12~61\ = CARRY((obstacle_hstart(30)) # (!\Add12~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(30),
	datad => VCC,
	cin => \Add12~59\,
	combout => \Add12~60_combout\,
	cout => \Add12~61\);

-- Location: LCCOMB_X40_Y23_N30
\Add12~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~62_combout\ = !\Add12~61\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add12~61\,
	combout => \Add12~62_combout\);

-- Location: LCCOMB_X41_Y23_N22
\LessThan3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (!\Add12~62_combout\) # (!\LessThan0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan0~8_combout\,
	datad => \Add12~62_combout\,
	combout => \LessThan3~0_combout\);

-- Location: FF_X39_Y22_N3
\obstacle_hstart[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(8));

-- Location: FF_X38_Y26_N19
\o_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(1));

-- Location: FF_X39_Y28_N11
\o_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(0));

-- Location: LCCOMB_X37_Y26_N0
\Add27~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~0_combout\ = o_count(0) $ (VCC)
-- \Add27~1\ = CARRY(o_count(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(0),
	datad => VCC,
	combout => \Add27~0_combout\,
	cout => \Add27~1\);

-- Location: LCCOMB_X37_Y26_N2
\Add27~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~2_combout\ = (o_count(1) & (!\Add27~1\)) # (!o_count(1) & ((\Add27~1\) # (GND)))
-- \Add27~3\ = CARRY((!\Add27~1\) # (!o_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(1),
	datad => VCC,
	cin => \Add27~1\,
	combout => \Add27~2_combout\,
	cout => \Add27~3\);

-- Location: LCCOMB_X37_Y26_N4
\Add27~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~4_combout\ = (o_count(2) & (\Add27~3\ $ (GND))) # (!o_count(2) & (!\Add27~3\ & VCC))
-- \Add27~5\ = CARRY((o_count(2) & !\Add27~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(2),
	datad => VCC,
	cin => \Add27~3\,
	combout => \Add27~4_combout\,
	cout => \Add27~5\);

-- Location: LCCOMB_X38_Y26_N8
\o_count~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~28_combout\ = (\LessThan20~5_combout\ & ((o_count(2)) # ((\Add27~4_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~4_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~4_combout\,
	datac => o_count(2),
	datad => \process_0~30_combout\,
	combout => \o_count~28_combout\);

-- Location: FF_X38_Y26_N9
\o_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(2));

-- Location: LCCOMB_X37_Y26_N6
\Add27~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~6_combout\ = (o_count(3) & (!\Add27~5\)) # (!o_count(3) & ((\Add27~5\) # (GND)))
-- \Add27~7\ = CARRY((!\Add27~5\) # (!o_count(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(3),
	datad => VCC,
	cin => \Add27~5\,
	combout => \Add27~6_combout\,
	cout => \Add27~7\);

-- Location: LCCOMB_X38_Y26_N22
\o_count~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~21_combout\ = (\Add27~6_combout\ & ((\process_0~30_combout\) # ((o_count(3) & \LessThan20~5_combout\)))) # (!\Add27~6_combout\ & (((o_count(3) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~6_combout\,
	datab => \process_0~30_combout\,
	datac => o_count(3),
	datad => \LessThan20~5_combout\,
	combout => \o_count~21_combout\);

-- Location: FF_X38_Y26_N23
\o_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(3));

-- Location: LCCOMB_X37_Y26_N8
\Add27~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~8_combout\ = (o_count(4) & (\Add27~7\ $ (GND))) # (!o_count(4) & (!\Add27~7\ & VCC))
-- \Add27~9\ = CARRY((o_count(4) & !\Add27~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(4),
	datad => VCC,
	cin => \Add27~7\,
	combout => \Add27~8_combout\,
	cout => \Add27~9\);

-- Location: LCCOMB_X38_Y26_N20
\o_count~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~20_combout\ = (\LessThan20~5_combout\ & ((o_count(4)) # ((\Add27~8_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~8_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~8_combout\,
	datac => o_count(4),
	datad => \process_0~30_combout\,
	combout => \o_count~20_combout\);

-- Location: FF_X38_Y26_N21
\o_count[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(4));

-- Location: LCCOMB_X37_Y26_N10
\Add27~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~10_combout\ = (o_count(5) & (!\Add27~9\)) # (!o_count(5) & ((\Add27~9\) # (GND)))
-- \Add27~11\ = CARRY((!\Add27~9\) # (!o_count(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(5),
	datad => VCC,
	cin => \Add27~9\,
	combout => \Add27~10_combout\,
	cout => \Add27~11\);

-- Location: LCCOMB_X38_Y25_N22
\o_count~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~13_combout\ = (\LessThan20~5_combout\ & ((o_count(5)) # ((\Add27~10_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (((\Add27~10_combout\ & \process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => o_count(5),
	datac => \Add27~10_combout\,
	datad => \process_0~30_combout\,
	combout => \o_count~13_combout\);

-- Location: FF_X38_Y25_N1
\o_count[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \o_count~13_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(5));

-- Location: LCCOMB_X37_Y26_N12
\Add27~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~12_combout\ = (o_count(6) & (\Add27~11\ $ (GND))) # (!o_count(6) & (!\Add27~11\ & VCC))
-- \Add27~13\ = CARRY((o_count(6) & !\Add27~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(6),
	datad => VCC,
	cin => \Add27~11\,
	combout => \Add27~12_combout\,
	cout => \Add27~13\);

-- Location: LCCOMB_X38_Y26_N14
\o_count~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~22_combout\ = (\LessThan20~5_combout\ & ((o_count(6)) # ((\Add27~12_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~12_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~12_combout\,
	datac => o_count(6),
	datad => \process_0~30_combout\,
	combout => \o_count~22_combout\);

-- Location: FF_X38_Y26_N15
\o_count[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(6));

-- Location: LCCOMB_X37_Y26_N14
\Add27~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~14_combout\ = (o_count(7) & (!\Add27~13\)) # (!o_count(7) & ((\Add27~13\) # (GND)))
-- \Add27~15\ = CARRY((!\Add27~13\) # (!o_count(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(7),
	datad => VCC,
	cin => \Add27~13\,
	combout => \Add27~14_combout\,
	cout => \Add27~15\);

-- Location: LCCOMB_X38_Y26_N4
\o_count~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~29_combout\ = (\LessThan20~5_combout\ & ((o_count(7)) # ((\Add27~14_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~14_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~14_combout\,
	datac => o_count(7),
	datad => \process_0~30_combout\,
	combout => \o_count~29_combout\);

-- Location: FF_X38_Y26_N5
\o_count[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(7));

-- Location: LCCOMB_X37_Y26_N16
\Add27~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~16_combout\ = (o_count(8) & (\Add27~15\ $ (GND))) # (!o_count(8) & (!\Add27~15\ & VCC))
-- \Add27~17\ = CARRY((o_count(8) & !\Add27~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(8),
	datad => VCC,
	cin => \Add27~15\,
	combout => \Add27~16_combout\,
	cout => \Add27~17\);

-- Location: LCCOMB_X38_Y26_N6
\o_count~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~24_combout\ = (\Add27~16_combout\ & ((\process_0~30_combout\) # ((o_count(8) & \LessThan20~5_combout\)))) # (!\Add27~16_combout\ & (((o_count(8) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~16_combout\,
	datab => \process_0~30_combout\,
	datac => o_count(8),
	datad => \LessThan20~5_combout\,
	combout => \o_count~24_combout\);

-- Location: FF_X38_Y26_N7
\o_count[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(8));

-- Location: LCCOMB_X37_Y26_N18
\Add27~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~18_combout\ = (o_count(9) & (!\Add27~17\)) # (!o_count(9) & ((\Add27~17\) # (GND)))
-- \Add27~19\ = CARRY((!\Add27~17\) # (!o_count(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(9),
	datad => VCC,
	cin => \Add27~17\,
	combout => \Add27~18_combout\,
	cout => \Add27~19\);

-- Location: LCCOMB_X38_Y26_N28
\o_count~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~23_combout\ = (\LessThan20~5_combout\ & ((o_count(9)) # ((\Add27~18_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~18_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~18_combout\,
	datac => o_count(9),
	datad => \process_0~30_combout\,
	combout => \o_count~23_combout\);

-- Location: FF_X38_Y26_N29
\o_count[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(9));

-- Location: LCCOMB_X37_Y26_N20
\Add27~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~20_combout\ = (o_count(10) & (\Add27~19\ $ (GND))) # (!o_count(10) & (!\Add27~19\ & VCC))
-- \Add27~21\ = CARRY((o_count(10) & !\Add27~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(10),
	datad => VCC,
	cin => \Add27~19\,
	combout => \Add27~20_combout\,
	cout => \Add27~21\);

-- Location: LCCOMB_X38_Y26_N26
\o_count~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~25_combout\ = (\Add27~20_combout\ & ((\process_0~30_combout\) # ((o_count(10) & \LessThan20~5_combout\)))) # (!\Add27~20_combout\ & (((o_count(10) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~20_combout\,
	datab => \process_0~30_combout\,
	datac => o_count(10),
	datad => \LessThan20~5_combout\,
	combout => \o_count~25_combout\);

-- Location: FF_X38_Y26_N27
\o_count[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(10));

-- Location: LCCOMB_X37_Y26_N22
\Add27~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~22_combout\ = (o_count(11) & (!\Add27~21\)) # (!o_count(11) & ((\Add27~21\) # (GND)))
-- \Add27~23\ = CARRY((!\Add27~21\) # (!o_count(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(11),
	datad => VCC,
	cin => \Add27~21\,
	combout => \Add27~22_combout\,
	cout => \Add27~23\);

-- Location: LCCOMB_X38_Y26_N16
\o_count~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~26_combout\ = (\Add27~22_combout\ & ((\process_0~30_combout\) # ((o_count(11) & \LessThan20~5_combout\)))) # (!\Add27~22_combout\ & (((o_count(11) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~22_combout\,
	datab => \process_0~30_combout\,
	datac => o_count(11),
	datad => \LessThan20~5_combout\,
	combout => \o_count~26_combout\);

-- Location: FF_X38_Y26_N17
\o_count[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(11));

-- Location: LCCOMB_X37_Y26_N24
\Add27~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~24_combout\ = (o_count(12) & (\Add27~23\ $ (GND))) # (!o_count(12) & (!\Add27~23\ & VCC))
-- \Add27~25\ = CARRY((o_count(12) & !\Add27~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(12),
	datad => VCC,
	cin => \Add27~23\,
	combout => \Add27~24_combout\,
	cout => \Add27~25\);

-- Location: LCCOMB_X39_Y25_N0
\o_count~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~0_combout\ = (\process_0~30_combout\ & ((\Add27~24_combout\) # ((o_count(12) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(12) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~24_combout\,
	datac => o_count(12),
	datad => \LessThan20~5_combout\,
	combout => \o_count~0_combout\);

-- Location: FF_X39_Y25_N1
\o_count[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(12));

-- Location: LCCOMB_X37_Y26_N26
\Add27~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~26_combout\ = (o_count(13) & (!\Add27~25\)) # (!o_count(13) & ((\Add27~25\) # (GND)))
-- \Add27~27\ = CARRY((!\Add27~25\) # (!o_count(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(13),
	datad => VCC,
	cin => \Add27~25\,
	combout => \Add27~26_combout\,
	cout => \Add27~27\);

-- Location: LCCOMB_X39_Y25_N6
\o_count~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~1_combout\ = (\process_0~30_combout\ & ((\Add27~26_combout\) # ((o_count(13) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(13) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~26_combout\,
	datac => o_count(13),
	datad => \LessThan20~5_combout\,
	combout => \o_count~1_combout\);

-- Location: FF_X39_Y25_N7
\o_count[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(13));

-- Location: LCCOMB_X37_Y26_N28
\Add27~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~28_combout\ = (o_count(14) & (\Add27~27\ $ (GND))) # (!o_count(14) & (!\Add27~27\ & VCC))
-- \Add27~29\ = CARRY((o_count(14) & !\Add27~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(14),
	datad => VCC,
	cin => \Add27~27\,
	combout => \Add27~28_combout\,
	cout => \Add27~29\);

-- Location: LCCOMB_X39_Y25_N4
\o_count~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~2_combout\ = (\process_0~30_combout\ & ((\Add27~28_combout\) # ((o_count(14) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(14) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~28_combout\,
	datac => o_count(14),
	datad => \LessThan20~5_combout\,
	combout => \o_count~2_combout\);

-- Location: FF_X39_Y25_N5
\o_count[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(14));

-- Location: LCCOMB_X37_Y26_N30
\Add27~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~30_combout\ = (o_count(15) & (!\Add27~29\)) # (!o_count(15) & ((\Add27~29\) # (GND)))
-- \Add27~31\ = CARRY((!\Add27~29\) # (!o_count(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(15),
	datad => VCC,
	cin => \Add27~29\,
	combout => \Add27~30_combout\,
	cout => \Add27~31\);

-- Location: LCCOMB_X39_Y25_N14
\o_count~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~3_combout\ = (\process_0~30_combout\ & ((\Add27~30_combout\) # ((o_count(15) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(15) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~30_combout\,
	datac => o_count(15),
	datad => \LessThan20~5_combout\,
	combout => \o_count~3_combout\);

-- Location: FF_X39_Y25_N15
\o_count[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(15));

-- Location: LCCOMB_X37_Y25_N0
\Add27~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~32_combout\ = (o_count(16) & (\Add27~31\ $ (GND))) # (!o_count(16) & (!\Add27~31\ & VCC))
-- \Add27~33\ = CARRY((o_count(16) & !\Add27~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(16),
	datad => VCC,
	cin => \Add27~31\,
	combout => \Add27~32_combout\,
	cout => \Add27~33\);

-- Location: LCCOMB_X39_Y25_N8
\o_count~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~4_combout\ = (\process_0~30_combout\ & ((\Add27~32_combout\) # ((o_count(16) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(16) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~32_combout\,
	datac => o_count(16),
	datad => \LessThan20~5_combout\,
	combout => \o_count~4_combout\);

-- Location: FF_X39_Y25_N9
\o_count[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(16));

-- Location: LCCOMB_X37_Y25_N2
\Add27~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~34_combout\ = (o_count(17) & (!\Add27~33\)) # (!o_count(17) & ((\Add27~33\) # (GND)))
-- \Add27~35\ = CARRY((!\Add27~33\) # (!o_count(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(17),
	datad => VCC,
	cin => \Add27~33\,
	combout => \Add27~34_combout\,
	cout => \Add27~35\);

-- Location: LCCOMB_X39_Y25_N24
\o_count~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~5_combout\ = (\process_0~30_combout\ & ((\Add27~34_combout\) # ((o_count(17) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(17) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~34_combout\,
	datac => o_count(17),
	datad => \LessThan20~5_combout\,
	combout => \o_count~5_combout\);

-- Location: FF_X39_Y25_N25
\o_count[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(17));

-- Location: LCCOMB_X37_Y25_N4
\Add27~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~36_combout\ = (o_count(18) & (\Add27~35\ $ (GND))) # (!o_count(18) & (!\Add27~35\ & VCC))
-- \Add27~37\ = CARRY((o_count(18) & !\Add27~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(18),
	datad => VCC,
	cin => \Add27~35\,
	combout => \Add27~36_combout\,
	cout => \Add27~37\);

-- Location: LCCOMB_X39_Y25_N18
\o_count~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~6_combout\ = (\process_0~30_combout\ & ((\Add27~36_combout\) # ((o_count(18) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(18) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~36_combout\,
	datac => o_count(18),
	datad => \LessThan20~5_combout\,
	combout => \o_count~6_combout\);

-- Location: FF_X39_Y25_N19
\o_count[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(18));

-- Location: LCCOMB_X37_Y25_N6
\Add27~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~38_combout\ = (o_count(19) & (!\Add27~37\)) # (!o_count(19) & ((\Add27~37\) # (GND)))
-- \Add27~39\ = CARRY((!\Add27~37\) # (!o_count(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(19),
	datad => VCC,
	cin => \Add27~37\,
	combout => \Add27~38_combout\,
	cout => \Add27~39\);

-- Location: LCCOMB_X39_Y25_N12
\o_count~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~7_combout\ = (\process_0~30_combout\ & ((\Add27~38_combout\) # ((o_count(19) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(19) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~38_combout\,
	datac => o_count(19),
	datad => \LessThan20~5_combout\,
	combout => \o_count~7_combout\);

-- Location: FF_X39_Y25_N13
\o_count[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(19));

-- Location: LCCOMB_X37_Y25_N8
\Add27~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~40_combout\ = (o_count(20) & (\Add27~39\ $ (GND))) # (!o_count(20) & (!\Add27~39\ & VCC))
-- \Add27~41\ = CARRY((o_count(20) & !\Add27~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(20),
	datad => VCC,
	cin => \Add27~39\,
	combout => \Add27~40_combout\,
	cout => \Add27~41\);

-- Location: LCCOMB_X39_Y25_N22
\o_count~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~8_combout\ = (\process_0~30_combout\ & ((\Add27~40_combout\) # ((o_count(20) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(20) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~40_combout\,
	datac => o_count(20),
	datad => \LessThan20~5_combout\,
	combout => \o_count~8_combout\);

-- Location: FF_X39_Y25_N23
\o_count[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(20));

-- Location: LCCOMB_X37_Y25_N10
\Add27~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~42_combout\ = (o_count(21) & (!\Add27~41\)) # (!o_count(21) & ((\Add27~41\) # (GND)))
-- \Add27~43\ = CARRY((!\Add27~41\) # (!o_count(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(21),
	datad => VCC,
	cin => \Add27~41\,
	combout => \Add27~42_combout\,
	cout => \Add27~43\);

-- Location: LCCOMB_X39_Y25_N28
\o_count~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~9_combout\ = (\process_0~30_combout\ & ((\Add27~42_combout\) # ((o_count(21) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(21) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~42_combout\,
	datac => o_count(21),
	datad => \LessThan20~5_combout\,
	combout => \o_count~9_combout\);

-- Location: FF_X39_Y25_N29
\o_count[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(21));

-- Location: LCCOMB_X37_Y25_N12
\Add27~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~44_combout\ = (o_count(22) & (\Add27~43\ $ (GND))) # (!o_count(22) & (!\Add27~43\ & VCC))
-- \Add27~45\ = CARRY((o_count(22) & !\Add27~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(22),
	datad => VCC,
	cin => \Add27~43\,
	combout => \Add27~44_combout\,
	cout => \Add27~45\);

-- Location: LCCOMB_X39_Y25_N30
\o_count~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~10_combout\ = (\process_0~30_combout\ & ((\Add27~44_combout\) # ((o_count(22) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(22) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~44_combout\,
	datac => o_count(22),
	datad => \LessThan20~5_combout\,
	combout => \o_count~10_combout\);

-- Location: FF_X39_Y25_N31
\o_count[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(22));

-- Location: LCCOMB_X37_Y25_N14
\Add27~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~46_combout\ = (o_count(23) & (!\Add27~45\)) # (!o_count(23) & ((\Add27~45\) # (GND)))
-- \Add27~47\ = CARRY((!\Add27~45\) # (!o_count(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(23),
	datad => VCC,
	cin => \Add27~45\,
	combout => \Add27~46_combout\,
	cout => \Add27~47\);

-- Location: LCCOMB_X39_Y25_N20
\o_count~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~11_combout\ = (\process_0~30_combout\ & ((\Add27~46_combout\) # ((o_count(23) & \LessThan20~5_combout\)))) # (!\process_0~30_combout\ & (((o_count(23) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~30_combout\,
	datab => \Add27~46_combout\,
	datac => o_count(23),
	datad => \LessThan20~5_combout\,
	combout => \o_count~11_combout\);

-- Location: FF_X39_Y25_N21
\o_count[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(23));

-- Location: LCCOMB_X37_Y25_N16
\Add27~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~48_combout\ = (o_count(24) & (\Add27~47\ $ (GND))) # (!o_count(24) & (!\Add27~47\ & VCC))
-- \Add27~49\ = CARRY((o_count(24) & !\Add27~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(24),
	datad => VCC,
	cin => \Add27~47\,
	combout => \Add27~48_combout\,
	cout => \Add27~49\);

-- Location: LCCOMB_X38_Y25_N6
\o_count~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~12_combout\ = (\LessThan20~5_combout\ & ((o_count(24)) # ((\Add27~48_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~48_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~48_combout\,
	datac => o_count(24),
	datad => \process_0~30_combout\,
	combout => \o_count~12_combout\);

-- Location: FF_X38_Y25_N7
\o_count[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(24));

-- Location: LCCOMB_X37_Y25_N18
\Add27~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~50_combout\ = (o_count(25) & (!\Add27~49\)) # (!o_count(25) & ((\Add27~49\) # (GND)))
-- \Add27~51\ = CARRY((!\Add27~49\) # (!o_count(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(25),
	datad => VCC,
	cin => \Add27~49\,
	combout => \Add27~50_combout\,
	cout => \Add27~51\);

-- Location: LCCOMB_X38_Y25_N26
\o_count~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~27_combout\ = (\LessThan20~5_combout\ & ((o_count(25)) # ((\Add27~50_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~50_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~50_combout\,
	datac => o_count(25),
	datad => \process_0~30_combout\,
	combout => \o_count~27_combout\);

-- Location: FF_X38_Y25_N27
\o_count[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(25));

-- Location: LCCOMB_X37_Y25_N20
\Add27~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~52_combout\ = (o_count(26) & (\Add27~51\ $ (GND))) # (!o_count(26) & (!\Add27~51\ & VCC))
-- \Add27~53\ = CARRY((o_count(26) & !\Add27~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(26),
	datad => VCC,
	cin => \Add27~51\,
	combout => \Add27~52_combout\,
	cout => \Add27~53\);

-- Location: LCCOMB_X38_Y25_N20
\o_count~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~14_combout\ = (\LessThan20~5_combout\ & ((o_count(26)) # ((\Add27~52_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~52_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~52_combout\,
	datac => o_count(26),
	datad => \process_0~30_combout\,
	combout => \o_count~14_combout\);

-- Location: FF_X38_Y25_N21
\o_count[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(26));

-- Location: LCCOMB_X37_Y25_N22
\Add27~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~54_combout\ = (o_count(27) & (!\Add27~53\)) # (!o_count(27) & ((\Add27~53\) # (GND)))
-- \Add27~55\ = CARRY((!\Add27~53\) # (!o_count(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(27),
	datad => VCC,
	cin => \Add27~53\,
	combout => \Add27~54_combout\,
	cout => \Add27~55\);

-- Location: LCCOMB_X38_Y25_N30
\o_count~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~15_combout\ = (\LessThan20~5_combout\ & ((o_count(27)) # ((\Add27~54_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~54_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~54_combout\,
	datac => o_count(27),
	datad => \process_0~30_combout\,
	combout => \o_count~15_combout\);

-- Location: FF_X38_Y25_N31
\o_count[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(27));

-- Location: LCCOMB_X37_Y25_N24
\Add27~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~56_combout\ = (o_count(28) & (\Add27~55\ $ (GND))) # (!o_count(28) & (!\Add27~55\ & VCC))
-- \Add27~57\ = CARRY((o_count(28) & !\Add27~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => o_count(28),
	datad => VCC,
	cin => \Add27~55\,
	combout => \Add27~56_combout\,
	cout => \Add27~57\);

-- Location: LCCOMB_X38_Y25_N8
\o_count~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~16_combout\ = (\Add27~56_combout\ & ((\process_0~30_combout\) # ((o_count(28) & \LessThan20~5_combout\)))) # (!\Add27~56_combout\ & (((o_count(28) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~56_combout\,
	datab => \process_0~30_combout\,
	datac => o_count(28),
	datad => \LessThan20~5_combout\,
	combout => \o_count~16_combout\);

-- Location: FF_X38_Y25_N9
\o_count[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(28));

-- Location: LCCOMB_X37_Y25_N26
\Add27~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~58_combout\ = (o_count(29) & (!\Add27~57\)) # (!o_count(29) & ((\Add27~57\) # (GND)))
-- \Add27~59\ = CARRY((!\Add27~57\) # (!o_count(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(29),
	datad => VCC,
	cin => \Add27~57\,
	combout => \Add27~58_combout\,
	cout => \Add27~59\);

-- Location: LCCOMB_X38_Y25_N12
\o_count~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~17_combout\ = (\LessThan20~5_combout\ & ((o_count(29)) # ((\Add27~58_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~58_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~58_combout\,
	datac => o_count(29),
	datad => \process_0~30_combout\,
	combout => \o_count~17_combout\);

-- Location: FF_X38_Y25_N13
\o_count[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(29));

-- Location: LCCOMB_X37_Y25_N28
\Add27~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~60_combout\ = (o_count(30) & (\Add27~59\ $ (GND))) # (!o_count(30) & (!\Add27~59\ & VCC))
-- \Add27~61\ = CARRY((o_count(30) & !\Add27~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => o_count(30),
	datad => VCC,
	cin => \Add27~59\,
	combout => \Add27~60_combout\,
	cout => \Add27~61\);

-- Location: LCCOMB_X38_Y25_N14
\o_count~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~18_combout\ = (\Add27~60_combout\ & ((\process_0~30_combout\) # ((o_count(30) & \LessThan20~5_combout\)))) # (!\Add27~60_combout\ & (((o_count(30) & \LessThan20~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~60_combout\,
	datab => \process_0~30_combout\,
	datac => o_count(30),
	datad => \LessThan20~5_combout\,
	combout => \o_count~18_combout\);

-- Location: FF_X38_Y25_N15
\o_count[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(30));

-- Location: LCCOMB_X37_Y25_N30
\Add27~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~62_combout\ = \Add27~61\ $ (o_count(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => o_count(31),
	cin => \Add27~61\,
	combout => \Add27~62_combout\);

-- Location: LCCOMB_X38_Y25_N18
\process_0~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~27_combout\ = (!o_count(25) & (!o_count(27) & (!o_count(26) & !o_count(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(25),
	datab => o_count(27),
	datac => o_count(26),
	datad => o_count(28),
	combout => \process_0~27_combout\);

-- Location: LCCOMB_X38_Y25_N0
\process_0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~28_combout\ = (!o_count(30) & (!o_count(29) & \process_0~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(30),
	datab => o_count(29),
	datad => \process_0~27_combout\,
	combout => \process_0~28_combout\);

-- Location: LCCOMB_X38_Y25_N4
\process_0~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~25_combout\ = (!o_count(19) & (!o_count(20) & (!o_count(17) & !o_count(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(19),
	datab => o_count(20),
	datac => o_count(17),
	datad => o_count(18),
	combout => \process_0~25_combout\);

-- Location: LCCOMB_X38_Y26_N30
\process_0~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~21_combout\ = (!o_count(8) & (!o_count(5) & (!o_count(7) & !o_count(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(8),
	datab => o_count(5),
	datac => o_count(7),
	datad => o_count(6),
	combout => \process_0~21_combout\);

-- Location: LCCOMB_X39_Y26_N24
\process_0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~22_combout\ = (!o_count(11) & (!o_count(9) & (!o_count(10) & !o_count(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(11),
	datab => o_count(9),
	datac => o_count(10),
	datad => o_count(12),
	combout => \process_0~22_combout\);

-- Location: LCCOMB_X39_Y25_N26
\process_0~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~23_combout\ = (!o_count(15) & (!o_count(13) & (!o_count(14) & !o_count(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(15),
	datab => o_count(13),
	datac => o_count(14),
	datad => o_count(16),
	combout => \process_0~23_combout\);

-- Location: LCCOMB_X38_Y26_N0
\process_0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~20_combout\ = (!o_count(3) & (!o_count(2) & (!o_count(4) & !o_count(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(3),
	datab => o_count(2),
	datac => o_count(4),
	datad => o_count(1),
	combout => \process_0~20_combout\);

-- Location: LCCOMB_X38_Y26_N24
\process_0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~24_combout\ = (\process_0~21_combout\ & (\process_0~22_combout\ & (\process_0~23_combout\ & \process_0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~21_combout\,
	datab => \process_0~22_combout\,
	datac => \process_0~23_combout\,
	datad => \process_0~20_combout\,
	combout => \process_0~24_combout\);

-- Location: LCCOMB_X38_Y25_N16
\process_0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~26_combout\ = (!o_count(23) & (!o_count(24) & (!o_count(22) & !o_count(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(23),
	datab => o_count(24),
	datac => o_count(22),
	datad => o_count(21),
	combout => \process_0~26_combout\);

-- Location: LCCOMB_X38_Y25_N28
\process_0~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~29_combout\ = (\process_0~28_combout\ & (\process_0~25_combout\ & (\process_0~24_combout\ & \process_0~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~28_combout\,
	datab => \process_0~25_combout\,
	datac => \process_0~24_combout\,
	datad => \process_0~26_combout\,
	combout => \process_0~29_combout\);

-- Location: LCCOMB_X38_Y25_N10
\o_count~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~19_combout\ = (\LessThan20~5_combout\ & (((o_count(31))))) # (!\LessThan20~5_combout\ & (\Add27~62_combout\ & ((\process_0~29_combout\) # (o_count(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~62_combout\,
	datab => \process_0~29_combout\,
	datac => o_count(31),
	datad => \LessThan20~5_combout\,
	combout => \o_count~19_combout\);

-- Location: FF_X38_Y25_N11
\o_count[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \o_count~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => o_count(31));

-- Location: LCCOMB_X39_Y22_N22
\process_0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~30_combout\ = (!\LessThan20~5_combout\ & ((o_count(31)) # (\process_0~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => o_count(31),
	datab => \process_0~29_combout\,
	datad => \LessThan20~5_combout\,
	combout => \process_0~30_combout\);

-- Location: LCCOMB_X38_Y26_N18
\o_count~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~30_combout\ = (\LessThan20~5_combout\ & ((o_count(1)) # ((\Add27~2_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~2_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~2_combout\,
	datac => o_count(1),
	datad => \process_0~30_combout\,
	combout => \o_count~30_combout\);

-- Location: LCCOMB_X38_Y25_N2
\Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!\o_count~19_combout\ & (!\o_count~18_combout\ & (!\o_count~16_combout\ & !\o_count~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~19_combout\,
	datab => \o_count~18_combout\,
	datac => \o_count~16_combout\,
	datad => \o_count~17_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X38_Y26_N2
\Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!\o_count~21_combout\ & (!\o_count~23_combout\ & (!\o_count~22_combout\ & !\o_count~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~21_combout\,
	datab => \o_count~23_combout\,
	datac => \o_count~22_combout\,
	datad => \o_count~20_combout\,
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X38_Y26_N12
\Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!\o_count~24_combout\ & (!\o_count~26_combout\ & (!\o_count~25_combout\ & !\o_count~27_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~24_combout\,
	datab => \o_count~26_combout\,
	datac => \o_count~25_combout\,
	datad => \o_count~27_combout\,
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X38_Y26_N10
\Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (!\o_count~28_combout\ & (!\o_count~29_combout\ & \Equal0~7_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \o_count~28_combout\,
	datac => \o_count~29_combout\,
	datad => \Equal0~7_combout\,
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X38_Y25_N24
\Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!\o_count~15_combout\ & (!\o_count~14_combout\ & (!\o_count~13_combout\ & !\o_count~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~15_combout\,
	datab => \o_count~14_combout\,
	datac => \o_count~13_combout\,
	datad => \o_count~12_combout\,
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X39_Y25_N16
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\o_count~7_combout\ & (!\o_count~6_combout\ & (!\o_count~4_combout\ & !\o_count~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~7_combout\,
	datab => \o_count~6_combout\,
	datac => \o_count~4_combout\,
	datad => \o_count~5_combout\,
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X39_Y25_N2
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!\o_count~8_combout\ & (!\o_count~11_combout\ & (!\o_count~10_combout\ & !\o_count~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~8_combout\,
	datab => \o_count~11_combout\,
	datac => \o_count~10_combout\,
	datad => \o_count~9_combout\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X39_Y25_N10
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\o_count~1_combout\ & (!\o_count~3_combout\ & (!\o_count~2_combout\ & !\o_count~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~1_combout\,
	datab => \o_count~3_combout\,
	datac => \o_count~2_combout\,
	datad => \o_count~0_combout\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X39_Y28_N16
\Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~3_combout\ & (\Equal0~1_combout\ & (\Equal0~2_combout\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X39_Y28_N18
\Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Equal0~5_combout\ & (\Equal0~6_combout\ & (\Equal0~8_combout\ & \Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \Equal0~6_combout\,
	datac => \Equal0~8_combout\,
	datad => \Equal0~4_combout\,
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X39_Y28_N0
\Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (\o_count~31_combout\ & (!\o_count~30_combout\ & \Equal0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~31_combout\,
	datac => \o_count~30_combout\,
	datad => \Equal0~9_combout\,
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X39_Y28_N14
\obstacle_width[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_width[2]~2_combout\ = (\Equal0~9_combout\ & ((!\o_count~30_combout\) # (!\o_count~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~31_combout\,
	datab => \Equal0~9_combout\,
	datac => \o_count~30_combout\,
	combout => \obstacle_width[2]~2_combout\);

-- Location: FF_X39_Y28_N1
\obstacle_width[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Equal1~0_combout\,
	ena => \obstacle_width[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_width(4));

-- Location: LCCOMB_X39_Y28_N30
\obstacle_width[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_width[2]~1_combout\ = (\o_count~30_combout\) # (!\Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \o_count~30_combout\,
	datad => \Equal0~9_combout\,
	combout => \obstacle_width[2]~1_combout\);

-- Location: FF_X39_Y28_N31
\obstacle_width[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_width[2]~1_combout\,
	ena => \obstacle_width[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_width(2));

-- Location: LCCOMB_X40_Y24_N0
\Add12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~0_combout\ = obstacle_hstart(0) $ (VCC)
-- \Add12~1\ = CARRY(obstacle_hstart(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(0),
	datad => VCC,
	combout => \Add12~0_combout\,
	cout => \Add12~1\);

-- Location: LCCOMB_X39_Y24_N6
\obstacle_hstart~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~27_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & ((\Add12~0_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(0),
	datab => \Add12~0_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~27_combout\);

-- Location: FF_X40_Y24_N31
\obstacle_hstart[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~27_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(0));

-- Location: LCCOMB_X40_Y24_N2
\Add12~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~2_combout\ = (obstacle_hstart(1) & (!\Add12~1\)) # (!obstacle_hstart(1) & ((\Add12~1\) # (GND)))
-- \Add12~3\ = CARRY((!\Add12~1\) # (!obstacle_hstart(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(1),
	datad => VCC,
	cin => \Add12~1\,
	combout => \Add12~2_combout\,
	cout => \Add12~3\);

-- Location: LCCOMB_X40_Y22_N12
\obstacle_hstart~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~9_combout\ = ((\LessThan0~8_combout\ & ((\Add12~2_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(1)))) # (!\LessThan3~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(1),
	datab => \LessThan0~8_combout\,
	datac => \Add12~2_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~9_combout\);

-- Location: FF_X40_Y22_N7
\obstacle_hstart[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~9_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(1));

-- Location: LCCOMB_X40_Y24_N4
\Add12~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~4_combout\ = (obstacle_hstart(2) & ((GND) # (!\Add12~3\))) # (!obstacle_hstart(2) & (\Add12~3\ $ (GND)))
-- \Add12~5\ = CARRY((obstacle_hstart(2)) # (!\Add12~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(2),
	datad => VCC,
	cin => \Add12~3\,
	combout => \Add12~4_combout\,
	cout => \Add12~5\);

-- Location: LCCOMB_X39_Y22_N8
\obstacle_hstart~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~10_combout\ = (\LessThan0~8_combout\ & (\Add12~4_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~4_combout\,
	datab => \LessThan0~8_combout\,
	datad => obstacle_hstart(2),
	combout => \obstacle_hstart~10_combout\);

-- Location: LCCOMB_X39_Y22_N12
\obstacle_hstart~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~11_combout\ = (\LessThan3~22_combout\ & ((\obstacle_hstart~10_combout\))) # (!\LessThan3~22_combout\ & (obstacle_width(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_width(2),
	datac => \obstacle_hstart~10_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~11_combout\);

-- Location: FF_X39_Y22_N19
\obstacle_hstart[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~11_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(2));

-- Location: LCCOMB_X40_Y24_N6
\Add12~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~6_combout\ = (obstacle_hstart(3) & (\Add12~5\ & VCC)) # (!obstacle_hstart(3) & (!\Add12~5\))
-- \Add12~7\ = CARRY((!obstacle_hstart(3) & !\Add12~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(3),
	datad => VCC,
	cin => \Add12~5\,
	combout => \Add12~6_combout\,
	cout => \Add12~7\);

-- Location: LCCOMB_X38_Y24_N6
\obstacle_hstart~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~8_combout\ = (\LessThan0~8_combout\ & ((\Add12~6_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datac => obstacle_hstart(3),
	datad => \Add12~6_combout\,
	combout => \obstacle_hstart~8_combout\);

-- Location: LCCOMB_X39_Y24_N12
\obstacle_hstart~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~25_combout\ = (\LessThan3~22_combout\ & ((\obstacle_hstart~8_combout\))) # (!\LessThan3~22_combout\ & (obstacle_width(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_width(4),
	datac => \obstacle_hstart~8_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~25_combout\);

-- Location: FF_X40_Y24_N13
\obstacle_hstart[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~25_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(3));

-- Location: LCCOMB_X40_Y24_N8
\Add12~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~8_combout\ = (obstacle_hstart(4) & ((GND) # (!\Add12~7\))) # (!obstacle_hstart(4) & (\Add12~7\ $ (GND)))
-- \Add12~9\ = CARRY((obstacle_hstart(4)) # (!\Add12~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(4),
	datad => VCC,
	cin => \Add12~7\,
	combout => \Add12~8_combout\,
	cout => \Add12~9\);

-- Location: LCCOMB_X39_Y24_N24
\obstacle_hstart~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~7_combout\ = (\LessThan0~8_combout\ & (\Add12~8_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add12~8_combout\,
	datac => obstacle_hstart(4),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~7_combout\);

-- Location: LCCOMB_X39_Y24_N22
\obstacle_hstart~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~26_combout\ = (\LessThan3~22_combout\ & ((\obstacle_hstart~7_combout\))) # (!\LessThan3~22_combout\ & (obstacle_width(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_width(4),
	datac => \obstacle_hstart~7_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~26_combout\);

-- Location: FF_X39_Y24_N25
\obstacle_hstart[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~26_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(4));

-- Location: LCCOMB_X40_Y24_N10
\Add12~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~10_combout\ = (obstacle_hstart(5) & (\Add12~9\ & VCC)) # (!obstacle_hstart(5) & (!\Add12~9\))
-- \Add12~11\ = CARRY((!obstacle_hstart(5) & !\Add12~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(5),
	datad => VCC,
	cin => \Add12~9\,
	combout => \Add12~10_combout\,
	cout => \Add12~11\);

-- Location: LCCOMB_X40_Y22_N4
\obstacle_hstart~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~12_combout\ = ((\LessThan0~8_combout\ & (\Add12~10_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(5))))) # (!\LessThan3~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~10_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(5),
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~12_combout\);

-- Location: FF_X40_Y22_N5
\obstacle_hstart[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(5));

-- Location: LCCOMB_X40_Y24_N12
\Add12~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~12_combout\ = (obstacle_hstart(6) & ((GND) # (!\Add12~11\))) # (!obstacle_hstart(6) & (\Add12~11\ $ (GND)))
-- \Add12~13\ = CARRY((obstacle_hstart(6)) # (!\Add12~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(6),
	datad => VCC,
	cin => \Add12~11\,
	combout => \Add12~12_combout\,
	cout => \Add12~13\);

-- Location: LCCOMB_X40_Y24_N14
\Add12~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~14_combout\ = (obstacle_hstart(7) & (\Add12~13\ & VCC)) # (!obstacle_hstart(7) & (!\Add12~13\))
-- \Add12~15\ = CARRY((!obstacle_hstart(7) & !\Add12~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(7),
	datad => VCC,
	cin => \Add12~13\,
	combout => \Add12~14_combout\,
	cout => \Add12~15\);

-- Location: LCCOMB_X41_Y22_N10
\obstacle_hstart~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~18_combout\ = (\LessThan0~8_combout\ & ((\Add12~14_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(7),
	datac => \LessThan0~8_combout\,
	datad => \Add12~14_combout\,
	combout => \obstacle_hstart~18_combout\);

-- Location: LCCOMB_X40_Y22_N14
\obstacle_hstart~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~19_combout\ = (\LessThan3~22_combout\ & ((\obstacle_hstart~18_combout\))) # (!\LessThan3~22_combout\ & (obstacle_width(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_width(6),
	datac => \obstacle_hstart~18_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~19_combout\);

-- Location: FF_X40_Y22_N15
\obstacle_hstart[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(7));

-- Location: LCCOMB_X40_Y24_N16
\Add12~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~16_combout\ = (obstacle_hstart(8) & ((GND) # (!\Add12~15\))) # (!obstacle_hstart(8) & (\Add12~15\ $ (GND)))
-- \Add12~17\ = CARRY((obstacle_hstart(8)) # (!\Add12~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(8),
	datad => VCC,
	cin => \Add12~15\,
	combout => \Add12~16_combout\,
	cout => \Add12~17\);

-- Location: LCCOMB_X41_Y22_N18
\Add12~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~65_combout\ = (\LessThan0~8_combout\ & ((\Add12~16_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => obstacle_hstart(8),
	datac => \Add12~16_combout\,
	combout => \Add12~65_combout\);

-- Location: LCCOMB_X39_Y22_N2
\obstacle_hstart~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~13_combout\ = (\LessThan3~22_combout\ & ((\Add12~65_combout\))) # (!\LessThan3~22_combout\ & (!obstacle_width(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_width(6),
	datac => \Add12~65_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~13_combout\);

-- Location: FF_X39_Y22_N27
\obstacle_hstart[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(10));

-- Location: LCCOMB_X40_Y24_N18
\Add12~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~18_combout\ = (obstacle_hstart(9) & (\Add12~17\ & VCC)) # (!obstacle_hstart(9) & (!\Add12~17\))
-- \Add12~19\ = CARRY((!obstacle_hstart(9) & !\Add12~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(9),
	datad => VCC,
	cin => \Add12~17\,
	combout => \Add12~18_combout\,
	cout => \Add12~19\);

-- Location: LCCOMB_X39_Y22_N16
\obstacle_hstart~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~16_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & (\Add12~18_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~18_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(9),
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~16_combout\);

-- Location: FF_X39_Y22_N17
\obstacle_hstart[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(9));

-- Location: LCCOMB_X40_Y24_N20
\Add12~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~20_combout\ = (obstacle_hstart(10) & ((GND) # (!\Add12~19\))) # (!obstacle_hstart(10) & (\Add12~19\ $ (GND)))
-- \Add12~21\ = CARRY((obstacle_hstart(10)) # (!\Add12~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(10),
	datad => VCC,
	cin => \Add12~19\,
	combout => \Add12~20_combout\,
	cout => \Add12~21\);

-- Location: LCCOMB_X39_Y22_N26
\obstacle_hstart~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~17_combout\ = ((\LessThan0~8_combout\ & (\Add12~20_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(10))))) # (!\LessThan3~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~20_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(10),
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~17_combout\);

-- Location: FF_X40_Y22_N21
\obstacle_hstart[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(11));

-- Location: LCCOMB_X40_Y24_N22
\Add12~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~22_combout\ = (obstacle_hstart(11) & (\Add12~21\ & VCC)) # (!obstacle_hstart(11) & (!\Add12~21\))
-- \Add12~23\ = CARRY((!obstacle_hstart(11) & !\Add12~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(11),
	datad => VCC,
	cin => \Add12~21\,
	combout => \Add12~22_combout\,
	cout => \Add12~23\);

-- Location: LCCOMB_X40_Y22_N20
\obstacle_hstart~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~15_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & (\Add12~22_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~22_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(11),
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~15_combout\);

-- Location: LCCOMB_X39_Y22_N0
\LessThan20~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~3_combout\ = (\obstacle_hstart~1_combout\) # ((\obstacle_hstart~15_combout\) # (\obstacle_hstart~16_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \obstacle_hstart~1_combout\,
	datac => \obstacle_hstart~15_combout\,
	datad => \obstacle_hstart~16_combout\,
	combout => \LessThan20~3_combout\);

-- Location: LCCOMB_X39_Y22_N14
\LessThan20~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~4_combout\ = (\obstacle_hstart~17_combout\) # ((\LessThan20~3_combout\) # ((\LessThan3~22_combout\ & !\LessThan3~21_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~22_combout\,
	datab => \LessThan3~21_combout\,
	datac => \obstacle_hstart~17_combout\,
	datad => \LessThan20~3_combout\,
	combout => \LessThan20~4_combout\);

-- Location: LCCOMB_X39_Y22_N30
\LessThan20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~0_combout\ = (\LessThan3~22_combout\ & (((\obstacle_hstart~8_combout\) # (\obstacle_hstart~7_combout\)))) # (!\LessThan3~22_combout\ & (obstacle_width(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_width(4),
	datab => \obstacle_hstart~8_combout\,
	datac => \obstacle_hstart~7_combout\,
	datad => \LessThan3~22_combout\,
	combout => \LessThan20~0_combout\);

-- Location: LCCOMB_X39_Y22_N10
\LessThan20~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~1_combout\ = (\obstacle_hstart~11_combout\) # ((\obstacle_hstart~9_combout\) # ((\LessThan20~0_combout\) # (\obstacle_hstart~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstart~11_combout\,
	datab => \obstacle_hstart~9_combout\,
	datac => \LessThan20~0_combout\,
	datad => \obstacle_hstart~12_combout\,
	combout => \LessThan20~1_combout\);

-- Location: LCCOMB_X39_Y22_N6
\LessThan20~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~2_combout\ = (\obstacle_hstart~13_combout\ & (\obstacle_hstart~14_combout\ & \LessThan20~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \obstacle_hstart~13_combout\,
	datac => \obstacle_hstart~14_combout\,
	datad => \LessThan20~1_combout\,
	combout => \LessThan20~2_combout\);

-- Location: LCCOMB_X39_Y22_N28
\LessThan20~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~5_combout\ = (\LessThan20~4_combout\) # ((\LessThan20~2_combout\) # ((\obstacle_hstart~13_combout\ & \obstacle_hstart~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstart~13_combout\,
	datab => \obstacle_hstart~19_combout\,
	datac => \LessThan20~4_combout\,
	datad => \LessThan20~2_combout\,
	combout => \LessThan20~5_combout\);

-- Location: LCCOMB_X39_Y28_N10
\o_count~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_count~31_combout\ = (\LessThan20~5_combout\ & ((o_count(0)) # ((\Add27~0_combout\ & \process_0~30_combout\)))) # (!\LessThan20~5_combout\ & (\Add27~0_combout\ & ((\process_0~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~5_combout\,
	datab => \Add27~0_combout\,
	datac => o_count(0),
	datad => \process_0~30_combout\,
	combout => \o_count~31_combout\);

-- Location: LCCOMB_X39_Y28_N20
\obstacle_width~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_width~0_combout\ = (\Equal0~9_combout\ & ((\o_count~31_combout\ & ((obstacle_width(6)) # (!\o_count~30_combout\))) # (!\o_count~31_combout\ & (\o_count~30_combout\)))) # (!\Equal0~9_combout\ & (((obstacle_width(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~31_combout\,
	datab => \o_count~30_combout\,
	datac => obstacle_width(6),
	datad => \Equal0~9_combout\,
	combout => \obstacle_width~0_combout\);

-- Location: FF_X39_Y28_N21
\obstacle_width[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_width~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_width(6));

-- Location: LCCOMB_X39_Y22_N4
\obstacle_hstart~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~14_combout\ = (\LessThan3~22_combout\ & ((\Add12~66_combout\))) # (!\LessThan3~22_combout\ & (obstacle_width(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_width(6),
	datac => \Add12~66_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~14_combout\);

-- Location: FF_X39_Y22_N9
\obstacle_hstart[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~14_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(6));

-- Location: LCCOMB_X39_Y22_N18
\Add12~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~66_combout\ = (\LessThan0~8_combout\ & ((\Add12~12_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(6),
	datab => \LessThan0~8_combout\,
	datad => \Add12~12_combout\,
	combout => \Add12~66_combout\);

-- Location: LCCOMB_X40_Y22_N8
\LessThan3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~7_combout\ = (\Add12~0_combout\) # ((\Add12~4_combout\) # ((\Add12~6_combout\) # (\Add12~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~0_combout\,
	datab => \Add12~4_combout\,
	datac => \Add12~6_combout\,
	datad => \Add12~2_combout\,
	combout => \LessThan3~7_combout\);

-- Location: LCCOMB_X40_Y22_N30
\LessThan3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~8_combout\ = (\LessThan0~8_combout\ & ((\Add12~10_combout\) # ((\LessThan3~7_combout\) # (\Add12~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~10_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan3~7_combout\,
	datad => \Add12~8_combout\,
	combout => \LessThan3~8_combout\);

-- Location: LCCOMB_X38_Y24_N24
\LessThan3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~5_combout\ = (obstacle_hstart(3)) # ((obstacle_hstart(2)) # ((obstacle_hstart(1)) # (obstacle_hstart(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(3),
	datab => obstacle_hstart(2),
	datac => obstacle_hstart(1),
	datad => obstacle_hstart(0),
	combout => \LessThan3~5_combout\);

-- Location: LCCOMB_X39_Y24_N30
\LessThan3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~6_combout\ = (!\LessThan0~8_combout\ & ((obstacle_hstart(5)) # ((obstacle_hstart(4)) # (\LessThan3~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(5),
	datab => obstacle_hstart(4),
	datac => \LessThan0~8_combout\,
	datad => \LessThan3~5_combout\,
	combout => \LessThan3~6_combout\);

-- Location: LCCOMB_X40_Y22_N24
\LessThan3~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~9_combout\ = (\Add12~66_combout\ & (\Add12~65_combout\ & ((\LessThan3~8_combout\) # (\LessThan3~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~66_combout\,
	datab => \Add12~65_combout\,
	datac => \LessThan3~8_combout\,
	datad => \LessThan3~6_combout\,
	combout => \LessThan3~9_combout\);

-- Location: LCCOMB_X39_Y22_N24
\LessThan3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (obstacle_hstart(9)) # ((obstacle_hstart(10)) # ((obstacle_hstart(30)) # (obstacle_hstart(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(9),
	datab => obstacle_hstart(10),
	datac => obstacle_hstart(30),
	datad => obstacle_hstart(11),
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X41_Y22_N12
\LessThan3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (!\LessThan0~8_combout\ & ((\LessThan3~1_combout\) # ((obstacle_hstart(7) & \Add12~65_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(7),
	datab => \LessThan3~1_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add12~65_combout\,
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X40_Y22_N16
\LessThan3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~3_combout\ = (\Add12~22_combout\) # ((\Add12~18_combout\) # ((\Add12~20_combout\) # (\Add12~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~22_combout\,
	datab => \Add12~18_combout\,
	datac => \Add12~20_combout\,
	datad => \Add12~60_combout\,
	combout => \LessThan3~3_combout\);

-- Location: LCCOMB_X40_Y22_N10
\LessThan3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~4_combout\ = (\LessThan0~8_combout\ & ((\LessThan3~3_combout\) # ((\Add12~14_combout\ & \Add12~65_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~14_combout\,
	datab => \Add12~65_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan3~3_combout\,
	combout => \LessThan3~4_combout\);

-- Location: LCCOMB_X40_Y22_N26
\LessThan3~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~10_combout\ = (\LessThan3~9_combout\) # ((\LessThan3~2_combout\) # (\LessThan3~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan3~9_combout\,
	datac => \LessThan3~2_combout\,
	datad => \LessThan3~4_combout\,
	combout => \LessThan3~10_combout\);

-- Location: LCCOMB_X40_Y22_N2
\LessThan3~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~22_combout\ = (\Add12~62_combout\ & (!\LessThan0~8_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\)))) # (!\Add12~62_combout\ & (((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~62_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan3~10_combout\,
	datad => \LessThan3~21_combout\,
	combout => \LessThan3~22_combout\);

-- Location: LCCOMB_X40_Y24_N24
\Add12~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~24_combout\ = (obstacle_hstart(12) & ((GND) # (!\Add12~23\))) # (!obstacle_hstart(12) & (\Add12~23\ $ (GND)))
-- \Add12~25\ = CARRY((obstacle_hstart(12)) # (!\Add12~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(12),
	datad => VCC,
	cin => \Add12~23\,
	combout => \Add12~24_combout\,
	cout => \Add12~25\);

-- Location: LCCOMB_X41_Y24_N16
\Add12~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~67_combout\ = (\LessThan0~8_combout\ & ((\Add12~24_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(12),
	datac => \LessThan0~8_combout\,
	datad => \Add12~24_combout\,
	combout => \Add12~67_combout\);

-- Location: LCCOMB_X38_Y24_N22
\obstacle_hstart~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~34_combout\ = (\Add12~67_combout\ & (\LessThan3~0_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~67_combout\,
	datab => \LessThan3~21_combout\,
	datac => \LessThan3~10_combout\,
	datad => \LessThan3~0_combout\,
	combout => \obstacle_hstart~34_combout\);

-- Location: FF_X40_Y24_N5
\obstacle_hstart[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~34_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(12));

-- Location: LCCOMB_X40_Y24_N26
\Add12~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~26_combout\ = (obstacle_hstart(13) & (\Add12~25\ & VCC)) # (!obstacle_hstart(13) & (!\Add12~25\))
-- \Add12~27\ = CARRY((!obstacle_hstart(13) & !\Add12~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(13),
	datad => VCC,
	cin => \Add12~25\,
	combout => \Add12~26_combout\,
	cout => \Add12~27\);

-- Location: LCCOMB_X41_Y24_N0
\obstacle_hstart~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~28_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & (\Add12~26_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~26_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan3~22_combout\,
	datad => obstacle_hstart(13),
	combout => \obstacle_hstart~28_combout\);

-- Location: FF_X41_Y24_N19
\obstacle_hstart[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(13));

-- Location: LCCOMB_X40_Y24_N28
\Add12~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~28_combout\ = (obstacle_hstart(14) & ((GND) # (!\Add12~27\))) # (!obstacle_hstart(14) & (\Add12~27\ $ (GND)))
-- \Add12~29\ = CARRY((obstacle_hstart(14)) # (!\Add12~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(14),
	datad => VCC,
	cin => \Add12~27\,
	combout => \Add12~28_combout\,
	cout => \Add12~29\);

-- Location: LCCOMB_X41_Y24_N30
\Add12~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~68_combout\ = (\LessThan0~8_combout\ & (\Add12~28_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~28_combout\,
	datab => obstacle_hstart(14),
	datad => \LessThan0~8_combout\,
	combout => \Add12~68_combout\);

-- Location: LCCOMB_X41_Y24_N26
\obstacle_hstart~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~29_combout\ = (\Add12~68_combout\ & (\LessThan3~0_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~68_combout\,
	datab => \LessThan3~0_combout\,
	datac => \LessThan3~21_combout\,
	datad => \LessThan3~10_combout\,
	combout => \obstacle_hstart~29_combout\);

-- Location: FF_X40_Y24_N19
\obstacle_hstart[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~29_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(14));

-- Location: LCCOMB_X40_Y24_N30
\Add12~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~30_combout\ = (obstacle_hstart(15) & (\Add12~29\ & VCC)) # (!obstacle_hstart(15) & (!\Add12~29\))
-- \Add12~31\ = CARRY((!obstacle_hstart(15) & !\Add12~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(15),
	datad => VCC,
	cin => \Add12~29\,
	combout => \Add12~30_combout\,
	cout => \Add12~31\);

-- Location: LCCOMB_X42_Y24_N24
\obstacle_hstart~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~24_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & ((\Add12~30_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(15),
	datab => \Add12~30_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~24_combout\);

-- Location: FF_X41_Y24_N5
\obstacle_hstart[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~24_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(15));

-- Location: LCCOMB_X40_Y23_N0
\Add12~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~32_combout\ = (obstacle_hstart(16) & ((GND) # (!\Add12~31\))) # (!obstacle_hstart(16) & (\Add12~31\ $ (GND)))
-- \Add12~33\ = CARRY((obstacle_hstart(16)) # (!\Add12~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(16),
	datad => VCC,
	cin => \Add12~31\,
	combout => \Add12~32_combout\,
	cout => \Add12~33\);

-- Location: LCCOMB_X41_Y22_N30
\Add12~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~69_combout\ = (\LessThan0~8_combout\ & ((\Add12~32_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(16),
	datac => \LessThan0~8_combout\,
	datad => \Add12~32_combout\,
	combout => \Add12~69_combout\);

-- Location: LCCOMB_X41_Y23_N28
\obstacle_hstart~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~33_combout\ = (\Add12~69_combout\ & (\LessThan3~0_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~10_combout\,
	datab => \Add12~69_combout\,
	datac => \LessThan3~0_combout\,
	datad => \LessThan3~21_combout\,
	combout => \obstacle_hstart~33_combout\);

-- Location: FF_X41_Y23_N29
\obstacle_hstart[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(16));

-- Location: LCCOMB_X40_Y23_N2
\Add12~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~34_combout\ = (obstacle_hstart(17) & (\Add12~33\ & VCC)) # (!obstacle_hstart(17) & (!\Add12~33\))
-- \Add12~35\ = CARRY((!obstacle_hstart(17) & !\Add12~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(17),
	datad => VCC,
	cin => \Add12~33\,
	combout => \Add12~34_combout\,
	cout => \Add12~35\);

-- Location: LCCOMB_X40_Y25_N16
\obstacle_hstart~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~23_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & ((\Add12~34_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => obstacle_hstart(17),
	datac => \LessThan3~22_combout\,
	datad => \Add12~34_combout\,
	combout => \obstacle_hstart~23_combout\);

-- Location: FF_X40_Y23_N27
\obstacle_hstart[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~23_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(17));

-- Location: LCCOMB_X40_Y23_N4
\Add12~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~36_combout\ = (obstacle_hstart(18) & ((GND) # (!\Add12~35\))) # (!obstacle_hstart(18) & (\Add12~35\ $ (GND)))
-- \Add12~37\ = CARRY((obstacle_hstart(18)) # (!\Add12~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(18),
	datad => VCC,
	cin => \Add12~35\,
	combout => \Add12~36_combout\,
	cout => \Add12~37\);

-- Location: LCCOMB_X41_Y23_N16
\Add12~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~70_combout\ = (\LessThan0~8_combout\ & ((\Add12~36_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(18),
	datab => \Add12~36_combout\,
	datac => \LessThan0~8_combout\,
	combout => \Add12~70_combout\);

-- Location: LCCOMB_X41_Y23_N10
\obstacle_hstart~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~30_combout\ = (\LessThan3~0_combout\ & (\Add12~70_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~0_combout\,
	datab => \Add12~70_combout\,
	datac => \LessThan3~21_combout\,
	datad => \LessThan3~10_combout\,
	combout => \obstacle_hstart~30_combout\);

-- Location: FF_X40_Y23_N17
\obstacle_hstart[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~30_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(18));

-- Location: LCCOMB_X40_Y23_N6
\Add12~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~38_combout\ = (obstacle_hstart(19) & (\Add12~37\ & VCC)) # (!obstacle_hstart(19) & (!\Add12~37\))
-- \Add12~39\ = CARRY((!obstacle_hstart(19) & !\Add12~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(19),
	datad => VCC,
	cin => \Add12~37\,
	combout => \Add12~38_combout\,
	cout => \Add12~39\);

-- Location: LCCOMB_X40_Y26_N4
\obstacle_hstart~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~22_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & (\Add12~38_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(19))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~38_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(19),
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~22_combout\);

-- Location: FF_X40_Y26_N5
\obstacle_hstart[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(19));

-- Location: LCCOMB_X40_Y23_N8
\Add12~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~40_combout\ = (obstacle_hstart(20) & ((GND) # (!\Add12~39\))) # (!obstacle_hstart(20) & (\Add12~39\ $ (GND)))
-- \Add12~41\ = CARRY((obstacle_hstart(20)) # (!\Add12~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(20),
	datad => VCC,
	cin => \Add12~39\,
	combout => \Add12~40_combout\,
	cout => \Add12~41\);

-- Location: LCCOMB_X41_Y24_N2
\Add12~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~71_combout\ = (\LessThan0~8_combout\ & ((\Add12~40_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(20),
	datac => \LessThan0~8_combout\,
	datad => \Add12~40_combout\,
	combout => \Add12~71_combout\);

-- Location: LCCOMB_X41_Y24_N22
\obstacle_hstart~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~20_combout\ = (\LessThan3~0_combout\ & (\Add12~71_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~0_combout\,
	datab => \Add12~71_combout\,
	datac => \LessThan3~21_combout\,
	datad => \LessThan3~10_combout\,
	combout => \obstacle_hstart~20_combout\);

-- Location: FF_X41_Y24_N31
\obstacle_hstart[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~20_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(20));

-- Location: LCCOMB_X40_Y23_N10
\Add12~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~42_combout\ = (obstacle_hstart(21) & (\Add12~41\ & VCC)) # (!obstacle_hstart(21) & (!\Add12~41\))
-- \Add12~43\ = CARRY((!obstacle_hstart(21) & !\Add12~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(21),
	datad => VCC,
	cin => \Add12~41\,
	combout => \Add12~42_combout\,
	cout => \Add12~43\);

-- Location: LCCOMB_X41_Y24_N8
\obstacle_hstart~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~21_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & (\Add12~42_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~42_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan3~22_combout\,
	datad => obstacle_hstart(21),
	combout => \obstacle_hstart~21_combout\);

-- Location: FF_X41_Y24_N29
\obstacle_hstart[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~21_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(21));

-- Location: LCCOMB_X40_Y23_N12
\Add12~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~44_combout\ = (obstacle_hstart(22) & ((GND) # (!\Add12~43\))) # (!obstacle_hstart(22) & (\Add12~43\ $ (GND)))
-- \Add12~45\ = CARRY((obstacle_hstart(22)) # (!\Add12~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(22),
	datad => VCC,
	cin => \Add12~43\,
	combout => \Add12~44_combout\,
	cout => \Add12~45\);

-- Location: LCCOMB_X41_Y23_N8
\Add12~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~72_combout\ = (\LessThan0~8_combout\ & ((\Add12~44_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(22),
	datac => \LessThan0~8_combout\,
	datad => \Add12~44_combout\,
	combout => \Add12~72_combout\);

-- Location: LCCOMB_X41_Y23_N20
\obstacle_hstart~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~31_combout\ = (\LessThan3~0_combout\ & (\Add12~72_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~0_combout\,
	datab => \LessThan3~21_combout\,
	datac => \Add12~72_combout\,
	datad => \LessThan3~10_combout\,
	combout => \obstacle_hstart~31_combout\);

-- Location: FF_X40_Y23_N11
\obstacle_hstart[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~31_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(22));

-- Location: LCCOMB_X40_Y23_N14
\Add12~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~46_combout\ = (obstacle_hstart(23) & (\Add12~45\ & VCC)) # (!obstacle_hstart(23) & (!\Add12~45\))
-- \Add12~47\ = CARRY((!obstacle_hstart(23) & !\Add12~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(23),
	datad => VCC,
	cin => \Add12~45\,
	combout => \Add12~46_combout\,
	cout => \Add12~47\);

-- Location: LCCOMB_X41_Y23_N18
\obstacle_hstart~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~6_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & ((\Add12~46_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(23),
	datab => \LessThan0~8_combout\,
	datac => \LessThan3~22_combout\,
	datad => \Add12~46_combout\,
	combout => \obstacle_hstart~6_combout\);

-- Location: FF_X40_Y23_N15
\obstacle_hstart[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~6_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(23));

-- Location: LCCOMB_X40_Y23_N16
\Add12~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~48_combout\ = (obstacle_hstart(24) & ((GND) # (!\Add12~47\))) # (!obstacle_hstart(24) & (\Add12~47\ $ (GND)))
-- \Add12~49\ = CARRY((obstacle_hstart(24)) # (!\Add12~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(24),
	datad => VCC,
	cin => \Add12~47\,
	combout => \Add12~48_combout\,
	cout => \Add12~49\);

-- Location: LCCOMB_X39_Y23_N24
\Add12~73\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~73_combout\ = (\LessThan0~8_combout\ & ((\Add12~48_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(24),
	datac => \LessThan0~8_combout\,
	datad => \Add12~48_combout\,
	combout => \Add12~73_combout\);

-- Location: LCCOMB_X41_Y23_N24
\obstacle_hstart~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~5_combout\ = (\Add12~73_combout\ & (\LessThan3~0_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~10_combout\,
	datab => \Add12~73_combout\,
	datac => \LessThan3~0_combout\,
	datad => \LessThan3~21_combout\,
	combout => \obstacle_hstart~5_combout\);

-- Location: FF_X40_Y23_N19
\obstacle_hstart[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~5_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(24));

-- Location: LCCOMB_X40_Y23_N18
\Add12~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~50_combout\ = (obstacle_hstart(25) & (\Add12~49\ & VCC)) # (!obstacle_hstart(25) & (!\Add12~49\))
-- \Add12~51\ = CARRY((!obstacle_hstart(25) & !\Add12~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(25),
	datad => VCC,
	cin => \Add12~49\,
	combout => \Add12~50_combout\,
	cout => \Add12~51\);

-- Location: LCCOMB_X39_Y23_N20
\obstacle_hstart~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~4_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & ((\Add12~50_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~22_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(25),
	datad => \Add12~50_combout\,
	combout => \obstacle_hstart~4_combout\);

-- Location: FF_X40_Y23_N29
\obstacle_hstart[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(25));

-- Location: LCCOMB_X40_Y23_N20
\Add12~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~52_combout\ = (obstacle_hstart(26) & ((GND) # (!\Add12~51\))) # (!obstacle_hstart(26) & (\Add12~51\ $ (GND)))
-- \Add12~53\ = CARRY((obstacle_hstart(26)) # (!\Add12~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(26),
	datad => VCC,
	cin => \Add12~51\,
	combout => \Add12~52_combout\,
	cout => \Add12~53\);

-- Location: LCCOMB_X41_Y23_N0
\Add12~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~74_combout\ = (\LessThan0~8_combout\ & ((\Add12~52_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(26),
	datac => \LessThan0~8_combout\,
	datad => \Add12~52_combout\,
	combout => \Add12~74_combout\);

-- Location: LCCOMB_X41_Y23_N2
\obstacle_hstart~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~32_combout\ = (\LessThan3~0_combout\ & (\Add12~74_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~0_combout\,
	datab => \Add12~74_combout\,
	datac => \LessThan3~21_combout\,
	datad => \LessThan3~10_combout\,
	combout => \obstacle_hstart~32_combout\);

-- Location: FF_X41_Y23_N3
\obstacle_hstart[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(26));

-- Location: LCCOMB_X40_Y23_N22
\Add12~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~54_combout\ = (obstacle_hstart(27) & (\Add12~53\ & VCC)) # (!obstacle_hstart(27) & (!\Add12~53\))
-- \Add12~55\ = CARRY((!obstacle_hstart(27) & !\Add12~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(27),
	datad => VCC,
	cin => \Add12~53\,
	combout => \Add12~54_combout\,
	cout => \Add12~55\);

-- Location: LCCOMB_X39_Y23_N16
\obstacle_hstart~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~2_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & ((\Add12~54_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(27),
	datab => \Add12~54_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~2_combout\);

-- Location: FF_X40_Y23_N7
\obstacle_hstart[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(27));

-- Location: LCCOMB_X40_Y23_N24
\Add12~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~56_combout\ = (obstacle_hstart(28) & ((GND) # (!\Add12~55\))) # (!obstacle_hstart(28) & (\Add12~55\ $ (GND)))
-- \Add12~57\ = CARRY((obstacle_hstart(28)) # (!\Add12~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(28),
	datad => VCC,
	cin => \Add12~55\,
	combout => \Add12~56_combout\,
	cout => \Add12~57\);

-- Location: LCCOMB_X41_Y22_N0
\Add12~75\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~75_combout\ = (\LessThan0~8_combout\ & ((\Add12~56_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datac => obstacle_hstart(28),
	datad => \Add12~56_combout\,
	combout => \Add12~75_combout\);

-- Location: LCCOMB_X41_Y23_N30
\LessThan3~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~19_combout\ = (!\Add12~74_combout\ & ((\LessThan0~8_combout\ & ((!\Add12~54_combout\))) # (!\LessThan0~8_combout\ & (!obstacle_hstart(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(27),
	datab => \Add12~54_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add12~74_combout\,
	combout => \LessThan3~19_combout\);

-- Location: LCCOMB_X41_Y23_N14
\LessThan3~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~17_combout\ = (!\Add12~72_combout\ & ((\LessThan0~8_combout\ & ((!\Add12~46_combout\))) # (!\LessThan0~8_combout\ & (!obstacle_hstart(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(23),
	datab => \LessThan0~8_combout\,
	datac => \Add12~72_combout\,
	datad => \Add12~46_combout\,
	combout => \LessThan3~17_combout\);

-- Location: LCCOMB_X39_Y23_N14
\LessThan3~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~18_combout\ = (!\Add12~73_combout\ & ((\LessThan0~8_combout\ & ((!\Add12~50_combout\))) # (!\LessThan0~8_combout\ & (!obstacle_hstart(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(25),
	datab => \Add12~50_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add12~73_combout\,
	combout => \LessThan3~18_combout\);

-- Location: LCCOMB_X41_Y24_N20
\LessThan3~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~16_combout\ = (!\Add12~71_combout\ & ((\LessThan0~8_combout\ & (!\Add12~42_combout\)) # (!\LessThan0~8_combout\ & ((!obstacle_hstart(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~42_combout\,
	datab => obstacle_hstart(21),
	datac => \LessThan0~8_combout\,
	datad => \Add12~71_combout\,
	combout => \LessThan3~16_combout\);

-- Location: LCCOMB_X40_Y22_N22
\LessThan3~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~20_combout\ = (\LessThan3~19_combout\ & (\LessThan3~17_combout\ & (\LessThan3~18_combout\ & \LessThan3~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~19_combout\,
	datab => \LessThan3~17_combout\,
	datac => \LessThan3~18_combout\,
	datad => \LessThan3~16_combout\,
	combout => \LessThan3~20_combout\);

-- Location: LCCOMB_X41_Y24_N24
\LessThan3~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~12_combout\ = (!\Add12~68_combout\ & ((\LessThan0~8_combout\ & ((!\Add12~30_combout\))) # (!\LessThan0~8_combout\ & (!obstacle_hstart(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~68_combout\,
	datab => obstacle_hstart(15),
	datac => \LessThan0~8_combout\,
	datad => \Add12~30_combout\,
	combout => \LessThan3~12_combout\);

-- Location: LCCOMB_X41_Y24_N10
\LessThan3~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~11_combout\ = (!\Add12~67_combout\ & ((\LessThan0~8_combout\ & (!\Add12~26_combout\)) # (!\LessThan0~8_combout\ & ((!obstacle_hstart(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~26_combout\,
	datab => obstacle_hstart(13),
	datac => \LessThan0~8_combout\,
	datad => \Add12~67_combout\,
	combout => \LessThan3~11_combout\);

-- Location: LCCOMB_X41_Y23_N6
\LessThan3~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~14_combout\ = (!\Add12~70_combout\ & ((\LessThan0~8_combout\ & ((!\Add12~38_combout\))) # (!\LessThan0~8_combout\ & (!obstacle_hstart(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(19),
	datab => \LessThan0~8_combout\,
	datac => \Add12~38_combout\,
	datad => \Add12~70_combout\,
	combout => \LessThan3~14_combout\);

-- Location: LCCOMB_X40_Y21_N0
\LessThan3~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~13_combout\ = (!\Add12~69_combout\ & ((\LessThan0~8_combout\ & ((!\Add12~34_combout\))) # (!\LessThan0~8_combout\ & (!obstacle_hstart(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(17),
	datab => \LessThan0~8_combout\,
	datac => \Add12~69_combout\,
	datad => \Add12~34_combout\,
	combout => \LessThan3~13_combout\);

-- Location: LCCOMB_X40_Y22_N28
\LessThan3~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~15_combout\ = (\LessThan3~12_combout\ & (\LessThan3~11_combout\ & (\LessThan3~14_combout\ & \LessThan3~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~12_combout\,
	datab => \LessThan3~11_combout\,
	datac => \LessThan3~14_combout\,
	datad => \LessThan3~13_combout\,
	combout => \LessThan3~15_combout\);

-- Location: LCCOMB_X40_Y22_N0
\LessThan3~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~21_combout\ = (!\Add12~64_combout\ & (!\Add12~75_combout\ & (\LessThan3~20_combout\ & \LessThan3~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~64_combout\,
	datab => \Add12~75_combout\,
	datac => \LessThan3~20_combout\,
	datad => \LessThan3~15_combout\,
	combout => \LessThan3~21_combout\);

-- Location: LCCOMB_X39_Y23_N26
\obstacle_hstart~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~3_combout\ = (\Add12~75_combout\ & (\LessThan3~0_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~21_combout\,
	datab => \Add12~75_combout\,
	datac => \LessThan3~0_combout\,
	datad => \LessThan3~10_combout\,
	combout => \obstacle_hstart~3_combout\);

-- Location: FF_X40_Y23_N25
\obstacle_hstart[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~3_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(28));

-- Location: LCCOMB_X40_Y23_N26
\Add12~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~58_combout\ = (obstacle_hstart(29) & (\Add12~57\ & VCC)) # (!obstacle_hstart(29) & (!\Add12~57\))
-- \Add12~59\ = CARRY((!obstacle_hstart(29) & !\Add12~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(29),
	datad => VCC,
	cin => \Add12~57\,
	combout => \Add12~58_combout\,
	cout => \Add12~59\);

-- Location: LCCOMB_X41_Y22_N4
\Add12~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~64_combout\ = (\LessThan0~8_combout\ & ((\Add12~58_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(29),
	datac => \LessThan0~8_combout\,
	datad => \Add12~58_combout\,
	combout => \Add12~64_combout\);

-- Location: LCCOMB_X41_Y25_N16
\obstacle_hstart~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~0_combout\ = (\Add12~64_combout\ & (\LessThan3~0_combout\ & ((\LessThan3~10_combout\) # (!\LessThan3~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~64_combout\,
	datab => \LessThan3~0_combout\,
	datac => \LessThan3~10_combout\,
	datad => \LessThan3~21_combout\,
	combout => \obstacle_hstart~0_combout\);

-- Location: FF_X40_Y23_N9
\obstacle_hstart[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstart~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(29));

-- Location: LCCOMB_X39_Y22_N20
\obstacle_hstart~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~1_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & (\Add12~60_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(30))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~60_combout\,
	datab => obstacle_hstart(30),
	datac => \LessThan0~8_combout\,
	datad => \LessThan3~22_combout\,
	combout => \obstacle_hstart~1_combout\);

-- Location: LCCOMB_X40_Y25_N4
\LessThan26~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~2_combout\ = (!hposition(29) & (\obstacle_hstart~0_combout\ & (\obstacle_hstart~1_combout\ $ (!hposition(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstart~1_combout\,
	datab => hposition(29),
	datac => hposition(30),
	datad => \obstacle_hstart~0_combout\,
	combout => \LessThan26~2_combout\);

-- Location: FF_X44_Y21_N1
\obstacle_hstop[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(30));

-- Location: LCCOMB_X45_Y21_N28
\Add13~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~60_combout\ = (obstacle_hstop(30) & ((GND) # (!\Add13~59\))) # (!obstacle_hstop(30) & (\Add13~59\ $ (GND)))
-- \Add13~61\ = CARRY((obstacle_hstop(30)) # (!\Add13~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(30),
	datad => VCC,
	cin => \Add13~59\,
	combout => \Add13~60_combout\,
	cout => \Add13~61\);

-- Location: LCCOMB_X45_Y22_N0
\Add13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~0_combout\ = obstacle_hstop(0) $ (VCC)
-- \Add13~1\ = CARRY(obstacle_hstop(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(0),
	datad => VCC,
	combout => \Add13~0_combout\,
	cout => \Add13~1\);

-- Location: LCCOMB_X44_Y23_N26
\obstacle_hstop~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~49_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~0_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => obstacle_hstop(0),
	datac => \LessThan4~22_combout\,
	datad => \Add13~0_combout\,
	combout => \obstacle_hstop~49_combout\);

-- Location: FF_X44_Y23_N25
\obstacle_hstop[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~49_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(0));

-- Location: LCCOMB_X45_Y22_N2
\Add13~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~2_combout\ = (obstacle_hstop(1) & (!\Add13~1\)) # (!obstacle_hstop(1) & ((\Add13~1\) # (GND)))
-- \Add13~3\ = CARRY((!\Add13~1\) # (!obstacle_hstop(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(1),
	datad => VCC,
	cin => \Add13~1\,
	combout => \Add13~2_combout\,
	cout => \Add13~3\);

-- Location: LCCOMB_X45_Y23_N10
\obstacle_hstop~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~48_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~2_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(1),
	datab => \Add13~2_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~48_combout\);

-- Location: FF_X45_Y23_N15
\obstacle_hstop[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~48_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(1));

-- Location: LCCOMB_X45_Y22_N4
\Add13~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~4_combout\ = (obstacle_hstop(2) & ((GND) # (!\Add13~3\))) # (!obstacle_hstop(2) & (\Add13~3\ $ (GND)))
-- \Add13~5\ = CARRY((obstacle_hstop(2)) # (!\Add13~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(2),
	datad => VCC,
	cin => \Add13~3\,
	combout => \Add13~4_combout\,
	cout => \Add13~5\);

-- Location: LCCOMB_X45_Y23_N16
\obstacle_hstop~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~47_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~4_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => obstacle_hstop(2),
	datac => \LessThan0~8_combout\,
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~47_combout\);

-- Location: LCCOMB_X45_Y23_N24
\obstacle_hstop[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop[2]~feeder_combout\ = \obstacle_hstop~47_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \obstacle_hstop~47_combout\,
	combout => \obstacle_hstop[2]~feeder_combout\);

-- Location: FF_X45_Y23_N25
\obstacle_hstop[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(2));

-- Location: LCCOMB_X45_Y22_N6
\Add13~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~6_combout\ = (obstacle_hstop(3) & (\Add13~5\ & VCC)) # (!obstacle_hstop(3) & (!\Add13~5\))
-- \Add13~7\ = CARRY((!obstacle_hstop(3) & !\Add13~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(3),
	datad => VCC,
	cin => \Add13~5\,
	combout => \Add13~6_combout\,
	cout => \Add13~7\);

-- Location: LCCOMB_X44_Y23_N28
\obstacle_hstop~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~46_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~6_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~6_combout\,
	datac => \LessThan4~22_combout\,
	datad => obstacle_hstop(3),
	combout => \obstacle_hstop~46_combout\);

-- Location: LCCOMB_X44_Y23_N6
\obstacle_hstop[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop[3]~feeder_combout\ = \obstacle_hstop~46_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \obstacle_hstop~46_combout\,
	combout => \obstacle_hstop[3]~feeder_combout\);

-- Location: FF_X44_Y23_N7
\obstacle_hstop[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(3));

-- Location: LCCOMB_X45_Y22_N8
\Add13~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~8_combout\ = (obstacle_hstop(4) & ((GND) # (!\Add13~7\))) # (!obstacle_hstop(4) & (\Add13~7\ $ (GND)))
-- \Add13~9\ = CARRY((obstacle_hstop(4)) # (!\Add13~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(4),
	datad => VCC,
	cin => \Add13~7\,
	combout => \Add13~8_combout\,
	cout => \Add13~9\);

-- Location: LCCOMB_X45_Y23_N18
\obstacle_hstop~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~45_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~8_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(4),
	datab => \Add13~8_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~45_combout\);

-- Location: FF_X45_Y23_N7
\obstacle_hstop[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~45_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(4));

-- Location: LCCOMB_X45_Y22_N10
\Add13~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~10_combout\ = (obstacle_hstop(5) & (\Add13~9\ & VCC)) # (!obstacle_hstop(5) & (!\Add13~9\))
-- \Add13~11\ = CARRY((!obstacle_hstop(5) & !\Add13~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(5),
	datad => VCC,
	cin => \Add13~9\,
	combout => \Add13~10_combout\,
	cout => \Add13~11\);

-- Location: LCCOMB_X44_Y23_N4
\obstacle_hstop~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~44_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~10_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~10_combout\,
	datac => obstacle_hstop(5),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~44_combout\);

-- Location: FF_X44_Y23_N5
\obstacle_hstop[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(5));

-- Location: LCCOMB_X45_Y22_N12
\Add13~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~12_combout\ = (obstacle_hstop(6) & ((GND) # (!\Add13~11\))) # (!obstacle_hstop(6) & (\Add13~11\ $ (GND)))
-- \Add13~13\ = CARRY((obstacle_hstop(6)) # (!\Add13~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(6),
	datad => VCC,
	cin => \Add13~11\,
	combout => \Add13~12_combout\,
	cout => \Add13~13\);

-- Location: LCCOMB_X43_Y23_N0
\obstacle_hstop~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~43_combout\ = ((\LessThan0~8_combout\ & (\Add13~12_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(6))))) # (!\LessThan4~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~12_combout\,
	datac => obstacle_hstop(6),
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~43_combout\);

-- Location: FF_X43_Y23_N1
\obstacle_hstop[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(6));

-- Location: LCCOMB_X45_Y22_N14
\Add13~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~14_combout\ = (obstacle_hstop(7) & (\Add13~13\ & VCC)) # (!obstacle_hstop(7) & (!\Add13~13\))
-- \Add13~15\ = CARRY((!obstacle_hstop(7) & !\Add13~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(7),
	datad => VCC,
	cin => \Add13~13\,
	combout => \Add13~14_combout\,
	cout => \Add13~15\);

-- Location: LCCOMB_X44_Y22_N26
\obstacle_hstop~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~42_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~14_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~14_combout\,
	datac => obstacle_hstop(7),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~42_combout\);

-- Location: FF_X44_Y22_N27
\obstacle_hstop[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(7));

-- Location: LCCOMB_X45_Y22_N16
\Add13~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~16_combout\ = (obstacle_hstop(8) & ((GND) # (!\Add13~15\))) # (!obstacle_hstop(8) & (\Add13~15\ $ (GND)))
-- \Add13~17\ = CARRY((obstacle_hstop(8)) # (!\Add13~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(8),
	datad => VCC,
	cin => \Add13~15\,
	combout => \Add13~16_combout\,
	cout => \Add13~17\);

-- Location: LCCOMB_X45_Y23_N0
\obstacle_hstop~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~41_combout\ = ((\LessThan0~8_combout\ & ((\Add13~16_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(8)))) # (!\LessThan4~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan4~22_combout\,
	datac => obstacle_hstop(8),
	datad => \Add13~16_combout\,
	combout => \obstacle_hstop~41_combout\);

-- Location: FF_X45_Y23_N1
\obstacle_hstop[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(8));

-- Location: LCCOMB_X45_Y22_N18
\Add13~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~18_combout\ = (obstacle_hstop(9) & (\Add13~17\ & VCC)) # (!obstacle_hstop(9) & (!\Add13~17\))
-- \Add13~19\ = CARRY((!obstacle_hstop(9) & !\Add13~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(9),
	datad => VCC,
	cin => \Add13~17\,
	combout => \Add13~18_combout\,
	cout => \Add13~19\);

-- Location: LCCOMB_X44_Y22_N22
\obstacle_hstop~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~40_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~18_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(9),
	datab => \Add13~18_combout\,
	datac => \LessThan4~22_combout\,
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~40_combout\);

-- Location: FF_X44_Y22_N29
\obstacle_hstop[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~40_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(9));

-- Location: LCCOMB_X45_Y22_N20
\Add13~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~20_combout\ = (obstacle_hstop(10) & ((GND) # (!\Add13~19\))) # (!obstacle_hstop(10) & (\Add13~19\ $ (GND)))
-- \Add13~21\ = CARRY((obstacle_hstop(10)) # (!\Add13~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(10),
	datad => VCC,
	cin => \Add13~19\,
	combout => \Add13~20_combout\,
	cout => \Add13~21\);

-- Location: LCCOMB_X44_Y22_N10
\obstacle_hstop~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~39_combout\ = ((\LessThan0~8_combout\ & (\Add13~20_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(10))))) # (!\LessThan4~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~20_combout\,
	datac => obstacle_hstop(10),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~39_combout\);

-- Location: FF_X44_Y22_N11
\obstacle_hstop[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(10));

-- Location: LCCOMB_X45_Y22_N22
\Add13~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~22_combout\ = (obstacle_hstop(11) & (\Add13~21\ & VCC)) # (!obstacle_hstop(11) & (!\Add13~21\))
-- \Add13~23\ = CARRY((!obstacle_hstop(11) & !\Add13~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(11),
	datad => VCC,
	cin => \Add13~21\,
	combout => \Add13~22_combout\,
	cout => \Add13~23\);

-- Location: LCCOMB_X44_Y23_N22
\obstacle_hstop~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~38_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~22_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(11),
	datad => \Add13~22_combout\,
	combout => \obstacle_hstop~38_combout\);

-- Location: FF_X44_Y23_N23
\obstacle_hstop[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(11));

-- Location: LCCOMB_X45_Y22_N24
\Add13~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~24_combout\ = (obstacle_hstop(12) & ((GND) # (!\Add13~23\))) # (!obstacle_hstop(12) & (\Add13~23\ $ (GND)))
-- \Add13~25\ = CARRY((obstacle_hstop(12)) # (!\Add13~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(12),
	datad => VCC,
	cin => \Add13~23\,
	combout => \Add13~24_combout\,
	cout => \Add13~25\);

-- Location: LCCOMB_X44_Y23_N12
\obstacle_hstop~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~37_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~24_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(12),
	datad => \Add13~24_combout\,
	combout => \obstacle_hstop~37_combout\);

-- Location: FF_X44_Y23_N13
\obstacle_hstop[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(12));

-- Location: LCCOMB_X45_Y22_N26
\Add13~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~26_combout\ = (obstacle_hstop(13) & (\Add13~25\ & VCC)) # (!obstacle_hstop(13) & (!\Add13~25\))
-- \Add13~27\ = CARRY((!obstacle_hstop(13) & !\Add13~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(13),
	datad => VCC,
	cin => \Add13~25\,
	combout => \Add13~26_combout\,
	cout => \Add13~27\);

-- Location: LCCOMB_X44_Y22_N12
\obstacle_hstop~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~36_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~26_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~26_combout\,
	datac => obstacle_hstop(13),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~36_combout\);

-- Location: FF_X44_Y22_N13
\obstacle_hstop[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(13));

-- Location: LCCOMB_X45_Y22_N28
\Add13~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~28_combout\ = (obstacle_hstop(14) & ((GND) # (!\Add13~27\))) # (!obstacle_hstop(14) & (\Add13~27\ $ (GND)))
-- \Add13~29\ = CARRY((obstacle_hstop(14)) # (!\Add13~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(14),
	datad => VCC,
	cin => \Add13~27\,
	combout => \Add13~28_combout\,
	cout => \Add13~29\);

-- Location: LCCOMB_X44_Y22_N2
\obstacle_hstop~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~35_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~28_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~28_combout\,
	datac => obstacle_hstop(14),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~35_combout\);

-- Location: FF_X44_Y22_N3
\obstacle_hstop[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(14));

-- Location: LCCOMB_X45_Y22_N30
\Add13~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~30_combout\ = (obstacle_hstop(15) & (\Add13~29\ & VCC)) # (!obstacle_hstop(15) & (!\Add13~29\))
-- \Add13~31\ = CARRY((!obstacle_hstop(15) & !\Add13~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(15),
	datad => VCC,
	cin => \Add13~29\,
	combout => \Add13~30_combout\,
	cout => \Add13~31\);

-- Location: LCCOMB_X44_Y22_N16
\obstacle_hstop~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~34_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~30_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~30_combout\,
	datac => obstacle_hstop(15),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~34_combout\);

-- Location: FF_X44_Y22_N17
\obstacle_hstop[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(15));

-- Location: LCCOMB_X45_Y21_N0
\Add13~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~32_combout\ = (obstacle_hstop(16) & ((GND) # (!\Add13~31\))) # (!obstacle_hstop(16) & (\Add13~31\ $ (GND)))
-- \Add13~33\ = CARRY((obstacle_hstop(16)) # (!\Add13~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(16),
	datad => VCC,
	cin => \Add13~31\,
	combout => \Add13~32_combout\,
	cout => \Add13~33\);

-- Location: LCCOMB_X44_Y22_N0
\obstacle_hstop~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~33_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~32_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(16))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~32_combout\,
	datac => \LessThan4~22_combout\,
	datad => obstacle_hstop(16),
	combout => \obstacle_hstop~33_combout\);

-- Location: FF_X44_Y22_N7
\obstacle_hstop[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~33_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(16));

-- Location: LCCOMB_X45_Y21_N2
\Add13~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~34_combout\ = (obstacle_hstop(17) & (\Add13~33\ & VCC)) # (!obstacle_hstop(17) & (!\Add13~33\))
-- \Add13~35\ = CARRY((!obstacle_hstop(17) & !\Add13~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(17),
	datad => VCC,
	cin => \Add13~33\,
	combout => \Add13~34_combout\,
	cout => \Add13~35\);

-- Location: LCCOMB_X44_Y22_N24
\obstacle_hstop~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~32_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~34_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~34_combout\,
	datac => obstacle_hstop(17),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~32_combout\);

-- Location: FF_X44_Y22_N25
\obstacle_hstop[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(17));

-- Location: LCCOMB_X45_Y21_N4
\Add13~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~36_combout\ = (obstacle_hstop(18) & ((GND) # (!\Add13~35\))) # (!obstacle_hstop(18) & (\Add13~35\ $ (GND)))
-- \Add13~37\ = CARRY((obstacle_hstop(18)) # (!\Add13~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(18),
	datad => VCC,
	cin => \Add13~35\,
	combout => \Add13~36_combout\,
	cout => \Add13~37\);

-- Location: LCCOMB_X44_Y22_N14
\obstacle_hstop~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~31_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~36_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~36_combout\,
	datab => obstacle_hstop(18),
	datac => \LessThan4~22_combout\,
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~31_combout\);

-- Location: FF_X44_Y22_N31
\obstacle_hstop[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~31_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(18));

-- Location: LCCOMB_X45_Y21_N6
\Add13~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~38_combout\ = (obstacle_hstop(19) & (\Add13~37\ & VCC)) # (!obstacle_hstop(19) & (!\Add13~37\))
-- \Add13~39\ = CARRY((!obstacle_hstop(19) & !\Add13~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(19),
	datad => VCC,
	cin => \Add13~37\,
	combout => \Add13~38_combout\,
	cout => \Add13~39\);

-- Location: LCCOMB_X44_Y21_N8
\obstacle_hstop~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~30_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~38_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(19))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~38_combout\,
	datab => \LessThan4~22_combout\,
	datac => obstacle_hstop(19),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~30_combout\);

-- Location: FF_X44_Y21_N9
\obstacle_hstop[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(19));

-- Location: LCCOMB_X45_Y21_N8
\Add13~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~40_combout\ = (obstacle_hstop(20) & ((GND) # (!\Add13~39\))) # (!obstacle_hstop(20) & (\Add13~39\ $ (GND)))
-- \Add13~41\ = CARRY((obstacle_hstop(20)) # (!\Add13~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(20),
	datad => VCC,
	cin => \Add13~39\,
	combout => \Add13~40_combout\,
	cout => \Add13~41\);

-- Location: LCCOMB_X44_Y22_N4
\obstacle_hstop~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~29_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~40_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~22_combout\,
	datab => \Add13~40_combout\,
	datac => obstacle_hstop(20),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~29_combout\);

-- Location: FF_X44_Y22_N5
\obstacle_hstop[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(20));

-- Location: LCCOMB_X45_Y21_N10
\Add13~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~42_combout\ = (obstacle_hstop(21) & (\Add13~41\ & VCC)) # (!obstacle_hstop(21) & (!\Add13~41\))
-- \Add13~43\ = CARRY((!obstacle_hstop(21) & !\Add13~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(21),
	datad => VCC,
	cin => \Add13~41\,
	combout => \Add13~42_combout\,
	cout => \Add13~43\);

-- Location: LCCOMB_X44_Y21_N14
\obstacle_hstop~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~28_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~42_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~42_combout\,
	datab => \LessThan4~22_combout\,
	datac => obstacle_hstop(21),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~28_combout\);

-- Location: FF_X44_Y21_N23
\obstacle_hstop[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~28_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(21));

-- Location: LCCOMB_X45_Y21_N12
\Add13~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~44_combout\ = (obstacle_hstop(22) & ((GND) # (!\Add13~43\))) # (!obstacle_hstop(22) & (\Add13~43\ $ (GND)))
-- \Add13~45\ = CARRY((obstacle_hstop(22)) # (!\Add13~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(22),
	datad => VCC,
	cin => \Add13~43\,
	combout => \Add13~44_combout\,
	cout => \Add13~45\);

-- Location: LCCOMB_X44_Y21_N24
\obstacle_hstop~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~27_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~44_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(22))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~44_combout\,
	datac => obstacle_hstop(22),
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~27_combout\);

-- Location: FF_X44_Y21_N25
\obstacle_hstop[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(22));

-- Location: LCCOMB_X45_Y21_N14
\Add13~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~46_combout\ = (obstacle_hstop(23) & (\Add13~45\ & VCC)) # (!obstacle_hstop(23) & (!\Add13~45\))
-- \Add13~47\ = CARRY((!obstacle_hstop(23) & !\Add13~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(23),
	datad => VCC,
	cin => \Add13~45\,
	combout => \Add13~46_combout\,
	cout => \Add13~47\);

-- Location: LCCOMB_X44_Y21_N6
\obstacle_hstop~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~26_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~46_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~46_combout\,
	datac => obstacle_hstop(23),
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~26_combout\);

-- Location: FF_X44_Y21_N7
\obstacle_hstop[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(23));

-- Location: LCCOMB_X45_Y21_N16
\Add13~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~48_combout\ = (obstacle_hstop(24) & ((GND) # (!\Add13~47\))) # (!obstacle_hstop(24) & (\Add13~47\ $ (GND)))
-- \Add13~49\ = CARRY((obstacle_hstop(24)) # (!\Add13~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(24),
	datad => VCC,
	cin => \Add13~47\,
	combout => \Add13~48_combout\,
	cout => \Add13~49\);

-- Location: LCCOMB_X44_Y21_N28
\obstacle_hstop~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~25_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~48_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan4~22_combout\,
	datac => obstacle_hstop(24),
	datad => \Add13~48_combout\,
	combout => \obstacle_hstop~25_combout\);

-- Location: FF_X44_Y21_N29
\obstacle_hstop[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(24));

-- Location: LCCOMB_X45_Y21_N18
\Add13~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~50_combout\ = (obstacle_hstop(25) & (\Add13~49\ & VCC)) # (!obstacle_hstop(25) & (!\Add13~49\))
-- \Add13~51\ = CARRY((!obstacle_hstop(25) & !\Add13~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(25),
	datad => VCC,
	cin => \Add13~49\,
	combout => \Add13~50_combout\,
	cout => \Add13~51\);

-- Location: LCCOMB_X44_Y21_N4
\obstacle_hstop~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~24_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~50_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(25),
	datab => \LessThan4~22_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add13~50_combout\,
	combout => \obstacle_hstop~24_combout\);

-- Location: FF_X44_Y21_N27
\obstacle_hstop[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \obstacle_hstop~24_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(25));

-- Location: LCCOMB_X45_Y21_N20
\Add13~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~52_combout\ = (obstacle_hstop(26) & ((GND) # (!\Add13~51\))) # (!obstacle_hstop(26) & (\Add13~51\ $ (GND)))
-- \Add13~53\ = CARRY((obstacle_hstop(26)) # (!\Add13~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(26),
	datad => VCC,
	cin => \Add13~51\,
	combout => \Add13~52_combout\,
	cout => \Add13~53\);

-- Location: LCCOMB_X44_Y21_N20
\obstacle_hstop~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~23_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~52_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~52_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(26),
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~23_combout\);

-- Location: FF_X44_Y21_N21
\obstacle_hstop[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(26));

-- Location: LCCOMB_X45_Y21_N22
\Add13~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~54_combout\ = (obstacle_hstop(27) & (\Add13~53\ & VCC)) # (!obstacle_hstop(27) & (!\Add13~53\))
-- \Add13~55\ = CARRY((!obstacle_hstop(27) & !\Add13~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(27),
	datad => VCC,
	cin => \Add13~53\,
	combout => \Add13~54_combout\,
	cout => \Add13~55\);

-- Location: LCCOMB_X44_Y21_N2
\obstacle_hstop~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~22_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~54_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan4~22_combout\,
	datac => obstacle_hstop(27),
	datad => \Add13~54_combout\,
	combout => \obstacle_hstop~22_combout\);

-- Location: FF_X44_Y21_N3
\obstacle_hstop[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(27));

-- Location: LCCOMB_X45_Y21_N24
\Add13~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~56_combout\ = (obstacle_hstop(28) & ((GND) # (!\Add13~55\))) # (!obstacle_hstop(28) & (\Add13~55\ $ (GND)))
-- \Add13~57\ = CARRY((obstacle_hstop(28)) # (!\Add13~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(28),
	datad => VCC,
	cin => \Add13~55\,
	combout => \Add13~56_combout\,
	cout => \Add13~57\);

-- Location: LCCOMB_X44_Y21_N12
\obstacle_hstop~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~21_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & (\Add13~56_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~56_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(28),
	datad => \LessThan4~22_combout\,
	combout => \obstacle_hstop~21_combout\);

-- Location: FF_X44_Y21_N13
\obstacle_hstop[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(28));

-- Location: LCCOMB_X44_Y21_N26
\LessThan4~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~13_combout\ = (obstacle_hstop(28)) # ((obstacle_hstop(27)) # ((obstacle_hstop(25)) # (obstacle_hstop(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(28),
	datab => obstacle_hstop(27),
	datac => obstacle_hstop(25),
	datad => obstacle_hstop(26),
	combout => \LessThan4~13_combout\);

-- Location: LCCOMB_X44_Y21_N22
\LessThan4~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~11_combout\ = (obstacle_hstop(23)) # ((obstacle_hstop(24)) # ((obstacle_hstop(21)) # (obstacle_hstop(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(23),
	datab => obstacle_hstop(24),
	datac => obstacle_hstop(21),
	datad => obstacle_hstop(22),
	combout => \LessThan4~11_combout\);

-- Location: LCCOMB_X44_Y22_N28
\LessThan4~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~8_combout\ = (obstacle_hstop(11)) # ((obstacle_hstop(12)) # ((obstacle_hstop(9)) # (obstacle_hstop(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(11),
	datab => obstacle_hstop(12),
	datac => obstacle_hstop(9),
	datad => obstacle_hstop(10),
	combout => \LessThan4~8_combout\);

-- Location: LCCOMB_X44_Y22_N30
\LessThan4~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~10_combout\ = (obstacle_hstop(19)) # ((obstacle_hstop(20)) # ((obstacle_hstop(18)) # (obstacle_hstop(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(19),
	datab => obstacle_hstop(20),
	datac => obstacle_hstop(18),
	datad => obstacle_hstop(17),
	combout => \LessThan4~10_combout\);

-- Location: LCCOMB_X44_Y22_N6
\LessThan4~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~9_combout\ = (obstacle_hstop(13)) # ((obstacle_hstop(14)) # ((obstacle_hstop(16)) # (obstacle_hstop(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(13),
	datab => obstacle_hstop(14),
	datac => obstacle_hstop(16),
	datad => obstacle_hstop(15),
	combout => \LessThan4~9_combout\);

-- Location: LCCOMB_X44_Y22_N20
\LessThan4~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~12_combout\ = (\LessThan4~11_combout\) # ((\LessThan4~8_combout\) # ((\LessThan4~10_combout\) # (\LessThan4~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~11_combout\,
	datab => \LessThan4~8_combout\,
	datac => \LessThan4~10_combout\,
	datad => \LessThan4~9_combout\,
	combout => \LessThan4~12_combout\);

-- Location: LCCOMB_X44_Y21_N18
\LessThan4~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~14_combout\ = (obstacle_hstop(29)) # ((obstacle_hstop(30)) # ((\LessThan4~13_combout\) # (\LessThan4~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(29),
	datab => obstacle_hstop(30),
	datac => \LessThan4~13_combout\,
	datad => \LessThan4~12_combout\,
	combout => \LessThan4~14_combout\);

-- Location: LCCOMB_X44_Y23_N24
\obstacle_hstop~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~19_combout\ = (\LessThan0~8_combout\ & ((!\Add13~10_combout\))) # (!\LessThan0~8_combout\ & (!obstacle_hstop(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => obstacle_hstop(5),
	datad => \Add13~10_combout\,
	combout => \obstacle_hstop~19_combout\);

-- Location: LCCOMB_X45_Y23_N14
\Add13~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~64_combout\ = (\LessThan0~8_combout\ & ((\Add13~16_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => obstacle_hstop(8),
	datad => \Add13~16_combout\,
	combout => \Add13~64_combout\);

-- Location: LCCOMB_X44_Y22_N8
\Add13~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~65_combout\ = (\LessThan0~8_combout\ & ((\Add13~14_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(7),
	datac => \Add13~14_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add13~65_combout\);

-- Location: LCCOMB_X45_Y23_N6
\Add13~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~66_combout\ = (\LessThan0~8_combout\ & ((\Add13~12_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(6),
	datab => \Add13~12_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add13~66_combout\);

-- Location: LCCOMB_X45_Y23_N20
\LessThan4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (\Add13~65_combout\) # ((!obstacle_width(6) & \Add13~66_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_width(6),
	datac => \Add13~65_combout\,
	datad => \Add13~66_combout\,
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X45_Y23_N8
\Add13~71\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~71_combout\ = (\LessThan0~8_combout\ & ((\Add13~6_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(3),
	datac => \Add13~6_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add13~71_combout\);

-- Location: LCCOMB_X45_Y23_N30
\Add13~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~70_combout\ = (\LessThan0~8_combout\ & (\Add13~8_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan0~8_combout\,
	datac => \Add13~8_combout\,
	datad => obstacle_hstop(4),
	combout => \Add13~70_combout\);

-- Location: LCCOMB_X45_Y23_N2
\Add13~69\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~69_combout\ = (\LessThan0~8_combout\ & ((\Add13~2_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(1),
	datab => \Add13~2_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add13~69_combout\);

-- Location: LCCOMB_X45_Y23_N26
\Add13~67\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~67_combout\ = (\LessThan0~8_combout\ & (\Add13~4_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => obstacle_hstop(2),
	datad => \LessThan0~8_combout\,
	combout => \Add13~67_combout\);

-- Location: LCCOMB_X45_Y23_N12
\Add13~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~68_combout\ = (\LessThan0~8_combout\ & ((\Add13~0_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(0),
	datac => \Add13~0_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add13~68_combout\);

-- Location: LCCOMB_X45_Y23_N28
\LessThan4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~1_combout\ = (obstacle_width(2) & ((\Add13~67_combout\) # ((\Add13~69_combout\ & \Add13~68_combout\)))) # (!obstacle_width(2) & (\Add13~69_combout\ & (\Add13~67_combout\ & \Add13~68_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_width(2),
	datab => \Add13~69_combout\,
	datac => \Add13~67_combout\,
	datad => \Add13~68_combout\,
	combout => \LessThan4~1_combout\);

-- Location: LCCOMB_X45_Y23_N22
\LessThan4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~2_combout\ = (obstacle_width(4) & ((\Add13~71_combout\) # ((\Add13~70_combout\) # (\LessThan4~1_combout\)))) # (!obstacle_width(4) & (\Add13~71_combout\ & (\Add13~70_combout\ & \LessThan4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_width(4),
	datab => \Add13~71_combout\,
	datac => \Add13~70_combout\,
	datad => \LessThan4~1_combout\,
	combout => \LessThan4~2_combout\);

-- Location: LCCOMB_X44_Y23_N14
\LessThan4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~3_combout\ = (\Add13~64_combout\ & (\LessThan4~0_combout\ & ((\LessThan4~2_combout\) # (!\obstacle_hstop~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~19_combout\,
	datab => \Add13~64_combout\,
	datac => \LessThan4~0_combout\,
	datad => \LessThan4~2_combout\,
	combout => \LessThan4~3_combout\);

-- Location: LCCOMB_X45_Y23_N4
\LessThan4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~4_combout\ = (\Add13~65_combout\ & (\Add13~64_combout\ & ((\Add13~66_combout\) # (!obstacle_width(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_width(6),
	datab => \Add13~65_combout\,
	datac => \Add13~64_combout\,
	datad => \Add13~66_combout\,
	combout => \LessThan4~4_combout\);

-- Location: LCCOMB_X44_Y23_N2
\LessThan4~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~20_combout\ = (\LessThan4~14_combout\) # ((\LessThan4~3_combout\) # (\LessThan4~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~14_combout\,
	datac => \LessThan4~3_combout\,
	datad => \LessThan4~4_combout\,
	combout => \LessThan4~20_combout\);

-- Location: LCCOMB_X44_Y23_N8
\LessThan4~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~21_combout\ = (\LessThan0~8_combout\ & (\Add13~60_combout\)) # (!\LessThan0~8_combout\ & ((\LessThan4~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datac => \Add13~60_combout\,
	datad => \LessThan4~20_combout\,
	combout => \LessThan4~21_combout\);

-- Location: LCCOMB_X44_Y22_N18
\LessThan4~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~7_combout\ = (\Add13~26_combout\) # ((\Add13~22_combout\) # ((\Add13~24_combout\) # (\Add13~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~26_combout\,
	datab => \Add13~22_combout\,
	datac => \Add13~24_combout\,
	datad => \Add13~28_combout\,
	combout => \LessThan4~7_combout\);

-- Location: LCCOMB_X44_Y23_N20
\LessThan4~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~15_combout\ = (\Add13~30_combout\) # ((\Add13~32_combout\) # ((\Add13~36_combout\) # (\Add13~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~30_combout\,
	datab => \Add13~32_combout\,
	datac => \Add13~36_combout\,
	datad => \Add13~34_combout\,
	combout => \LessThan4~15_combout\);

-- Location: LCCOMB_X44_Y23_N10
\LessThan4~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~16_combout\ = (\Add13~44_combout\) # ((\Add13~38_combout\) # ((\Add13~40_combout\) # (\Add13~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~44_combout\,
	datab => \Add13~38_combout\,
	datac => \Add13~40_combout\,
	datad => \Add13~42_combout\,
	combout => \LessThan4~16_combout\);

-- Location: LCCOMB_X44_Y23_N16
\LessThan4~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~17_combout\ = (\Add13~18_combout\) # ((\LessThan4~15_combout\) # ((\Add13~20_combout\) # (\LessThan4~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~18_combout\,
	datab => \LessThan4~15_combout\,
	datac => \Add13~20_combout\,
	datad => \LessThan4~16_combout\,
	combout => \LessThan4~17_combout\);

-- Location: LCCOMB_X44_Y23_N18
\LessThan4~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~18_combout\ = (\LessThan0~8_combout\ & (((\LessThan4~7_combout\) # (\LessThan4~17_combout\)))) # (!\LessThan0~8_combout\ & (\LessThan4~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~14_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan4~7_combout\,
	datad => \LessThan4~17_combout\,
	combout => \LessThan4~18_combout\);

-- Location: LCCOMB_X44_Y21_N10
\LessThan4~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~5_combout\ = (\Add13~52_combout\) # ((\Add13~50_combout\) # ((\Add13~46_combout\) # (\Add13~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~52_combout\,
	datab => \Add13~50_combout\,
	datac => \Add13~46_combout\,
	datad => \Add13~48_combout\,
	combout => \LessThan4~5_combout\);

-- Location: LCCOMB_X45_Y21_N26
\Add13~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~58_combout\ = (obstacle_hstop(29) & (\Add13~57\ & VCC)) # (!obstacle_hstop(29) & (!\Add13~57\))
-- \Add13~59\ = CARRY((!obstacle_hstop(29) & !\Add13~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(29),
	datad => VCC,
	cin => \Add13~57\,
	combout => \Add13~58_combout\,
	cout => \Add13~59\);

-- Location: LCCOMB_X44_Y21_N16
\LessThan4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~6_combout\ = (\LessThan4~5_combout\) # ((\Add13~58_combout\) # ((\Add13~56_combout\) # (\Add13~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~5_combout\,
	datab => \Add13~58_combout\,
	datac => \Add13~56_combout\,
	datad => \Add13~54_combout\,
	combout => \LessThan4~6_combout\);

-- Location: LCCOMB_X44_Y23_N0
\LessThan4~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~19_combout\ = (\LessThan4~4_combout\) # ((\LessThan4~18_combout\) # ((\LessThan4~3_combout\) # (\LessThan4~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~4_combout\,
	datab => \LessThan4~18_combout\,
	datac => \LessThan4~3_combout\,
	datad => \LessThan4~6_combout\,
	combout => \LessThan4~19_combout\);

-- Location: LCCOMB_X44_Y23_N30
\LessThan4~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~22_combout\ = (\LessThan0~8_combout\ & (!\Add13~62_combout\ & ((\LessThan4~21_combout\) # (\LessThan4~19_combout\)))) # (!\LessThan0~8_combout\ & (((\LessThan4~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~62_combout\,
	datac => \LessThan4~21_combout\,
	datad => \LessThan4~19_combout\,
	combout => \LessThan4~22_combout\);

-- Location: LCCOMB_X44_Y21_N30
\obstacle_hstop~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~20_combout\ = (\LessThan4~22_combout\ & ((\LessThan0~8_combout\ & ((\Add13~58_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan4~22_combout\,
	datac => obstacle_hstop(29),
	datad => \Add13~58_combout\,
	combout => \obstacle_hstop~20_combout\);

-- Location: FF_X44_Y21_N31
\obstacle_hstop[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(29));

-- Location: LCCOMB_X45_Y21_N30
\Add13~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~62_combout\ = !\Add13~61\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add13~61\,
	combout => \Add13~62_combout\);

-- Location: LCCOMB_X44_Y21_N0
\obstacle_hstop~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~18_combout\ = (\LessThan0~8_combout\ & (!\Add13~62_combout\ & ((\Add13~60_combout\)))) # (!\LessThan0~8_combout\ & (((obstacle_hstop(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~62_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(30),
	datad => \Add13~60_combout\,
	combout => \obstacle_hstop~18_combout\);

-- Location: LCCOMB_X43_Y23_N2
\LessThan27~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~1_cout\ = CARRY((!hposition(0) & \obstacle_hstop~49_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => \obstacle_hstop~49_combout\,
	datad => VCC,
	cout => \LessThan27~1_cout\);

-- Location: LCCOMB_X43_Y23_N4
\LessThan27~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~3_cout\ = CARRY((\obstacle_hstop~48_combout\ & (hposition(1) & !\LessThan27~1_cout\)) # (!\obstacle_hstop~48_combout\ & ((hposition(1)) # (!\LessThan27~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~48_combout\,
	datab => hposition(1),
	datad => VCC,
	cin => \LessThan27~1_cout\,
	cout => \LessThan27~3_cout\);

-- Location: LCCOMB_X43_Y23_N6
\LessThan27~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~5_cout\ = CARRY((\obstacle_hstop~47_combout\ & ((!\LessThan27~3_cout\) # (!hposition(2)))) # (!\obstacle_hstop~47_combout\ & (!hposition(2) & !\LessThan27~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~47_combout\,
	datab => hposition(2),
	datad => VCC,
	cin => \LessThan27~3_cout\,
	cout => \LessThan27~5_cout\);

-- Location: LCCOMB_X43_Y23_N8
\LessThan27~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~7_cout\ = CARRY((hposition(3) & ((!\LessThan27~5_cout\) # (!\obstacle_hstop~46_combout\))) # (!hposition(3) & (!\obstacle_hstop~46_combout\ & !\LessThan27~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \obstacle_hstop~46_combout\,
	datad => VCC,
	cin => \LessThan27~5_cout\,
	cout => \LessThan27~7_cout\);

-- Location: LCCOMB_X43_Y23_N10
\LessThan27~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~9_cout\ = CARRY((hposition(4) & (\obstacle_hstop~45_combout\ & !\LessThan27~7_cout\)) # (!hposition(4) & ((\obstacle_hstop~45_combout\) # (!\LessThan27~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \obstacle_hstop~45_combout\,
	datad => VCC,
	cin => \LessThan27~7_cout\,
	cout => \LessThan27~9_cout\);

-- Location: LCCOMB_X43_Y23_N12
\LessThan27~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~11_cout\ = CARRY((\obstacle_hstop~44_combout\ & (hposition(5) & !\LessThan27~9_cout\)) # (!\obstacle_hstop~44_combout\ & ((hposition(5)) # (!\LessThan27~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~44_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan27~9_cout\,
	cout => \LessThan27~11_cout\);

-- Location: LCCOMB_X43_Y23_N14
\LessThan27~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~13_cout\ = CARRY((hposition(6) & (\obstacle_hstop~43_combout\ & !\LessThan27~11_cout\)) # (!hposition(6) & ((\obstacle_hstop~43_combout\) # (!\LessThan27~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datab => \obstacle_hstop~43_combout\,
	datad => VCC,
	cin => \LessThan27~11_cout\,
	cout => \LessThan27~13_cout\);

-- Location: LCCOMB_X43_Y23_N16
\LessThan27~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~15_cout\ = CARRY((hposition(7) & ((!\LessThan27~13_cout\) # (!\obstacle_hstop~42_combout\))) # (!hposition(7) & (!\obstacle_hstop~42_combout\ & !\LessThan27~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(7),
	datab => \obstacle_hstop~42_combout\,
	datad => VCC,
	cin => \LessThan27~13_cout\,
	cout => \LessThan27~15_cout\);

-- Location: LCCOMB_X43_Y23_N18
\LessThan27~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~17_cout\ = CARRY((hposition(8) & (\obstacle_hstop~41_combout\ & !\LessThan27~15_cout\)) # (!hposition(8) & ((\obstacle_hstop~41_combout\) # (!\LessThan27~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \obstacle_hstop~41_combout\,
	datad => VCC,
	cin => \LessThan27~15_cout\,
	cout => \LessThan27~17_cout\);

-- Location: LCCOMB_X43_Y23_N20
\LessThan27~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~19_cout\ = CARRY((hposition(9) & ((!\LessThan27~17_cout\) # (!\obstacle_hstop~40_combout\))) # (!hposition(9) & (!\obstacle_hstop~40_combout\ & !\LessThan27~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => \obstacle_hstop~40_combout\,
	datad => VCC,
	cin => \LessThan27~17_cout\,
	cout => \LessThan27~19_cout\);

-- Location: LCCOMB_X43_Y23_N22
\LessThan27~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~21_cout\ = CARRY((\obstacle_hstop~39_combout\ & ((!\LessThan27~19_cout\) # (!hposition(10)))) # (!\obstacle_hstop~39_combout\ & (!hposition(10) & !\LessThan27~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~39_combout\,
	datab => hposition(10),
	datad => VCC,
	cin => \LessThan27~19_cout\,
	cout => \LessThan27~21_cout\);

-- Location: LCCOMB_X43_Y23_N24
\LessThan27~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~23_cout\ = CARRY((hposition(11) & ((!\LessThan27~21_cout\) # (!\obstacle_hstop~38_combout\))) # (!hposition(11) & (!\obstacle_hstop~38_combout\ & !\LessThan27~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \obstacle_hstop~38_combout\,
	datad => VCC,
	cin => \LessThan27~21_cout\,
	cout => \LessThan27~23_cout\);

-- Location: LCCOMB_X43_Y23_N26
\LessThan27~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~25_cout\ = CARRY((hposition(12) & (\obstacle_hstop~37_combout\ & !\LessThan27~23_cout\)) # (!hposition(12) & ((\obstacle_hstop~37_combout\) # (!\LessThan27~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \obstacle_hstop~37_combout\,
	datad => VCC,
	cin => \LessThan27~23_cout\,
	cout => \LessThan27~25_cout\);

-- Location: LCCOMB_X43_Y23_N28
\LessThan27~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~27_cout\ = CARRY((hposition(13) & ((!\LessThan27~25_cout\) # (!\obstacle_hstop~36_combout\))) # (!hposition(13) & (!\obstacle_hstop~36_combout\ & !\LessThan27~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \obstacle_hstop~36_combout\,
	datad => VCC,
	cin => \LessThan27~25_cout\,
	cout => \LessThan27~27_cout\);

-- Location: LCCOMB_X43_Y23_N30
\LessThan27~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~29_cout\ = CARRY((\obstacle_hstop~35_combout\ & ((!\LessThan27~27_cout\) # (!hposition(14)))) # (!\obstacle_hstop~35_combout\ & (!hposition(14) & !\LessThan27~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~35_combout\,
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan27~27_cout\,
	cout => \LessThan27~29_cout\);

-- Location: LCCOMB_X43_Y22_N0
\LessThan27~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~31_cout\ = CARRY((hposition(15) & ((!\LessThan27~29_cout\) # (!\obstacle_hstop~34_combout\))) # (!hposition(15) & (!\obstacle_hstop~34_combout\ & !\LessThan27~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datab => \obstacle_hstop~34_combout\,
	datad => VCC,
	cin => \LessThan27~29_cout\,
	cout => \LessThan27~31_cout\);

-- Location: LCCOMB_X43_Y22_N2
\LessThan27~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~33_cout\ = CARRY((hposition(16) & (\obstacle_hstop~33_combout\ & !\LessThan27~31_cout\)) # (!hposition(16) & ((\obstacle_hstop~33_combout\) # (!\LessThan27~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(16),
	datab => \obstacle_hstop~33_combout\,
	datad => VCC,
	cin => \LessThan27~31_cout\,
	cout => \LessThan27~33_cout\);

-- Location: LCCOMB_X43_Y22_N4
\LessThan27~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~35_cout\ = CARRY((hposition(17) & ((!\LessThan27~33_cout\) # (!\obstacle_hstop~32_combout\))) # (!hposition(17) & (!\obstacle_hstop~32_combout\ & !\LessThan27~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => \obstacle_hstop~32_combout\,
	datad => VCC,
	cin => \LessThan27~33_cout\,
	cout => \LessThan27~35_cout\);

-- Location: LCCOMB_X43_Y22_N6
\LessThan27~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~37_cout\ = CARRY((hposition(18) & (\obstacle_hstop~31_combout\ & !\LessThan27~35_cout\)) # (!hposition(18) & ((\obstacle_hstop~31_combout\) # (!\LessThan27~35_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(18),
	datab => \obstacle_hstop~31_combout\,
	datad => VCC,
	cin => \LessThan27~35_cout\,
	cout => \LessThan27~37_cout\);

-- Location: LCCOMB_X43_Y22_N8
\LessThan27~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~39_cout\ = CARRY((\obstacle_hstop~30_combout\ & (hposition(19) & !\LessThan27~37_cout\)) # (!\obstacle_hstop~30_combout\ & ((hposition(19)) # (!\LessThan27~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~30_combout\,
	datab => hposition(19),
	datad => VCC,
	cin => \LessThan27~37_cout\,
	cout => \LessThan27~39_cout\);

-- Location: LCCOMB_X43_Y22_N10
\LessThan27~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~41_cout\ = CARRY((\obstacle_hstop~29_combout\ & ((!\LessThan27~39_cout\) # (!hposition(20)))) # (!\obstacle_hstop~29_combout\ & (!hposition(20) & !\LessThan27~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~29_combout\,
	datab => hposition(20),
	datad => VCC,
	cin => \LessThan27~39_cout\,
	cout => \LessThan27~41_cout\);

-- Location: LCCOMB_X43_Y22_N12
\LessThan27~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~43_cout\ = CARRY((\obstacle_hstop~28_combout\ & (hposition(21) & !\LessThan27~41_cout\)) # (!\obstacle_hstop~28_combout\ & ((hposition(21)) # (!\LessThan27~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~28_combout\,
	datab => hposition(21),
	datad => VCC,
	cin => \LessThan27~41_cout\,
	cout => \LessThan27~43_cout\);

-- Location: LCCOMB_X43_Y22_N14
\LessThan27~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~45_cout\ = CARRY((hposition(22) & (\obstacle_hstop~27_combout\ & !\LessThan27~43_cout\)) # (!hposition(22) & ((\obstacle_hstop~27_combout\) # (!\LessThan27~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(22),
	datab => \obstacle_hstop~27_combout\,
	datad => VCC,
	cin => \LessThan27~43_cout\,
	cout => \LessThan27~45_cout\);

-- Location: LCCOMB_X43_Y22_N16
\LessThan27~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~47_cout\ = CARRY((hposition(23) & ((!\LessThan27~45_cout\) # (!\obstacle_hstop~26_combout\))) # (!hposition(23) & (!\obstacle_hstop~26_combout\ & !\LessThan27~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \obstacle_hstop~26_combout\,
	datad => VCC,
	cin => \LessThan27~45_cout\,
	cout => \LessThan27~47_cout\);

-- Location: LCCOMB_X43_Y22_N18
\LessThan27~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~49_cout\ = CARRY((hposition(24) & (\obstacle_hstop~25_combout\ & !\LessThan27~47_cout\)) # (!hposition(24) & ((\obstacle_hstop~25_combout\) # (!\LessThan27~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \obstacle_hstop~25_combout\,
	datad => VCC,
	cin => \LessThan27~47_cout\,
	cout => \LessThan27~49_cout\);

-- Location: LCCOMB_X43_Y22_N20
\LessThan27~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~51_cout\ = CARRY((hposition(25) & ((!\LessThan27~49_cout\) # (!\obstacle_hstop~24_combout\))) # (!hposition(25) & (!\obstacle_hstop~24_combout\ & !\LessThan27~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(25),
	datab => \obstacle_hstop~24_combout\,
	datad => VCC,
	cin => \LessThan27~49_cout\,
	cout => \LessThan27~51_cout\);

-- Location: LCCOMB_X43_Y22_N22
\LessThan27~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~53_cout\ = CARRY((\obstacle_hstop~23_combout\ & ((!\LessThan27~51_cout\) # (!hposition(26)))) # (!\obstacle_hstop~23_combout\ & (!hposition(26) & !\LessThan27~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~23_combout\,
	datab => hposition(26),
	datad => VCC,
	cin => \LessThan27~51_cout\,
	cout => \LessThan27~53_cout\);

-- Location: LCCOMB_X43_Y22_N24
\LessThan27~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~55_cout\ = CARRY((hposition(27) & ((!\LessThan27~53_cout\) # (!\obstacle_hstop~22_combout\))) # (!hposition(27) & (!\obstacle_hstop~22_combout\ & !\LessThan27~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => \obstacle_hstop~22_combout\,
	datad => VCC,
	cin => \LessThan27~53_cout\,
	cout => \LessThan27~55_cout\);

-- Location: LCCOMB_X43_Y22_N26
\LessThan27~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~57_cout\ = CARRY((\obstacle_hstop~21_combout\ & ((!\LessThan27~55_cout\) # (!hposition(28)))) # (!\obstacle_hstop~21_combout\ & (!hposition(28) & !\LessThan27~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~21_combout\,
	datab => hposition(28),
	datad => VCC,
	cin => \LessThan27~55_cout\,
	cout => \LessThan27~57_cout\);

-- Location: LCCOMB_X43_Y22_N28
\LessThan27~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~59_cout\ = CARRY((\obstacle_hstop~20_combout\ & (hposition(29) & !\LessThan27~57_cout\)) # (!\obstacle_hstop~20_combout\ & ((hposition(29)) # (!\LessThan27~57_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstop~20_combout\,
	datab => hposition(29),
	datad => VCC,
	cin => \LessThan27~57_cout\,
	cout => \LessThan27~59_cout\);

-- Location: LCCOMB_X43_Y22_N30
\LessThan27~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~60_combout\ = (\obstacle_hstop~18_combout\ & ((!hposition(30)) # (!\LessThan27~59_cout\))) # (!\obstacle_hstop~18_combout\ & (!\LessThan27~59_cout\ & !hposition(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \obstacle_hstop~18_combout\,
	datad => hposition(30),
	cin => \LessThan27~59_cout\,
	combout => \LessThan27~60_combout\);

-- Location: LCCOMB_X41_Y24_N4
\LessThan26~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~13_combout\ = (\LessThan3~22_combout\ & (\Add12~72_combout\ & !hposition(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~22_combout\,
	datab => \Add12~72_combout\,
	datad => hposition(22),
	combout => \LessThan26~13_combout\);

-- Location: LCCOMB_X39_Y23_N28
\LessThan26~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~3_combout\ = (hposition(28) & (\obstacle_hstart~3_combout\ & (hposition(27) $ (!\obstacle_hstart~2_combout\)))) # (!hposition(28) & (!\obstacle_hstart~3_combout\ & (hposition(27) $ (!\obstacle_hstart~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => hposition(27),
	datac => \obstacle_hstart~3_combout\,
	datad => \obstacle_hstart~2_combout\,
	combout => \LessThan26~3_combout\);

-- Location: LCCOMB_X39_Y23_N30
\LessThan26~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~8_combout\ = (hposition(28) & (!hposition(27) & (\obstacle_hstart~3_combout\ & \obstacle_hstart~2_combout\))) # (!hposition(28) & ((\obstacle_hstart~3_combout\) # ((!hposition(27) & \obstacle_hstart~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => hposition(27),
	datac => \obstacle_hstart~3_combout\,
	datad => \obstacle_hstart~2_combout\,
	combout => \LessThan26~8_combout\);

-- Location: LCCOMB_X41_Y23_N26
\LessThan26~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~54_combout\ = (\LessThan3~22_combout\ & ((\LessThan0~8_combout\ & ((\Add12~52_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(26)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~22_combout\,
	datab => obstacle_hstart(26),
	datac => \LessThan0~8_combout\,
	datad => \Add12~52_combout\,
	combout => \LessThan26~54_combout\);

-- Location: LCCOMB_X39_Y23_N0
\LessThan26~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~9_combout\ = (hposition(26) & (!hposition(25) & (\LessThan26~54_combout\ & \obstacle_hstart~4_combout\))) # (!hposition(26) & ((\LessThan26~54_combout\) # ((!hposition(25) & \obstacle_hstart~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(26),
	datab => hposition(25),
	datac => \LessThan26~54_combout\,
	datad => \obstacle_hstart~4_combout\,
	combout => \LessThan26~9_combout\);

-- Location: LCCOMB_X39_Y23_N18
\LessThan26~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~10_combout\ = (\LessThan26~8_combout\) # ((\LessThan26~3_combout\ & \LessThan26~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan26~3_combout\,
	datac => \LessThan26~8_combout\,
	datad => \LessThan26~9_combout\,
	combout => \LessThan26~10_combout\);

-- Location: LCCOMB_X41_Y23_N4
\LessThan26~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~6_combout\ = (!hposition(23) & \obstacle_hstart~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(23),
	datad => \obstacle_hstart~6_combout\,
	combout => \LessThan26~6_combout\);

-- Location: LCCOMB_X39_Y23_N22
\LessThan26~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~4_combout\ = (\LessThan26~3_combout\ & (hposition(26) $ (((!\Add12~74_combout\) # (!\LessThan3~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~22_combout\,
	datab => hposition(26),
	datac => \Add12~74_combout\,
	datad => \LessThan26~3_combout\,
	combout => \LessThan26~4_combout\);

-- Location: LCCOMB_X39_Y23_N6
\LessThan26~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~5_combout\ = (\LessThan26~4_combout\ & (hposition(25) $ (!\obstacle_hstart~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(25),
	datac => \LessThan26~4_combout\,
	datad => \obstacle_hstart~4_combout\,
	combout => \LessThan26~5_combout\);

-- Location: LCCOMB_X39_Y23_N8
\LessThan26~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~7_combout\ = (\LessThan26~5_combout\ & ((hposition(24) & (\obstacle_hstart~5_combout\ & \LessThan26~6_combout\)) # (!hposition(24) & ((\obstacle_hstart~5_combout\) # (\LessThan26~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \obstacle_hstart~5_combout\,
	datac => \LessThan26~6_combout\,
	datad => \LessThan26~5_combout\,
	combout => \LessThan26~7_combout\);

-- Location: LCCOMB_X39_Y23_N4
\LessThan26~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~11_combout\ = hposition(24) $ (((\Add12~73_combout\ & \LessThan3~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \Add12~73_combout\,
	datad => \LessThan3~22_combout\,
	combout => \LessThan26~11_combout\);

-- Location: LCCOMB_X39_Y23_N2
\LessThan26~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~12_combout\ = (!\LessThan26~11_combout\ & (\LessThan26~5_combout\ & (\obstacle_hstart~6_combout\ $ (!hposition(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstart~6_combout\,
	datab => hposition(23),
	datac => \LessThan26~11_combout\,
	datad => \LessThan26~5_combout\,
	combout => \LessThan26~12_combout\);

-- Location: LCCOMB_X39_Y23_N12
\LessThan26~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~14_combout\ = (\LessThan26~10_combout\) # ((\LessThan26~7_combout\) # ((\LessThan26~13_combout\ & \LessThan26~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~13_combout\,
	datab => \LessThan26~10_combout\,
	datac => \LessThan26~7_combout\,
	datad => \LessThan26~12_combout\,
	combout => \LessThan26~14_combout\);

-- Location: LCCOMB_X40_Y25_N14
\LessThan26~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~15_combout\ = (hposition(30) & (\obstacle_hstart~1_combout\ & (hposition(29) $ (!\obstacle_hstart~0_combout\)))) # (!hposition(30) & (!\obstacle_hstart~1_combout\ & (hposition(29) $ (!\obstacle_hstart~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(30),
	datab => hposition(29),
	datac => \obstacle_hstart~1_combout\,
	datad => \obstacle_hstart~0_combout\,
	combout => \LessThan26~15_combout\);

-- Location: LCCOMB_X39_Y23_N10
\r[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[2]~1_combout\ = (\LessThan26~14_combout\ & ((\LessThan26~15_combout\) # ((\obstacle_hstart~1_combout\ & !hposition(30))))) # (!\LessThan26~14_combout\ & (\obstacle_hstart~1_combout\ & (!hposition(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~14_combout\,
	datab => \obstacle_hstart~1_combout\,
	datac => hposition(30),
	datad => \LessThan26~15_combout\,
	combout => \r[2]~1_combout\);

-- Location: LCCOMB_X39_Y30_N8
\LessThan22~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~1_combout\ = (!vposition(5) & (!vposition(4) & (!vposition(6) & !vposition(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datab => vposition(4),
	datac => vposition(6),
	datad => vposition(3),
	combout => \LessThan22~1_combout\);

-- Location: LCCOMB_X39_Y30_N2
\LessThan22~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~2_combout\ = (!vposition(8) & (((\LessThan22~1_combout\ & \LessThan22~0_combout\)) # (!vposition(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => \LessThan22~1_combout\,
	datac => vposition(8),
	datad => \LessThan22~0_combout\,
	combout => \LessThan22~2_combout\);

-- Location: LCCOMB_X40_Y29_N14
\LessThan22~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~3_combout\ = (\LessThan23~4_combout\ & ((\LessThan22~2_combout\) # (!vposition(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(9),
	datab => \LessThan22~2_combout\,
	datac => \LessThan23~4_combout\,
	combout => \LessThan22~3_combout\);

-- Location: LCCOMB_X39_Y28_N8
\Equal0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (!\o_count~31_combout\ & (!\o_count~30_combout\ & \Equal0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~31_combout\,
	datac => \o_count~30_combout\,
	datad => \Equal0~9_combout\,
	combout => \Equal0~10_combout\);

-- Location: LCCOMB_X40_Y25_N0
\LessThan26~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~47_combout\ = (!hposition(16) & (\LessThan3~22_combout\ & \Add12~69_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(16),
	datac => \LessThan3~22_combout\,
	datad => \Add12~69_combout\,
	combout => \LessThan26~47_combout\);

-- Location: LCCOMB_X41_Y24_N14
\LessThan26~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~16_combout\ = (hposition(21) & (\obstacle_hstart~21_combout\ & (hposition(20) $ (!\obstacle_hstart~20_combout\)))) # (!hposition(21) & (!\obstacle_hstart~21_combout\ & (hposition(20) $ (!\obstacle_hstart~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => hposition(20),
	datac => \obstacle_hstart~21_combout\,
	datad => \obstacle_hstart~20_combout\,
	combout => \LessThan26~16_combout\);

-- Location: LCCOMB_X41_Y26_N10
\LessThan26~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~17_combout\ = (\LessThan26~16_combout\ & (hposition(19) $ (!\obstacle_hstart~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(19),
	datac => \obstacle_hstart~22_combout\,
	datad => \LessThan26~16_combout\,
	combout => \LessThan26~17_combout\);

-- Location: LCCOMB_X41_Y26_N28
\LessThan26~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~18_combout\ = (\LessThan26~17_combout\ & (hposition(18) $ (((!\LessThan3~22_combout\) # (!\Add12~70_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~70_combout\,
	datab => hposition(18),
	datac => \LessThan3~22_combout\,
	datad => \LessThan26~17_combout\,
	combout => \LessThan26~18_combout\);

-- Location: LCCOMB_X40_Y26_N10
\LessThan26~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~48_combout\ = (\LessThan26~18_combout\ & ((hposition(17) & (\LessThan26~47_combout\ & \obstacle_hstart~23_combout\)) # (!hposition(17) & ((\LessThan26~47_combout\) # (\obstacle_hstart~23_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => \LessThan26~47_combout\,
	datac => \obstacle_hstart~23_combout\,
	datad => \LessThan26~18_combout\,
	combout => \LessThan26~48_combout\);

-- Location: LCCOMB_X40_Y25_N22
\LessThan26~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~19_combout\ = hposition(16) $ (((\LessThan3~22_combout\ & \Add12~69_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(16),
	datac => \LessThan3~22_combout\,
	datad => \Add12~69_combout\,
	combout => \LessThan26~19_combout\);

-- Location: LCCOMB_X40_Y26_N6
\LessThan26~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~20_combout\ = (!\LessThan26~19_combout\ & (\LessThan26~18_combout\ & (hposition(17) $ (!\obstacle_hstart~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => \LessThan26~19_combout\,
	datac => \obstacle_hstart~23_combout\,
	datad => \LessThan26~18_combout\,
	combout => \LessThan26~20_combout\);

-- Location: LCCOMB_X40_Y26_N8
\LessThan26~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~46_combout\ = (!hposition(15) & (\obstacle_hstart~24_combout\ & \LessThan26~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(15),
	datac => \obstacle_hstart~24_combout\,
	datad => \LessThan26~20_combout\,
	combout => \LessThan26~46_combout\);

-- Location: LCCOMB_X41_Y24_N28
\LessThan26~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~49_combout\ = (hposition(21) & (!hposition(20) & (\obstacle_hstart~21_combout\ & \obstacle_hstart~20_combout\))) # (!hposition(21) & ((\obstacle_hstart~21_combout\) # ((!hposition(20) & \obstacle_hstart~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => hposition(20),
	datac => \obstacle_hstart~21_combout\,
	datad => \obstacle_hstart~20_combout\,
	combout => \LessThan26~49_combout\);

-- Location: LCCOMB_X40_Y26_N24
\LessThan26~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~50_combout\ = (\LessThan26~49_combout\) # ((!hposition(19) & (\obstacle_hstart~22_combout\ & \LessThan26~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datab => \obstacle_hstart~22_combout\,
	datac => \LessThan26~49_combout\,
	datad => \LessThan26~16_combout\,
	combout => \LessThan26~50_combout\);

-- Location: LCCOMB_X40_Y26_N30
\LessThan26~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~51_combout\ = (\LessThan26~50_combout\) # ((!hposition(18) & (\LessThan26~17_combout\ & \obstacle_hstart~30_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(18),
	datab => \LessThan26~17_combout\,
	datac => \obstacle_hstart~30_combout\,
	datad => \LessThan26~50_combout\,
	combout => \LessThan26~51_combout\);

-- Location: LCCOMB_X40_Y26_N28
\LessThan26~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~21_combout\ = (\LessThan26~20_combout\ & (hposition(15) $ (!\obstacle_hstart~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(15),
	datac => \obstacle_hstart~24_combout\,
	datad => \LessThan26~20_combout\,
	combout => \LessThan26~21_combout\);

-- Location: LCCOMB_X39_Y26_N26
\LessThan26~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~44_combout\ = (\obstacle_hstart~15_combout\ & !hposition(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \obstacle_hstart~15_combout\,
	datad => hposition(11),
	combout => \LessThan26~44_combout\);

-- Location: LCCOMB_X41_Y24_N18
\LessThan26~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~41_combout\ = (!hposition(13) & (\obstacle_hstart~28_combout\ & (\obstacle_hstart~29_combout\ $ (!hposition(14)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstart~29_combout\,
	datab => hposition(13),
	datac => \obstacle_hstart~28_combout\,
	datad => hposition(14),
	combout => \LessThan26~41_combout\);

-- Location: LCCOMB_X41_Y24_N12
\LessThan26~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~34_combout\ = (hposition(14) & (\obstacle_hstart~29_combout\ & (hposition(13) $ (!\obstacle_hstart~28_combout\)))) # (!hposition(14) & (!\obstacle_hstart~29_combout\ & (hposition(13) $ (!\obstacle_hstart~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datab => hposition(13),
	datac => \obstacle_hstart~29_combout\,
	datad => \obstacle_hstart~28_combout\,
	combout => \LessThan26~34_combout\);

-- Location: LCCOMB_X41_Y24_N6
\LessThan26~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~42_combout\ = (!hposition(12) & (\Add12~67_combout\ & (\LessThan3~22_combout\ & \LessThan26~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \Add12~67_combout\,
	datac => \LessThan3~22_combout\,
	datad => \LessThan26~34_combout\,
	combout => \LessThan26~42_combout\);

-- Location: LCCOMB_X40_Y26_N16
\LessThan26~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~43_combout\ = (\LessThan26~41_combout\) # ((\LessThan26~42_combout\) # ((!hposition(14) & \obstacle_hstart~29_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datab => \obstacle_hstart~29_combout\,
	datac => \LessThan26~41_combout\,
	datad => \LessThan26~42_combout\,
	combout => \LessThan26~43_combout\);

-- Location: LCCOMB_X41_Y26_N20
\LessThan26~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~39_combout\ = (!hposition(9) & \obstacle_hstart~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => hposition(9),
	datad => \obstacle_hstart~16_combout\,
	combout => \LessThan26~39_combout\);

-- Location: LCCOMB_X40_Y22_N18
\LessThan26~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~35_combout\ = (\LessThan26~34_combout\ & (hposition(12) $ (((!\Add12~67_combout\) # (!\LessThan3~22_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \LessThan3~22_combout\,
	datac => \Add12~67_combout\,
	datad => \LessThan26~34_combout\,
	combout => \LessThan26~35_combout\);

-- Location: LCCOMB_X40_Y22_N6
\LessThan26~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~36_combout\ = (\LessThan26~35_combout\ & (hposition(11) $ (!\obstacle_hstart~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \obstacle_hstart~15_combout\,
	datad => \LessThan26~35_combout\,
	combout => \LessThan26~36_combout\);

-- Location: LCCOMB_X40_Y26_N22
\LessThan26~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~40_combout\ = (\LessThan26~36_combout\ & ((hposition(10) & (\obstacle_hstart~17_combout\ & \LessThan26~39_combout\)) # (!hposition(10) & ((\obstacle_hstart~17_combout\) # (\LessThan26~39_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \obstacle_hstart~17_combout\,
	datac => \LessThan26~39_combout\,
	datad => \LessThan26~36_combout\,
	combout => \LessThan26~40_combout\);

-- Location: LCCOMB_X40_Y26_N14
\LessThan26~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~45_combout\ = (\LessThan26~43_combout\) # ((\LessThan26~40_combout\) # ((\LessThan26~44_combout\ & \LessThan26~35_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~44_combout\,
	datab => \LessThan26~43_combout\,
	datac => \LessThan26~40_combout\,
	datad => \LessThan26~35_combout\,
	combout => \LessThan26~45_combout\);

-- Location: LCCOMB_X39_Y24_N4
\LessThan26~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~22_combout\ = (hposition(7) & (\obstacle_hstart~19_combout\ & (hposition(6) $ (!\obstacle_hstart~14_combout\)))) # (!hposition(7) & (!\obstacle_hstart~19_combout\ & (hposition(6) $ (!\obstacle_hstart~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(7),
	datab => hposition(6),
	datac => \obstacle_hstart~19_combout\,
	datad => \obstacle_hstart~14_combout\,
	combout => \LessThan26~22_combout\);

-- Location: LCCOMB_X39_Y24_N0
\LessThan26~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~31_combout\ = (!hposition(6) & (\obstacle_hstart~14_combout\ & (hposition(7) $ (!\obstacle_hstart~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(7),
	datab => hposition(6),
	datac => \obstacle_hstart~19_combout\,
	datad => \obstacle_hstart~14_combout\,
	combout => \LessThan26~31_combout\);

-- Location: LCCOMB_X39_Y24_N14
\LessThan26~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~32_combout\ = (\LessThan26~31_combout\) # ((!hposition(5) & (\obstacle_hstart~12_combout\ & \LessThan26~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datab => \obstacle_hstart~12_combout\,
	datac => \LessThan26~22_combout\,
	datad => \LessThan26~31_combout\,
	combout => \LessThan26~32_combout\);

-- Location: LCCOMB_X39_Y24_N8
\LessThan26~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~24_combout\ = (hposition(3) & (\obstacle_hstart~25_combout\ & (hposition(4) $ (!\obstacle_hstart~26_combout\)))) # (!hposition(3) & (!\obstacle_hstart~25_combout\ & (hposition(4) $ (!\obstacle_hstart~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => hposition(4),
	datac => \obstacle_hstart~26_combout\,
	datad => \obstacle_hstart~25_combout\,
	combout => \LessThan26~24_combout\);

-- Location: LCCOMB_X39_Y24_N20
\LessThan26~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~25_combout\ = (hposition(1) & (!hposition(0) & (\obstacle_hstart~9_combout\ & \obstacle_hstart~27_combout\))) # (!hposition(1) & ((\obstacle_hstart~9_combout\) # ((!hposition(0) & \obstacle_hstart~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => hposition(1),
	datac => \obstacle_hstart~9_combout\,
	datad => \obstacle_hstart~27_combout\,
	combout => \LessThan26~25_combout\);

-- Location: LCCOMB_X39_Y24_N10
\LessThan26~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~26_combout\ = (\LessThan26~24_combout\ & (\LessThan26~25_combout\ & (hposition(2) $ (!\obstacle_hstart~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => \LessThan26~24_combout\,
	datac => \obstacle_hstart~11_combout\,
	datad => \LessThan26~25_combout\,
	combout => \LessThan26~26_combout\);

-- Location: LCCOMB_X39_Y24_N28
\LessThan26~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~27_combout\ = (!hposition(4) & ((\LessThan3~22_combout\ & (\obstacle_hstart~7_combout\)) # (!\LessThan3~22_combout\ & ((obstacle_width(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstart~7_combout\,
	datab => hposition(4),
	datac => obstacle_width(4),
	datad => \LessThan3~22_combout\,
	combout => \LessThan26~27_combout\);

-- Location: LCCOMB_X39_Y24_N26
\LessThan26~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~23_combout\ = (\LessThan26~22_combout\ & (hposition(5) $ (!\obstacle_hstart~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datac => \LessThan26~22_combout\,
	datad => \obstacle_hstart~12_combout\,
	combout => \LessThan26~23_combout\);

-- Location: LCCOMB_X39_Y24_N2
\LessThan26~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~28_combout\ = (hposition(3) & (!hposition(2) & (\obstacle_hstart~11_combout\ & \obstacle_hstart~25_combout\))) # (!hposition(3) & ((\obstacle_hstart~25_combout\) # ((!hposition(2) & \obstacle_hstart~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => hposition(3),
	datac => \obstacle_hstart~11_combout\,
	datad => \obstacle_hstart~25_combout\,
	combout => \LessThan26~28_combout\);

-- Location: LCCOMB_X39_Y24_N16
\LessThan26~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~29_combout\ = (\LessThan26~28_combout\ & (hposition(4) $ (!\obstacle_hstart~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(4),
	datac => \obstacle_hstart~26_combout\,
	datad => \LessThan26~28_combout\,
	combout => \LessThan26~29_combout\);

-- Location: LCCOMB_X39_Y24_N18
\LessThan26~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~30_combout\ = (\LessThan26~23_combout\ & ((\LessThan26~26_combout\) # ((\LessThan26~27_combout\) # (\LessThan26~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~26_combout\,
	datab => \LessThan26~27_combout\,
	datac => \LessThan26~23_combout\,
	datad => \LessThan26~29_combout\,
	combout => \LessThan26~30_combout\);

-- Location: LCCOMB_X40_Y26_N26
\LessThan26~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~33_combout\ = (\LessThan26~32_combout\) # ((\LessThan26~30_combout\) # ((\obstacle_hstart~19_combout\ & !hposition(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \obstacle_hstart~19_combout\,
	datab => hposition(7),
	datac => \LessThan26~32_combout\,
	datad => \LessThan26~30_combout\,
	combout => \LessThan26~33_combout\);

-- Location: LCCOMB_X41_Y26_N30
\LessThan26~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~37_combout\ = hposition(9) $ (\obstacle_hstart~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => hposition(9),
	datad => \obstacle_hstart~16_combout\,
	combout => \LessThan26~37_combout\);

-- Location: LCCOMB_X40_Y26_N0
\LessThan26~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~38_combout\ = (!\LessThan26~37_combout\ & (\LessThan26~36_combout\ & (hposition(10) $ (!\obstacle_hstart~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \obstacle_hstart~17_combout\,
	datac => \LessThan26~37_combout\,
	datad => \LessThan26~36_combout\,
	combout => \LessThan26~38_combout\);

-- Location: LCCOMB_X40_Y26_N12
\LessThan26~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~55_combout\ = (\LessThan26~38_combout\ & ((hposition(8) & (\obstacle_hstart~13_combout\ & \LessThan26~33_combout\)) # (!hposition(8) & ((\obstacle_hstart~13_combout\) # (\LessThan26~33_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \obstacle_hstart~13_combout\,
	datac => \LessThan26~33_combout\,
	datad => \LessThan26~38_combout\,
	combout => \LessThan26~55_combout\);

-- Location: LCCOMB_X40_Y26_N18
\LessThan26~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~56_combout\ = (\LessThan26~21_combout\ & ((\LessThan26~45_combout\) # (\LessThan26~55_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan26~21_combout\,
	datac => \LessThan26~45_combout\,
	datad => \LessThan26~55_combout\,
	combout => \LessThan26~56_combout\);

-- Location: LCCOMB_X40_Y26_N20
\LessThan26~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~52_combout\ = (\LessThan26~48_combout\) # ((\LessThan26~46_combout\) # ((\LessThan26~51_combout\) # (\LessThan26~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~48_combout\,
	datab => \LessThan26~46_combout\,
	datac => \LessThan26~51_combout\,
	datad => \LessThan26~56_combout\,
	combout => \LessThan26~52_combout\);

-- Location: LCCOMB_X40_Y26_N2
\LessThan26~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~53_combout\ = (\LessThan26~12_combout\ & (\LessThan26~52_combout\ & (hposition(22) $ (!\obstacle_hstart~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~12_combout\,
	datab => hposition(22),
	datac => \obstacle_hstart~31_combout\,
	datad => \LessThan26~52_combout\,
	combout => \LessThan26~53_combout\);

-- Location: LCCOMB_X39_Y28_N26
\r[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[2]~2_combout\ = (\LessThan22~3_combout\ & ((\Equal0~10_combout\) # ((\LessThan26~15_combout\ & \LessThan26~53_combout\)))) # (!\LessThan22~3_combout\ & (\LessThan26~15_combout\ & ((\LessThan26~53_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan22~3_combout\,
	datab => \LessThan26~15_combout\,
	datac => \Equal0~10_combout\,
	datad => \LessThan26~53_combout\,
	combout => \r[2]~2_combout\);

-- Location: LCCOMB_X40_Y29_N18
\LessThan24~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~1_combout\ = ((!vposition(0)) # (!vposition(1))) # (!vposition(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datac => vposition(1),
	datad => vposition(0),
	combout => \LessThan24~1_combout\);

-- Location: LCCOMB_X40_Y29_N12
\LessThan24~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~2_combout\ = (!vposition(4) & (!vposition(3) & \LessThan24~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datac => vposition(3),
	datad => \LessThan24~1_combout\,
	combout => \LessThan24~2_combout\);

-- Location: LCCOMB_X40_Y29_N4
\LessThan25~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~0_combout\ = (vposition(7)) # ((vposition(6)) # ((vposition(5) & !\LessThan24~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => vposition(5),
	datac => vposition(6),
	datad => \LessThan24~2_combout\,
	combout => \LessThan25~0_combout\);

-- Location: LCCOMB_X40_Y29_N6
\LessThan23~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~5_combout\ = ((\LessThan24~1_combout\) # (!vposition(3))) # (!vposition(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datac => vposition(3),
	datad => \LessThan24~1_combout\,
	combout => \LessThan23~5_combout\);

-- Location: LCCOMB_X40_Y29_N0
\LessThan23~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~6_combout\ = ((!vposition(5) & (!vposition(6) & \LessThan23~5_combout\))) # (!vposition(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => vposition(5),
	datac => vposition(6),
	datad => \LessThan23~5_combout\,
	combout => \LessThan23~6_combout\);

-- Location: LCCOMB_X40_Y29_N26
\LessThan23~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~7_combout\ = (\LessThan23~4_combout\ & (((!vposition(8) & \LessThan23~6_combout\)) # (!vposition(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(9),
	datab => \LessThan23~4_combout\,
	datac => vposition(8),
	datad => \LessThan23~6_combout\,
	combout => \LessThan23~7_combout\);

-- Location: LCCOMB_X40_Y29_N2
\LessThan24~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~3_combout\ = (((!vposition(5) & \LessThan24~2_combout\)) # (!vposition(6))) # (!vposition(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => vposition(5),
	datac => vposition(6),
	datad => \LessThan24~2_combout\,
	combout => \LessThan24~3_combout\);

-- Location: LCCOMB_X40_Y29_N24
\LessThan24~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~0_combout\ = (!vposition(25) & (!vposition(26) & \LessThan23~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(25),
	datab => vposition(26),
	datac => \LessThan23~4_combout\,
	combout => \LessThan24~0_combout\);

-- Location: LCCOMB_X40_Y29_N20
\LessThan24~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~4_combout\ = (\LessThan24~0_combout\ & (((\LessThan24~3_combout\ & !vposition(8))) # (!vposition(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(9),
	datab => \LessThan24~3_combout\,
	datac => vposition(8),
	datad => \LessThan24~0_combout\,
	combout => \LessThan24~4_combout\);

-- Location: LCCOMB_X39_Y28_N4
\Equal2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (!\o_count~31_combout\ & (\o_count~30_combout\ & \Equal0~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \o_count~31_combout\,
	datac => \o_count~30_combout\,
	datad => \Equal0~9_combout\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X39_Y28_N2
\r[2]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[2]~3_combout\ = (\Equal1~0_combout\ & (!\LessThan23~7_combout\)) # (!\Equal1~0_combout\ & (((!\LessThan24~4_combout\ & \Equal2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan23~7_combout\,
	datab => \LessThan24~4_combout\,
	datac => \Equal2~0_combout\,
	datad => \Equal1~0_combout\,
	combout => \r[2]~3_combout\);

-- Location: LCCOMB_X39_Y28_N12
\r[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[2]~4_combout\ = (\LessThan25~0_combout\ & ((\LessThan25~1_combout\) # ((!\Equal0~10_combout\ & !\r[2]~3_combout\)))) # (!\LessThan25~0_combout\ & (((!\Equal0~10_combout\ & !\r[2]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan25~0_combout\,
	datab => \LessThan25~1_combout\,
	datac => \Equal0~10_combout\,
	datad => \r[2]~3_combout\,
	combout => \r[2]~4_combout\);

-- Location: LCCOMB_X39_Y28_N22
\r[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[2]~5_combout\ = ((\r[2]~1_combout\) # ((\r[2]~2_combout\) # (\r[2]~4_combout\))) # (!\process_0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datab => \r[2]~1_combout\,
	datac => \r[2]~2_combout\,
	datad => \r[2]~4_combout\,
	combout => \r[2]~5_combout\);

-- Location: LCCOMB_X39_Y30_N20
\process_0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~9_combout\ = (!vposition(2) & (!vposition(3) & (vposition(8) & vposition(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => vposition(3),
	datac => vposition(8),
	datad => vposition(9),
	combout => \process_0~9_combout\);

-- Location: LCCOMB_X40_Y29_N10
\process_0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~10_combout\ = (!vposition(7) & (!vposition(5) & (!vposition(6) & !vposition(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => vposition(5),
	datac => vposition(6),
	datad => vposition(4),
	combout => \process_0~10_combout\);

-- Location: LCCOMB_X40_Y29_N8
\process_0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~11_combout\ = (\LessThan6~1_combout\ & (!vposition(31) & \process_0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan6~1_combout\,
	datac => vposition(31),
	datad => \process_0~10_combout\,
	combout => \process_0~11_combout\);

-- Location: LCCOMB_X38_Y24_N10
\LessThan18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan18~0_combout\ = (hposition(3)) # ((hposition(4)) # ((hposition(1)) # (hposition(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => hposition(4),
	datac => hposition(1),
	datad => hposition(2),
	combout => \LessThan18~0_combout\);

-- Location: LCCOMB_X38_Y24_N20
\LessThan18~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan18~1_combout\ = (hposition(6) & ((hposition(0)) # ((hposition(5)) # (\LessThan18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => hposition(6),
	datac => hposition(5),
	datad => \LessThan18~0_combout\,
	combout => \LessThan18~1_combout\);

-- Location: LCCOMB_X41_Y26_N6
\LessThan18~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan18~2_combout\ = (hposition(9)) # ((hposition(8) & ((\LessThan18~1_combout\) # (hposition(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan18~1_combout\,
	datab => hposition(7),
	datac => hposition(9),
	datad => hposition(8),
	combout => \LessThan18~2_combout\);

-- Location: LCCOMB_X41_Y26_N18
\LessThan17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan17~0_combout\ = (!hposition(9) & !hposition(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datac => hposition(10),
	combout => \LessThan17~0_combout\);

-- Location: LCCOMB_X41_Y26_N12
\process_0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~13_combout\ = ((hposition(8) & ((hposition(6)) # (hposition(7))))) # (!\LessThan17~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datab => hposition(8),
	datac => hposition(7),
	datad => \LessThan17~0_combout\,
	combout => \process_0~13_combout\);

-- Location: LCCOMB_X39_Y30_N14
\process_0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~14_combout\ = (\process_0~13_combout\ & (((vposition(5)) # (!\process_0~3_combout\)) # (!\LessThan6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~2_combout\,
	datab => vposition(5),
	datac => \process_0~13_combout\,
	datad => \process_0~3_combout\,
	combout => \process_0~14_combout\);

-- Location: LCCOMB_X41_Y26_N24
\process_0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~12_combout\ = (\LessThan5~6_combout\ & !hposition(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan5~6_combout\,
	datad => hposition(31),
	combout => \process_0~12_combout\);

-- Location: LCCOMB_X41_Y26_N4
\process_0~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~15_combout\ = (\process_0~14_combout\ & (\process_0~12_combout\ & ((!hposition(10)) # (!\LessThan18~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan18~2_combout\,
	datab => \process_0~14_combout\,
	datac => hposition(10),
	datad => \process_0~12_combout\,
	combout => \process_0~15_combout\);

-- Location: LCCOMB_X38_Y24_N4
\process_0~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~17_combout\ = (hposition(6) & (!hposition(7) & ((hposition(3)) # (hposition(5))))) # (!hposition(6) & (!hposition(3) & (!hposition(5) & hposition(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => hposition(6),
	datac => hposition(5),
	datad => hposition(7),
	combout => \process_0~17_combout\);

-- Location: LCCOMB_X38_Y24_N2
\process_0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~16_combout\ = (hposition(3) & (hposition(4) & (hposition(1) & hposition(2)))) # (!hposition(3) & (!hposition(4) & ((!hposition(2)) # (!hposition(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => hposition(4),
	datac => hposition(1),
	datad => hposition(2),
	combout => \process_0~16_combout\);

-- Location: LCCOMB_X38_Y24_N14
\process_0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~18_combout\ = (hposition(8) & (\process_0~17_combout\ & ((hposition(5)) # (\process_0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \process_0~17_combout\,
	datac => hposition(5),
	datad => \process_0~16_combout\,
	combout => \process_0~18_combout\);

-- Location: IOIBUF_X51_Y54_N22
\moveUp~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_moveUp,
	o => \moveUp~input_o\);

-- Location: LCCOMB_X37_Y32_N0
\object_vstart[1]~90\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[1]~90_combout\ = !object_vstart(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => object_vstart(1),
	combout => \object_vstart[1]~90_combout\);

-- Location: FF_X37_Y32_N1
\object_vstart[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[1]~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(1));

-- Location: LCCOMB_X37_Y32_N2
\object_vstart[2]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[2]~30_combout\ = (object_vstart(1) & (object_vstart(2) $ (VCC))) # (!object_vstart(1) & (object_vstart(2) & VCC))
-- \object_vstart[2]~31\ = CARRY((object_vstart(1) & object_vstart(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(1),
	datab => object_vstart(2),
	datad => VCC,
	combout => \object_vstart[2]~30_combout\,
	cout => \object_vstart[2]~31\);

-- Location: FF_X37_Y32_N3
\object_vstart[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[2]~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(2));

-- Location: LCCOMB_X37_Y32_N4
\object_vstart[3]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[3]~32_combout\ = (object_vstart(3) & (!\object_vstart[2]~31\)) # (!object_vstart(3) & ((\object_vstart[2]~31\) # (GND)))
-- \object_vstart[3]~33\ = CARRY((!\object_vstart[2]~31\) # (!object_vstart(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(3),
	datad => VCC,
	cin => \object_vstart[2]~31\,
	combout => \object_vstart[3]~32_combout\,
	cout => \object_vstart[3]~33\);

-- Location: FF_X37_Y32_N5
\object_vstart[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[3]~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(3));

-- Location: LCCOMB_X37_Y32_N6
\object_vstart[4]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[4]~34_combout\ = (object_vstart(4) & (\object_vstart[3]~33\ $ (GND))) # (!object_vstart(4) & (!\object_vstart[3]~33\ & VCC))
-- \object_vstart[4]~35\ = CARRY((object_vstart(4) & !\object_vstart[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(4),
	datad => VCC,
	cin => \object_vstart[3]~33\,
	combout => \object_vstart[4]~34_combout\,
	cout => \object_vstart[4]~35\);

-- Location: FF_X37_Y32_N7
\object_vstart[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[4]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(4));

-- Location: LCCOMB_X37_Y32_N8
\object_vstart[5]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[5]~36_combout\ = (object_vstart(5) & (\object_vstart[4]~35\ & VCC)) # (!object_vstart(5) & (!\object_vstart[4]~35\))
-- \object_vstart[5]~37\ = CARRY((!object_vstart(5) & !\object_vstart[4]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(5),
	datad => VCC,
	cin => \object_vstart[4]~35\,
	combout => \object_vstart[5]~36_combout\,
	cout => \object_vstart[5]~37\);

-- Location: FF_X37_Y32_N9
\object_vstart[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[5]~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(5));

-- Location: LCCOMB_X37_Y32_N10
\object_vstart[6]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[6]~38_combout\ = (object_vstart(6) & ((GND) # (!\object_vstart[5]~37\))) # (!object_vstart(6) & (\object_vstart[5]~37\ $ (GND)))
-- \object_vstart[6]~39\ = CARRY((object_vstart(6)) # (!\object_vstart[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(6),
	datad => VCC,
	cin => \object_vstart[5]~37\,
	combout => \object_vstart[6]~38_combout\,
	cout => \object_vstart[6]~39\);

-- Location: FF_X37_Y32_N11
\object_vstart[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[6]~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(6));

-- Location: LCCOMB_X37_Y32_N12
\object_vstart[7]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[7]~40_combout\ = (object_vstart(7) & (\object_vstart[6]~39\ & VCC)) # (!object_vstart(7) & (!\object_vstart[6]~39\))
-- \object_vstart[7]~41\ = CARRY((!object_vstart(7) & !\object_vstart[6]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(7),
	datad => VCC,
	cin => \object_vstart[6]~39\,
	combout => \object_vstart[7]~40_combout\,
	cout => \object_vstart[7]~41\);

-- Location: FF_X37_Y32_N13
\object_vstart[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[7]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(7));

-- Location: LCCOMB_X37_Y32_N14
\object_vstart[8]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[8]~42_combout\ = (object_vstart(8) & ((GND) # (!\object_vstart[7]~41\))) # (!object_vstart(8) & (\object_vstart[7]~41\ $ (GND)))
-- \object_vstart[8]~43\ = CARRY((object_vstart(8)) # (!\object_vstart[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(8),
	datad => VCC,
	cin => \object_vstart[7]~41\,
	combout => \object_vstart[8]~42_combout\,
	cout => \object_vstart[8]~43\);

-- Location: FF_X37_Y32_N15
\object_vstart[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[8]~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(8));

-- Location: LCCOMB_X37_Y32_N16
\object_vstart[9]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[9]~44_combout\ = (object_vstart(9) & (\object_vstart[8]~43\ & VCC)) # (!object_vstart(9) & (!\object_vstart[8]~43\))
-- \object_vstart[9]~45\ = CARRY((!object_vstart(9) & !\object_vstart[8]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(9),
	datad => VCC,
	cin => \object_vstart[8]~43\,
	combout => \object_vstart[9]~44_combout\,
	cout => \object_vstart[9]~45\);

-- Location: FF_X37_Y32_N17
\object_vstart[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[9]~44_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(9));

-- Location: LCCOMB_X37_Y32_N18
\object_vstart[10]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[10]~46_combout\ = (object_vstart(10) & ((GND) # (!\object_vstart[9]~45\))) # (!object_vstart(10) & (\object_vstart[9]~45\ $ (GND)))
-- \object_vstart[10]~47\ = CARRY((object_vstart(10)) # (!\object_vstart[9]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(10),
	datad => VCC,
	cin => \object_vstart[9]~45\,
	combout => \object_vstart[10]~46_combout\,
	cout => \object_vstart[10]~47\);

-- Location: FF_X37_Y32_N19
\object_vstart[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[10]~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(10));

-- Location: LCCOMB_X37_Y32_N20
\object_vstart[11]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[11]~48_combout\ = (object_vstart(11) & (\object_vstart[10]~47\ & VCC)) # (!object_vstart(11) & (!\object_vstart[10]~47\))
-- \object_vstart[11]~49\ = CARRY((!object_vstart(11) & !\object_vstart[10]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(11),
	datad => VCC,
	cin => \object_vstart[10]~47\,
	combout => \object_vstart[11]~48_combout\,
	cout => \object_vstart[11]~49\);

-- Location: FF_X37_Y32_N21
\object_vstart[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[11]~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(11));

-- Location: LCCOMB_X37_Y32_N22
\object_vstart[12]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[12]~50_combout\ = (object_vstart(12) & ((GND) # (!\object_vstart[11]~49\))) # (!object_vstart(12) & (\object_vstart[11]~49\ $ (GND)))
-- \object_vstart[12]~51\ = CARRY((object_vstart(12)) # (!\object_vstart[11]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(12),
	datad => VCC,
	cin => \object_vstart[11]~49\,
	combout => \object_vstart[12]~50_combout\,
	cout => \object_vstart[12]~51\);

-- Location: FF_X37_Y32_N23
\object_vstart[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[12]~50_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(12));

-- Location: LCCOMB_X37_Y32_N24
\object_vstart[13]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[13]~52_combout\ = (object_vstart(13) & (\object_vstart[12]~51\ & VCC)) # (!object_vstart(13) & (!\object_vstart[12]~51\))
-- \object_vstart[13]~53\ = CARRY((!object_vstart(13) & !\object_vstart[12]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(13),
	datad => VCC,
	cin => \object_vstart[12]~51\,
	combout => \object_vstart[13]~52_combout\,
	cout => \object_vstart[13]~53\);

-- Location: FF_X37_Y32_N25
\object_vstart[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[13]~52_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(13));

-- Location: LCCOMB_X37_Y32_N26
\object_vstart[14]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[14]~54_combout\ = (object_vstart(14) & ((GND) # (!\object_vstart[13]~53\))) # (!object_vstart(14) & (\object_vstart[13]~53\ $ (GND)))
-- \object_vstart[14]~55\ = CARRY((object_vstart(14)) # (!\object_vstart[13]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(14),
	datad => VCC,
	cin => \object_vstart[13]~53\,
	combout => \object_vstart[14]~54_combout\,
	cout => \object_vstart[14]~55\);

-- Location: FF_X37_Y32_N27
\object_vstart[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[14]~54_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(14));

-- Location: LCCOMB_X37_Y32_N28
\object_vstart[15]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[15]~56_combout\ = (object_vstart(15) & (\object_vstart[14]~55\ & VCC)) # (!object_vstart(15) & (!\object_vstart[14]~55\))
-- \object_vstart[15]~57\ = CARRY((!object_vstart(15) & !\object_vstart[14]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(15),
	datad => VCC,
	cin => \object_vstart[14]~55\,
	combout => \object_vstart[15]~56_combout\,
	cout => \object_vstart[15]~57\);

-- Location: FF_X37_Y32_N29
\object_vstart[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[15]~56_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(15));

-- Location: LCCOMB_X37_Y32_N30
\object_vstart[16]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[16]~58_combout\ = (object_vstart(16) & ((GND) # (!\object_vstart[15]~57\))) # (!object_vstart(16) & (\object_vstart[15]~57\ $ (GND)))
-- \object_vstart[16]~59\ = CARRY((object_vstart(16)) # (!\object_vstart[15]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(16),
	datad => VCC,
	cin => \object_vstart[15]~57\,
	combout => \object_vstart[16]~58_combout\,
	cout => \object_vstart[16]~59\);

-- Location: FF_X37_Y32_N31
\object_vstart[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[16]~58_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(16));

-- Location: LCCOMB_X37_Y31_N0
\object_vstart[17]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[17]~60_combout\ = (object_vstart(17) & (\object_vstart[16]~59\ & VCC)) # (!object_vstart(17) & (!\object_vstart[16]~59\))
-- \object_vstart[17]~61\ = CARRY((!object_vstart(17) & !\object_vstart[16]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(17),
	datad => VCC,
	cin => \object_vstart[16]~59\,
	combout => \object_vstart[17]~60_combout\,
	cout => \object_vstart[17]~61\);

-- Location: FF_X37_Y31_N1
\object_vstart[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[17]~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(17));

-- Location: LCCOMB_X37_Y31_N2
\object_vstart[18]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[18]~62_combout\ = (object_vstart(18) & ((GND) # (!\object_vstart[17]~61\))) # (!object_vstart(18) & (\object_vstart[17]~61\ $ (GND)))
-- \object_vstart[18]~63\ = CARRY((object_vstart(18)) # (!\object_vstart[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(18),
	datad => VCC,
	cin => \object_vstart[17]~61\,
	combout => \object_vstart[18]~62_combout\,
	cout => \object_vstart[18]~63\);

-- Location: FF_X37_Y31_N3
\object_vstart[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[18]~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(18));

-- Location: LCCOMB_X37_Y31_N4
\object_vstart[19]~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[19]~64_combout\ = (object_vstart(19) & (\object_vstart[18]~63\ & VCC)) # (!object_vstart(19) & (!\object_vstart[18]~63\))
-- \object_vstart[19]~65\ = CARRY((!object_vstart(19) & !\object_vstart[18]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(19),
	datad => VCC,
	cin => \object_vstart[18]~63\,
	combout => \object_vstart[19]~64_combout\,
	cout => \object_vstart[19]~65\);

-- Location: FF_X37_Y31_N5
\object_vstart[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[19]~64_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(19));

-- Location: LCCOMB_X37_Y31_N6
\object_vstart[20]~66\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[20]~66_combout\ = (object_vstart(20) & ((GND) # (!\object_vstart[19]~65\))) # (!object_vstart(20) & (\object_vstart[19]~65\ $ (GND)))
-- \object_vstart[20]~67\ = CARRY((object_vstart(20)) # (!\object_vstart[19]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(20),
	datad => VCC,
	cin => \object_vstart[19]~65\,
	combout => \object_vstart[20]~66_combout\,
	cout => \object_vstart[20]~67\);

-- Location: FF_X37_Y31_N7
\object_vstart[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[20]~66_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(20));

-- Location: LCCOMB_X37_Y31_N8
\object_vstart[21]~68\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[21]~68_combout\ = (object_vstart(21) & (\object_vstart[20]~67\ & VCC)) # (!object_vstart(21) & (!\object_vstart[20]~67\))
-- \object_vstart[21]~69\ = CARRY((!object_vstart(21) & !\object_vstart[20]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(21),
	datad => VCC,
	cin => \object_vstart[20]~67\,
	combout => \object_vstart[21]~68_combout\,
	cout => \object_vstart[21]~69\);

-- Location: FF_X37_Y31_N9
\object_vstart[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[21]~68_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(21));

-- Location: LCCOMB_X37_Y31_N10
\object_vstart[22]~70\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[22]~70_combout\ = (object_vstart(22) & ((GND) # (!\object_vstart[21]~69\))) # (!object_vstart(22) & (\object_vstart[21]~69\ $ (GND)))
-- \object_vstart[22]~71\ = CARRY((object_vstart(22)) # (!\object_vstart[21]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(22),
	datad => VCC,
	cin => \object_vstart[21]~69\,
	combout => \object_vstart[22]~70_combout\,
	cout => \object_vstart[22]~71\);

-- Location: FF_X37_Y31_N11
\object_vstart[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[22]~70_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(22));

-- Location: LCCOMB_X37_Y31_N12
\object_vstart[23]~72\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[23]~72_combout\ = (object_vstart(23) & (\object_vstart[22]~71\ & VCC)) # (!object_vstart(23) & (!\object_vstart[22]~71\))
-- \object_vstart[23]~73\ = CARRY((!object_vstart(23) & !\object_vstart[22]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(23),
	datad => VCC,
	cin => \object_vstart[22]~71\,
	combout => \object_vstart[23]~72_combout\,
	cout => \object_vstart[23]~73\);

-- Location: FF_X37_Y31_N13
\object_vstart[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[23]~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(23));

-- Location: LCCOMB_X37_Y31_N14
\object_vstart[24]~74\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[24]~74_combout\ = (object_vstart(24) & ((GND) # (!\object_vstart[23]~73\))) # (!object_vstart(24) & (\object_vstart[23]~73\ $ (GND)))
-- \object_vstart[24]~75\ = CARRY((object_vstart(24)) # (!\object_vstart[23]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(24),
	datad => VCC,
	cin => \object_vstart[23]~73\,
	combout => \object_vstart[24]~74_combout\,
	cout => \object_vstart[24]~75\);

-- Location: FF_X37_Y31_N15
\object_vstart[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[24]~74_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(24));

-- Location: LCCOMB_X37_Y31_N16
\object_vstart[25]~76\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[25]~76_combout\ = (object_vstart(25) & (\object_vstart[24]~75\ & VCC)) # (!object_vstart(25) & (!\object_vstart[24]~75\))
-- \object_vstart[25]~77\ = CARRY((!object_vstart(25) & !\object_vstart[24]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(25),
	datad => VCC,
	cin => \object_vstart[24]~75\,
	combout => \object_vstart[25]~76_combout\,
	cout => \object_vstart[25]~77\);

-- Location: FF_X37_Y31_N17
\object_vstart[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[25]~76_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(25));

-- Location: LCCOMB_X37_Y31_N18
\object_vstart[26]~78\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[26]~78_combout\ = (object_vstart(26) & ((GND) # (!\object_vstart[25]~77\))) # (!object_vstart(26) & (\object_vstart[25]~77\ $ (GND)))
-- \object_vstart[26]~79\ = CARRY((object_vstart(26)) # (!\object_vstart[25]~77\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(26),
	datad => VCC,
	cin => \object_vstart[25]~77\,
	combout => \object_vstart[26]~78_combout\,
	cout => \object_vstart[26]~79\);

-- Location: FF_X37_Y31_N19
\object_vstart[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[26]~78_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(26));

-- Location: LCCOMB_X37_Y31_N20
\object_vstart[27]~80\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[27]~80_combout\ = (object_vstart(27) & (\object_vstart[26]~79\ & VCC)) # (!object_vstart(27) & (!\object_vstart[26]~79\))
-- \object_vstart[27]~81\ = CARRY((!object_vstart(27) & !\object_vstart[26]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(27),
	datad => VCC,
	cin => \object_vstart[26]~79\,
	combout => \object_vstart[27]~80_combout\,
	cout => \object_vstart[27]~81\);

-- Location: FF_X37_Y31_N21
\object_vstart[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[27]~80_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(27));

-- Location: LCCOMB_X37_Y31_N22
\object_vstart[28]~82\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[28]~82_combout\ = (object_vstart(28) & ((GND) # (!\object_vstart[27]~81\))) # (!object_vstart(28) & (\object_vstart[27]~81\ $ (GND)))
-- \object_vstart[28]~83\ = CARRY((object_vstart(28)) # (!\object_vstart[27]~81\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(28),
	datad => VCC,
	cin => \object_vstart[27]~81\,
	combout => \object_vstart[28]~82_combout\,
	cout => \object_vstart[28]~83\);

-- Location: FF_X37_Y31_N23
\object_vstart[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[28]~82_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(28));

-- Location: LCCOMB_X37_Y31_N24
\object_vstart[29]~84\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[29]~84_combout\ = (object_vstart(29) & (\object_vstart[28]~83\ & VCC)) # (!object_vstart(29) & (!\object_vstart[28]~83\))
-- \object_vstart[29]~85\ = CARRY((!object_vstart(29) & !\object_vstart[28]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(29),
	datad => VCC,
	cin => \object_vstart[28]~83\,
	combout => \object_vstart[29]~84_combout\,
	cout => \object_vstart[29]~85\);

-- Location: FF_X37_Y31_N25
\object_vstart[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[29]~84_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(29));

-- Location: LCCOMB_X37_Y31_N26
\object_vstart[30]~86\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[30]~86_combout\ = (object_vstart(30) & ((GND) # (!\object_vstart[29]~85\))) # (!object_vstart(30) & (\object_vstart[29]~85\ $ (GND)))
-- \object_vstart[30]~87\ = CARRY((object_vstart(30)) # (!\object_vstart[29]~85\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(30),
	datad => VCC,
	cin => \object_vstart[29]~85\,
	combout => \object_vstart[30]~86_combout\,
	cout => \object_vstart[30]~87\);

-- Location: FF_X37_Y31_N27
\object_vstart[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[30]~86_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(30));

-- Location: LCCOMB_X37_Y31_N28
\object_vstart[31]~88\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \object_vstart[31]~88_combout\ = \object_vstart[30]~87\ $ (!object_vstart(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => object_vstart(31),
	cin => \object_vstart[30]~87\,
	combout => \object_vstart[31]~88_combout\);

-- Location: FF_X37_Y31_N29
\object_vstart[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \moveUp~input_o\,
	d => \object_vstart[31]~88_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => object_vstart(31));

-- Location: LCCOMB_X36_Y32_N2
\LessThan28~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~1_cout\ = CARRY((!vposition(1) & object_vstart(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(1),
	datab => object_vstart(1),
	datad => VCC,
	cout => \LessThan28~1_cout\);

-- Location: LCCOMB_X36_Y32_N4
\LessThan28~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~3_cout\ = CARRY((object_vstart(2) & (vposition(2) & !\LessThan28~1_cout\)) # (!object_vstart(2) & ((vposition(2)) # (!\LessThan28~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(2),
	datab => vposition(2),
	datad => VCC,
	cin => \LessThan28~1_cout\,
	cout => \LessThan28~3_cout\);

-- Location: LCCOMB_X36_Y32_N6
\LessThan28~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~5_cout\ = CARRY((object_vstart(3) & ((!\LessThan28~3_cout\) # (!vposition(3)))) # (!object_vstart(3) & (!vposition(3) & !\LessThan28~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(3),
	datab => vposition(3),
	datad => VCC,
	cin => \LessThan28~3_cout\,
	cout => \LessThan28~5_cout\);

-- Location: LCCOMB_X36_Y32_N8
\LessThan28~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~7_cout\ = CARRY((object_vstart(4) & (vposition(4) & !\LessThan28~5_cout\)) # (!object_vstart(4) & ((vposition(4)) # (!\LessThan28~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(4),
	datab => vposition(4),
	datad => VCC,
	cin => \LessThan28~5_cout\,
	cout => \LessThan28~7_cout\);

-- Location: LCCOMB_X36_Y32_N10
\LessThan28~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~9_cout\ = CARRY((vposition(5) & (object_vstart(5) & !\LessThan28~7_cout\)) # (!vposition(5) & ((object_vstart(5)) # (!\LessThan28~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datab => object_vstart(5),
	datad => VCC,
	cin => \LessThan28~7_cout\,
	cout => \LessThan28~9_cout\);

-- Location: LCCOMB_X36_Y32_N12
\LessThan28~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~11_cout\ = CARRY((vposition(6) & ((!\LessThan28~9_cout\) # (!object_vstart(6)))) # (!vposition(6) & (!object_vstart(6) & !\LessThan28~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datab => object_vstart(6),
	datad => VCC,
	cin => \LessThan28~9_cout\,
	cout => \LessThan28~11_cout\);

-- Location: LCCOMB_X36_Y32_N14
\LessThan28~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~13_cout\ = CARRY((vposition(7) & (object_vstart(7) & !\LessThan28~11_cout\)) # (!vposition(7) & ((object_vstart(7)) # (!\LessThan28~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => object_vstart(7),
	datad => VCC,
	cin => \LessThan28~11_cout\,
	cout => \LessThan28~13_cout\);

-- Location: LCCOMB_X36_Y32_N16
\LessThan28~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~15_cout\ = CARRY((vposition(8) & ((!\LessThan28~13_cout\) # (!object_vstart(8)))) # (!vposition(8) & (!object_vstart(8) & !\LessThan28~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(8),
	datab => object_vstart(8),
	datad => VCC,
	cin => \LessThan28~13_cout\,
	cout => \LessThan28~15_cout\);

-- Location: LCCOMB_X36_Y32_N18
\LessThan28~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~17_cout\ = CARRY((vposition(9) & (object_vstart(9) & !\LessThan28~15_cout\)) # (!vposition(9) & ((object_vstart(9)) # (!\LessThan28~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(9),
	datab => object_vstart(9),
	datad => VCC,
	cin => \LessThan28~15_cout\,
	cout => \LessThan28~17_cout\);

-- Location: LCCOMB_X36_Y32_N20
\LessThan28~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~19_cout\ = CARRY((vposition(10) & ((!\LessThan28~17_cout\) # (!object_vstart(10)))) # (!vposition(10) & (!object_vstart(10) & !\LessThan28~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(10),
	datab => object_vstart(10),
	datad => VCC,
	cin => \LessThan28~17_cout\,
	cout => \LessThan28~19_cout\);

-- Location: LCCOMB_X36_Y32_N22
\LessThan28~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~21_cout\ = CARRY((vposition(11) & (object_vstart(11) & !\LessThan28~19_cout\)) # (!vposition(11) & ((object_vstart(11)) # (!\LessThan28~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(11),
	datab => object_vstart(11),
	datad => VCC,
	cin => \LessThan28~19_cout\,
	cout => \LessThan28~21_cout\);

-- Location: LCCOMB_X36_Y32_N24
\LessThan28~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~23_cout\ = CARRY((vposition(12) & ((!\LessThan28~21_cout\) # (!object_vstart(12)))) # (!vposition(12) & (!object_vstart(12) & !\LessThan28~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(12),
	datab => object_vstart(12),
	datad => VCC,
	cin => \LessThan28~21_cout\,
	cout => \LessThan28~23_cout\);

-- Location: LCCOMB_X36_Y32_N26
\LessThan28~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~25_cout\ = CARRY((object_vstart(13) & ((!\LessThan28~23_cout\) # (!vposition(13)))) # (!object_vstart(13) & (!vposition(13) & !\LessThan28~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(13),
	datab => vposition(13),
	datad => VCC,
	cin => \LessThan28~23_cout\,
	cout => \LessThan28~25_cout\);

-- Location: LCCOMB_X36_Y32_N28
\LessThan28~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~27_cout\ = CARRY((vposition(14) & ((!\LessThan28~25_cout\) # (!object_vstart(14)))) # (!vposition(14) & (!object_vstart(14) & !\LessThan28~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(14),
	datab => object_vstart(14),
	datad => VCC,
	cin => \LessThan28~25_cout\,
	cout => \LessThan28~27_cout\);

-- Location: LCCOMB_X36_Y32_N30
\LessThan28~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~29_cout\ = CARRY((vposition(15) & (object_vstart(15) & !\LessThan28~27_cout\)) # (!vposition(15) & ((object_vstart(15)) # (!\LessThan28~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(15),
	datab => object_vstart(15),
	datad => VCC,
	cin => \LessThan28~27_cout\,
	cout => \LessThan28~29_cout\);

-- Location: LCCOMB_X36_Y31_N0
\LessThan28~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~31_cout\ = CARRY((vposition(16) & ((!\LessThan28~29_cout\) # (!object_vstart(16)))) # (!vposition(16) & (!object_vstart(16) & !\LessThan28~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(16),
	datab => object_vstart(16),
	datad => VCC,
	cin => \LessThan28~29_cout\,
	cout => \LessThan28~31_cout\);

-- Location: LCCOMB_X36_Y31_N2
\LessThan28~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~33_cout\ = CARRY((vposition(17) & (object_vstart(17) & !\LessThan28~31_cout\)) # (!vposition(17) & ((object_vstart(17)) # (!\LessThan28~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(17),
	datab => object_vstart(17),
	datad => VCC,
	cin => \LessThan28~31_cout\,
	cout => \LessThan28~33_cout\);

-- Location: LCCOMB_X36_Y31_N4
\LessThan28~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~35_cout\ = CARRY((vposition(18) & ((!\LessThan28~33_cout\) # (!object_vstart(18)))) # (!vposition(18) & (!object_vstart(18) & !\LessThan28~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(18),
	datab => object_vstart(18),
	datad => VCC,
	cin => \LessThan28~33_cout\,
	cout => \LessThan28~35_cout\);

-- Location: LCCOMB_X36_Y31_N6
\LessThan28~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~37_cout\ = CARRY((object_vstart(19) & ((!\LessThan28~35_cout\) # (!vposition(19)))) # (!object_vstart(19) & (!vposition(19) & !\LessThan28~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(19),
	datab => vposition(19),
	datad => VCC,
	cin => \LessThan28~35_cout\,
	cout => \LessThan28~37_cout\);

-- Location: LCCOMB_X36_Y31_N8
\LessThan28~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~39_cout\ = CARRY((object_vstart(20) & (vposition(20) & !\LessThan28~37_cout\)) # (!object_vstart(20) & ((vposition(20)) # (!\LessThan28~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(20),
	datab => vposition(20),
	datad => VCC,
	cin => \LessThan28~37_cout\,
	cout => \LessThan28~39_cout\);

-- Location: LCCOMB_X36_Y31_N10
\LessThan28~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~41_cout\ = CARRY((vposition(21) & (object_vstart(21) & !\LessThan28~39_cout\)) # (!vposition(21) & ((object_vstart(21)) # (!\LessThan28~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(21),
	datab => object_vstart(21),
	datad => VCC,
	cin => \LessThan28~39_cout\,
	cout => \LessThan28~41_cout\);

-- Location: LCCOMB_X36_Y31_N12
\LessThan28~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~43_cout\ = CARRY((vposition(22) & ((!\LessThan28~41_cout\) # (!object_vstart(22)))) # (!vposition(22) & (!object_vstart(22) & !\LessThan28~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(22),
	datab => object_vstart(22),
	datad => VCC,
	cin => \LessThan28~41_cout\,
	cout => \LessThan28~43_cout\);

-- Location: LCCOMB_X36_Y31_N14
\LessThan28~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~45_cout\ = CARRY((vposition(23) & (object_vstart(23) & !\LessThan28~43_cout\)) # (!vposition(23) & ((object_vstart(23)) # (!\LessThan28~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(23),
	datab => object_vstart(23),
	datad => VCC,
	cin => \LessThan28~43_cout\,
	cout => \LessThan28~45_cout\);

-- Location: LCCOMB_X36_Y31_N16
\LessThan28~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~47_cout\ = CARRY((vposition(24) & ((!\LessThan28~45_cout\) # (!object_vstart(24)))) # (!vposition(24) & (!object_vstart(24) & !\LessThan28~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(24),
	datab => object_vstart(24),
	datad => VCC,
	cin => \LessThan28~45_cout\,
	cout => \LessThan28~47_cout\);

-- Location: LCCOMB_X36_Y31_N18
\LessThan28~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~49_cout\ = CARRY((vposition(25) & (object_vstart(25) & !\LessThan28~47_cout\)) # (!vposition(25) & ((object_vstart(25)) # (!\LessThan28~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(25),
	datab => object_vstart(25),
	datad => VCC,
	cin => \LessThan28~47_cout\,
	cout => \LessThan28~49_cout\);

-- Location: LCCOMB_X36_Y31_N20
\LessThan28~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~51_cout\ = CARRY((vposition(26) & ((!\LessThan28~49_cout\) # (!object_vstart(26)))) # (!vposition(26) & (!object_vstart(26) & !\LessThan28~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(26),
	datab => object_vstart(26),
	datad => VCC,
	cin => \LessThan28~49_cout\,
	cout => \LessThan28~51_cout\);

-- Location: LCCOMB_X36_Y31_N22
\LessThan28~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~53_cout\ = CARRY((object_vstart(27) & ((!\LessThan28~51_cout\) # (!vposition(27)))) # (!object_vstart(27) & (!vposition(27) & !\LessThan28~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(27),
	datab => vposition(27),
	datad => VCC,
	cin => \LessThan28~51_cout\,
	cout => \LessThan28~53_cout\);

-- Location: LCCOMB_X36_Y31_N24
\LessThan28~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~55_cout\ = CARRY((vposition(28) & ((!\LessThan28~53_cout\) # (!object_vstart(28)))) # (!vposition(28) & (!object_vstart(28) & !\LessThan28~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(28),
	datab => object_vstart(28),
	datad => VCC,
	cin => \LessThan28~53_cout\,
	cout => \LessThan28~55_cout\);

-- Location: LCCOMB_X36_Y31_N26
\LessThan28~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~57_cout\ = CARRY((vposition(29) & (object_vstart(29) & !\LessThan28~55_cout\)) # (!vposition(29) & ((object_vstart(29)) # (!\LessThan28~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(29),
	datab => object_vstart(29),
	datad => VCC,
	cin => \LessThan28~55_cout\,
	cout => \LessThan28~57_cout\);

-- Location: LCCOMB_X36_Y31_N28
\LessThan28~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~59_cout\ = CARRY((vposition(30) & ((!\LessThan28~57_cout\) # (!object_vstart(30)))) # (!vposition(30) & (!object_vstart(30) & !\LessThan28~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(30),
	datab => object_vstart(30),
	datad => VCC,
	cin => \LessThan28~57_cout\,
	cout => \LessThan28~59_cout\);

-- Location: LCCOMB_X36_Y31_N30
\LessThan28~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~60_combout\ = (vposition(31) & ((!object_vstart(31)) # (!\LessThan28~59_cout\))) # (!vposition(31) & (!\LessThan28~59_cout\ & !object_vstart(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => vposition(31),
	datad => object_vstart(31),
	cin => \LessThan28~59_cout\,
	combout => \LessThan28~60_combout\);

-- Location: LCCOMB_X41_Y26_N22
\process_0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~36_combout\ = (!hposition(10) & (!hposition(31) & (!hposition(9) & \LessThan5~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => hposition(31),
	datac => hposition(9),
	datad => \LessThan5~6_combout\,
	combout => \process_0~36_combout\);

-- Location: LCCOMB_X38_Y32_N2
\Add9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~0_combout\ = (object_vstart(2) & (object_vstart(1) $ (VCC))) # (!object_vstart(2) & (object_vstart(1) & VCC))
-- \Add9~1\ = CARRY((object_vstart(2) & object_vstart(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(2),
	datab => object_vstart(1),
	datad => VCC,
	combout => \Add9~0_combout\,
	cout => \Add9~1\);

-- Location: LCCOMB_X38_Y32_N4
\Add9~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~2_combout\ = (object_vstart(3) & (\Add9~1\ & VCC)) # (!object_vstart(3) & (!\Add9~1\))
-- \Add9~3\ = CARRY((!object_vstart(3) & !\Add9~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(3),
	datad => VCC,
	cin => \Add9~1\,
	combout => \Add9~2_combout\,
	cout => \Add9~3\);

-- Location: LCCOMB_X38_Y32_N6
\Add9~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~4_combout\ = (object_vstart(4) & (\Add9~3\ $ (GND))) # (!object_vstart(4) & (!\Add9~3\ & VCC))
-- \Add9~5\ = CARRY((object_vstart(4) & !\Add9~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(4),
	datad => VCC,
	cin => \Add9~3\,
	combout => \Add9~4_combout\,
	cout => \Add9~5\);

-- Location: LCCOMB_X38_Y32_N8
\Add9~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~6_combout\ = (object_vstart(5) & (!\Add9~5\)) # (!object_vstart(5) & ((\Add9~5\) # (GND)))
-- \Add9~7\ = CARRY((!\Add9~5\) # (!object_vstart(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(5),
	datad => VCC,
	cin => \Add9~5\,
	combout => \Add9~6_combout\,
	cout => \Add9~7\);

-- Location: LCCOMB_X38_Y32_N10
\Add9~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~8_combout\ = (object_vstart(6) & ((GND) # (!\Add9~7\))) # (!object_vstart(6) & (\Add9~7\ $ (GND)))
-- \Add9~9\ = CARRY((object_vstart(6)) # (!\Add9~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(6),
	datad => VCC,
	cin => \Add9~7\,
	combout => \Add9~8_combout\,
	cout => \Add9~9\);

-- Location: LCCOMB_X38_Y32_N12
\Add9~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~10_combout\ = (object_vstart(7) & (!\Add9~9\)) # (!object_vstart(7) & ((\Add9~9\) # (GND)))
-- \Add9~11\ = CARRY((!\Add9~9\) # (!object_vstart(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(7),
	datad => VCC,
	cin => \Add9~9\,
	combout => \Add9~10_combout\,
	cout => \Add9~11\);

-- Location: LCCOMB_X38_Y32_N14
\Add9~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~12_combout\ = (object_vstart(8) & (\Add9~11\ $ (GND))) # (!object_vstart(8) & (!\Add9~11\ & VCC))
-- \Add9~13\ = CARRY((object_vstart(8) & !\Add9~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(8),
	datad => VCC,
	cin => \Add9~11\,
	combout => \Add9~12_combout\,
	cout => \Add9~13\);

-- Location: LCCOMB_X38_Y32_N16
\Add9~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~14_combout\ = (object_vstart(9) & (!\Add9~13\)) # (!object_vstart(9) & ((\Add9~13\) # (GND)))
-- \Add9~15\ = CARRY((!\Add9~13\) # (!object_vstart(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(9),
	datad => VCC,
	cin => \Add9~13\,
	combout => \Add9~14_combout\,
	cout => \Add9~15\);

-- Location: LCCOMB_X38_Y32_N18
\Add9~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~16_combout\ = (object_vstart(10) & (\Add9~15\ $ (GND))) # (!object_vstart(10) & (!\Add9~15\ & VCC))
-- \Add9~17\ = CARRY((object_vstart(10) & !\Add9~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(10),
	datad => VCC,
	cin => \Add9~15\,
	combout => \Add9~16_combout\,
	cout => \Add9~17\);

-- Location: LCCOMB_X38_Y32_N20
\Add9~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~18_combout\ = (object_vstart(11) & (!\Add9~17\)) # (!object_vstart(11) & ((\Add9~17\) # (GND)))
-- \Add9~19\ = CARRY((!\Add9~17\) # (!object_vstart(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(11),
	datad => VCC,
	cin => \Add9~17\,
	combout => \Add9~18_combout\,
	cout => \Add9~19\);

-- Location: LCCOMB_X38_Y32_N22
\Add9~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~20_combout\ = (object_vstart(12) & (\Add9~19\ $ (GND))) # (!object_vstart(12) & (!\Add9~19\ & VCC))
-- \Add9~21\ = CARRY((object_vstart(12) & !\Add9~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(12),
	datad => VCC,
	cin => \Add9~19\,
	combout => \Add9~20_combout\,
	cout => \Add9~21\);

-- Location: LCCOMB_X38_Y32_N24
\Add9~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~22_combout\ = (object_vstart(13) & (!\Add9~21\)) # (!object_vstart(13) & ((\Add9~21\) # (GND)))
-- \Add9~23\ = CARRY((!\Add9~21\) # (!object_vstart(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(13),
	datad => VCC,
	cin => \Add9~21\,
	combout => \Add9~22_combout\,
	cout => \Add9~23\);

-- Location: LCCOMB_X38_Y32_N26
\Add9~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~24_combout\ = (object_vstart(14) & (\Add9~23\ $ (GND))) # (!object_vstart(14) & (!\Add9~23\ & VCC))
-- \Add9~25\ = CARRY((object_vstart(14) & !\Add9~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(14),
	datad => VCC,
	cin => \Add9~23\,
	combout => \Add9~24_combout\,
	cout => \Add9~25\);

-- Location: LCCOMB_X38_Y32_N28
\Add9~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~26_combout\ = (object_vstart(15) & (!\Add9~25\)) # (!object_vstart(15) & ((\Add9~25\) # (GND)))
-- \Add9~27\ = CARRY((!\Add9~25\) # (!object_vstart(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(15),
	datad => VCC,
	cin => \Add9~25\,
	combout => \Add9~26_combout\,
	cout => \Add9~27\);

-- Location: LCCOMB_X38_Y32_N30
\Add9~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~28_combout\ = (object_vstart(16) & (\Add9~27\ $ (GND))) # (!object_vstart(16) & (!\Add9~27\ & VCC))
-- \Add9~29\ = CARRY((object_vstart(16) & !\Add9~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(16),
	datad => VCC,
	cin => \Add9~27\,
	combout => \Add9~28_combout\,
	cout => \Add9~29\);

-- Location: LCCOMB_X38_Y31_N0
\Add9~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~30_combout\ = (object_vstart(17) & (!\Add9~29\)) # (!object_vstart(17) & ((\Add9~29\) # (GND)))
-- \Add9~31\ = CARRY((!\Add9~29\) # (!object_vstart(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(17),
	datad => VCC,
	cin => \Add9~29\,
	combout => \Add9~30_combout\,
	cout => \Add9~31\);

-- Location: LCCOMB_X38_Y31_N2
\Add9~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~32_combout\ = (object_vstart(18) & (\Add9~31\ $ (GND))) # (!object_vstart(18) & (!\Add9~31\ & VCC))
-- \Add9~33\ = CARRY((object_vstart(18) & !\Add9~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(18),
	datad => VCC,
	cin => \Add9~31\,
	combout => \Add9~32_combout\,
	cout => \Add9~33\);

-- Location: LCCOMB_X38_Y31_N4
\Add9~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~34_combout\ = (object_vstart(19) & (!\Add9~33\)) # (!object_vstart(19) & ((\Add9~33\) # (GND)))
-- \Add9~35\ = CARRY((!\Add9~33\) # (!object_vstart(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(19),
	datad => VCC,
	cin => \Add9~33\,
	combout => \Add9~34_combout\,
	cout => \Add9~35\);

-- Location: LCCOMB_X38_Y31_N6
\Add9~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~36_combout\ = (object_vstart(20) & (\Add9~35\ $ (GND))) # (!object_vstart(20) & (!\Add9~35\ & VCC))
-- \Add9~37\ = CARRY((object_vstart(20) & !\Add9~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(20),
	datad => VCC,
	cin => \Add9~35\,
	combout => \Add9~36_combout\,
	cout => \Add9~37\);

-- Location: LCCOMB_X38_Y31_N8
\Add9~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~38_combout\ = (object_vstart(21) & (!\Add9~37\)) # (!object_vstart(21) & ((\Add9~37\) # (GND)))
-- \Add9~39\ = CARRY((!\Add9~37\) # (!object_vstart(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(21),
	datad => VCC,
	cin => \Add9~37\,
	combout => \Add9~38_combout\,
	cout => \Add9~39\);

-- Location: LCCOMB_X38_Y31_N10
\Add9~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~40_combout\ = (object_vstart(22) & (\Add9~39\ $ (GND))) # (!object_vstart(22) & (!\Add9~39\ & VCC))
-- \Add9~41\ = CARRY((object_vstart(22) & !\Add9~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(22),
	datad => VCC,
	cin => \Add9~39\,
	combout => \Add9~40_combout\,
	cout => \Add9~41\);

-- Location: LCCOMB_X38_Y31_N12
\Add9~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~42_combout\ = (object_vstart(23) & (!\Add9~41\)) # (!object_vstart(23) & ((\Add9~41\) # (GND)))
-- \Add9~43\ = CARRY((!\Add9~41\) # (!object_vstart(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(23),
	datad => VCC,
	cin => \Add9~41\,
	combout => \Add9~42_combout\,
	cout => \Add9~43\);

-- Location: LCCOMB_X38_Y31_N14
\Add9~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~44_combout\ = (object_vstart(24) & (\Add9~43\ $ (GND))) # (!object_vstart(24) & (!\Add9~43\ & VCC))
-- \Add9~45\ = CARRY((object_vstart(24) & !\Add9~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(24),
	datad => VCC,
	cin => \Add9~43\,
	combout => \Add9~44_combout\,
	cout => \Add9~45\);

-- Location: LCCOMB_X38_Y31_N16
\Add9~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~46_combout\ = (object_vstart(25) & (!\Add9~45\)) # (!object_vstart(25) & ((\Add9~45\) # (GND)))
-- \Add9~47\ = CARRY((!\Add9~45\) # (!object_vstart(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(25),
	datad => VCC,
	cin => \Add9~45\,
	combout => \Add9~46_combout\,
	cout => \Add9~47\);

-- Location: LCCOMB_X38_Y31_N18
\Add9~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~48_combout\ = (object_vstart(26) & (\Add9~47\ $ (GND))) # (!object_vstart(26) & (!\Add9~47\ & VCC))
-- \Add9~49\ = CARRY((object_vstart(26) & !\Add9~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(26),
	datad => VCC,
	cin => \Add9~47\,
	combout => \Add9~48_combout\,
	cout => \Add9~49\);

-- Location: LCCOMB_X38_Y31_N20
\Add9~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~50_combout\ = (object_vstart(27) & (!\Add9~49\)) # (!object_vstart(27) & ((\Add9~49\) # (GND)))
-- \Add9~51\ = CARRY((!\Add9~49\) # (!object_vstart(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(27),
	datad => VCC,
	cin => \Add9~49\,
	combout => \Add9~50_combout\,
	cout => \Add9~51\);

-- Location: LCCOMB_X38_Y31_N22
\Add9~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~52_combout\ = (object_vstart(28) & (\Add9~51\ $ (GND))) # (!object_vstart(28) & (!\Add9~51\ & VCC))
-- \Add9~53\ = CARRY((object_vstart(28) & !\Add9~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(28),
	datad => VCC,
	cin => \Add9~51\,
	combout => \Add9~52_combout\,
	cout => \Add9~53\);

-- Location: LCCOMB_X38_Y31_N24
\Add9~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~54_combout\ = (object_vstart(29) & (!\Add9~53\)) # (!object_vstart(29) & ((\Add9~53\) # (GND)))
-- \Add9~55\ = CARRY((!\Add9~53\) # (!object_vstart(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => object_vstart(29),
	datad => VCC,
	cin => \Add9~53\,
	combout => \Add9~54_combout\,
	cout => \Add9~55\);

-- Location: LCCOMB_X38_Y31_N26
\Add9~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~56_combout\ = (object_vstart(30) & (\Add9~55\ $ (GND))) # (!object_vstart(30) & (!\Add9~55\ & VCC))
-- \Add9~57\ = CARRY((object_vstart(30) & !\Add9~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => object_vstart(30),
	datad => VCC,
	cin => \Add9~55\,
	combout => \Add9~56_combout\,
	cout => \Add9~57\);

-- Location: LCCOMB_X38_Y31_N28
\Add9~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add9~58_combout\ = \Add9~57\ $ (object_vstart(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => object_vstart(31),
	cin => \Add9~57\,
	combout => \Add9~58_combout\);

-- Location: LCCOMB_X39_Y32_N2
\LessThan29~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~1_cout\ = CARRY((vposition(1) & object_vstart(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(1),
	datab => object_vstart(1),
	datad => VCC,
	cout => \LessThan29~1_cout\);

-- Location: LCCOMB_X39_Y32_N4
\LessThan29~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~3_cout\ = CARRY((\Add9~0_combout\ & ((!\LessThan29~1_cout\) # (!vposition(2)))) # (!\Add9~0_combout\ & (!vposition(2) & !\LessThan29~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~0_combout\,
	datab => vposition(2),
	datad => VCC,
	cin => \LessThan29~1_cout\,
	cout => \LessThan29~3_cout\);

-- Location: LCCOMB_X39_Y32_N6
\LessThan29~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~5_cout\ = CARRY((vposition(3) & ((!\LessThan29~3_cout\) # (!\Add9~2_combout\))) # (!vposition(3) & (!\Add9~2_combout\ & !\LessThan29~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(3),
	datab => \Add9~2_combout\,
	datad => VCC,
	cin => \LessThan29~3_cout\,
	cout => \LessThan29~5_cout\);

-- Location: LCCOMB_X39_Y32_N8
\LessThan29~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~7_cout\ = CARRY((vposition(4) & (\Add9~4_combout\ & !\LessThan29~5_cout\)) # (!vposition(4) & ((\Add9~4_combout\) # (!\LessThan29~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => \Add9~4_combout\,
	datad => VCC,
	cin => \LessThan29~5_cout\,
	cout => \LessThan29~7_cout\);

-- Location: LCCOMB_X39_Y32_N10
\LessThan29~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~9_cout\ = CARRY((\Add9~6_combout\ & (vposition(5) & !\LessThan29~7_cout\)) # (!\Add9~6_combout\ & ((vposition(5)) # (!\LessThan29~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~6_combout\,
	datab => vposition(5),
	datad => VCC,
	cin => \LessThan29~7_cout\,
	cout => \LessThan29~9_cout\);

-- Location: LCCOMB_X39_Y32_N12
\LessThan29~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~11_cout\ = CARRY((\Add9~8_combout\ & ((!\LessThan29~9_cout\) # (!vposition(6)))) # (!\Add9~8_combout\ & (!vposition(6) & !\LessThan29~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~8_combout\,
	datab => vposition(6),
	datad => VCC,
	cin => \LessThan29~9_cout\,
	cout => \LessThan29~11_cout\);

-- Location: LCCOMB_X39_Y32_N14
\LessThan29~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~13_cout\ = CARRY((\Add9~10_combout\ & (vposition(7) & !\LessThan29~11_cout\)) # (!\Add9~10_combout\ & ((vposition(7)) # (!\LessThan29~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~10_combout\,
	datab => vposition(7),
	datad => VCC,
	cin => \LessThan29~11_cout\,
	cout => \LessThan29~13_cout\);

-- Location: LCCOMB_X39_Y32_N16
\LessThan29~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~15_cout\ = CARRY((\Add9~12_combout\ & ((!\LessThan29~13_cout\) # (!vposition(8)))) # (!\Add9~12_combout\ & (!vposition(8) & !\LessThan29~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~12_combout\,
	datab => vposition(8),
	datad => VCC,
	cin => \LessThan29~13_cout\,
	cout => \LessThan29~15_cout\);

-- Location: LCCOMB_X39_Y32_N18
\LessThan29~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~17_cout\ = CARRY((\Add9~14_combout\ & (vposition(9) & !\LessThan29~15_cout\)) # (!\Add9~14_combout\ & ((vposition(9)) # (!\LessThan29~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~14_combout\,
	datab => vposition(9),
	datad => VCC,
	cin => \LessThan29~15_cout\,
	cout => \LessThan29~17_cout\);

-- Location: LCCOMB_X39_Y32_N20
\LessThan29~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~19_cout\ = CARRY((vposition(10) & (\Add9~16_combout\ & !\LessThan29~17_cout\)) # (!vposition(10) & ((\Add9~16_combout\) # (!\LessThan29~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(10),
	datab => \Add9~16_combout\,
	datad => VCC,
	cin => \LessThan29~17_cout\,
	cout => \LessThan29~19_cout\);

-- Location: LCCOMB_X39_Y32_N22
\LessThan29~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~21_cout\ = CARRY((vposition(11) & ((!\LessThan29~19_cout\) # (!\Add9~18_combout\))) # (!vposition(11) & (!\Add9~18_combout\ & !\LessThan29~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(11),
	datab => \Add9~18_combout\,
	datad => VCC,
	cin => \LessThan29~19_cout\,
	cout => \LessThan29~21_cout\);

-- Location: LCCOMB_X39_Y32_N24
\LessThan29~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~23_cout\ = CARRY((vposition(12) & (\Add9~20_combout\ & !\LessThan29~21_cout\)) # (!vposition(12) & ((\Add9~20_combout\) # (!\LessThan29~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(12),
	datab => \Add9~20_combout\,
	datad => VCC,
	cin => \LessThan29~21_cout\,
	cout => \LessThan29~23_cout\);

-- Location: LCCOMB_X39_Y32_N26
\LessThan29~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~25_cout\ = CARRY((vposition(13) & ((!\LessThan29~23_cout\) # (!\Add9~22_combout\))) # (!vposition(13) & (!\Add9~22_combout\ & !\LessThan29~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(13),
	datab => \Add9~22_combout\,
	datad => VCC,
	cin => \LessThan29~23_cout\,
	cout => \LessThan29~25_cout\);

-- Location: LCCOMB_X39_Y32_N28
\LessThan29~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~27_cout\ = CARRY((\Add9~24_combout\ & ((!\LessThan29~25_cout\) # (!vposition(14)))) # (!\Add9~24_combout\ & (!vposition(14) & !\LessThan29~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~24_combout\,
	datab => vposition(14),
	datad => VCC,
	cin => \LessThan29~25_cout\,
	cout => \LessThan29~27_cout\);

-- Location: LCCOMB_X39_Y32_N30
\LessThan29~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~29_cout\ = CARRY((vposition(15) & ((!\LessThan29~27_cout\) # (!\Add9~26_combout\))) # (!vposition(15) & (!\Add9~26_combout\ & !\LessThan29~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(15),
	datab => \Add9~26_combout\,
	datad => VCC,
	cin => \LessThan29~27_cout\,
	cout => \LessThan29~29_cout\);

-- Location: LCCOMB_X39_Y31_N0
\LessThan29~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~31_cout\ = CARRY((\Add9~28_combout\ & ((!\LessThan29~29_cout\) # (!vposition(16)))) # (!\Add9~28_combout\ & (!vposition(16) & !\LessThan29~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~28_combout\,
	datab => vposition(16),
	datad => VCC,
	cin => \LessThan29~29_cout\,
	cout => \LessThan29~31_cout\);

-- Location: LCCOMB_X39_Y31_N2
\LessThan29~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~33_cout\ = CARRY((\Add9~30_combout\ & (vposition(17) & !\LessThan29~31_cout\)) # (!\Add9~30_combout\ & ((vposition(17)) # (!\LessThan29~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~30_combout\,
	datab => vposition(17),
	datad => VCC,
	cin => \LessThan29~31_cout\,
	cout => \LessThan29~33_cout\);

-- Location: LCCOMB_X39_Y31_N4
\LessThan29~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~35_cout\ = CARRY((\Add9~32_combout\ & ((!\LessThan29~33_cout\) # (!vposition(18)))) # (!\Add9~32_combout\ & (!vposition(18) & !\LessThan29~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~32_combout\,
	datab => vposition(18),
	datad => VCC,
	cin => \LessThan29~33_cout\,
	cout => \LessThan29~35_cout\);

-- Location: LCCOMB_X39_Y31_N6
\LessThan29~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~37_cout\ = CARRY((vposition(19) & ((!\LessThan29~35_cout\) # (!\Add9~34_combout\))) # (!vposition(19) & (!\Add9~34_combout\ & !\LessThan29~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(19),
	datab => \Add9~34_combout\,
	datad => VCC,
	cin => \LessThan29~35_cout\,
	cout => \LessThan29~37_cout\);

-- Location: LCCOMB_X39_Y31_N8
\LessThan29~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~39_cout\ = CARRY((vposition(20) & (\Add9~36_combout\ & !\LessThan29~37_cout\)) # (!vposition(20) & ((\Add9~36_combout\) # (!\LessThan29~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(20),
	datab => \Add9~36_combout\,
	datad => VCC,
	cin => \LessThan29~37_cout\,
	cout => \LessThan29~39_cout\);

-- Location: LCCOMB_X39_Y31_N10
\LessThan29~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~41_cout\ = CARRY((\Add9~38_combout\ & (vposition(21) & !\LessThan29~39_cout\)) # (!\Add9~38_combout\ & ((vposition(21)) # (!\LessThan29~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~38_combout\,
	datab => vposition(21),
	datad => VCC,
	cin => \LessThan29~39_cout\,
	cout => \LessThan29~41_cout\);

-- Location: LCCOMB_X39_Y31_N12
\LessThan29~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~43_cout\ = CARRY((\Add9~40_combout\ & ((!\LessThan29~41_cout\) # (!vposition(22)))) # (!\Add9~40_combout\ & (!vposition(22) & !\LessThan29~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~40_combout\,
	datab => vposition(22),
	datad => VCC,
	cin => \LessThan29~41_cout\,
	cout => \LessThan29~43_cout\);

-- Location: LCCOMB_X39_Y31_N14
\LessThan29~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~45_cout\ = CARRY((\Add9~42_combout\ & (vposition(23) & !\LessThan29~43_cout\)) # (!\Add9~42_combout\ & ((vposition(23)) # (!\LessThan29~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~42_combout\,
	datab => vposition(23),
	datad => VCC,
	cin => \LessThan29~43_cout\,
	cout => \LessThan29~45_cout\);

-- Location: LCCOMB_X39_Y31_N16
\LessThan29~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~47_cout\ = CARRY((\Add9~44_combout\ & ((!\LessThan29~45_cout\) # (!vposition(24)))) # (!\Add9~44_combout\ & (!vposition(24) & !\LessThan29~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~44_combout\,
	datab => vposition(24),
	datad => VCC,
	cin => \LessThan29~45_cout\,
	cout => \LessThan29~47_cout\);

-- Location: LCCOMB_X39_Y31_N18
\LessThan29~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~49_cout\ = CARRY((\Add9~46_combout\ & (vposition(25) & !\LessThan29~47_cout\)) # (!\Add9~46_combout\ & ((vposition(25)) # (!\LessThan29~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~46_combout\,
	datab => vposition(25),
	datad => VCC,
	cin => \LessThan29~47_cout\,
	cout => \LessThan29~49_cout\);

-- Location: LCCOMB_X39_Y31_N20
\LessThan29~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~51_cout\ = CARRY((vposition(26) & (\Add9~48_combout\ & !\LessThan29~49_cout\)) # (!vposition(26) & ((\Add9~48_combout\) # (!\LessThan29~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(26),
	datab => \Add9~48_combout\,
	datad => VCC,
	cin => \LessThan29~49_cout\,
	cout => \LessThan29~51_cout\);

-- Location: LCCOMB_X39_Y31_N22
\LessThan29~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~53_cout\ = CARRY((vposition(27) & ((!\LessThan29~51_cout\) # (!\Add9~50_combout\))) # (!vposition(27) & (!\Add9~50_combout\ & !\LessThan29~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(27),
	datab => \Add9~50_combout\,
	datad => VCC,
	cin => \LessThan29~51_cout\,
	cout => \LessThan29~53_cout\);

-- Location: LCCOMB_X39_Y31_N24
\LessThan29~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~55_cout\ = CARRY((vposition(28) & (\Add9~52_combout\ & !\LessThan29~53_cout\)) # (!vposition(28) & ((\Add9~52_combout\) # (!\LessThan29~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(28),
	datab => \Add9~52_combout\,
	datad => VCC,
	cin => \LessThan29~53_cout\,
	cout => \LessThan29~55_cout\);

-- Location: LCCOMB_X39_Y31_N26
\LessThan29~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~57_cout\ = CARRY((vposition(29) & ((!\LessThan29~55_cout\) # (!\Add9~54_combout\))) # (!vposition(29) & (!\Add9~54_combout\ & !\LessThan29~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(29),
	datab => \Add9~54_combout\,
	datad => VCC,
	cin => \LessThan29~55_cout\,
	cout => \LessThan29~57_cout\);

-- Location: LCCOMB_X39_Y31_N28
\LessThan29~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~59_cout\ = CARRY((\Add9~56_combout\ & ((!\LessThan29~57_cout\) # (!vposition(30)))) # (!\Add9~56_combout\ & (!vposition(30) & !\LessThan29~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add9~56_combout\,
	datab => vposition(30),
	datad => VCC,
	cin => \LessThan29~57_cout\,
	cout => \LessThan29~59_cout\);

-- Location: LCCOMB_X39_Y31_N30
\LessThan29~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan29~60_combout\ = (vposition(31) & (!\LessThan29~59_cout\ & \Add9~58_combout\)) # (!vposition(31) & ((\Add9~58_combout\) # (!\LessThan29~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(31),
	datad => \Add9~58_combout\,
	cin => \LessThan29~59_cout\,
	combout => \LessThan29~60_combout\);

-- Location: LCCOMB_X39_Y28_N24
\process_0~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~19_combout\ = (\process_0~18_combout\ & (!\LessThan28~60_combout\ & (\process_0~36_combout\ & !\LessThan29~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~18_combout\,
	datab => \LessThan28~60_combout\,
	datac => \process_0~36_combout\,
	datad => \LessThan29~60_combout\,
	combout => \process_0~19_combout\);

-- Location: LCCOMB_X39_Y28_N6
\r[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[2]~0_combout\ = (!\process_0~19_combout\ & (((!\process_0~15_combout\) # (!\process_0~11_combout\)) # (!\process_0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~9_combout\,
	datab => \process_0~11_combout\,
	datac => \process_0~15_combout\,
	datad => \process_0~19_combout\,
	combout => \r[2]~0_combout\);

-- Location: LCCOMB_X39_Y28_N28
\r[2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[2]~6_combout\ = (\r[2]~0_combout\ & ((\LessThan26~2_combout\) # ((\r[2]~5_combout\) # (!\LessThan27~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~2_combout\,
	datab => \LessThan27~60_combout\,
	datac => \r[2]~5_combout\,
	datad => \r[2]~0_combout\,
	combout => \r[2]~6_combout\);

-- Location: LCCOMB_X38_Y28_N20
\r~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~7_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\,
	datad => \r[2]~6_combout\,
	combout => \r~7_combout\);

-- Location: FF_X38_Y28_N21
\r[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[0]~reg0_q\);

-- Location: M9K_X33_Y17_N0
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

-- Location: M9K_X53_Y19_N0
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

-- Location: M9K_X53_Y17_N0
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

-- Location: LCCOMB_X42_Y24_N30
\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\);

-- Location: M9K_X33_Y24_N0
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

-- Location: LCCOMB_X38_Y24_N16
\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\);

-- Location: LCCOMB_X38_Y28_N18
\r~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~8_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\,
	datad => \r[2]~6_combout\,
	combout => \r~8_combout\);

-- Location: FF_X38_Y28_N19
\r[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[1]~reg0_q\);

-- Location: M9K_X33_Y19_N0
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

-- Location: M9K_X33_Y15_N0
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

-- Location: M9K_X53_Y16_N0
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

-- Location: LCCOMB_X42_Y24_N12
\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\);

-- Location: M9K_X33_Y25_N0
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

-- Location: LCCOMB_X34_Y24_N8
\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\);

-- Location: LCCOMB_X38_Y28_N24
\r~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~9_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\,
	datad => \r[2]~6_combout\,
	combout => \r~9_combout\);

-- Location: FF_X38_Y28_N25
\r[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[2]~reg0_q\);

-- Location: M9K_X33_Y31_N0
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

-- Location: M9K_X33_Y18_N0
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

-- Location: M9K_X53_Y13_N0
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

-- Location: M9K_X53_Y18_N0
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

-- Location: LCCOMB_X42_Y24_N10
\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\);

-- Location: LCCOMB_X42_Y24_N20
\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\);

-- Location: LCCOMB_X38_Y28_N10
\r~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~10_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\,
	datad => \r[2]~6_combout\,
	combout => \r~10_combout\);

-- Location: FF_X38_Y28_N11
\r[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[3]~reg0_q\);

-- Location: M9K_X33_Y30_N0
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

-- Location: M9K_X73_Y27_N0
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

-- Location: M9K_X53_Y10_N0
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

-- Location: LCCOMB_X45_Y28_N8
\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\);

-- Location: M9K_X73_Y32_N0
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

-- Location: LCCOMB_X45_Y28_N2
\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\);

-- Location: LCCOMB_X38_Y28_N16
\g~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~0_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\,
	datad => \r[2]~6_combout\,
	combout => \g~0_combout\);

-- Location: FF_X38_Y28_N17
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

-- Location: M9K_X73_Y28_N0
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

-- Location: M9K_X33_Y32_N0
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

-- Location: M9K_X53_Y28_N0
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

-- Location: M9K_X53_Y20_N0
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

-- Location: LCCOMB_X45_Y28_N16
\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\);

-- Location: LCCOMB_X45_Y28_N10
\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\);

-- Location: LCCOMB_X38_Y28_N30
\g~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~1_combout\ = ((\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\ & \process_0~8_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\,
	datab => \process_0~8_combout\,
	datad => \r[2]~6_combout\,
	combout => \g~1_combout\);

-- Location: FF_X38_Y28_N31
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

-- Location: M9K_X53_Y14_N0
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

-- Location: M9K_X33_Y21_N0
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

-- Location: LCCOMB_X45_Y28_N24
\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\);

-- Location: M9K_X53_Y23_N0
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

-- Location: M9K_X53_Y25_N0
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

-- Location: LCCOMB_X45_Y28_N14
\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a42~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a18~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a18~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a42~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\);

-- Location: LCCOMB_X38_Y28_N4
\g~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~2_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\,
	datad => \r[2]~6_combout\,
	combout => \g~2_combout\);

-- Location: FF_X38_Y28_N5
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

-- Location: M9K_X53_Y21_N0
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

-- Location: M9K_X53_Y12_N0
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

-- Location: M9K_X53_Y29_N0
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

-- Location: LCCOMB_X45_Y28_N20
\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\);

-- Location: M9K_X73_Y29_N0
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

-- Location: LCCOMB_X45_Y28_N18
\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\ & 
-- (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\,
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\);

-- Location: LCCOMB_X38_Y28_N26
\g~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~3_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\,
	datad => \r[2]~6_combout\,
	combout => \g~3_combout\);

-- Location: FF_X38_Y28_N27
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

-- Location: M9K_X53_Y30_N0
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

-- Location: M9K_X53_Y31_N0
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

-- Location: M9K_X53_Y22_N0
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

-- Location: M9K_X53_Y27_N0
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

-- Location: LCCOMB_X45_Y28_N12
\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\ & 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\);

-- Location: LCCOMB_X45_Y28_N26
\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\);

-- Location: LCCOMB_X38_Y28_N8
\b~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~0_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\,
	datad => \r[2]~6_combout\,
	combout => \b~0_combout\);

-- Location: FF_X38_Y28_N9
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

-- Location: M9K_X33_Y28_N0
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

-- Location: M9K_X33_Y22_N0
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

-- Location: M9K_X33_Y27_N0
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

-- Location: LCCOMB_X37_Y28_N12
\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\);

-- Location: M9K_X53_Y26_N0
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

-- Location: LCCOMB_X45_Y28_N4
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

-- Location: LCCOMB_X38_Y28_N22
\b~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~1_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\,
	datad => \r[2]~6_combout\,
	combout => \b~1_combout\);

-- Location: FF_X38_Y28_N23
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

-- Location: M9K_X73_Y20_N0
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

-- Location: M9K_X33_Y16_N0
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

-- Location: LCCOMB_X42_Y24_N26
\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\);

-- Location: M9K_X5_Y26_N0
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

-- Location: M9K_X33_Y26_N0
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

-- Location: LCCOMB_X34_Y26_N24
\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\);

-- Location: LCCOMB_X38_Y28_N12
\b~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~2_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\,
	datad => \r[2]~6_combout\,
	combout => \b~2_combout\);

-- Location: FF_X38_Y28_N13
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

-- Location: M9K_X33_Y10_N0
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

-- Location: M9K_X53_Y24_N0
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

-- Location: LCCOMB_X42_Y24_N28
\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\);

-- Location: M9K_X33_Y23_N0
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

-- Location: M9K_X53_Y15_N0
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

-- Location: LCCOMB_X42_Y24_N2
\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\);

-- Location: LCCOMB_X38_Y28_N2
\b~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~3_combout\ = ((\process_0~8_combout\ & \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\)) # (!\r[2]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \process_0~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\,
	datad => \r[2]~6_combout\,
	combout => \b~3_combout\);

-- Location: FF_X38_Y28_N3
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

-- Location: LCCOMB_X38_Y24_N28
\process_0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~32_combout\ = (!hposition(7) & (!hposition(6) & ((!hposition(4)) # (!hposition(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => hposition(7),
	datac => hposition(6),
	datad => hposition(4),
	combout => \process_0~32_combout\);

-- Location: LCCOMB_X38_Y24_N18
\process_0~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~31_combout\ = (hposition(8)) # ((hposition(7) & ((hposition(6)) # (hposition(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => hposition(6),
	datac => hposition(5),
	datad => hposition(7),
	combout => \process_0~31_combout\);

-- Location: LCCOMB_X38_Y24_N12
\process_0~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~33_combout\ = ((\process_0~31_combout\) # ((\process_0~32_combout\ & !hposition(5)))) # (!\process_0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~36_combout\,
	datab => \process_0~32_combout\,
	datac => hposition(5),
	datad => \process_0~31_combout\,
	combout => \process_0~33_combout\);

-- Location: FF_X38_Y24_N13
\hsync~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \process_0~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \hsync~reg0_q\);

-- Location: LCCOMB_X39_Y30_N10
\process_0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~34_combout\ = (vposition(2) & (vposition(3))) # (!vposition(2) & ((vposition(3) & ((vposition(1)) # (vposition(0)))) # (!vposition(3) & ((!vposition(0)) # (!vposition(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => vposition(3),
	datac => vposition(1),
	datad => vposition(0),
	combout => \process_0~34_combout\);

-- Location: LCCOMB_X39_Y30_N0
\process_0~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~35_combout\ = (\process_0~34_combout\) # ((vposition(8)) # ((vposition(9)) # (!\process_0~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~34_combout\,
	datab => vposition(8),
	datac => \process_0~11_combout\,
	datad => vposition(9),
	combout => \process_0~35_combout\);

-- Location: FF_X39_Y30_N1
\vsync~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \process_0~35_combout\,
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

-- Location: IOIBUF_X51_Y54_N1
\moveDown~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_moveDown,
	o => \moveDown~input_o\);

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


