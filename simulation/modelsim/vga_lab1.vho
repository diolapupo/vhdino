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

-- DATE "01/02/2022 18:33:00"

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
-- moveleft	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- moveright	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
SIGNAL \hposition[0]~32_combout\ : std_logic;
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
SIGNAL \hposition[26]~85\ : std_logic;
SIGNAL \hposition[27]~86_combout\ : std_logic;
SIGNAL \hposition[27]~87\ : std_logic;
SIGNAL \hposition[28]~88_combout\ : std_logic;
SIGNAL \hposition[28]~89\ : std_logic;
SIGNAL \hposition[29]~90_combout\ : std_logic;
SIGNAL \hposition[29]~91\ : std_logic;
SIGNAL \hposition[30]~92_combout\ : std_logic;
SIGNAL \hposition[30]~93\ : std_logic;
SIGNAL \hposition[31]~94_combout\ : std_logic;
SIGNAL \LessThan5~0_combout\ : std_logic;
SIGNAL \LessThan5~5_combout\ : std_logic;
SIGNAL \LessThan5~2_combout\ : std_logic;
SIGNAL \LessThan5~1_combout\ : std_logic;
SIGNAL \LessThan5~3_combout\ : std_logic;
SIGNAL \LessThan5~4_combout\ : std_logic;
SIGNAL \LessThan5~6_combout\ : std_logic;
SIGNAL \LessThan5~7_combout\ : std_logic;
SIGNAL \LessThan5~8_combout\ : std_logic;
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
SIGNAL \LessThan18~0_combout\ : std_logic;
SIGNAL \LessThan18~1_combout\ : std_logic;
SIGNAL \LessThan18~2_combout\ : std_logic;
SIGNAL \vposition[0]~32_combout\ : std_logic;
SIGNAL \LessThan6~1_combout\ : std_logic;
SIGNAL \vposition[5]~43\ : std_logic;
SIGNAL \vposition[6]~44_combout\ : std_logic;
SIGNAL \vposition[6]~45\ : std_logic;
SIGNAL \vposition[7]~46_combout\ : std_logic;
SIGNAL \LessThan6~0_combout\ : std_logic;
SIGNAL \vposition[7]~47\ : std_logic;
SIGNAL \vposition[8]~48_combout\ : std_logic;
SIGNAL \vposition[8]~49\ : std_logic;
SIGNAL \vposition[9]~50_combout\ : std_logic;
SIGNAL \LessThan20~0_combout\ : std_logic;
SIGNAL \LessThan6~2_combout\ : std_logic;
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
SIGNAL \LessThan19~5_combout\ : std_logic;
SIGNAL \LessThan19~2_combout\ : std_logic;
SIGNAL \LessThan19~0_combout\ : std_logic;
SIGNAL \LessThan19~3_combout\ : std_logic;
SIGNAL \LessThan19~1_combout\ : std_logic;
SIGNAL \LessThan19~4_combout\ : std_logic;
SIGNAL \LessThan19~6_combout\ : std_logic;
SIGNAL \LessThan6~3_combout\ : std_logic;
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
SIGNAL \process_0~2_combout\ : std_logic;
SIGNAL \process_0~4_combout\ : std_logic;
SIGNAL \LessThan17~1_combout\ : std_logic;
SIGNAL \LessThan15~0_combout\ : std_logic;
SIGNAL \LessThan17~0_combout\ : std_logic;
SIGNAL \process_0~5_combout\ : std_logic;
SIGNAL \process_0~6_combout\ : std_logic;
SIGNAL \process_0~3_combout\ : std_logic;
SIGNAL \process_0~7_combout\ : std_logic;
SIGNAL \process_0~8_combout\ : std_logic;
SIGNAL \process_0~9_combout\ : std_logic;
SIGNAL \process_0~10_combout\ : std_logic;
SIGNAL \process_0~11_combout\ : std_logic;
SIGNAL \LessThan19~7_combout\ : std_logic;
SIGNAL \process_0~12_combout\ : std_logic;
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
SIGNAL \LessThan0~3_combout\ : std_logic;
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
SIGNAL \LessThan0~2_combout\ : std_logic;
SIGNAL \LessThan0~5_combout\ : std_logic;
SIGNAL \LessThan0~4_combout\ : std_logic;
SIGNAL \LessThan0~6_combout\ : std_logic;
SIGNAL \LessThan0~7_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \count[30]~93\ : std_logic;
SIGNAL \count[31]~94_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \LessThan0~8_combout\ : std_logic;
SIGNAL \Add12~27\ : std_logic;
SIGNAL \Add12~28_combout\ : std_logic;
SIGNAL \bg_hstart~20_combout\ : std_logic;
SIGNAL \Add12~29\ : std_logic;
SIGNAL \Add12~30_combout\ : std_logic;
SIGNAL \bg_hstart~19_combout\ : std_logic;
SIGNAL \Add12~31\ : std_logic;
SIGNAL \Add12~32_combout\ : std_logic;
SIGNAL \bg_hstart~18_combout\ : std_logic;
SIGNAL \Add12~33\ : std_logic;
SIGNAL \Add12~34_combout\ : std_logic;
SIGNAL \bg_hstart~17_combout\ : std_logic;
SIGNAL \Add12~35\ : std_logic;
SIGNAL \Add12~36_combout\ : std_logic;
SIGNAL \bg_hstart~16_combout\ : std_logic;
SIGNAL \Add12~37\ : std_logic;
SIGNAL \Add12~38_combout\ : std_logic;
SIGNAL \bg_hstart~15_combout\ : std_logic;
SIGNAL \Add12~39\ : std_logic;
SIGNAL \Add12~40_combout\ : std_logic;
SIGNAL \bg_hstart~14_combout\ : std_logic;
SIGNAL \Add12~41\ : std_logic;
SIGNAL \Add12~42_combout\ : std_logic;
SIGNAL \bg_hstart~13_combout\ : std_logic;
SIGNAL \Add12~43\ : std_logic;
SIGNAL \Add12~44_combout\ : std_logic;
SIGNAL \bg_hstart~12_combout\ : std_logic;
SIGNAL \Add12~45\ : std_logic;
SIGNAL \Add12~46_combout\ : std_logic;
SIGNAL \bg_hstart~11_combout\ : std_logic;
SIGNAL \Add12~47\ : std_logic;
SIGNAL \Add12~48_combout\ : std_logic;
SIGNAL \bg_hstart~10_combout\ : std_logic;
SIGNAL \Add12~49\ : std_logic;
SIGNAL \Add12~50_combout\ : std_logic;
SIGNAL \bg_hstart~9_combout\ : std_logic;
SIGNAL \Add12~51\ : std_logic;
SIGNAL \Add12~52_combout\ : std_logic;
SIGNAL \bg_hstart~8_combout\ : std_logic;
SIGNAL \Add12~53\ : std_logic;
SIGNAL \Add12~54_combout\ : std_logic;
SIGNAL \bg_hstart~7_combout\ : std_logic;
SIGNAL \Add12~55\ : std_logic;
SIGNAL \Add12~56_combout\ : std_logic;
SIGNAL \bg_hstart~6_combout\ : std_logic;
SIGNAL \Add12~57\ : std_logic;
SIGNAL \Add12~58_combout\ : std_logic;
SIGNAL \bg_hstart~5_combout\ : std_logic;
SIGNAL \Add12~59\ : std_logic;
SIGNAL \Add12~60_combout\ : std_logic;
SIGNAL \bg_hstart~4_combout\ : std_logic;
SIGNAL \Add12~61\ : std_logic;
SIGNAL \Add12~62_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \Add12~0_combout\ : std_logic;
SIGNAL \bg_hstart~32_combout\ : std_logic;
SIGNAL \Add12~1\ : std_logic;
SIGNAL \Add12~2_combout\ : std_logic;
SIGNAL \bg_hstart~31_combout\ : std_logic;
SIGNAL \Add12~3\ : std_logic;
SIGNAL \Add12~4_combout\ : std_logic;
SIGNAL \bg_hstart~30_combout\ : std_logic;
SIGNAL \Add12~5\ : std_logic;
SIGNAL \Add12~6_combout\ : std_logic;
SIGNAL \bg_hstart~29_combout\ : std_logic;
SIGNAL \Add12~7\ : std_logic;
SIGNAL \Add12~8_combout\ : std_logic;
SIGNAL \bg_hstart~28_combout\ : std_logic;
SIGNAL \Add12~9\ : std_logic;
SIGNAL \Add12~10_combout\ : std_logic;
SIGNAL \bg_hstart~27_combout\ : std_logic;
SIGNAL \Add12~11\ : std_logic;
SIGNAL \Add12~12_combout\ : std_logic;
SIGNAL \bg_hstart~34_combout\ : std_logic;
SIGNAL \Add12~13\ : std_logic;
SIGNAL \Add12~14_combout\ : std_logic;
SIGNAL \bg_hstart~26_combout\ : std_logic;
SIGNAL \Add12~15\ : std_logic;
SIGNAL \Add12~16_combout\ : std_logic;
SIGNAL \bg_hstart~33_combout\ : std_logic;
SIGNAL \Add12~17\ : std_logic;
SIGNAL \Add12~18_combout\ : std_logic;
SIGNAL \bg_hstart~25_combout\ : std_logic;
SIGNAL \Add12~19\ : std_logic;
SIGNAL \Add12~20_combout\ : std_logic;
SIGNAL \bg_hstart~24_combout\ : std_logic;
SIGNAL \Add12~21\ : std_logic;
SIGNAL \Add12~22_combout\ : std_logic;
SIGNAL \bg_hstart~23_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \Add12~64_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \Add12~65_combout\ : std_logic;
SIGNAL \LessThan1~9_combout\ : std_logic;
SIGNAL \LessThan1~10_combout\ : std_logic;
SIGNAL \LessThan1~11_combout\ : std_logic;
SIGNAL \LessThan1~12_combout\ : std_logic;
SIGNAL \LessThan1~13_combout\ : std_logic;
SIGNAL \LessThan1~14_combout\ : std_logic;
SIGNAL \LessThan1~15_combout\ : std_logic;
SIGNAL \Add12~23\ : std_logic;
SIGNAL \Add12~24_combout\ : std_logic;
SIGNAL \LessThan1~16_combout\ : std_logic;
SIGNAL \LessThan1~17_combout\ : std_logic;
SIGNAL \LessThan1~18_combout\ : std_logic;
SIGNAL \LessThan1~20_combout\ : std_logic;
SIGNAL \LessThan1~19_combout\ : std_logic;
SIGNAL \LessThan1~21_combout\ : std_logic;
SIGNAL \LessThan1~22_combout\ : std_logic;
SIGNAL \LessThan1~23_combout\ : std_logic;
SIGNAL \bg_hstart~22_combout\ : std_logic;
SIGNAL \Add12~25\ : std_logic;
SIGNAL \Add12~26_combout\ : std_logic;
SIGNAL \bg_hstart~21_combout\ : std_logic;
SIGNAL \Add20~1\ : std_logic;
SIGNAL \Add20~3\ : std_logic;
SIGNAL \Add20~5\ : std_logic;
SIGNAL \Add20~7\ : std_logic;
SIGNAL \Add20~9\ : std_logic;
SIGNAL \Add20~11\ : std_logic;
SIGNAL \Add20~13\ : std_logic;
SIGNAL \Add20~15\ : std_logic;
SIGNAL \Add20~17\ : std_logic;
SIGNAL \Add20~19\ : std_logic;
SIGNAL \Add20~21\ : std_logic;
SIGNAL \Add20~23\ : std_logic;
SIGNAL \Add20~25\ : std_logic;
SIGNAL \Add20~26_combout\ : std_logic;
SIGNAL \Add20~24_combout\ : std_logic;
SIGNAL \Add20~22_combout\ : std_logic;
SIGNAL \Add20~20_combout\ : std_logic;
SIGNAL \Add20~18_combout\ : std_logic;
SIGNAL \Add21~1\ : std_logic;
SIGNAL \Add21~3\ : std_logic;
SIGNAL \Add21~5\ : std_logic;
SIGNAL \Add21~7\ : std_logic;
SIGNAL \Add21~8_combout\ : std_logic;
SIGNAL \Add21~6_combout\ : std_logic;
SIGNAL \Add21~4_combout\ : std_logic;
SIGNAL \Add21~2_combout\ : std_logic;
SIGNAL \Add21~0_combout\ : std_logic;
SIGNAL \bg_address[9]~7\ : std_logic;
SIGNAL \bg_address[10]~9\ : std_logic;
SIGNAL \bg_address[11]~11\ : std_logic;
SIGNAL \bg_address[12]~13\ : std_logic;
SIGNAL \bg_address[13]~14_combout\ : std_logic;
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
SIGNAL \r[3]~0_combout\ : std_logic;
SIGNAL \process_0~21_combout\ : std_logic;
SIGNAL \bg_hstop[30]~feeder_combout\ : std_logic;
SIGNAL \bg_hstop~18_combout\ : std_logic;
SIGNAL \bg_hstop[23]~feeder_combout\ : std_logic;
SIGNAL \Add13~0_combout\ : std_logic;
SIGNAL \bg_hstop~42_combout\ : std_logic;
SIGNAL \LessThan2~15_combout\ : std_logic;
SIGNAL \LessThan2~16_combout\ : std_logic;
SIGNAL \LessThan2~13_combout\ : std_logic;
SIGNAL \LessThan2~14_combout\ : std_logic;
SIGNAL \LessThan2~17_combout\ : std_logic;
SIGNAL \Add13~64_combout\ : std_logic;
SIGNAL \LessThan2~18_combout\ : std_logic;
SIGNAL \LessThan2~19_combout\ : std_logic;
SIGNAL \bg_hstop~38_combout\ : std_logic;
SIGNAL \Add13~1\ : std_logic;
SIGNAL \Add13~2_combout\ : std_logic;
SIGNAL \bg_hstop~37_combout\ : std_logic;
SIGNAL \Add13~3\ : std_logic;
SIGNAL \Add13~4_combout\ : std_logic;
SIGNAL \bg_hstop~36_combout\ : std_logic;
SIGNAL \Add13~5\ : std_logic;
SIGNAL \Add13~6_combout\ : std_logic;
SIGNAL \bg_hstop~35_combout\ : std_logic;
SIGNAL \Add13~7\ : std_logic;
SIGNAL \Add13~8_combout\ : std_logic;
SIGNAL \bg_hstop~34_combout\ : std_logic;
SIGNAL \Add13~9\ : std_logic;
SIGNAL \Add13~10_combout\ : std_logic;
SIGNAL \bg_hstop~33_combout\ : std_logic;
SIGNAL \Add13~11\ : std_logic;
SIGNAL \Add13~12_combout\ : std_logic;
SIGNAL \bg_hstop~41_combout\ : std_logic;
SIGNAL \Add13~13\ : std_logic;
SIGNAL \Add13~14_combout\ : std_logic;
SIGNAL \bg_hstop~40_combout\ : std_logic;
SIGNAL \bg_hstop[7]~feeder_combout\ : std_logic;
SIGNAL \Add13~15\ : std_logic;
SIGNAL \Add13~17\ : std_logic;
SIGNAL \Add13~18_combout\ : std_logic;
SIGNAL \bg_hstop~32_combout\ : std_logic;
SIGNAL \bg_hstop[9]~feeder_combout\ : std_logic;
SIGNAL \Add13~19\ : std_logic;
SIGNAL \Add13~20_combout\ : std_logic;
SIGNAL \bg_hstop~31_combout\ : std_logic;
SIGNAL \Add13~21\ : std_logic;
SIGNAL \Add13~22_combout\ : std_logic;
SIGNAL \bg_hstop~30_combout\ : std_logic;
SIGNAL \Add13~23\ : std_logic;
SIGNAL \Add13~24_combout\ : std_logic;
SIGNAL \bg_hstop~29_combout\ : std_logic;
SIGNAL \bg_hstop[12]~feeder_combout\ : std_logic;
SIGNAL \Add13~25\ : std_logic;
SIGNAL \Add13~26_combout\ : std_logic;
SIGNAL \bg_hstop~28_combout\ : std_logic;
SIGNAL \bg_hstop[13]~feeder_combout\ : std_logic;
SIGNAL \Add13~27\ : std_logic;
SIGNAL \Add13~28_combout\ : std_logic;
SIGNAL \bg_hstop~27_combout\ : std_logic;
SIGNAL \Add13~29\ : std_logic;
SIGNAL \Add13~30_combout\ : std_logic;
SIGNAL \bg_hstop~26_combout\ : std_logic;
SIGNAL \bg_hstop[15]~feeder_combout\ : std_logic;
SIGNAL \Add13~31\ : std_logic;
SIGNAL \Add13~32_combout\ : std_logic;
SIGNAL \bg_hstop~25_combout\ : std_logic;
SIGNAL \bg_hstop[16]~feeder_combout\ : std_logic;
SIGNAL \Add13~33\ : std_logic;
SIGNAL \Add13~34_combout\ : std_logic;
SIGNAL \bg_hstop~24_combout\ : std_logic;
SIGNAL \bg_hstop[17]~feeder_combout\ : std_logic;
SIGNAL \Add13~35\ : std_logic;
SIGNAL \Add13~36_combout\ : std_logic;
SIGNAL \bg_hstop~23_combout\ : std_logic;
SIGNAL \bg_hstop[18]~feeder_combout\ : std_logic;
SIGNAL \Add13~37\ : std_logic;
SIGNAL \Add13~38_combout\ : std_logic;
SIGNAL \bg_hstop~22_combout\ : std_logic;
SIGNAL \Add13~39\ : std_logic;
SIGNAL \Add13~40_combout\ : std_logic;
SIGNAL \bg_hstop~21_combout\ : std_logic;
SIGNAL \bg_hstop[20]~feeder_combout\ : std_logic;
SIGNAL \Add13~41\ : std_logic;
SIGNAL \Add13~42_combout\ : std_logic;
SIGNAL \bg_hstop~20_combout\ : std_logic;
SIGNAL \Add13~43\ : std_logic;
SIGNAL \Add13~44_combout\ : std_logic;
SIGNAL \bg_hstop~19_combout\ : std_logic;
SIGNAL \Add13~45\ : std_logic;
SIGNAL \Add13~46_combout\ : std_logic;
SIGNAL \LessThan2~10_combout\ : std_logic;
SIGNAL \Add13~47\ : std_logic;
SIGNAL \Add13~48_combout\ : std_logic;
SIGNAL \bg_hstop~17_combout\ : std_logic;
SIGNAL \Add13~49\ : std_logic;
SIGNAL \Add13~50_combout\ : std_logic;
SIGNAL \LessThan2~11_combout\ : std_logic;
SIGNAL \LessThan2~12_combout\ : std_logic;
SIGNAL \LessThan2~4_combout\ : std_logic;
SIGNAL \LessThan2~6_combout\ : std_logic;
SIGNAL \LessThan2~3_combout\ : std_logic;
SIGNAL \LessThan2~5_combout\ : std_logic;
SIGNAL \LessThan2~7_combout\ : std_logic;
SIGNAL \LessThan2~8_combout\ : std_logic;
SIGNAL \LessThan2~9_combout\ : std_logic;
SIGNAL \Add13~60_combout\ : std_logic;
SIGNAL \LessThan2~0_combout\ : std_logic;
SIGNAL \LessThan2~1_combout\ : std_logic;
SIGNAL \LessThan2~2_combout\ : std_logic;
SIGNAL \LessThan2~21_combout\ : std_logic;
SIGNAL \LessThan2~22_combout\ : std_logic;
SIGNAL \bg_hstop~39_combout\ : std_logic;
SIGNAL \Add13~16_combout\ : std_logic;
SIGNAL \bg_hstop~11_combout\ : std_logic;
SIGNAL \Add13~65_combout\ : std_logic;
SIGNAL \LessThan2~20_combout\ : std_logic;
SIGNAL \bg_hstop~16_combout\ : std_logic;
SIGNAL \Add13~51\ : std_logic;
SIGNAL \Add13~52_combout\ : std_logic;
SIGNAL \bg_hstop~15_combout\ : std_logic;
SIGNAL \Add13~53\ : std_logic;
SIGNAL \Add13~54_combout\ : std_logic;
SIGNAL \bg_hstop~14_combout\ : std_logic;
SIGNAL \Add13~55\ : std_logic;
SIGNAL \Add13~56_combout\ : std_logic;
SIGNAL \bg_hstop~13_combout\ : std_logic;
SIGNAL \Add13~57\ : std_logic;
SIGNAL \Add13~58_combout\ : std_logic;
SIGNAL \bg_hstop~12_combout\ : std_logic;
SIGNAL \Add13~59\ : std_logic;
SIGNAL \Add13~61\ : std_logic;
SIGNAL \Add13~62_combout\ : std_logic;
SIGNAL \bg_hstop~10_combout\ : std_logic;
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
SIGNAL \process_0~20_combout\ : std_logic;
SIGNAL \Add20~27\ : std_logic;
SIGNAL \Add20~28_combout\ : std_logic;
SIGNAL \Add21~9\ : std_logic;
SIGNAL \Add21~10_combout\ : std_logic;
SIGNAL \bg_address[13]~15\ : std_logic;
SIGNAL \bg_address[14]~16_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\ : std_logic;
SIGNAL \Add20~0_combout\ : std_logic;
SIGNAL \Add20~2_combout\ : std_logic;
SIGNAL \Add20~4_combout\ : std_logic;
SIGNAL \Add20~6_combout\ : std_logic;
SIGNAL \Add20~8_combout\ : std_logic;
SIGNAL \Add20~10_combout\ : std_logic;
SIGNAL \Add20~12_combout\ : std_logic;
SIGNAL \Add20~14_combout\ : std_logic;
SIGNAL \Add20~16_combout\ : std_logic;
SIGNAL \bg_address[9]~6_combout\ : std_logic;
SIGNAL \bg_address[10]~8_combout\ : std_logic;
SIGNAL \bg_address[11]~10_combout\ : std_logic;
SIGNAL \bg_address[12]~12_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|out_address_reg_a[1]~feeder_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|address_reg_a[0]~feeder_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|out_address_reg_a[0]~feeder_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\ : std_logic;
SIGNAL \process_0~13_combout\ : std_logic;
SIGNAL \process_0~14_combout\ : std_logic;
SIGNAL \r~1_combout\ : std_logic;
SIGNAL \LessThan20~1_combout\ : std_logic;
SIGNAL \LessThan20~2_combout\ : std_logic;
SIGNAL \r[3]~2_combout\ : std_logic;
SIGNAL \Add11~0_combout\ : std_logic;
SIGNAL \obstacle_hstop~32_combout\ : std_logic;
SIGNAL \obstacle_hstop[4]~29_combout\ : std_logic;
SIGNAL \Add11~1\ : std_logic;
SIGNAL \Add11~2_combout\ : std_logic;
SIGNAL \obstacle_hstop~31_combout\ : std_logic;
SIGNAL \Add11~3\ : std_logic;
SIGNAL \Add11~4_combout\ : std_logic;
SIGNAL \obstacle_hstop~30_combout\ : std_logic;
SIGNAL \Add11~5\ : std_logic;
SIGNAL \Add11~6_combout\ : std_logic;
SIGNAL \obstacle_hstop~28_combout\ : std_logic;
SIGNAL \Add11~7\ : std_logic;
SIGNAL \Add11~8_combout\ : std_logic;
SIGNAL \obstacle_hstop~27_combout\ : std_logic;
SIGNAL \Add11~9\ : std_logic;
SIGNAL \Add11~10_combout\ : std_logic;
SIGNAL \obstacle_hstop~26_combout\ : std_logic;
SIGNAL \Add11~11\ : std_logic;
SIGNAL \Add11~12_combout\ : std_logic;
SIGNAL \obstacle_hstop~25_combout\ : std_logic;
SIGNAL \Add11~13\ : std_logic;
SIGNAL \Add11~14_combout\ : std_logic;
SIGNAL \obstacle_hstop~33_combout\ : std_logic;
SIGNAL \obstacle_hstop~3_combout\ : std_logic;
SIGNAL \LessThan4~7_combout\ : std_logic;
SIGNAL \Add11~15\ : std_logic;
SIGNAL \Add11~16_combout\ : std_logic;
SIGNAL \obstacle_hstop~24_combout\ : std_logic;
SIGNAL \Add11~17\ : std_logic;
SIGNAL \Add11~18_combout\ : std_logic;
SIGNAL \obstacle_hstop~23_combout\ : std_logic;
SIGNAL \Add11~19\ : std_logic;
SIGNAL \Add11~20_combout\ : std_logic;
SIGNAL \obstacle_hstop~22_combout\ : std_logic;
SIGNAL \Add11~21\ : std_logic;
SIGNAL \Add11~22_combout\ : std_logic;
SIGNAL \obstacle_hstop~21_combout\ : std_logic;
SIGNAL \Add11~23\ : std_logic;
SIGNAL \Add11~24_combout\ : std_logic;
SIGNAL \obstacle_hstop~20_combout\ : std_logic;
SIGNAL \Add11~25\ : std_logic;
SIGNAL \Add11~26_combout\ : std_logic;
SIGNAL \obstacle_hstop~19_combout\ : std_logic;
SIGNAL \Add11~27\ : std_logic;
SIGNAL \Add11~28_combout\ : std_logic;
SIGNAL \obstacle_hstop~18_combout\ : std_logic;
SIGNAL \Add11~29\ : std_logic;
SIGNAL \Add11~30_combout\ : std_logic;
SIGNAL \obstacle_hstop~17_combout\ : std_logic;
SIGNAL \Add11~31\ : std_logic;
SIGNAL \Add11~32_combout\ : std_logic;
SIGNAL \obstacle_hstop~16_combout\ : std_logic;
SIGNAL \Add11~33\ : std_logic;
SIGNAL \Add11~34_combout\ : std_logic;
SIGNAL \obstacle_hstop~15_combout\ : std_logic;
SIGNAL \Add11~35\ : std_logic;
SIGNAL \Add11~36_combout\ : std_logic;
SIGNAL \obstacle_hstop~14_combout\ : std_logic;
SIGNAL \Add11~37\ : std_logic;
SIGNAL \Add11~38_combout\ : std_logic;
SIGNAL \obstacle_hstop~13_combout\ : std_logic;
SIGNAL \Add11~39\ : std_logic;
SIGNAL \Add11~40_combout\ : std_logic;
SIGNAL \obstacle_hstop~12_combout\ : std_logic;
SIGNAL \Add11~41\ : std_logic;
SIGNAL \Add11~42_combout\ : std_logic;
SIGNAL \obstacle_hstop~11_combout\ : std_logic;
SIGNAL \Add11~43\ : std_logic;
SIGNAL \Add11~44_combout\ : std_logic;
SIGNAL \obstacle_hstop~10_combout\ : std_logic;
SIGNAL \Add11~45\ : std_logic;
SIGNAL \Add11~46_combout\ : std_logic;
SIGNAL \obstacle_hstop~9_combout\ : std_logic;
SIGNAL \Add11~47\ : std_logic;
SIGNAL \Add11~48_combout\ : std_logic;
SIGNAL \obstacle_hstop~8_combout\ : std_logic;
SIGNAL \Add11~49\ : std_logic;
SIGNAL \Add11~50_combout\ : std_logic;
SIGNAL \obstacle_hstop~7_combout\ : std_logic;
SIGNAL \Add11~51\ : std_logic;
SIGNAL \Add11~52_combout\ : std_logic;
SIGNAL \obstacle_hstop~6_combout\ : std_logic;
SIGNAL \Add11~53\ : std_logic;
SIGNAL \Add11~54_combout\ : std_logic;
SIGNAL \obstacle_hstop~5_combout\ : std_logic;
SIGNAL \LessThan4~5_combout\ : std_logic;
SIGNAL \LessThan4~3_combout\ : std_logic;
SIGNAL \LessThan4~0_combout\ : std_logic;
SIGNAL \LessThan4~1_combout\ : std_logic;
SIGNAL \LessThan4~2_combout\ : std_logic;
SIGNAL \LessThan4~4_combout\ : std_logic;
SIGNAL \LessThan4~6_combout\ : std_logic;
SIGNAL \LessThan4~8_combout\ : std_logic;
SIGNAL \LessThan4~11_combout\ : std_logic;
SIGNAL \Add11~58_combout\ : std_logic;
SIGNAL \Add11~55\ : std_logic;
SIGNAL \Add11~56_combout\ : std_logic;
SIGNAL \LessThan4~9_combout\ : std_logic;
SIGNAL \LessThan4~10_combout\ : std_logic;
SIGNAL \LessThan4~12_combout\ : std_logic;
SIGNAL \LessThan4~13_combout\ : std_logic;
SIGNAL \LessThan4~14_combout\ : std_logic;
SIGNAL \LessThan4~15_combout\ : std_logic;
SIGNAL \LessThan4~16_combout\ : std_logic;
SIGNAL \LessThan4~17_combout\ : std_logic;
SIGNAL \LessThan4~18_combout\ : std_logic;
SIGNAL \obstacle_hstop~4_combout\ : std_logic;
SIGNAL \Add11~57\ : std_logic;
SIGNAL \Add11~59\ : std_logic;
SIGNAL \Add11~60_combout\ : std_logic;
SIGNAL \obstacle_hstop~2_combout\ : std_logic;
SIGNAL \LessThan22~1_cout\ : std_logic;
SIGNAL \LessThan22~3_cout\ : std_logic;
SIGNAL \LessThan22~5_cout\ : std_logic;
SIGNAL \LessThan22~7_cout\ : std_logic;
SIGNAL \LessThan22~9_cout\ : std_logic;
SIGNAL \LessThan22~11_cout\ : std_logic;
SIGNAL \LessThan22~13_cout\ : std_logic;
SIGNAL \LessThan22~15_cout\ : std_logic;
SIGNAL \LessThan22~17_cout\ : std_logic;
SIGNAL \LessThan22~19_cout\ : std_logic;
SIGNAL \LessThan22~21_cout\ : std_logic;
SIGNAL \LessThan22~23_cout\ : std_logic;
SIGNAL \LessThan22~25_cout\ : std_logic;
SIGNAL \LessThan22~27_cout\ : std_logic;
SIGNAL \LessThan22~29_cout\ : std_logic;
SIGNAL \LessThan22~31_cout\ : std_logic;
SIGNAL \LessThan22~33_cout\ : std_logic;
SIGNAL \LessThan22~35_cout\ : std_logic;
SIGNAL \LessThan22~37_cout\ : std_logic;
SIGNAL \LessThan22~39_cout\ : std_logic;
SIGNAL \LessThan22~41_cout\ : std_logic;
SIGNAL \LessThan22~43_cout\ : std_logic;
SIGNAL \LessThan22~45_cout\ : std_logic;
SIGNAL \LessThan22~47_cout\ : std_logic;
SIGNAL \LessThan22~49_cout\ : std_logic;
SIGNAL \LessThan22~51_cout\ : std_logic;
SIGNAL \LessThan22~53_cout\ : std_logic;
SIGNAL \LessThan22~55_cout\ : std_logic;
SIGNAL \LessThan22~57_cout\ : std_logic;
SIGNAL \LessThan22~58_combout\ : std_logic;
SIGNAL \Add10~0_combout\ : std_logic;
SIGNAL \Add10~62_combout\ : std_logic;
SIGNAL \Add10~63_combout\ : std_logic;
SIGNAL \LessThan3~17_combout\ : std_logic;
SIGNAL \LessThan3~18_combout\ : std_logic;
SIGNAL \LessThan3~11_combout\ : std_logic;
SIGNAL \LessThan3~12_combout\ : std_logic;
SIGNAL \LessThan3~10_combout\ : std_logic;
SIGNAL \LessThan3~13_combout\ : std_logic;
SIGNAL \LessThan3~14_combout\ : std_logic;
SIGNAL \LessThan3~15_combout\ : std_logic;
SIGNAL \LessThan3~16_combout\ : std_logic;
SIGNAL \LessThan3~19_combout\ : std_logic;
SIGNAL \LessThan3~7_combout\ : std_logic;
SIGNAL \LessThan3~8_combout\ : std_logic;
SIGNAL \LessThan3~5_combout\ : std_logic;
SIGNAL \LessThan3~2_combout\ : std_logic;
SIGNAL \LessThan3~3_combout\ : std_logic;
SIGNAL \LessThan3~1_combout\ : std_logic;
SIGNAL \LessThan3~0_combout\ : std_logic;
SIGNAL \LessThan3~4_combout\ : std_logic;
SIGNAL \LessThan3~6_combout\ : std_logic;
SIGNAL \LessThan3~9_combout\ : std_logic;
SIGNAL \Add10~59\ : std_logic;
SIGNAL \Add10~60_combout\ : std_logic;
SIGNAL \LessThan3~20_combout\ : std_logic;
SIGNAL \obstacle_hstart~31_combout\ : std_logic;
SIGNAL \Add10~1\ : std_logic;
SIGNAL \Add10~2_combout\ : std_logic;
SIGNAL \obstacle_hstart~30_combout\ : std_logic;
SIGNAL \Add10~3\ : std_logic;
SIGNAL \Add10~4_combout\ : std_logic;
SIGNAL \obstacle_hstart~29_combout\ : std_logic;
SIGNAL \Add10~5\ : std_logic;
SIGNAL \Add10~6_combout\ : std_logic;
SIGNAL \obstacle_hstart~28_combout\ : std_logic;
SIGNAL \Add10~7\ : std_logic;
SIGNAL \Add10~8_combout\ : std_logic;
SIGNAL \obstacle_hstart~27_combout\ : std_logic;
SIGNAL \Add10~9\ : std_logic;
SIGNAL \Add10~10_combout\ : std_logic;
SIGNAL \obstacle_hstart~33_combout\ : std_logic;
SIGNAL \Add10~11\ : std_logic;
SIGNAL \Add10~12_combout\ : std_logic;
SIGNAL \obstacle_hstart~26_combout\ : std_logic;
SIGNAL \Add10~13\ : std_logic;
SIGNAL \Add10~14_combout\ : std_logic;
SIGNAL \obstacle_hstart~32_combout\ : std_logic;
SIGNAL \Add10~15\ : std_logic;
SIGNAL \Add10~16_combout\ : std_logic;
SIGNAL \obstacle_hstart~25_combout\ : std_logic;
SIGNAL \Add10~17\ : std_logic;
SIGNAL \Add10~18_combout\ : std_logic;
SIGNAL \obstacle_hstart~24_combout\ : std_logic;
SIGNAL \Add10~19\ : std_logic;
SIGNAL \Add10~20_combout\ : std_logic;
SIGNAL \obstacle_hstart~23_combout\ : std_logic;
SIGNAL \Add10~21\ : std_logic;
SIGNAL \Add10~22_combout\ : std_logic;
SIGNAL \obstacle_hstart~22_combout\ : std_logic;
SIGNAL \Add10~23\ : std_logic;
SIGNAL \Add10~24_combout\ : std_logic;
SIGNAL \obstacle_hstart~21_combout\ : std_logic;
SIGNAL \Add10~25\ : std_logic;
SIGNAL \Add10~26_combout\ : std_logic;
SIGNAL \obstacle_hstart~20_combout\ : std_logic;
SIGNAL \Add10~27\ : std_logic;
SIGNAL \Add10~28_combout\ : std_logic;
SIGNAL \obstacle_hstart~19_combout\ : std_logic;
SIGNAL \Add10~29\ : std_logic;
SIGNAL \Add10~30_combout\ : std_logic;
SIGNAL \obstacle_hstart~18_combout\ : std_logic;
SIGNAL \Add10~31\ : std_logic;
SIGNAL \Add10~32_combout\ : std_logic;
SIGNAL \obstacle_hstart~17_combout\ : std_logic;
SIGNAL \Add10~33\ : std_logic;
SIGNAL \Add10~34_combout\ : std_logic;
SIGNAL \obstacle_hstart~16_combout\ : std_logic;
SIGNAL \Add10~35\ : std_logic;
SIGNAL \Add10~36_combout\ : std_logic;
SIGNAL \obstacle_hstart~15_combout\ : std_logic;
SIGNAL \Add10~37\ : std_logic;
SIGNAL \Add10~38_combout\ : std_logic;
SIGNAL \obstacle_hstart~14_combout\ : std_logic;
SIGNAL \Add10~39\ : std_logic;
SIGNAL \Add10~40_combout\ : std_logic;
SIGNAL \obstacle_hstart~13_combout\ : std_logic;
SIGNAL \Add10~41\ : std_logic;
SIGNAL \Add10~42_combout\ : std_logic;
SIGNAL \obstacle_hstart~12_combout\ : std_logic;
SIGNAL \Add10~43\ : std_logic;
SIGNAL \Add10~44_combout\ : std_logic;
SIGNAL \obstacle_hstart~11_combout\ : std_logic;
SIGNAL \Add10~45\ : std_logic;
SIGNAL \Add10~46_combout\ : std_logic;
SIGNAL \obstacle_hstart~10_combout\ : std_logic;
SIGNAL \Add10~47\ : std_logic;
SIGNAL \Add10~48_combout\ : std_logic;
SIGNAL \obstacle_hstart~9_combout\ : std_logic;
SIGNAL \Add10~49\ : std_logic;
SIGNAL \Add10~50_combout\ : std_logic;
SIGNAL \obstacle_hstart~8_combout\ : std_logic;
SIGNAL \Add10~51\ : std_logic;
SIGNAL \Add10~52_combout\ : std_logic;
SIGNAL \obstacle_hstart~7_combout\ : std_logic;
SIGNAL \Add10~53\ : std_logic;
SIGNAL \Add10~54_combout\ : std_logic;
SIGNAL \obstacle_hstart~6_combout\ : std_logic;
SIGNAL \Add10~55\ : std_logic;
SIGNAL \Add10~56_combout\ : std_logic;
SIGNAL \obstacle_hstart~5_combout\ : std_logic;
SIGNAL \Add10~57\ : std_logic;
SIGNAL \Add10~58_combout\ : std_logic;
SIGNAL \obstacle_hstart~4_combout\ : std_logic;
SIGNAL \LessThan21~1_cout\ : std_logic;
SIGNAL \LessThan21~3_cout\ : std_logic;
SIGNAL \LessThan21~5_cout\ : std_logic;
SIGNAL \LessThan21~7_cout\ : std_logic;
SIGNAL \LessThan21~9_cout\ : std_logic;
SIGNAL \LessThan21~11_cout\ : std_logic;
SIGNAL \LessThan21~13_cout\ : std_logic;
SIGNAL \LessThan21~15_cout\ : std_logic;
SIGNAL \LessThan21~17_cout\ : std_logic;
SIGNAL \LessThan21~19_cout\ : std_logic;
SIGNAL \LessThan21~21_cout\ : std_logic;
SIGNAL \LessThan21~23_cout\ : std_logic;
SIGNAL \LessThan21~25_cout\ : std_logic;
SIGNAL \LessThan21~27_cout\ : std_logic;
SIGNAL \LessThan21~29_cout\ : std_logic;
SIGNAL \LessThan21~31_cout\ : std_logic;
SIGNAL \LessThan21~33_cout\ : std_logic;
SIGNAL \LessThan21~35_cout\ : std_logic;
SIGNAL \LessThan21~37_cout\ : std_logic;
SIGNAL \LessThan21~39_cout\ : std_logic;
SIGNAL \LessThan21~41_cout\ : std_logic;
SIGNAL \LessThan21~43_cout\ : std_logic;
SIGNAL \LessThan21~45_cout\ : std_logic;
SIGNAL \LessThan21~47_cout\ : std_logic;
SIGNAL \LessThan21~49_cout\ : std_logic;
SIGNAL \LessThan21~51_cout\ : std_logic;
SIGNAL \LessThan21~53_cout\ : std_logic;
SIGNAL \LessThan21~55_cout\ : std_logic;
SIGNAL \LessThan21~57_cout\ : std_logic;
SIGNAL \LessThan21~58_combout\ : std_logic;
SIGNAL \LessThan19~8_combout\ : std_logic;
SIGNAL \LessThan19~9_combout\ : std_logic;
SIGNAL \LessThan19~10_combout\ : std_logic;
SIGNAL \r[3]~4_combout\ : std_logic;
SIGNAL \LessThan26~0_combout\ : std_logic;
SIGNAL \LessThan26~1_combout\ : std_logic;
SIGNAL \Add30~1_cout\ : std_logic;
SIGNAL \Add30~3\ : std_logic;
SIGNAL \Add30~5\ : std_logic;
SIGNAL \Add30~7\ : std_logic;
SIGNAL \Add30~9\ : std_logic;
SIGNAL \Add30~11\ : std_logic;
SIGNAL \Add30~13\ : std_logic;
SIGNAL \Add30~15\ : std_logic;
SIGNAL \Add30~17\ : std_logic;
SIGNAL \Add30~19\ : std_logic;
SIGNAL \Add30~21\ : std_logic;
SIGNAL \Add30~23\ : std_logic;
SIGNAL \Add30~25\ : std_logic;
SIGNAL \Add30~27\ : std_logic;
SIGNAL \Add30~29\ : std_logic;
SIGNAL \Add30~31\ : std_logic;
SIGNAL \Add30~33\ : std_logic;
SIGNAL \Add30~35\ : std_logic;
SIGNAL \Add30~37\ : std_logic;
SIGNAL \Add30~39\ : std_logic;
SIGNAL \Add30~41\ : std_logic;
SIGNAL \Add30~43\ : std_logic;
SIGNAL \Add30~45\ : std_logic;
SIGNAL \Add30~47\ : std_logic;
SIGNAL \Add30~49\ : std_logic;
SIGNAL \Add30~51\ : std_logic;
SIGNAL \Add30~53\ : std_logic;
SIGNAL \Add30~55\ : std_logic;
SIGNAL \Add30~57\ : std_logic;
SIGNAL \Add30~59\ : std_logic;
SIGNAL \Add30~60_combout\ : std_logic;
SIGNAL \Add30~58_combout\ : std_logic;
SIGNAL \Add30~56_combout\ : std_logic;
SIGNAL \Add30~54_combout\ : std_logic;
SIGNAL \Add30~52_combout\ : std_logic;
SIGNAL \Add30~50_combout\ : std_logic;
SIGNAL \Add30~48_combout\ : std_logic;
SIGNAL \Add30~46_combout\ : std_logic;
SIGNAL \Add30~44_combout\ : std_logic;
SIGNAL \Add30~42_combout\ : std_logic;
SIGNAL \Add30~40_combout\ : std_logic;
SIGNAL \Add30~38_combout\ : std_logic;
SIGNAL \Add30~36_combout\ : std_logic;
SIGNAL \Add30~34_combout\ : std_logic;
SIGNAL \Add30~32_combout\ : std_logic;
SIGNAL \Add30~30_combout\ : std_logic;
SIGNAL \Add30~28_combout\ : std_logic;
SIGNAL \Add30~26_combout\ : std_logic;
SIGNAL \Add30~24_combout\ : std_logic;
SIGNAL \Add30~22_combout\ : std_logic;
SIGNAL \Add30~20_combout\ : std_logic;
SIGNAL \Add30~18_combout\ : std_logic;
SIGNAL \Add30~16_combout\ : std_logic;
SIGNAL \Add30~14_combout\ : std_logic;
SIGNAL \Add30~12_combout\ : std_logic;
SIGNAL \Add30~10_combout\ : std_logic;
SIGNAL \Add30~8_combout\ : std_logic;
SIGNAL \Add30~6_combout\ : std_logic;
SIGNAL \Add30~4_combout\ : std_logic;
SIGNAL \Add30~2_combout\ : std_logic;
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
SIGNAL \LessThan27~61_cout\ : std_logic;
SIGNAL \LessThan27~62_combout\ : std_logic;
SIGNAL \Add31~1\ : std_logic;
SIGNAL \Add31~3\ : std_logic;
SIGNAL \Add31~5\ : std_logic;
SIGNAL \Add31~7\ : std_logic;
SIGNAL \Add31~9\ : std_logic;
SIGNAL \Add31~11\ : std_logic;
SIGNAL \Add31~13\ : std_logic;
SIGNAL \Add31~15\ : std_logic;
SIGNAL \Add31~17\ : std_logic;
SIGNAL \Add31~19\ : std_logic;
SIGNAL \Add31~21\ : std_logic;
SIGNAL \Add31~23\ : std_logic;
SIGNAL \Add31~25\ : std_logic;
SIGNAL \Add31~27\ : std_logic;
SIGNAL \Add31~29\ : std_logic;
SIGNAL \Add31~31\ : std_logic;
SIGNAL \Add31~33\ : std_logic;
SIGNAL \Add31~35\ : std_logic;
SIGNAL \Add31~37\ : std_logic;
SIGNAL \Add31~39\ : std_logic;
SIGNAL \Add31~41\ : std_logic;
SIGNAL \Add31~43\ : std_logic;
SIGNAL \Add31~45\ : std_logic;
SIGNAL \Add31~47\ : std_logic;
SIGNAL \Add31~49\ : std_logic;
SIGNAL \Add31~51\ : std_logic;
SIGNAL \Add31~53\ : std_logic;
SIGNAL \Add31~54_combout\ : std_logic;
SIGNAL \Add31~52_combout\ : std_logic;
SIGNAL \Add31~50_combout\ : std_logic;
SIGNAL \Add31~48_combout\ : std_logic;
SIGNAL \Add31~46_combout\ : std_logic;
SIGNAL \Add31~44_combout\ : std_logic;
SIGNAL \Add31~42_combout\ : std_logic;
SIGNAL \Add31~40_combout\ : std_logic;
SIGNAL \Add31~38_combout\ : std_logic;
SIGNAL \Add31~36_combout\ : std_logic;
SIGNAL \Add31~34_combout\ : std_logic;
SIGNAL \Add31~32_combout\ : std_logic;
SIGNAL \Add31~30_combout\ : std_logic;
SIGNAL \Add31~28_combout\ : std_logic;
SIGNAL \Add31~26_combout\ : std_logic;
SIGNAL \Add31~24_combout\ : std_logic;
SIGNAL \Add31~22_combout\ : std_logic;
SIGNAL \Add31~20_combout\ : std_logic;
SIGNAL \Add31~18_combout\ : std_logic;
SIGNAL \Add31~16_combout\ : std_logic;
SIGNAL \Add31~14_combout\ : std_logic;
SIGNAL \Add31~12_combout\ : std_logic;
SIGNAL \Add31~10_combout\ : std_logic;
SIGNAL \Add31~8_combout\ : std_logic;
SIGNAL \Add31~6_combout\ : std_logic;
SIGNAL \Add31~4_combout\ : std_logic;
SIGNAL \Add31~2_combout\ : std_logic;
SIGNAL \Add31~0_combout\ : std_logic;
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
SIGNAL \LessThan28~61_cout\ : std_logic;
SIGNAL \LessThan28~62_combout\ : std_logic;
SIGNAL \r[3]~5_combout\ : std_logic;
SIGNAL \LessThan23~0_combout\ : std_logic;
SIGNAL \LessThan23~1_combout\ : std_logic;
SIGNAL \LessThan23~2_combout\ : std_logic;
SIGNAL \Add28~1_cout\ : std_logic;
SIGNAL \Add28~3\ : std_logic;
SIGNAL \Add28~5\ : std_logic;
SIGNAL \Add28~7\ : std_logic;
SIGNAL \Add28~9\ : std_logic;
SIGNAL \Add28~11\ : std_logic;
SIGNAL \Add28~13\ : std_logic;
SIGNAL \Add28~15\ : std_logic;
SIGNAL \Add28~17\ : std_logic;
SIGNAL \Add28~19\ : std_logic;
SIGNAL \Add28~21\ : std_logic;
SIGNAL \Add28~23\ : std_logic;
SIGNAL \Add28~25\ : std_logic;
SIGNAL \Add28~27\ : std_logic;
SIGNAL \Add28~29\ : std_logic;
SIGNAL \Add28~31\ : std_logic;
SIGNAL \Add28~33\ : std_logic;
SIGNAL \Add28~35\ : std_logic;
SIGNAL \Add28~37\ : std_logic;
SIGNAL \Add28~39\ : std_logic;
SIGNAL \Add28~41\ : std_logic;
SIGNAL \Add28~43\ : std_logic;
SIGNAL \Add28~45\ : std_logic;
SIGNAL \Add28~47\ : std_logic;
SIGNAL \Add28~49\ : std_logic;
SIGNAL \Add28~51\ : std_logic;
SIGNAL \Add28~53\ : std_logic;
SIGNAL \Add28~54_combout\ : std_logic;
SIGNAL \Add28~52_combout\ : std_logic;
SIGNAL \Add28~50_combout\ : std_logic;
SIGNAL \Add28~48_combout\ : std_logic;
SIGNAL \Add28~46_combout\ : std_logic;
SIGNAL \Add28~44_combout\ : std_logic;
SIGNAL \Add28~42_combout\ : std_logic;
SIGNAL \Add28~40_combout\ : std_logic;
SIGNAL \Add28~38_combout\ : std_logic;
SIGNAL \Add28~36_combout\ : std_logic;
SIGNAL \Add28~34_combout\ : std_logic;
SIGNAL \Add28~32_combout\ : std_logic;
SIGNAL \Add28~30_combout\ : std_logic;
SIGNAL \Add28~28_combout\ : std_logic;
SIGNAL \Add28~26_combout\ : std_logic;
SIGNAL \Add28~24_combout\ : std_logic;
SIGNAL \Add28~22_combout\ : std_logic;
SIGNAL \Add28~20_combout\ : std_logic;
SIGNAL \Add28~18_combout\ : std_logic;
SIGNAL \Add28~16_combout\ : std_logic;
SIGNAL \Add28~14_combout\ : std_logic;
SIGNAL \Add28~12_combout\ : std_logic;
SIGNAL \Add28~10_combout\ : std_logic;
SIGNAL \Add28~8_combout\ : std_logic;
SIGNAL \Add28~6_combout\ : std_logic;
SIGNAL \Add28~4_combout\ : std_logic;
SIGNAL \Add28~2_combout\ : std_logic;
SIGNAL \LessThan25~1_cout\ : std_logic;
SIGNAL \LessThan25~3_cout\ : std_logic;
SIGNAL \LessThan25~5_cout\ : std_logic;
SIGNAL \LessThan25~7_cout\ : std_logic;
SIGNAL \LessThan25~9_cout\ : std_logic;
SIGNAL \LessThan25~11_cout\ : std_logic;
SIGNAL \LessThan25~13_cout\ : std_logic;
SIGNAL \LessThan25~15_cout\ : std_logic;
SIGNAL \LessThan25~17_cout\ : std_logic;
SIGNAL \LessThan25~19_cout\ : std_logic;
SIGNAL \LessThan25~21_cout\ : std_logic;
SIGNAL \LessThan25~23_cout\ : std_logic;
SIGNAL \LessThan25~25_cout\ : std_logic;
SIGNAL \LessThan25~27_cout\ : std_logic;
SIGNAL \LessThan25~29_cout\ : std_logic;
SIGNAL \LessThan25~31_cout\ : std_logic;
SIGNAL \LessThan25~33_cout\ : std_logic;
SIGNAL \LessThan25~35_cout\ : std_logic;
SIGNAL \LessThan25~37_cout\ : std_logic;
SIGNAL \LessThan25~39_cout\ : std_logic;
SIGNAL \LessThan25~41_cout\ : std_logic;
SIGNAL \LessThan25~43_cout\ : std_logic;
SIGNAL \LessThan25~45_cout\ : std_logic;
SIGNAL \LessThan25~47_cout\ : std_logic;
SIGNAL \LessThan25~49_cout\ : std_logic;
SIGNAL \LessThan25~51_cout\ : std_logic;
SIGNAL \LessThan25~53_cout\ : std_logic;
SIGNAL \LessThan25~55_cout\ : std_logic;
SIGNAL \LessThan25~57_cout\ : std_logic;
SIGNAL \LessThan25~59_cout\ : std_logic;
SIGNAL \LessThan25~61_cout\ : std_logic;
SIGNAL \LessThan25~62_combout\ : std_logic;
SIGNAL \Add27~1\ : std_logic;
SIGNAL \Add27~3\ : std_logic;
SIGNAL \Add27~5\ : std_logic;
SIGNAL \Add27~7\ : std_logic;
SIGNAL \Add27~9\ : std_logic;
SIGNAL \Add27~11\ : std_logic;
SIGNAL \Add27~13\ : std_logic;
SIGNAL \Add27~15\ : std_logic;
SIGNAL \Add27~17\ : std_logic;
SIGNAL \Add27~19\ : std_logic;
SIGNAL \Add27~21\ : std_logic;
SIGNAL \Add27~23\ : std_logic;
SIGNAL \Add27~25\ : std_logic;
SIGNAL \Add27~27\ : std_logic;
SIGNAL \Add27~29\ : std_logic;
SIGNAL \Add27~31\ : std_logic;
SIGNAL \Add27~33\ : std_logic;
SIGNAL \Add27~35\ : std_logic;
SIGNAL \Add27~37\ : std_logic;
SIGNAL \Add27~39\ : std_logic;
SIGNAL \Add27~41\ : std_logic;
SIGNAL \Add27~43\ : std_logic;
SIGNAL \Add27~45\ : std_logic;
SIGNAL \Add27~47\ : std_logic;
SIGNAL \Add27~49\ : std_logic;
SIGNAL \Add27~51\ : std_logic;
SIGNAL \Add27~53\ : std_logic;
SIGNAL \Add27~55\ : std_logic;
SIGNAL \Add27~56_combout\ : std_logic;
SIGNAL \Add27~54_combout\ : std_logic;
SIGNAL \Add27~52_combout\ : std_logic;
SIGNAL \Add27~50_combout\ : std_logic;
SIGNAL \Add27~48_combout\ : std_logic;
SIGNAL \Add27~46_combout\ : std_logic;
SIGNAL \Add27~44_combout\ : std_logic;
SIGNAL \Add27~42_combout\ : std_logic;
SIGNAL \Add27~40_combout\ : std_logic;
SIGNAL \Add27~38_combout\ : std_logic;
SIGNAL \Add27~36_combout\ : std_logic;
SIGNAL \Add27~34_combout\ : std_logic;
SIGNAL \Add27~32_combout\ : std_logic;
SIGNAL \Add27~30_combout\ : std_logic;
SIGNAL \Add27~28_combout\ : std_logic;
SIGNAL \Add27~26_combout\ : std_logic;
SIGNAL \Add27~24_combout\ : std_logic;
SIGNAL \Add27~22_combout\ : std_logic;
SIGNAL \Add27~20_combout\ : std_logic;
SIGNAL \Add27~18_combout\ : std_logic;
SIGNAL \Add27~16_combout\ : std_logic;
SIGNAL \Add27~14_combout\ : std_logic;
SIGNAL \Add27~12_combout\ : std_logic;
SIGNAL \Add27~10_combout\ : std_logic;
SIGNAL \Add27~8_combout\ : std_logic;
SIGNAL \Add27~6_combout\ : std_logic;
SIGNAL \Add27~4_combout\ : std_logic;
SIGNAL \Add27~2_combout\ : std_logic;
SIGNAL \Add27~0_combout\ : std_logic;
SIGNAL \LessThan24~1_cout\ : std_logic;
SIGNAL \LessThan24~3_cout\ : std_logic;
SIGNAL \LessThan24~5_cout\ : std_logic;
SIGNAL \LessThan24~7_cout\ : std_logic;
SIGNAL \LessThan24~9_cout\ : std_logic;
SIGNAL \LessThan24~11_cout\ : std_logic;
SIGNAL \LessThan24~13_cout\ : std_logic;
SIGNAL \LessThan24~15_cout\ : std_logic;
SIGNAL \LessThan24~17_cout\ : std_logic;
SIGNAL \LessThan24~19_cout\ : std_logic;
SIGNAL \LessThan24~21_cout\ : std_logic;
SIGNAL \LessThan24~23_cout\ : std_logic;
SIGNAL \LessThan24~25_cout\ : std_logic;
SIGNAL \LessThan24~27_cout\ : std_logic;
SIGNAL \LessThan24~29_cout\ : std_logic;
SIGNAL \LessThan24~31_cout\ : std_logic;
SIGNAL \LessThan24~33_cout\ : std_logic;
SIGNAL \LessThan24~35_cout\ : std_logic;
SIGNAL \LessThan24~37_cout\ : std_logic;
SIGNAL \LessThan24~39_cout\ : std_logic;
SIGNAL \LessThan24~41_cout\ : std_logic;
SIGNAL \LessThan24~43_cout\ : std_logic;
SIGNAL \LessThan24~45_cout\ : std_logic;
SIGNAL \LessThan24~47_cout\ : std_logic;
SIGNAL \LessThan24~49_cout\ : std_logic;
SIGNAL \LessThan24~51_cout\ : std_logic;
SIGNAL \LessThan24~53_cout\ : std_logic;
SIGNAL \LessThan24~55_cout\ : std_logic;
SIGNAL \LessThan24~57_cout\ : std_logic;
SIGNAL \LessThan24~59_cout\ : std_logic;
SIGNAL \LessThan24~61_cout\ : std_logic;
SIGNAL \LessThan24~62_combout\ : std_logic;
SIGNAL \r[3]~3_combout\ : std_logic;
SIGNAL \r[3]~6_combout\ : std_logic;
SIGNAL \r[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\ : std_logic;
SIGNAL \r~7_combout\ : std_logic;
SIGNAL \r[1]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\ : std_logic;
SIGNAL \r~8_combout\ : std_logic;
SIGNAL \r[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\ : std_logic;
SIGNAL \r~9_combout\ : std_logic;
SIGNAL \r[3]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\ : std_logic;
SIGNAL \g~0_combout\ : std_logic;
SIGNAL \g[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\ : std_logic;
SIGNAL \g~1_combout\ : std_logic;
SIGNAL \g[1]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a18~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a42~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\ : std_logic;
SIGNAL \g~2_combout\ : std_logic;
SIGNAL \g[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\ : std_logic;
SIGNAL \g~3_combout\ : std_logic;
SIGNAL \g[3]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a24~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\ : std_logic;
SIGNAL \b~0_combout\ : std_logic;
SIGNAL \b[0]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a37~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a25~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\ : std_logic;
SIGNAL \b~1_combout\ : std_logic;
SIGNAL \b[1]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\ : std_logic;
SIGNAL \b~2_combout\ : std_logic;
SIGNAL \b[2]~reg0_q\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ : std_logic;
SIGNAL \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\ : std_logic;
SIGNAL \b~3_combout\ : std_logic;
SIGNAL \b[3]~reg0_q\ : std_logic;
SIGNAL \process_0~15_combout\ : std_logic;
SIGNAL \process_0~16_combout\ : std_logic;
SIGNAL \process_0~17_combout\ : std_logic;
SIGNAL \hsync~reg0_q\ : std_logic;
SIGNAL \process_0~18_combout\ : std_logic;
SIGNAL \process_0~19_combout\ : std_logic;
SIGNAL \vsync~reg0_q\ : std_logic;
SIGNAL vposition : std_logic_vector(31 DOWNTO 0);
SIGNAL hposition : std_logic_vector(31 DOWNTO 0);
SIGNAL \disp_clk|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL count : std_logic_vector(31 DOWNTO 0);
SIGNAL bg_address : std_logic_vector(14 DOWNTO 0);
SIGNAL bg_hstop : std_logic_vector(31 DOWNTO 0);
SIGNAL bg_hstart : std_logic_vector(31 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|out_address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL obstacle_hstop : std_logic_vector(31 DOWNTO 0);
SIGNAL obstacle_hstart : std_logic_vector(31 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|address_reg_a\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_r[3]~6_combout\ : std_logic;
SIGNAL \ALT_INV_b[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_b[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_b[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_b[0]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_g[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_g[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_g[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_g[0]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_r[3]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_r[2]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_r[1]~reg0_q\ : std_logic;
SIGNAL \ALT_INV_r[0]~reg0_q\ : std_logic;

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
\ALT_INV_r[3]~6_combout\ <= NOT \r[3]~6_combout\;
\ALT_INV_b[3]~reg0_q\ <= NOT \b[3]~reg0_q\;
\ALT_INV_b[2]~reg0_q\ <= NOT \b[2]~reg0_q\;
\ALT_INV_b[1]~reg0_q\ <= NOT \b[1]~reg0_q\;
\ALT_INV_b[0]~reg0_q\ <= NOT \b[0]~reg0_q\;
\ALT_INV_g[3]~reg0_q\ <= NOT \g[3]~reg0_q\;
\ALT_INV_g[2]~reg0_q\ <= NOT \g[2]~reg0_q\;
\ALT_INV_g[1]~reg0_q\ <= NOT \g[1]~reg0_q\;
\ALT_INV_g[0]~reg0_q\ <= NOT \g[0]~reg0_q\;
\ALT_INV_r[3]~reg0_q\ <= NOT \r[3]~reg0_q\;
\ALT_INV_r[2]~reg0_q\ <= NOT \r[2]~reg0_q\;
\ALT_INV_r[1]~reg0_q\ <= NOT \r[1]~reg0_q\;
\ALT_INV_r[0]~reg0_q\ <= NOT \r[0]~reg0_q\;

-- Location: LCCOMB_X44_Y52_N16
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
	i => \ALT_INV_r[0]~reg0_q\,
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
	i => \ALT_INV_r[1]~reg0_q\,
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
	i => \ALT_INV_r[2]~reg0_q\,
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
	i => \ALT_INV_r[3]~reg0_q\,
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
	i => \ALT_INV_g[0]~reg0_q\,
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
	i => \ALT_INV_g[1]~reg0_q\,
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
	i => \ALT_INV_g[2]~reg0_q\,
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
	i => \ALT_INV_g[3]~reg0_q\,
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
	i => \ALT_INV_b[0]~reg0_q\,
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
	i => \ALT_INV_b[1]~reg0_q\,
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
	i => \ALT_INV_b[2]~reg0_q\,
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
	i => \ALT_INV_b[3]~reg0_q\,
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

-- Location: LCCOMB_X35_Y20_N0
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

-- Location: LCCOMB_X35_Y20_N20
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

-- Location: LCCOMB_X35_Y20_N22
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

-- Location: FF_X35_Y20_N23
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

-- Location: LCCOMB_X35_Y20_N24
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

-- Location: FF_X35_Y20_N25
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

-- Location: LCCOMB_X35_Y20_N26
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

-- Location: FF_X35_Y20_N27
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

-- Location: LCCOMB_X35_Y20_N28
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

-- Location: FF_X35_Y20_N29
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

-- Location: LCCOMB_X35_Y20_N30
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

-- Location: FF_X35_Y20_N31
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

-- Location: LCCOMB_X35_Y19_N0
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

-- Location: FF_X35_Y19_N1
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

-- Location: LCCOMB_X35_Y19_N2
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

-- Location: FF_X35_Y19_N3
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

-- Location: LCCOMB_X35_Y19_N4
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

-- Location: FF_X35_Y19_N5
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

-- Location: LCCOMB_X35_Y19_N6
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

-- Location: FF_X35_Y19_N7
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

-- Location: LCCOMB_X35_Y19_N8
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

-- Location: FF_X35_Y19_N9
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

-- Location: LCCOMB_X35_Y19_N10
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

-- Location: FF_X35_Y19_N11
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

-- Location: LCCOMB_X35_Y19_N12
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

-- Location: FF_X35_Y19_N13
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

-- Location: LCCOMB_X35_Y19_N14
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

-- Location: FF_X35_Y19_N15
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

-- Location: LCCOMB_X35_Y19_N16
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

-- Location: FF_X35_Y19_N17
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

-- Location: LCCOMB_X35_Y19_N18
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

-- Location: FF_X35_Y19_N19
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

-- Location: LCCOMB_X35_Y19_N20
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

-- Location: FF_X35_Y19_N21
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

-- Location: LCCOMB_X35_Y19_N22
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

-- Location: FF_X35_Y19_N23
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

-- Location: LCCOMB_X35_Y19_N24
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

-- Location: FF_X35_Y19_N25
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

-- Location: LCCOMB_X35_Y19_N26
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

-- Location: FF_X35_Y19_N27
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

-- Location: LCCOMB_X35_Y19_N28
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

-- Location: FF_X35_Y19_N29
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

-- Location: LCCOMB_X35_Y19_N30
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

-- Location: FF_X35_Y19_N31
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

-- Location: LCCOMB_X34_Y19_N30
\LessThan5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~0_combout\ = (!hposition(27) & (!hposition(28) & (!hposition(29) & !hposition(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => hposition(28),
	datac => hposition(29),
	datad => hposition(30),
	combout => \LessThan5~0_combout\);

-- Location: LCCOMB_X37_Y20_N24
\LessThan5~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~5_combout\ = (!hposition(24) & (!hposition(25) & (!hposition(26) & !hposition(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => hposition(25),
	datac => hposition(26),
	datad => hposition(23),
	combout => \LessThan5~5_combout\);

-- Location: LCCOMB_X37_Y20_N10
\LessThan5~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~2_combout\ = (!hposition(17) & (!hposition(18) & (!hposition(15) & !hposition(16))))

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
	combout => \LessThan5~2_combout\);

-- Location: LCCOMB_X37_Y20_N0
\LessThan5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~1_combout\ = (!hposition(12) & !hposition(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(12),
	datad => hposition(11),
	combout => \LessThan5~1_combout\);

-- Location: LCCOMB_X37_Y20_N4
\LessThan5~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~3_combout\ = (\LessThan5~2_combout\ & (!hposition(14) & (!hposition(13) & \LessThan5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~2_combout\,
	datab => hposition(14),
	datac => hposition(13),
	datad => \LessThan5~1_combout\,
	combout => \LessThan5~3_combout\);

-- Location: LCCOMB_X37_Y20_N6
\LessThan5~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~4_combout\ = (!hposition(20) & (!hposition(21) & (!hposition(19) & !hposition(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => hposition(21),
	datac => hposition(19),
	datad => hposition(22),
	combout => \LessThan5~4_combout\);

-- Location: LCCOMB_X37_Y20_N18
\LessThan5~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~6_combout\ = (\LessThan5~0_combout\ & (\LessThan5~5_combout\ & (\LessThan5~3_combout\ & \LessThan5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan5~0_combout\,
	datab => \LessThan5~5_combout\,
	datac => \LessThan5~3_combout\,
	datad => \LessThan5~4_combout\,
	combout => \LessThan5~6_combout\);

-- Location: LCCOMB_X38_Y18_N0
\LessThan5~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~7_combout\ = (!hposition(9) & (((!hposition(6) & !hposition(7))) # (!hposition(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => hposition(9),
	datac => hposition(6),
	datad => hposition(7),
	combout => \LessThan5~7_combout\);

-- Location: LCCOMB_X38_Y18_N18
\LessThan5~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan5~8_combout\ = (!hposition(31) & (((hposition(10) & !\LessThan5~7_combout\)) # (!\LessThan5~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => hposition(31),
	datac => \LessThan5~6_combout\,
	datad => \LessThan5~7_combout\,
	combout => \LessThan5~8_combout\);

-- Location: FF_X35_Y20_N1
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

-- Location: LCCOMB_X35_Y20_N2
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

-- Location: FF_X35_Y20_N3
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

-- Location: LCCOMB_X35_Y20_N4
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

-- Location: FF_X35_Y20_N5
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

-- Location: LCCOMB_X35_Y20_N6
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

-- Location: FF_X35_Y20_N7
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

-- Location: LCCOMB_X35_Y20_N8
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

-- Location: FF_X35_Y20_N9
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

-- Location: LCCOMB_X35_Y20_N10
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

-- Location: FF_X35_Y20_N11
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

-- Location: LCCOMB_X35_Y20_N12
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

-- Location: FF_X35_Y20_N13
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

-- Location: LCCOMB_X35_Y20_N14
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

-- Location: FF_X35_Y20_N15
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

-- Location: LCCOMB_X35_Y20_N16
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

-- Location: FF_X35_Y20_N17
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

-- Location: LCCOMB_X35_Y20_N18
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

-- Location: FF_X35_Y20_N19
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

-- Location: FF_X35_Y20_N21
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

-- Location: LCCOMB_X38_Y18_N28
\LessThan18~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan18~0_combout\ = (hposition(3)) # ((hposition(2)) # ((hposition(1)) # (hposition(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => hposition(2),
	datac => hposition(1),
	datad => hposition(0),
	combout => \LessThan18~0_combout\);

-- Location: LCCOMB_X38_Y18_N6
\LessThan18~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan18~1_combout\ = (hposition(6) & ((hposition(5)) # ((hposition(4)) # (\LessThan18~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datab => hposition(5),
	datac => hposition(4),
	datad => \LessThan18~0_combout\,
	combout => \LessThan18~1_combout\);

-- Location: LCCOMB_X38_Y18_N16
\LessThan18~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan18~2_combout\ = (hposition(9)) # ((hposition(8) & ((hposition(7)) # (\LessThan18~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => hposition(7),
	datac => hposition(9),
	datad => \LessThan18~1_combout\,
	combout => \LessThan18~2_combout\);

-- Location: LCCOMB_X43_Y18_N0
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

-- Location: LCCOMB_X43_Y21_N18
\LessThan6~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~1_combout\ = (!vposition(4) & (!vposition(3) & ((!vposition(1)) # (!vposition(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => vposition(3),
	datac => vposition(2),
	datad => vposition(1),
	combout => \LessThan6~1_combout\);

-- Location: LCCOMB_X43_Y18_N10
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

-- Location: LCCOMB_X43_Y18_N12
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

-- Location: FF_X43_Y18_N13
\vposition[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[6]~44_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(6));

-- Location: LCCOMB_X43_Y18_N14
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

-- Location: FF_X43_Y18_N15
\vposition[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[7]~46_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(7));

-- Location: LCCOMB_X42_Y20_N0
\LessThan6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~0_combout\ = (!vposition(6) & !vposition(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datad => vposition(7),
	combout => \LessThan6~0_combout\);

-- Location: LCCOMB_X43_Y18_N16
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

-- Location: FF_X43_Y18_N17
\vposition[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[8]~48_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(8));

-- Location: LCCOMB_X43_Y18_N18
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

-- Location: FF_X43_Y18_N19
\vposition[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[9]~50_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(9));

-- Location: LCCOMB_X43_Y21_N6
\LessThan20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~0_combout\ = (vposition(8) & vposition(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => vposition(8),
	datad => vposition(9),
	combout => \LessThan20~0_combout\);

-- Location: LCCOMB_X43_Y21_N12
\LessThan6~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~2_combout\ = ((\LessThan6~0_combout\ & ((\LessThan6~1_combout\) # (!vposition(5))))) # (!\LessThan20~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datab => \LessThan6~1_combout\,
	datac => \LessThan6~0_combout\,
	datad => \LessThan20~0_combout\,
	combout => \LessThan6~2_combout\);

-- Location: LCCOMB_X43_Y18_N20
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

-- Location: FF_X43_Y18_N21
\vposition[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[10]~52_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(10));

-- Location: LCCOMB_X43_Y18_N22
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

-- Location: FF_X43_Y18_N23
\vposition[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[11]~54_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(11));

-- Location: LCCOMB_X43_Y18_N24
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

-- Location: FF_X43_Y18_N25
\vposition[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[12]~56_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(12));

-- Location: LCCOMB_X43_Y18_N26
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

-- Location: FF_X43_Y18_N27
\vposition[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[13]~58_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(13));

-- Location: LCCOMB_X43_Y18_N28
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

-- Location: FF_X43_Y18_N29
\vposition[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[14]~60_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(14));

-- Location: LCCOMB_X43_Y18_N30
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

-- Location: FF_X43_Y18_N31
\vposition[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[15]~62_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(15));

-- Location: LCCOMB_X43_Y17_N0
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

-- Location: FF_X43_Y17_N1
\vposition[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[16]~64_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(16));

-- Location: LCCOMB_X43_Y17_N2
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

-- Location: FF_X43_Y17_N3
\vposition[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[17]~66_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(17));

-- Location: LCCOMB_X43_Y17_N4
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

-- Location: FF_X43_Y17_N5
\vposition[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[18]~68_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(18));

-- Location: LCCOMB_X43_Y17_N6
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

-- Location: FF_X43_Y17_N7
\vposition[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[19]~70_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(19));

-- Location: LCCOMB_X43_Y17_N8
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

-- Location: FF_X43_Y17_N9
\vposition[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[20]~72_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(20));

-- Location: LCCOMB_X43_Y17_N10
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

-- Location: FF_X43_Y17_N11
\vposition[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[21]~74_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(21));

-- Location: LCCOMB_X43_Y17_N12
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

-- Location: FF_X43_Y17_N13
\vposition[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[22]~76_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(22));

-- Location: LCCOMB_X43_Y17_N14
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

-- Location: FF_X43_Y17_N15
\vposition[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[23]~78_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(23));

-- Location: LCCOMB_X43_Y17_N16
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

-- Location: FF_X43_Y17_N17
\vposition[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[24]~80_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(24));

-- Location: LCCOMB_X43_Y17_N18
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

-- Location: FF_X43_Y17_N19
\vposition[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[25]~82_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(25));

-- Location: LCCOMB_X43_Y17_N20
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

-- Location: FF_X43_Y17_N21
\vposition[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[26]~84_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(26));

-- Location: LCCOMB_X43_Y17_N22
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

-- Location: FF_X43_Y17_N23
\vposition[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[27]~86_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(27));

-- Location: LCCOMB_X43_Y17_N24
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

-- Location: FF_X43_Y17_N25
\vposition[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[28]~88_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(28));

-- Location: LCCOMB_X43_Y17_N26
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

-- Location: FF_X43_Y17_N27
\vposition[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[29]~90_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(29));

-- Location: LCCOMB_X43_Y17_N28
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

-- Location: FF_X43_Y17_N29
\vposition[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[30]~92_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(30));

-- Location: LCCOMB_X43_Y17_N30
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

-- Location: FF_X43_Y17_N31
\vposition[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[31]~94_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(31));

-- Location: LCCOMB_X44_Y17_N26
\LessThan19~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~5_combout\ = (!vposition(27) & (!vposition(28) & (!vposition(29) & !vposition(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(27),
	datab => vposition(28),
	datac => vposition(29),
	datad => vposition(26),
	combout => \LessThan19~5_combout\);

-- Location: LCCOMB_X44_Y17_N12
\LessThan19~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~2_combout\ = (!vposition(21) & (!vposition(19) & (!vposition(18) & !vposition(20))))

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
	combout => \LessThan19~2_combout\);

-- Location: LCCOMB_X44_Y17_N24
\LessThan19~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~0_combout\ = (!vposition(13) & (!vposition(11) & (!vposition(12) & !vposition(10))))

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
	combout => \LessThan19~0_combout\);

-- Location: LCCOMB_X44_Y17_N22
\LessThan19~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~3_combout\ = (!vposition(22) & (!vposition(25) & (!vposition(24) & !vposition(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(22),
	datab => vposition(25),
	datac => vposition(24),
	datad => vposition(23),
	combout => \LessThan19~3_combout\);

-- Location: LCCOMB_X44_Y17_N10
\LessThan19~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~1_combout\ = (!vposition(17) & (!vposition(14) & (!vposition(16) & !vposition(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(17),
	datab => vposition(14),
	datac => vposition(16),
	datad => vposition(15),
	combout => \LessThan19~1_combout\);

-- Location: LCCOMB_X44_Y17_N0
\LessThan19~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~4_combout\ = (\LessThan19~2_combout\ & (\LessThan19~0_combout\ & (\LessThan19~3_combout\ & \LessThan19~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~2_combout\,
	datab => \LessThan19~0_combout\,
	datac => \LessThan19~3_combout\,
	datad => \LessThan19~1_combout\,
	combout => \LessThan19~4_combout\);

-- Location: LCCOMB_X44_Y17_N20
\LessThan19~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~6_combout\ = (\LessThan19~5_combout\ & (!vposition(30) & \LessThan19~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~5_combout\,
	datac => vposition(30),
	datad => \LessThan19~4_combout\,
	combout => \LessThan19~6_combout\);

-- Location: LCCOMB_X43_Y21_N14
\LessThan6~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan6~3_combout\ = (!vposition(31) & ((!\LessThan19~6_combout\) # (!\LessThan6~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan6~2_combout\,
	datac => vposition(31),
	datad => \LessThan19~6_combout\,
	combout => \LessThan6~3_combout\);

-- Location: FF_X43_Y18_N1
\vposition[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[0]~32_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(0));

-- Location: LCCOMB_X43_Y18_N2
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

-- Location: FF_X43_Y18_N3
\vposition[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[1]~34_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(1));

-- Location: LCCOMB_X43_Y18_N4
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

-- Location: FF_X43_Y18_N5
\vposition[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[2]~36_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(2));

-- Location: LCCOMB_X43_Y18_N6
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

-- Location: FF_X43_Y18_N7
\vposition[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[3]~38_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(3));

-- Location: LCCOMB_X43_Y18_N8
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

-- Location: FF_X43_Y18_N9
\vposition[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[4]~40_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(4));

-- Location: FF_X43_Y18_N11
\vposition[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \vposition[5]~42_combout\,
	sclr => \LessThan6~3_combout\,
	ena => \LessThan5~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => vposition(5));

-- Location: LCCOMB_X43_Y21_N10
\process_0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~2_combout\ = (!vposition(5) & (\LessThan6~0_combout\ & (!vposition(31) & \LessThan19~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datab => \LessThan6~0_combout\,
	datac => vposition(31),
	datad => \LessThan19~6_combout\,
	combout => \process_0~2_combout\);

-- Location: LCCOMB_X38_Y18_N26
\process_0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~4_combout\ = (!hposition(31) & \LessThan5~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(31),
	datac => \LessThan5~6_combout\,
	combout => \process_0~4_combout\);

-- Location: LCCOMB_X38_Y18_N30
\LessThan17~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan17~1_combout\ = (!hposition(9) & (!hposition(10) & !hposition(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => hposition(9),
	datac => hposition(10),
	datad => hposition(8),
	combout => \LessThan17~1_combout\);

-- Location: LCCOMB_X42_Y20_N10
\LessThan15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan15~0_combout\ = (!vposition(6) & (!vposition(5) & !vposition(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datac => vposition(5),
	datad => vposition(7),
	combout => \LessThan15~0_combout\);

-- Location: LCCOMB_X38_Y18_N4
\LessThan17~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan17~0_combout\ = (!hposition(6) & (!hposition(9) & (!hposition(10) & !hposition(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datab => hposition(9),
	datac => hposition(10),
	datad => hposition(7),
	combout => \LessThan17~0_combout\);

-- Location: LCCOMB_X43_Y21_N8
\process_0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~5_combout\ = (!vposition(4) & (!vposition(3) & (!vposition(2) & !vposition(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => vposition(3),
	datac => vposition(2),
	datad => vposition(1),
	combout => \process_0~5_combout\);

-- Location: LCCOMB_X38_Y18_N24
\process_0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~6_combout\ = (!\LessThan17~1_combout\ & (!\LessThan17~0_combout\ & ((!\process_0~5_combout\) # (!\LessThan15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan17~1_combout\,
	datab => \LessThan15~0_combout\,
	datac => \LessThan17~0_combout\,
	datad => \process_0~5_combout\,
	combout => \process_0~6_combout\);

-- Location: LCCOMB_X43_Y21_N28
\process_0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~3_combout\ = (!vposition(4) & (!vposition(2) & !vposition(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datac => vposition(2),
	datad => vposition(3),
	combout => \process_0~3_combout\);

-- Location: LCCOMB_X38_Y18_N10
\process_0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~7_combout\ = (\process_0~4_combout\ & (\process_0~6_combout\ & (\LessThan20~0_combout\ & \process_0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~4_combout\,
	datab => \process_0~6_combout\,
	datac => \LessThan20~0_combout\,
	datad => \process_0~3_combout\,
	combout => \process_0~7_combout\);

-- Location: LCCOMB_X38_Y18_N2
\process_0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~8_combout\ = (\process_0~2_combout\ & (\process_0~7_combout\ & ((!\LessThan18~2_combout\) # (!hposition(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \LessThan18~2_combout\,
	datac => \process_0~2_combout\,
	datad => \process_0~7_combout\,
	combout => \process_0~8_combout\);

-- Location: LCCOMB_X43_Y21_N2
\process_0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~9_combout\ = (vposition(8) & (\LessThan6~0_combout\ & ((\process_0~5_combout\) # (!vposition(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(8),
	datab => \LessThan6~0_combout\,
	datac => \process_0~5_combout\,
	datad => vposition(5),
	combout => \process_0~9_combout\);

-- Location: LCCOMB_X42_Y20_N4
\process_0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~10_combout\ = (vposition(6) & vposition(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datad => vposition(7),
	combout => \process_0~10_combout\);

-- Location: LCCOMB_X42_Y20_N22
\process_0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~11_combout\ = (vposition(4) & (vposition(5) & (\process_0~10_combout\ & !vposition(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => vposition(5),
	datac => \process_0~10_combout\,
	datad => vposition(8),
	combout => \process_0~11_combout\);

-- Location: LCCOMB_X43_Y21_N20
\LessThan19~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~7_combout\ = (!vposition(0) & (!vposition(2) & !vposition(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(0),
	datac => vposition(2),
	datad => vposition(1),
	combout => \LessThan19~7_combout\);

-- Location: LCCOMB_X43_Y21_N30
\process_0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~12_combout\ = (\process_0~9_combout\) # ((vposition(3) & (\process_0~11_combout\ & !\LessThan19~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(3),
	datab => \process_0~9_combout\,
	datac => \process_0~11_combout\,
	datad => \LessThan19~7_combout\,
	combout => \process_0~12_combout\);

-- Location: LCCOMB_X38_Y22_N0
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

-- Location: FF_X38_Y22_N1
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

-- Location: LCCOMB_X38_Y22_N2
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

-- Location: FF_X38_Y22_N3
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

-- Location: LCCOMB_X38_Y22_N4
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

-- Location: FF_X38_Y22_N5
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

-- Location: LCCOMB_X38_Y22_N6
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

-- Location: FF_X38_Y22_N7
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

-- Location: LCCOMB_X38_Y22_N8
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

-- Location: FF_X38_Y22_N9
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

-- Location: LCCOMB_X38_Y22_N10
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

-- Location: FF_X38_Y22_N11
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

-- Location: LCCOMB_X38_Y22_N12
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

-- Location: FF_X38_Y22_N13
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

-- Location: LCCOMB_X38_Y22_N14
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

-- Location: FF_X38_Y22_N15
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

-- Location: LCCOMB_X38_Y22_N16
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

-- Location: FF_X38_Y22_N17
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

-- Location: LCCOMB_X38_Y22_N18
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

-- Location: FF_X38_Y22_N19
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

-- Location: LCCOMB_X38_Y22_N20
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

-- Location: FF_X38_Y22_N21
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

-- Location: LCCOMB_X38_Y22_N22
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

-- Location: FF_X38_Y22_N23
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

-- Location: LCCOMB_X38_Y22_N24
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

-- Location: FF_X38_Y22_N25
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

-- Location: LCCOMB_X38_Y22_N26
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

-- Location: FF_X38_Y22_N27
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

-- Location: LCCOMB_X38_Y22_N28
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

-- Location: FF_X38_Y22_N29
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

-- Location: LCCOMB_X38_Y22_N30
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

-- Location: FF_X38_Y22_N31
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

-- Location: LCCOMB_X38_Y21_N0
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

-- Location: FF_X38_Y21_N1
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

-- Location: LCCOMB_X38_Y21_N2
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

-- Location: FF_X38_Y21_N3
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

-- Location: LCCOMB_X37_Y21_N6
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_combout\ = (((!count(14) & !count(15))) # (!count(16))) # (!count(17))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(17),
	datab => count(16),
	datac => count(14),
	datad => count(15),
	combout => \LessThan0~3_combout\);

-- Location: LCCOMB_X38_Y21_N4
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

-- Location: FF_X38_Y21_N5
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

-- Location: LCCOMB_X38_Y21_N6
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

-- Location: FF_X38_Y21_N7
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

-- Location: LCCOMB_X38_Y21_N8
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

-- Location: FF_X38_Y21_N9
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

-- Location: LCCOMB_X38_Y21_N10
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

-- Location: FF_X38_Y21_N11
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

-- Location: LCCOMB_X38_Y21_N12
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

-- Location: FF_X38_Y21_N13
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

-- Location: LCCOMB_X38_Y21_N14
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

-- Location: FF_X38_Y21_N15
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

-- Location: LCCOMB_X38_Y21_N16
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

-- Location: FF_X38_Y21_N17
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

-- Location: LCCOMB_X38_Y21_N18
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

-- Location: FF_X38_Y21_N19
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

-- Location: LCCOMB_X38_Y21_N20
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

-- Location: FF_X38_Y21_N21
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

-- Location: LCCOMB_X38_Y21_N22
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

-- Location: FF_X38_Y21_N23
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

-- Location: LCCOMB_X38_Y21_N24
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

-- Location: FF_X38_Y21_N25
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

-- Location: LCCOMB_X38_Y21_N26
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

-- Location: FF_X38_Y21_N27
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

-- Location: LCCOMB_X38_Y21_N28
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

-- Location: FF_X38_Y21_N29
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

-- Location: LCCOMB_X37_Y21_N20
\LessThan0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~2_combout\ = (!count(29) & (!count(30) & !count(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => count(29),
	datac => count(30),
	datad => count(28),
	combout => \LessThan0~2_combout\);

-- Location: LCCOMB_X37_Y21_N26
\LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~5_combout\ = (!count(11) & (!count(13) & (!count(10) & !count(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(11),
	datab => count(13),
	datac => count(10),
	datad => count(12),
	combout => \LessThan0~5_combout\);

-- Location: LCCOMB_X37_Y21_N0
\LessThan0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~4_combout\ = ((!count(6) & (!count(8) & !count(7)))) # (!count(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(6),
	datab => count(9),
	datac => count(8),
	datad => count(7),
	combout => \LessThan0~4_combout\);

-- Location: LCCOMB_X37_Y21_N4
\LessThan0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~6_combout\ = (count(18) & (((count(15)) # (!\LessThan0~4_combout\)) # (!\LessThan0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~5_combout\,
	datab => \LessThan0~4_combout\,
	datac => count(15),
	datad => count(18),
	combout => \LessThan0~6_combout\);

-- Location: LCCOMB_X37_Y21_N22
\LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~7_combout\ = (\LessThan0~2_combout\ & ((\LessThan0~3_combout\) # ((!count(19)) # (!\LessThan0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~3_combout\,
	datab => \LessThan0~2_combout\,
	datac => \LessThan0~6_combout\,
	datad => count(19),
	combout => \LessThan0~7_combout\);

-- Location: LCCOMB_X37_Y21_N24
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!count(23) & (!count(21) & (!count(22) & !count(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(23),
	datab => count(21),
	datac => count(22),
	datad => count(20),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X38_Y21_N30
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

-- Location: FF_X38_Y21_N31
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

-- Location: LCCOMB_X37_Y21_N10
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (!count(26) & (!count(25) & (!count(27) & !count(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => count(26),
	datab => count(25),
	datac => count(27),
	datad => count(24),
	combout => \LessThan0~1_combout\);

-- Location: LCCOMB_X37_Y21_N16
\LessThan0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~8_combout\ = (!count(31) & (((!\LessThan0~1_combout\) # (!\LessThan0~0_combout\)) # (!\LessThan0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~7_combout\,
	datab => \LessThan0~0_combout\,
	datac => count(31),
	datad => \LessThan0~1_combout\,
	combout => \LessThan0~8_combout\);

-- Location: FF_X40_Y22_N13
\bg_hstart[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~21_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(13));

-- Location: LCCOMB_X41_Y22_N26
\Add12~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~26_combout\ = (bg_hstart(13) & (\Add12~25\ & VCC)) # (!bg_hstart(13) & (!\Add12~25\))
-- \Add12~27\ = CARRY((!bg_hstart(13) & !\Add12~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(13),
	datad => VCC,
	cin => \Add12~25\,
	combout => \Add12~26_combout\,
	cout => \Add12~27\);

-- Location: LCCOMB_X41_Y22_N28
\Add12~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~28_combout\ = (bg_hstart(14) & ((GND) # (!\Add12~27\))) # (!bg_hstart(14) & (\Add12~27\ $ (GND)))
-- \Add12~29\ = CARRY((bg_hstart(14)) # (!\Add12~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(14),
	datad => VCC,
	cin => \Add12~27\,
	combout => \Add12~28_combout\,
	cout => \Add12~29\);

-- Location: LCCOMB_X40_Y22_N26
\bg_hstart~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~20_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~28_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \Add12~28_combout\,
	datac => bg_hstart(14),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~20_combout\);

-- Location: FF_X40_Y22_N27
\bg_hstart[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(14));

-- Location: LCCOMB_X41_Y22_N30
\Add12~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~30_combout\ = (bg_hstart(15) & (\Add12~29\ & VCC)) # (!bg_hstart(15) & (!\Add12~29\))
-- \Add12~31\ = CARRY((!bg_hstart(15) & !\Add12~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(15),
	datad => VCC,
	cin => \Add12~29\,
	combout => \Add12~30_combout\,
	cout => \Add12~31\);

-- Location: LCCOMB_X40_Y22_N0
\bg_hstart~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~19_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~30_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~30_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(15),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~19_combout\);

-- Location: FF_X40_Y22_N1
\bg_hstart[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(15));

-- Location: LCCOMB_X41_Y21_N0
\Add12~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~32_combout\ = (bg_hstart(16) & ((GND) # (!\Add12~31\))) # (!bg_hstart(16) & (\Add12~31\ $ (GND)))
-- \Add12~33\ = CARRY((bg_hstart(16)) # (!\Add12~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(16),
	datad => VCC,
	cin => \Add12~31\,
	combout => \Add12~32_combout\,
	cout => \Add12~33\);

-- Location: LCCOMB_X40_Y22_N22
\bg_hstart~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~18_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~32_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(16))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~32_combout\,
	datac => bg_hstart(16),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~18_combout\);

-- Location: FF_X40_Y22_N23
\bg_hstart[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(16));

-- Location: LCCOMB_X41_Y21_N2
\Add12~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~34_combout\ = (bg_hstart(17) & (\Add12~33\ & VCC)) # (!bg_hstart(17) & (!\Add12~33\))
-- \Add12~35\ = CARRY((!bg_hstart(17) & !\Add12~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(17),
	datad => VCC,
	cin => \Add12~33\,
	combout => \Add12~34_combout\,
	cout => \Add12~35\);

-- Location: LCCOMB_X40_Y22_N18
\bg_hstart~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~17_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~34_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstart(17),
	datac => \Add12~34_combout\,
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~17_combout\);

-- Location: FF_X40_Y22_N29
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

-- Location: LCCOMB_X41_Y21_N4
\Add12~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~36_combout\ = (bg_hstart(18) & ((GND) # (!\Add12~35\))) # (!bg_hstart(18) & (\Add12~35\ $ (GND)))
-- \Add12~37\ = CARRY((bg_hstart(18)) # (!\Add12~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(18),
	datad => VCC,
	cin => \Add12~35\,
	combout => \Add12~36_combout\,
	cout => \Add12~37\);

-- Location: LCCOMB_X40_Y22_N2
\bg_hstart~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~16_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~36_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~36_combout\,
	datac => bg_hstart(18),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~16_combout\);

-- Location: FF_X40_Y22_N3
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

-- Location: LCCOMB_X41_Y21_N6
\Add12~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~38_combout\ = (bg_hstart(19) & (\Add12~37\ & VCC)) # (!bg_hstart(19) & (!\Add12~37\))
-- \Add12~39\ = CARRY((!bg_hstart(19) & !\Add12~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(19),
	datad => VCC,
	cin => \Add12~37\,
	combout => \Add12~38_combout\,
	cout => \Add12~39\);

-- Location: LCCOMB_X40_Y22_N8
\bg_hstart~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~15_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~38_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan1~23_combout\,
	datac => bg_hstart(19),
	datad => \Add12~38_combout\,
	combout => \bg_hstart~15_combout\);

-- Location: FF_X40_Y22_N9
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

-- Location: LCCOMB_X41_Y21_N8
\Add12~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~40_combout\ = (bg_hstart(20) & ((GND) # (!\Add12~39\))) # (!bg_hstart(20) & (\Add12~39\ $ (GND)))
-- \Add12~41\ = CARRY((bg_hstart(20)) # (!\Add12~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(20),
	datad => VCC,
	cin => \Add12~39\,
	combout => \Add12~40_combout\,
	cout => \Add12~41\);

-- Location: LCCOMB_X42_Y22_N30
\bg_hstart~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~14_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~40_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan1~23_combout\,
	datac => bg_hstart(20),
	datad => \Add12~40_combout\,
	combout => \bg_hstart~14_combout\);

-- Location: FF_X42_Y22_N31
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

-- Location: LCCOMB_X41_Y21_N10
\Add12~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~42_combout\ = (bg_hstart(21) & (\Add12~41\ & VCC)) # (!bg_hstart(21) & (!\Add12~41\))
-- \Add12~43\ = CARRY((!bg_hstart(21) & !\Add12~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(21),
	datad => VCC,
	cin => \Add12~41\,
	combout => \Add12~42_combout\,
	cout => \Add12~43\);

-- Location: LCCOMB_X39_Y21_N0
\bg_hstart~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~13_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~42_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(21),
	datad => \Add12~42_combout\,
	combout => \bg_hstart~13_combout\);

-- Location: FF_X39_Y21_N1
\bg_hstart[21]\ : dffeas
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
	q => bg_hstart(21));

-- Location: LCCOMB_X41_Y21_N12
\Add12~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~44_combout\ = (bg_hstart(22) & ((GND) # (!\Add12~43\))) # (!bg_hstart(22) & (\Add12~43\ $ (GND)))
-- \Add12~45\ = CARRY((bg_hstart(22)) # (!\Add12~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(22),
	datad => VCC,
	cin => \Add12~43\,
	combout => \Add12~44_combout\,
	cout => \Add12~45\);

-- Location: LCCOMB_X39_Y21_N6
\bg_hstart~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~12_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~44_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(22),
	datad => \Add12~44_combout\,
	combout => \bg_hstart~12_combout\);

-- Location: FF_X39_Y21_N7
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

-- Location: LCCOMB_X41_Y21_N14
\Add12~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~46_combout\ = (bg_hstart(23) & (\Add12~45\ & VCC)) # (!bg_hstart(23) & (!\Add12~45\))
-- \Add12~47\ = CARRY((!bg_hstart(23) & !\Add12~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(23),
	datad => VCC,
	cin => \Add12~45\,
	combout => \Add12~46_combout\,
	cout => \Add12~47\);

-- Location: LCCOMB_X39_Y21_N4
\bg_hstart~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~11_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~46_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~46_combout\,
	datac => bg_hstart(23),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~11_combout\);

-- Location: FF_X39_Y21_N5
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

-- Location: LCCOMB_X41_Y21_N16
\Add12~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~48_combout\ = (bg_hstart(24) & ((GND) # (!\Add12~47\))) # (!bg_hstart(24) & (\Add12~47\ $ (GND)))
-- \Add12~49\ = CARRY((bg_hstart(24)) # (!\Add12~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(24),
	datad => VCC,
	cin => \Add12~47\,
	combout => \Add12~48_combout\,
	cout => \Add12~49\);

-- Location: LCCOMB_X39_Y21_N14
\bg_hstart~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~10_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~48_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(24)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(24),
	datad => \Add12~48_combout\,
	combout => \bg_hstart~10_combout\);

-- Location: FF_X39_Y21_N19
\bg_hstart[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~10_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(24));

-- Location: LCCOMB_X41_Y21_N18
\Add12~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~50_combout\ = (bg_hstart(25) & (\Add12~49\ & VCC)) # (!bg_hstart(25) & (!\Add12~49\))
-- \Add12~51\ = CARRY((!bg_hstart(25) & !\Add12~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(25),
	datad => VCC,
	cin => \Add12~49\,
	combout => \Add12~50_combout\,
	cout => \Add12~51\);

-- Location: LCCOMB_X39_Y21_N16
\bg_hstart~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~9_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~50_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(25),
	datad => \Add12~50_combout\,
	combout => \bg_hstart~9_combout\);

-- Location: FF_X39_Y21_N17
\bg_hstart[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(25));

-- Location: LCCOMB_X41_Y21_N20
\Add12~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~52_combout\ = (bg_hstart(26) & ((GND) # (!\Add12~51\))) # (!bg_hstart(26) & (\Add12~51\ $ (GND)))
-- \Add12~53\ = CARRY((bg_hstart(26)) # (!\Add12~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(26),
	datad => VCC,
	cin => \Add12~51\,
	combout => \Add12~52_combout\,
	cout => \Add12~53\);

-- Location: LCCOMB_X39_Y21_N22
\bg_hstart~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~8_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~52_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~52_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(26),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~8_combout\);

-- Location: FF_X39_Y21_N23
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

-- Location: LCCOMB_X41_Y21_N22
\Add12~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~54_combout\ = (bg_hstart(27) & (\Add12~53\ & VCC)) # (!bg_hstart(27) & (!\Add12~53\))
-- \Add12~55\ = CARRY((!bg_hstart(27) & !\Add12~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(27),
	datad => VCC,
	cin => \Add12~53\,
	combout => \Add12~54_combout\,
	cout => \Add12~55\);

-- Location: LCCOMB_X39_Y21_N12
\bg_hstart~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~7_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~54_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(27),
	datad => \Add12~54_combout\,
	combout => \bg_hstart~7_combout\);

-- Location: FF_X39_Y21_N13
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

-- Location: LCCOMB_X41_Y21_N24
\Add12~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~56_combout\ = (bg_hstart(28) & ((GND) # (!\Add12~55\))) # (!bg_hstart(28) & (\Add12~55\ $ (GND)))
-- \Add12~57\ = CARRY((bg_hstart(28)) # (!\Add12~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(28),
	datad => VCC,
	cin => \Add12~55\,
	combout => \Add12~56_combout\,
	cout => \Add12~57\);

-- Location: LCCOMB_X39_Y21_N2
\bg_hstart~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~6_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~56_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(28)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(28),
	datad => \Add12~56_combout\,
	combout => \bg_hstart~6_combout\);

-- Location: FF_X39_Y21_N3
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

-- Location: LCCOMB_X41_Y21_N26
\Add12~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~58_combout\ = (bg_hstart(29) & (\Add12~57\ & VCC)) # (!bg_hstart(29) & (!\Add12~57\))
-- \Add12~59\ = CARRY((!bg_hstart(29) & !\Add12~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(29),
	datad => VCC,
	cin => \Add12~57\,
	combout => \Add12~58_combout\,
	cout => \Add12~59\);

-- Location: LCCOMB_X39_Y21_N24
\bg_hstart~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~5_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~58_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(29),
	datad => \Add12~58_combout\,
	combout => \bg_hstart~5_combout\);

-- Location: FF_X39_Y21_N25
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

-- Location: LCCOMB_X41_Y21_N28
\Add12~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~60_combout\ = (bg_hstart(30) & ((GND) # (!\Add12~59\))) # (!bg_hstart(30) & (\Add12~59\ $ (GND)))
-- \Add12~61\ = CARRY((bg_hstart(30)) # (!\Add12~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(30),
	datad => VCC,
	cin => \Add12~59\,
	combout => \Add12~60_combout\,
	cout => \Add12~61\);

-- Location: LCCOMB_X42_Y22_N28
\bg_hstart~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~4_combout\ = (\LessThan0~8_combout\ & (!\Add12~62_combout\ & ((\Add12~60_combout\)))) # (!\LessThan0~8_combout\ & (((bg_hstart(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~62_combout\,
	datac => bg_hstart(30),
	datad => \Add12~60_combout\,
	combout => \bg_hstart~4_combout\);

-- Location: FF_X42_Y22_N29
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

-- Location: LCCOMB_X41_Y21_N30
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

-- Location: LCCOMB_X40_Y22_N12
\LessThan1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (bg_hstart(16)) # ((bg_hstart(15)) # ((bg_hstart(13)) # (bg_hstart(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(16),
	datab => bg_hstart(15),
	datac => bg_hstart(13),
	datad => bg_hstart(14),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X41_Y22_N0
\Add12~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~0_combout\ = bg_hstart(0) $ (VCC)
-- \Add12~1\ = CARRY(bg_hstart(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(0),
	datad => VCC,
	combout => \Add12~0_combout\,
	cout => \Add12~1\);

-- Location: LCCOMB_X40_Y21_N4
\bg_hstart~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~32_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~0_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~0_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(0),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~32_combout\);

-- Location: FF_X40_Y21_N5
\bg_hstart[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(0));

-- Location: LCCOMB_X41_Y22_N2
\Add12~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~2_combout\ = (bg_hstart(1) & (\Add12~1\ & VCC)) # (!bg_hstart(1) & (!\Add12~1\))
-- \Add12~3\ = CARRY((!bg_hstart(1) & !\Add12~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(1),
	datad => VCC,
	cin => \Add12~1\,
	combout => \Add12~2_combout\,
	cout => \Add12~3\);

-- Location: LCCOMB_X40_Y21_N26
\bg_hstart~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~31_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~2_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~2_combout\,
	datac => bg_hstart(1),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~31_combout\);

-- Location: FF_X40_Y21_N27
\bg_hstart[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(1));

-- Location: LCCOMB_X41_Y22_N4
\Add12~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~4_combout\ = (bg_hstart(2) & ((GND) # (!\Add12~3\))) # (!bg_hstart(2) & (\Add12~3\ $ (GND)))
-- \Add12~5\ = CARRY((bg_hstart(2)) # (!\Add12~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(2),
	datad => VCC,
	cin => \Add12~3\,
	combout => \Add12~4_combout\,
	cout => \Add12~5\);

-- Location: LCCOMB_X40_Y21_N8
\bg_hstart~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~30_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~4_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(2),
	datad => \Add12~4_combout\,
	combout => \bg_hstart~30_combout\);

-- Location: FF_X40_Y21_N9
\bg_hstart[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(2));

-- Location: LCCOMB_X41_Y22_N6
\Add12~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~6_combout\ = (bg_hstart(3) & (\Add12~5\ & VCC)) # (!bg_hstart(3) & (!\Add12~5\))
-- \Add12~7\ = CARRY((!bg_hstart(3) & !\Add12~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(3),
	datad => VCC,
	cin => \Add12~5\,
	combout => \Add12~6_combout\,
	cout => \Add12~7\);

-- Location: LCCOMB_X40_Y21_N22
\bg_hstart~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~29_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~6_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(3),
	datad => \Add12~6_combout\,
	combout => \bg_hstart~29_combout\);

-- Location: FF_X40_Y21_N23
\bg_hstart[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(3));

-- Location: LCCOMB_X41_Y22_N8
\Add12~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~8_combout\ = (bg_hstart(4) & ((GND) # (!\Add12~7\))) # (!bg_hstart(4) & (\Add12~7\ $ (GND)))
-- \Add12~9\ = CARRY((bg_hstart(4)) # (!\Add12~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datad => VCC,
	cin => \Add12~7\,
	combout => \Add12~8_combout\,
	cout => \Add12~9\);

-- Location: LCCOMB_X40_Y21_N12
\bg_hstart~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~28_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & ((\Add12~8_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(4),
	datad => \Add12~8_combout\,
	combout => \bg_hstart~28_combout\);

-- Location: FF_X40_Y21_N13
\bg_hstart[4]\ : dffeas
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
	q => bg_hstart(4));

-- Location: LCCOMB_X41_Y22_N10
\Add12~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~10_combout\ = (bg_hstart(5) & (\Add12~9\ & VCC)) # (!bg_hstart(5) & (!\Add12~9\))
-- \Add12~11\ = CARRY((!bg_hstart(5) & !\Add12~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(5),
	datad => VCC,
	cin => \Add12~9\,
	combout => \Add12~10_combout\,
	cout => \Add12~11\);

-- Location: LCCOMB_X40_Y21_N10
\bg_hstart~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~27_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~10_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~10_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(5),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~27_combout\);

-- Location: FF_X40_Y21_N11
\bg_hstart[5]\ : dffeas
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
	q => bg_hstart(5));

-- Location: LCCOMB_X41_Y22_N12
\Add12~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~12_combout\ = (bg_hstart(6) & ((GND) # (!\Add12~11\))) # (!bg_hstart(6) & (\Add12~11\ $ (GND)))
-- \Add12~13\ = CARRY((bg_hstart(6)) # (!\Add12~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(6),
	datad => VCC,
	cin => \Add12~11\,
	combout => \Add12~12_combout\,
	cout => \Add12~13\);

-- Location: LCCOMB_X40_Y19_N2
\bg_hstart~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~34_combout\ = ((\LessThan0~8_combout\ & (\Add12~12_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(6))))) # (!\LessThan1~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~12_combout\,
	datac => bg_hstart(6),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~34_combout\);

-- Location: FF_X40_Y19_N3
\bg_hstart[6]\ : dffeas
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
	q => bg_hstart(6));

-- Location: LCCOMB_X41_Y22_N14
\Add12~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~14_combout\ = (bg_hstart(7) & (\Add12~13\ & VCC)) # (!bg_hstart(7) & (!\Add12~13\))
-- \Add12~15\ = CARRY((!bg_hstart(7) & !\Add12~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(7),
	datad => VCC,
	cin => \Add12~13\,
	combout => \Add12~14_combout\,
	cout => \Add12~15\);

-- Location: LCCOMB_X39_Y20_N0
\bg_hstart~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~26_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~14_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~14_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(7),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~26_combout\);

-- Location: FF_X39_Y20_N1
\bg_hstart[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(7));

-- Location: LCCOMB_X41_Y22_N16
\Add12~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~16_combout\ = (bg_hstart(8) & ((GND) # (!\Add12~15\))) # (!bg_hstart(8) & (\Add12~15\ $ (GND)))
-- \Add12~17\ = CARRY((bg_hstart(8)) # (!\Add12~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(8),
	datad => VCC,
	cin => \Add12~15\,
	combout => \Add12~16_combout\,
	cout => \Add12~17\);

-- Location: LCCOMB_X40_Y21_N24
\bg_hstart~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~33_combout\ = ((\LessThan0~8_combout\ & (\Add12~16_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(8))))) # (!\LessThan1~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~16_combout\,
	datac => bg_hstart(8),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~33_combout\);

-- Location: FF_X40_Y21_N25
\bg_hstart[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(8));

-- Location: LCCOMB_X41_Y22_N18
\Add12~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~18_combout\ = (bg_hstart(9) & (\Add12~17\ & VCC)) # (!bg_hstart(9) & (!\Add12~17\))
-- \Add12~19\ = CARRY((!bg_hstart(9) & !\Add12~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(9),
	datad => VCC,
	cin => \Add12~17\,
	combout => \Add12~18_combout\,
	cout => \Add12~19\);

-- Location: LCCOMB_X40_Y19_N0
\bg_hstart~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~25_combout\ = ((\LessThan0~8_combout\ & (\Add12~18_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(9))))) # (!\LessThan1~23_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~18_combout\,
	datac => bg_hstart(9),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~25_combout\);

-- Location: FF_X40_Y19_N1
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

-- Location: LCCOMB_X41_Y22_N20
\Add12~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~20_combout\ = (bg_hstart(10) & ((GND) # (!\Add12~19\))) # (!bg_hstart(10) & (\Add12~19\ $ (GND)))
-- \Add12~21\ = CARRY((bg_hstart(10)) # (!\Add12~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(10),
	datad => VCC,
	cin => \Add12~19\,
	combout => \Add12~20_combout\,
	cout => \Add12~21\);

-- Location: LCCOMB_X39_Y23_N0
\bg_hstart~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~24_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~20_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(10))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~20_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstart(10),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~24_combout\);

-- Location: FF_X39_Y23_N1
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

-- Location: LCCOMB_X41_Y22_N22
\Add12~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~22_combout\ = (bg_hstart(11) & (\Add12~21\ & VCC)) # (!bg_hstart(11) & (!\Add12~21\))
-- \Add12~23\ = CARRY((!bg_hstart(11) & !\Add12~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datad => VCC,
	cin => \Add12~21\,
	combout => \Add12~22_combout\,
	cout => \Add12~23\);

-- Location: LCCOMB_X40_Y22_N14
\bg_hstart~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~23_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~22_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \Add12~22_combout\,
	datac => bg_hstart(11),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~23_combout\);

-- Location: FF_X40_Y22_N17
\bg_hstart[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstart~23_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(11));

-- Location: LCCOMB_X40_Y22_N16
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (bg_hstart(10)) # ((bg_hstart(9)) # ((bg_hstart(11)) # (bg_hstart(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(10),
	datab => bg_hstart(9),
	datac => bg_hstart(11),
	datad => bg_hstart(12),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X39_Y21_N18
\LessThan1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (bg_hstart(22)) # ((bg_hstart(23)) # ((bg_hstart(24)) # (bg_hstart(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(22),
	datab => bg_hstart(23),
	datac => bg_hstart(24),
	datad => bg_hstart(21),
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X40_Y22_N28
\LessThan1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (bg_hstart(19)) # ((bg_hstart(18)) # ((bg_hstart(17)) # (bg_hstart(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(19),
	datab => bg_hstart(18),
	datac => bg_hstart(17),
	datad => bg_hstart(20),
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X40_Y22_N10
\LessThan1~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (\LessThan1~1_combout\) # ((\LessThan1~0_combout\) # ((\LessThan1~3_combout\) # (\LessThan1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datab => \LessThan1~0_combout\,
	datac => \LessThan1~3_combout\,
	datad => \LessThan1~2_combout\,
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X40_Y22_N20
\LessThan1~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (bg_hstart(28)) # ((bg_hstart(27)) # ((bg_hstart(26)) # (bg_hstart(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(28),
	datab => bg_hstart(27),
	datac => bg_hstart(26),
	datad => bg_hstart(25),
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X40_Y22_N30
\LessThan1~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = (\LessThan1~4_combout\) # ((bg_hstart(29)) # ((bg_hstart(30)) # (\LessThan1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~4_combout\,
	datab => bg_hstart(29),
	datac => bg_hstart(30),
	datad => \LessThan1~5_combout\,
	combout => \LessThan1~6_combout\);

-- Location: LCCOMB_X40_Y21_N14
\Add12~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~64_combout\ = (\LessThan0~8_combout\ & ((\Add12~16_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(8),
	datac => \Add12~16_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add12~64_combout\);

-- Location: LCCOMB_X37_Y21_N2
\LessThan1~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = (bg_hstart(0)) # ((bg_hstart(3)) # ((bg_hstart(2)) # (bg_hstart(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(0),
	datab => bg_hstart(3),
	datac => bg_hstart(2),
	datad => bg_hstart(1),
	combout => \LessThan1~7_combout\);

-- Location: LCCOMB_X37_Y21_N12
\LessThan1~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = (!\LessThan0~8_combout\ & ((bg_hstart(5)) # ((\LessThan1~7_combout\) # (bg_hstart(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(5),
	datab => \LessThan1~7_combout\,
	datac => bg_hstart(4),
	datad => \LessThan0~8_combout\,
	combout => \LessThan1~8_combout\);

-- Location: LCCOMB_X40_Y21_N0
\Add12~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~65_combout\ = (\LessThan0~8_combout\ & ((\Add12~12_combout\))) # (!\LessThan0~8_combout\ & (bg_hstart(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(6),
	datac => \Add12~12_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add12~65_combout\);

-- Location: LCCOMB_X40_Y21_N2
\LessThan1~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~9_combout\ = (\LessThan0~8_combout\ & (((\Add12~65_combout\)))) # (!\LessThan0~8_combout\ & ((bg_hstart(7)) # ((\LessThan1~8_combout\ & \Add12~65_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(7),
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~8_combout\,
	datad => \Add12~65_combout\,
	combout => \LessThan1~9_combout\);

-- Location: LCCOMB_X40_Y21_N20
\LessThan1~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~10_combout\ = (\LessThan1~6_combout\ & (((\Add12~64_combout\ & \LessThan1~9_combout\)) # (!\LessThan0~8_combout\))) # (!\LessThan1~6_combout\ & (((\Add12~64_combout\ & \LessThan1~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~6_combout\,
	datab => \LessThan0~8_combout\,
	datac => \Add12~64_combout\,
	datad => \LessThan1~9_combout\,
	combout => \LessThan1~10_combout\);

-- Location: LCCOMB_X40_Y23_N24
\LessThan1~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~11_combout\ = (\Add12~4_combout\) # ((\Add12~6_combout\) # ((\Add12~0_combout\) # (\Add12~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~4_combout\,
	datab => \Add12~6_combout\,
	datac => \Add12~0_combout\,
	datad => \Add12~2_combout\,
	combout => \LessThan1~11_combout\);

-- Location: LCCOMB_X40_Y21_N30
\LessThan1~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~12_combout\ = (\LessThan1~11_combout\) # ((\LessThan1~8_combout\) # ((\Add12~10_combout\) # (\Add12~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~11_combout\,
	datab => \LessThan1~8_combout\,
	datac => \Add12~10_combout\,
	datad => \Add12~8_combout\,
	combout => \LessThan1~12_combout\);

-- Location: LCCOMB_X40_Y21_N16
\LessThan1~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~13_combout\ = (\LessThan1~12_combout\ & ((\LessThan1~10_combout\) # ((\Add12~14_combout\ & \Add12~16_combout\)))) # (!\LessThan1~12_combout\ & (\Add12~14_combout\ & (\Add12~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~12_combout\,
	datab => \Add12~14_combout\,
	datac => \Add12~16_combout\,
	datad => \LessThan1~10_combout\,
	combout => \LessThan1~13_combout\);

-- Location: LCCOMB_X40_Y21_N18
\LessThan1~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~14_combout\ = (\Add12~20_combout\) # ((\Add12~18_combout\) # (\LessThan1~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add12~20_combout\,
	datac => \Add12~18_combout\,
	datad => \LessThan1~13_combout\,
	combout => \LessThan1~14_combout\);

-- Location: LCCOMB_X40_Y21_N28
\LessThan1~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~15_combout\ = (\LessThan0~8_combout\ & (((\LessThan1~14_combout\) # (\Add12~60_combout\)))) # (!\LessThan0~8_combout\ & (\LessThan1~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~10_combout\,
	datab => \LessThan1~14_combout\,
	datac => \LessThan0~8_combout\,
	datad => \Add12~60_combout\,
	combout => \LessThan1~15_combout\);

-- Location: LCCOMB_X41_Y22_N24
\Add12~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add12~24_combout\ = (bg_hstart(12) & ((GND) # (!\Add12~23\))) # (!bg_hstart(12) & (\Add12~23\ $ (GND)))
-- \Add12~25\ = CARRY((bg_hstart(12)) # (!\Add12~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(12),
	datad => VCC,
	cin => \Add12~23\,
	combout => \Add12~24_combout\,
	cout => \Add12~25\);

-- Location: LCCOMB_X40_Y22_N24
\LessThan1~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~16_combout\ = (\Add12~38_combout\) # ((\Add12~28_combout\) # ((\Add12~30_combout\) # (\Add12~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~38_combout\,
	datab => \Add12~28_combout\,
	datac => \Add12~30_combout\,
	datad => \Add12~24_combout\,
	combout => \LessThan1~16_combout\);

-- Location: LCCOMB_X39_Y21_N10
\LessThan1~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~17_combout\ = (\Add12~26_combout\) # ((\Add12~36_combout\) # ((\Add12~32_combout\) # (\Add12~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~26_combout\,
	datab => \Add12~36_combout\,
	datac => \Add12~32_combout\,
	datad => \Add12~22_combout\,
	combout => \LessThan1~17_combout\);

-- Location: LCCOMB_X39_Y21_N20
\LessThan1~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~18_combout\ = (\LessThan0~8_combout\ & ((\Add12~34_combout\) # ((\LessThan1~16_combout\) # (\LessThan1~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~34_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~16_combout\,
	datad => \LessThan1~17_combout\,
	combout => \LessThan1~18_combout\);

-- Location: LCCOMB_X39_Y21_N8
\LessThan1~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~20_combout\ = (\Add12~50_combout\) # ((\Add12~58_combout\) # (\Add12~48_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~50_combout\,
	datab => \Add12~58_combout\,
	datad => \Add12~48_combout\,
	combout => \LessThan1~20_combout\);

-- Location: LCCOMB_X39_Y21_N30
\LessThan1~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~19_combout\ = (\Add12~40_combout\) # ((\Add12~44_combout\) # ((\Add12~46_combout\) # (\Add12~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~40_combout\,
	datab => \Add12~44_combout\,
	datac => \Add12~46_combout\,
	datad => \Add12~42_combout\,
	combout => \LessThan1~19_combout\);

-- Location: LCCOMB_X39_Y21_N26
\LessThan1~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~21_combout\ = (\Add12~52_combout\) # ((\LessThan1~20_combout\) # ((\LessThan1~19_combout\) # (\Add12~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~52_combout\,
	datab => \LessThan1~20_combout\,
	datac => \LessThan1~19_combout\,
	datad => \Add12~54_combout\,
	combout => \LessThan1~21_combout\);

-- Location: LCCOMB_X39_Y21_N28
\LessThan1~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~22_combout\ = (\LessThan1~18_combout\) # ((\LessThan0~8_combout\ & ((\LessThan1~21_combout\) # (\Add12~56_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \LessThan1~18_combout\,
	datac => \LessThan1~21_combout\,
	datad => \Add12~56_combout\,
	combout => \LessThan1~22_combout\);

-- Location: LCCOMB_X40_Y21_N6
\LessThan1~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~23_combout\ = (\Add12~62_combout\ & (!\LessThan0~8_combout\ & ((\LessThan1~15_combout\) # (\LessThan1~22_combout\)))) # (!\Add12~62_combout\ & (((\LessThan1~15_combout\) # (\LessThan1~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add12~62_combout\,
	datab => \LessThan0~8_combout\,
	datac => \LessThan1~15_combout\,
	datad => \LessThan1~22_combout\,
	combout => \LessThan1~23_combout\);

-- Location: LCCOMB_X40_Y22_N6
\bg_hstart~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~22_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~24_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~23_combout\,
	datab => \Add12~24_combout\,
	datac => bg_hstart(12),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstart~22_combout\);

-- Location: FF_X40_Y22_N7
\bg_hstart[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstart~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstart(12));

-- Location: LCCOMB_X40_Y22_N4
\bg_hstart~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstart~21_combout\ = (\LessThan1~23_combout\ & ((\LessThan0~8_combout\ & (\Add12~26_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstart(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add12~26_combout\,
	datac => bg_hstart(13),
	datad => \LessThan1~23_combout\,
	combout => \bg_hstart~21_combout\);

-- Location: LCCOMB_X40_Y20_N0
\Add20~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~0_combout\ = (\bg_hstart~32_combout\ & (hposition(0) $ (VCC))) # (!\bg_hstart~32_combout\ & ((hposition(0)) # (GND)))
-- \Add20~1\ = CARRY((hposition(0)) # (!\bg_hstart~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~32_combout\,
	datab => hposition(0),
	datad => VCC,
	combout => \Add20~0_combout\,
	cout => \Add20~1\);

-- Location: LCCOMB_X40_Y20_N2
\Add20~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~2_combout\ = (\bg_hstart~31_combout\ & ((hposition(1) & (!\Add20~1\)) # (!hposition(1) & ((\Add20~1\) # (GND))))) # (!\bg_hstart~31_combout\ & ((hposition(1) & (\Add20~1\ & VCC)) # (!hposition(1) & (!\Add20~1\))))
-- \Add20~3\ = CARRY((\bg_hstart~31_combout\ & ((!\Add20~1\) # (!hposition(1)))) # (!\bg_hstart~31_combout\ & (!hposition(1) & !\Add20~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~31_combout\,
	datab => hposition(1),
	datad => VCC,
	cin => \Add20~1\,
	combout => \Add20~2_combout\,
	cout => \Add20~3\);

-- Location: LCCOMB_X40_Y20_N4
\Add20~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~4_combout\ = ((\bg_hstart~30_combout\ $ (hposition(2) $ (\Add20~3\)))) # (GND)
-- \Add20~5\ = CARRY((\bg_hstart~30_combout\ & (hposition(2) & !\Add20~3\)) # (!\bg_hstart~30_combout\ & ((hposition(2)) # (!\Add20~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~30_combout\,
	datab => hposition(2),
	datad => VCC,
	cin => \Add20~3\,
	combout => \Add20~4_combout\,
	cout => \Add20~5\);

-- Location: LCCOMB_X40_Y20_N6
\Add20~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~6_combout\ = (\bg_hstart~29_combout\ & ((hposition(3) & (!\Add20~5\)) # (!hposition(3) & ((\Add20~5\) # (GND))))) # (!\bg_hstart~29_combout\ & ((hposition(3) & (\Add20~5\ & VCC)) # (!hposition(3) & (!\Add20~5\))))
-- \Add20~7\ = CARRY((\bg_hstart~29_combout\ & ((!\Add20~5\) # (!hposition(3)))) # (!\bg_hstart~29_combout\ & (!hposition(3) & !\Add20~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~29_combout\,
	datab => hposition(3),
	datad => VCC,
	cin => \Add20~5\,
	combout => \Add20~6_combout\,
	cout => \Add20~7\);

-- Location: LCCOMB_X40_Y20_N8
\Add20~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~8_combout\ = ((hposition(4) $ (\bg_hstart~28_combout\ $ (\Add20~7\)))) # (GND)
-- \Add20~9\ = CARRY((hposition(4) & ((!\Add20~7\) # (!\bg_hstart~28_combout\))) # (!hposition(4) & (!\bg_hstart~28_combout\ & !\Add20~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \bg_hstart~28_combout\,
	datad => VCC,
	cin => \Add20~7\,
	combout => \Add20~8_combout\,
	cout => \Add20~9\);

-- Location: LCCOMB_X40_Y20_N10
\Add20~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~10_combout\ = (\bg_hstart~27_combout\ & ((hposition(5) & (!\Add20~9\)) # (!hposition(5) & ((\Add20~9\) # (GND))))) # (!\bg_hstart~27_combout\ & ((hposition(5) & (\Add20~9\ & VCC)) # (!hposition(5) & (!\Add20~9\))))
-- \Add20~11\ = CARRY((\bg_hstart~27_combout\ & ((!\Add20~9\) # (!hposition(5)))) # (!\bg_hstart~27_combout\ & (!hposition(5) & !\Add20~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~27_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \Add20~9\,
	combout => \Add20~10_combout\,
	cout => \Add20~11\);

-- Location: LCCOMB_X40_Y20_N12
\Add20~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~12_combout\ = ((\bg_hstart~34_combout\ $ (hposition(6) $ (\Add20~11\)))) # (GND)
-- \Add20~13\ = CARRY((\bg_hstart~34_combout\ & (hposition(6) & !\Add20~11\)) # (!\bg_hstart~34_combout\ & ((hposition(6)) # (!\Add20~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~34_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \Add20~11\,
	combout => \Add20~12_combout\,
	cout => \Add20~13\);

-- Location: LCCOMB_X40_Y20_N14
\Add20~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~14_combout\ = (\bg_hstart~26_combout\ & ((hposition(7) & (!\Add20~13\)) # (!hposition(7) & ((\Add20~13\) # (GND))))) # (!\bg_hstart~26_combout\ & ((hposition(7) & (\Add20~13\ & VCC)) # (!hposition(7) & (!\Add20~13\))))
-- \Add20~15\ = CARRY((\bg_hstart~26_combout\ & ((!\Add20~13\) # (!hposition(7)))) # (!\bg_hstart~26_combout\ & (!hposition(7) & !\Add20~13\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~26_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \Add20~13\,
	combout => \Add20~14_combout\,
	cout => \Add20~15\);

-- Location: LCCOMB_X40_Y20_N16
\Add20~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~16_combout\ = ((hposition(8) $ (\bg_hstart~33_combout\ $ (\Add20~15\)))) # (GND)
-- \Add20~17\ = CARRY((hposition(8) & ((!\Add20~15\) # (!\bg_hstart~33_combout\))) # (!hposition(8) & (!\bg_hstart~33_combout\ & !\Add20~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \bg_hstart~33_combout\,
	datad => VCC,
	cin => \Add20~15\,
	combout => \Add20~16_combout\,
	cout => \Add20~17\);

-- Location: LCCOMB_X40_Y20_N18
\Add20~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~18_combout\ = (\bg_hstart~25_combout\ & ((hposition(9) & (!\Add20~17\)) # (!hposition(9) & ((\Add20~17\) # (GND))))) # (!\bg_hstart~25_combout\ & ((hposition(9) & (\Add20~17\ & VCC)) # (!hposition(9) & (!\Add20~17\))))
-- \Add20~19\ = CARRY((\bg_hstart~25_combout\ & ((!\Add20~17\) # (!hposition(9)))) # (!\bg_hstart~25_combout\ & (!hposition(9) & !\Add20~17\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~25_combout\,
	datab => hposition(9),
	datad => VCC,
	cin => \Add20~17\,
	combout => \Add20~18_combout\,
	cout => \Add20~19\);

-- Location: LCCOMB_X40_Y20_N20
\Add20~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~20_combout\ = ((\bg_hstart~24_combout\ $ (hposition(10) $ (\Add20~19\)))) # (GND)
-- \Add20~21\ = CARRY((\bg_hstart~24_combout\ & (hposition(10) & !\Add20~19\)) # (!\bg_hstart~24_combout\ & ((hposition(10)) # (!\Add20~19\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~24_combout\,
	datab => hposition(10),
	datad => VCC,
	cin => \Add20~19\,
	combout => \Add20~20_combout\,
	cout => \Add20~21\);

-- Location: LCCOMB_X40_Y20_N22
\Add20~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~22_combout\ = (hposition(11) & ((\bg_hstart~23_combout\ & (!\Add20~21\)) # (!\bg_hstart~23_combout\ & (\Add20~21\ & VCC)))) # (!hposition(11) & ((\bg_hstart~23_combout\ & ((\Add20~21\) # (GND))) # (!\bg_hstart~23_combout\ & (!\Add20~21\))))
-- \Add20~23\ = CARRY((hposition(11) & (\bg_hstart~23_combout\ & !\Add20~21\)) # (!hposition(11) & ((\bg_hstart~23_combout\) # (!\Add20~21\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \bg_hstart~23_combout\,
	datad => VCC,
	cin => \Add20~21\,
	combout => \Add20~22_combout\,
	cout => \Add20~23\);

-- Location: LCCOMB_X40_Y20_N24
\Add20~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~24_combout\ = ((hposition(12) $ (\bg_hstart~22_combout\ $ (\Add20~23\)))) # (GND)
-- \Add20~25\ = CARRY((hposition(12) & ((!\Add20~23\) # (!\bg_hstart~22_combout\))) # (!hposition(12) & (!\bg_hstart~22_combout\ & !\Add20~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \bg_hstart~22_combout\,
	datad => VCC,
	cin => \Add20~23\,
	combout => \Add20~24_combout\,
	cout => \Add20~25\);

-- Location: LCCOMB_X40_Y20_N26
\Add20~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~26_combout\ = (hposition(13) & ((\bg_hstart~21_combout\ & (!\Add20~25\)) # (!\bg_hstart~21_combout\ & (\Add20~25\ & VCC)))) # (!hposition(13) & ((\bg_hstart~21_combout\ & ((\Add20~25\) # (GND))) # (!\bg_hstart~21_combout\ & (!\Add20~25\))))
-- \Add20~27\ = CARRY((hposition(13) & (\bg_hstart~21_combout\ & !\Add20~25\)) # (!hposition(13) & ((\bg_hstart~21_combout\) # (!\Add20~25\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \bg_hstart~21_combout\,
	datad => VCC,
	cin => \Add20~25\,
	combout => \Add20~26_combout\,
	cout => \Add20~27\);

-- Location: LCCOMB_X41_Y20_N4
\Add21~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add21~0_combout\ = (vposition(0) & (\Add20~18_combout\ $ (VCC))) # (!vposition(0) & (\Add20~18_combout\ & VCC))
-- \Add21~1\ = CARRY((vposition(0) & \Add20~18_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(0),
	datab => \Add20~18_combout\,
	datad => VCC,
	combout => \Add21~0_combout\,
	cout => \Add21~1\);

-- Location: LCCOMB_X41_Y20_N6
\Add21~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add21~2_combout\ = (vposition(1) & ((\Add20~20_combout\ & (\Add21~1\ & VCC)) # (!\Add20~20_combout\ & (!\Add21~1\)))) # (!vposition(1) & ((\Add20~20_combout\ & (!\Add21~1\)) # (!\Add20~20_combout\ & ((\Add21~1\) # (GND)))))
-- \Add21~3\ = CARRY((vposition(1) & (!\Add20~20_combout\ & !\Add21~1\)) # (!vposition(1) & ((!\Add21~1\) # (!\Add20~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(1),
	datab => \Add20~20_combout\,
	datad => VCC,
	cin => \Add21~1\,
	combout => \Add21~2_combout\,
	cout => \Add21~3\);

-- Location: LCCOMB_X41_Y20_N8
\Add21~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add21~4_combout\ = ((vposition(2) $ (\Add20~22_combout\ $ (!\Add21~3\)))) # (GND)
-- \Add21~5\ = CARRY((vposition(2) & ((\Add20~22_combout\) # (!\Add21~3\))) # (!vposition(2) & (\Add20~22_combout\ & !\Add21~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(2),
	datab => \Add20~22_combout\,
	datad => VCC,
	cin => \Add21~3\,
	combout => \Add21~4_combout\,
	cout => \Add21~5\);

-- Location: LCCOMB_X41_Y20_N10
\Add21~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add21~6_combout\ = (vposition(3) & ((\Add20~24_combout\ & (\Add21~5\ & VCC)) # (!\Add20~24_combout\ & (!\Add21~5\)))) # (!vposition(3) & ((\Add20~24_combout\ & (!\Add21~5\)) # (!\Add20~24_combout\ & ((\Add21~5\) # (GND)))))
-- \Add21~7\ = CARRY((vposition(3) & (!\Add20~24_combout\ & !\Add21~5\)) # (!vposition(3) & ((!\Add21~5\) # (!\Add20~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(3),
	datab => \Add20~24_combout\,
	datad => VCC,
	cin => \Add21~5\,
	combout => \Add21~6_combout\,
	cout => \Add21~7\);

-- Location: LCCOMB_X41_Y20_N12
\Add21~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add21~8_combout\ = ((\Add20~26_combout\ $ (vposition(4) $ (!\Add21~7\)))) # (GND)
-- \Add21~9\ = CARRY((\Add20~26_combout\ & ((vposition(4)) # (!\Add21~7\))) # (!\Add20~26_combout\ & (vposition(4) & !\Add21~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add20~26_combout\,
	datab => vposition(4),
	datad => VCC,
	cin => \Add21~7\,
	combout => \Add21~8_combout\,
	cout => \Add21~9\);

-- Location: LCCOMB_X41_Y20_N18
\bg_address[9]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[9]~6_combout\ = \Add21~0_combout\ $ (VCC)
-- \bg_address[9]~7\ = CARRY(\Add21~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add21~0_combout\,
	datad => VCC,
	combout => \bg_address[9]~6_combout\,
	cout => \bg_address[9]~7\);

-- Location: LCCOMB_X41_Y20_N20
\bg_address[10]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[10]~8_combout\ = (\Add21~2_combout\ & (\bg_address[9]~7\ & VCC)) # (!\Add21~2_combout\ & (!\bg_address[9]~7\))
-- \bg_address[10]~9\ = CARRY((!\Add21~2_combout\ & !\bg_address[9]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add21~2_combout\,
	datad => VCC,
	cin => \bg_address[9]~7\,
	combout => \bg_address[10]~8_combout\,
	cout => \bg_address[10]~9\);

-- Location: LCCOMB_X41_Y20_N22
\bg_address[11]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[11]~10_combout\ = (\Add21~4_combout\ & ((GND) # (!\bg_address[10]~9\))) # (!\Add21~4_combout\ & (\bg_address[10]~9\ $ (GND)))
-- \bg_address[11]~11\ = CARRY((\Add21~4_combout\) # (!\bg_address[10]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add21~4_combout\,
	datad => VCC,
	cin => \bg_address[10]~9\,
	combout => \bg_address[11]~10_combout\,
	cout => \bg_address[11]~11\);

-- Location: LCCOMB_X41_Y20_N24
\bg_address[12]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[12]~12_combout\ = (\Add21~6_combout\ & (!\bg_address[11]~11\)) # (!\Add21~6_combout\ & ((\bg_address[11]~11\) # (GND)))
-- \bg_address[12]~13\ = CARRY((!\bg_address[11]~11\) # (!\Add21~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add21~6_combout\,
	datad => VCC,
	cin => \bg_address[11]~11\,
	combout => \bg_address[12]~12_combout\,
	cout => \bg_address[12]~13\);

-- Location: LCCOMB_X41_Y20_N26
\bg_address[13]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[13]~14_combout\ = (\Add21~8_combout\ & (\bg_address[12]~13\ $ (GND))) # (!\Add21~8_combout\ & (!\bg_address[12]~13\ & VCC))
-- \bg_address[13]~15\ = CARRY((\Add21~8_combout\ & !\bg_address[12]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add21~8_combout\,
	datad => VCC,
	cin => \bg_address[12]~13\,
	combout => \bg_address[13]~14_combout\,
	cout => \bg_address[13]~15\);

-- Location: LCCOMB_X39_Y23_N2
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

-- Location: LCCOMB_X39_Y23_N4
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

-- Location: LCCOMB_X39_Y23_N6
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

-- Location: LCCOMB_X39_Y23_N8
\LessThan11~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~7_cout\ = CARRY((hposition(3) & ((!\LessThan11~5_cout\) # (!\bg_hstart~29_combout\))) # (!hposition(3) & (!\bg_hstart~29_combout\ & !\LessThan11~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \bg_hstart~29_combout\,
	datad => VCC,
	cin => \LessThan11~5_cout\,
	cout => \LessThan11~7_cout\);

-- Location: LCCOMB_X39_Y23_N10
\LessThan11~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~9_cout\ = CARRY((hposition(4) & (\bg_hstart~28_combout\ & !\LessThan11~7_cout\)) # (!hposition(4) & ((\bg_hstart~28_combout\) # (!\LessThan11~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \bg_hstart~28_combout\,
	datad => VCC,
	cin => \LessThan11~7_cout\,
	cout => \LessThan11~9_cout\);

-- Location: LCCOMB_X39_Y23_N12
\LessThan11~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~11_cout\ = CARRY((hposition(5) & ((!\LessThan11~9_cout\) # (!\bg_hstart~27_combout\))) # (!hposition(5) & (!\bg_hstart~27_combout\ & !\LessThan11~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datab => \bg_hstart~27_combout\,
	datad => VCC,
	cin => \LessThan11~9_cout\,
	cout => \LessThan11~11_cout\);

-- Location: LCCOMB_X39_Y23_N14
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

-- Location: LCCOMB_X39_Y23_N16
\LessThan11~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~15_cout\ = CARRY((\bg_hstart~26_combout\ & (hposition(7) & !\LessThan11~13_cout\)) # (!\bg_hstart~26_combout\ & ((hposition(7)) # (!\LessThan11~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~26_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan11~13_cout\,
	cout => \LessThan11~15_cout\);

-- Location: LCCOMB_X39_Y23_N18
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

-- Location: LCCOMB_X39_Y23_N20
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

-- Location: LCCOMB_X39_Y23_N22
\LessThan11~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~21_cout\ = CARRY((hposition(10) & (\bg_hstart~24_combout\ & !\LessThan11~19_cout\)) # (!hposition(10) & ((\bg_hstart~24_combout\) # (!\LessThan11~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \bg_hstart~24_combout\,
	datad => VCC,
	cin => \LessThan11~19_cout\,
	cout => \LessThan11~21_cout\);

-- Location: LCCOMB_X39_Y23_N24
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

-- Location: LCCOMB_X39_Y23_N26
\LessThan11~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~25_cout\ = CARRY((hposition(12) & (\bg_hstart~22_combout\ & !\LessThan11~23_cout\)) # (!hposition(12) & ((\bg_hstart~22_combout\) # (!\LessThan11~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \bg_hstart~22_combout\,
	datad => VCC,
	cin => \LessThan11~23_cout\,
	cout => \LessThan11~25_cout\);

-- Location: LCCOMB_X39_Y23_N28
\LessThan11~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~27_cout\ = CARRY((\bg_hstart~21_combout\ & (hposition(13) & !\LessThan11~25_cout\)) # (!\bg_hstart~21_combout\ & ((hposition(13)) # (!\LessThan11~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~21_combout\,
	datab => hposition(13),
	datad => VCC,
	cin => \LessThan11~25_cout\,
	cout => \LessThan11~27_cout\);

-- Location: LCCOMB_X39_Y23_N30
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

-- Location: LCCOMB_X39_Y22_N0
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

-- Location: LCCOMB_X39_Y22_N2
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

-- Location: LCCOMB_X39_Y22_N4
\LessThan11~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~35_cout\ = CARRY((\bg_hstart~17_combout\ & (hposition(17) & !\LessThan11~33_cout\)) # (!\bg_hstart~17_combout\ & ((hposition(17)) # (!\LessThan11~33_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~17_combout\,
	datab => hposition(17),
	datad => VCC,
	cin => \LessThan11~33_cout\,
	cout => \LessThan11~35_cout\);

-- Location: LCCOMB_X39_Y22_N6
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

-- Location: LCCOMB_X39_Y22_N8
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

-- Location: LCCOMB_X39_Y22_N10
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

-- Location: LCCOMB_X39_Y22_N12
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

-- Location: LCCOMB_X39_Y22_N14
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

-- Location: LCCOMB_X39_Y22_N16
\LessThan11~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~47_cout\ = CARRY((hposition(23) & ((!\LessThan11~45_cout\) # (!\bg_hstart~11_combout\))) # (!hposition(23) & (!\bg_hstart~11_combout\ & !\LessThan11~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \bg_hstart~11_combout\,
	datad => VCC,
	cin => \LessThan11~45_cout\,
	cout => \LessThan11~47_cout\);

-- Location: LCCOMB_X39_Y22_N18
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

-- Location: LCCOMB_X39_Y22_N20
\LessThan11~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~51_cout\ = CARRY((\bg_hstart~9_combout\ & (hposition(25) & !\LessThan11~49_cout\)) # (!\bg_hstart~9_combout\ & ((hposition(25)) # (!\LessThan11~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~9_combout\,
	datab => hposition(25),
	datad => VCC,
	cin => \LessThan11~49_cout\,
	cout => \LessThan11~51_cout\);

-- Location: LCCOMB_X39_Y22_N22
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

-- Location: LCCOMB_X39_Y22_N24
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

-- Location: LCCOMB_X39_Y22_N26
\LessThan11~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~57_cout\ = CARRY((hposition(28) & (\bg_hstart~6_combout\ & !\LessThan11~55_cout\)) # (!hposition(28) & ((\bg_hstart~6_combout\) # (!\LessThan11~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => \bg_hstart~6_combout\,
	datad => VCC,
	cin => \LessThan11~55_cout\,
	cout => \LessThan11~57_cout\);

-- Location: LCCOMB_X39_Y22_N28
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

-- Location: LCCOMB_X39_Y22_N30
\LessThan11~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan11~60_combout\ = (\bg_hstart~4_combout\ & ((!hposition(30)) # (!\LessThan11~59_cout\))) # (!\bg_hstart~4_combout\ & (!\LessThan11~59_cout\ & !hposition(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstart~4_combout\,
	datad => hposition(30),
	cin => \LessThan11~59_cout\,
	combout => \LessThan11~60_combout\);

-- Location: LCCOMB_X44_Y17_N6
\r[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[3]~0_combout\ = (\LessThan19~5_combout\ & (!vposition(31) & (!vposition(30) & \LessThan19~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~5_combout\,
	datab => vposition(31),
	datac => vposition(30),
	datad => \LessThan19~4_combout\,
	combout => \r[3]~0_combout\);

-- Location: LCCOMB_X44_Y17_N8
\process_0~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~21_combout\ = (vposition(9) & (!hposition(31) & \r[3]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => vposition(9),
	datac => hposition(31),
	datad => \r[3]~0_combout\,
	combout => \process_0~21_combout\);

-- Location: LCCOMB_X35_Y21_N0
\bg_hstop[30]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[30]~feeder_combout\ = \bg_hstop~10_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~10_combout\,
	combout => \bg_hstop[30]~feeder_combout\);

-- Location: FF_X35_Y21_N1
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

-- Location: LCCOMB_X36_Y22_N18
\bg_hstop~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~18_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~46_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(23),
	datac => \LessThan2~20_combout\,
	datad => \Add13~46_combout\,
	combout => \bg_hstop~18_combout\);

-- Location: LCCOMB_X36_Y22_N26
\bg_hstop[23]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[23]~feeder_combout\ = \bg_hstop~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~18_combout\,
	combout => \bg_hstop[23]~feeder_combout\);

-- Location: FF_X36_Y22_N27
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

-- Location: LCCOMB_X34_Y23_N0
\Add13~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~0_combout\ = bg_hstop(0) $ (VCC)
-- \Add13~1\ = CARRY(bg_hstop(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(0),
	datad => VCC,
	combout => \Add13~0_combout\,
	cout => \Add13~1\);

-- Location: LCCOMB_X35_Y21_N10
\bg_hstop~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~42_combout\ = (\LessThan0~8_combout\ & (!\Add13~62_combout\ & ((\Add13~0_combout\)))) # (!\LessThan0~8_combout\ & (((bg_hstop(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~62_combout\,
	datab => bg_hstop(0),
	datac => \Add13~0_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~42_combout\);

-- Location: LCCOMB_X35_Y21_N12
\LessThan2~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~15_combout\ = (\Add13~6_combout\) # ((\Add13~0_combout\) # ((\Add13~2_combout\) # (\Add13~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~6_combout\,
	datab => \Add13~0_combout\,
	datac => \Add13~2_combout\,
	datad => \Add13~4_combout\,
	combout => \LessThan2~15_combout\);

-- Location: LCCOMB_X35_Y21_N22
\LessThan2~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~16_combout\ = (\LessThan0~8_combout\ & ((\LessThan2~15_combout\) # ((\Add13~8_combout\) # (\Add13~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~15_combout\,
	datab => \Add13~8_combout\,
	datac => \Add13~10_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~16_combout\);

-- Location: LCCOMB_X36_Y23_N24
\LessThan2~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~13_combout\ = (bg_hstop(5)) # ((bg_hstop(4)) # ((bg_hstop(2)) # (bg_hstop(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(5),
	datab => bg_hstop(4),
	datac => bg_hstop(2),
	datad => bg_hstop(3),
	combout => \LessThan2~13_combout\);

-- Location: LCCOMB_X35_Y21_N18
\LessThan2~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~14_combout\ = (!\LessThan0~8_combout\ & ((bg_hstop(1)) # ((bg_hstop(0)) # (\LessThan2~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(1),
	datab => bg_hstop(0),
	datac => \LessThan2~13_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~14_combout\);

-- Location: LCCOMB_X35_Y21_N8
\LessThan2~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~17_combout\ = (\LessThan0~8_combout\ & ((!\Add13~14_combout\))) # (!\LessThan0~8_combout\ & (!bg_hstop(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(7),
	datac => \Add13~14_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~17_combout\);

-- Location: LCCOMB_X35_Y21_N24
\Add13~64\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~64_combout\ = (\LessThan0~8_combout\ & ((\Add13~12_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(6),
	datac => \Add13~12_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add13~64_combout\);

-- Location: LCCOMB_X35_Y21_N26
\LessThan2~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~18_combout\ = ((\Add13~64_combout\ & ((\LessThan2~16_combout\) # (\LessThan2~14_combout\)))) # (!\LessThan2~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~16_combout\,
	datab => \LessThan2~14_combout\,
	datac => \LessThan2~17_combout\,
	datad => \Add13~64_combout\,
	combout => \LessThan2~18_combout\);

-- Location: LCCOMB_X35_Y21_N4
\LessThan2~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~19_combout\ = (\LessThan2~18_combout\ & ((\LessThan0~8_combout\ & ((\Add13~18_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~18_combout\,
	datab => bg_hstop(9),
	datac => \Add13~18_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~19_combout\);

-- Location: LCCOMB_X36_Y21_N0
\bg_hstop~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~38_combout\ = (\bg_hstop~42_combout\ & ((\LessThan2~22_combout\) # ((\LessThan2~19_combout\ & !\bg_hstop~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~42_combout\,
	datab => \LessThan2~19_combout\,
	datac => \LessThan2~22_combout\,
	datad => \bg_hstop~11_combout\,
	combout => \bg_hstop~38_combout\);

-- Location: FF_X36_Y21_N1
\bg_hstop[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(0));

-- Location: LCCOMB_X34_Y23_N2
\Add13~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~2_combout\ = (bg_hstop(1) & (\Add13~1\ & VCC)) # (!bg_hstop(1) & (!\Add13~1\))
-- \Add13~3\ = CARRY((!bg_hstop(1) & !\Add13~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(1),
	datad => VCC,
	cin => \Add13~1\,
	combout => \Add13~2_combout\,
	cout => \Add13~3\);

-- Location: LCCOMB_X35_Y22_N18
\bg_hstop~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~37_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~2_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(1),
	datab => \LessThan0~8_combout\,
	datac => \Add13~2_combout\,
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~37_combout\);

-- Location: FF_X35_Y22_N23
\bg_hstop[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~37_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(1));

-- Location: LCCOMB_X34_Y23_N4
\Add13~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~4_combout\ = (bg_hstop(2) & ((GND) # (!\Add13~3\))) # (!bg_hstop(2) & (\Add13~3\ $ (GND)))
-- \Add13~5\ = CARRY((bg_hstop(2)) # (!\Add13~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(2),
	datad => VCC,
	cin => \Add13~3\,
	combout => \Add13~4_combout\,
	cout => \Add13~5\);

-- Location: LCCOMB_X35_Y22_N20
\bg_hstop~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~36_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~4_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~4_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(2),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~36_combout\);

-- Location: FF_X35_Y22_N21
\bg_hstop[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(2));

-- Location: LCCOMB_X34_Y23_N6
\Add13~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~6_combout\ = (bg_hstop(3) & (\Add13~5\ & VCC)) # (!bg_hstop(3) & (!\Add13~5\))
-- \Add13~7\ = CARRY((!bg_hstop(3) & !\Add13~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(3),
	datad => VCC,
	cin => \Add13~5\,
	combout => \Add13~6_combout\,
	cout => \Add13~7\);

-- Location: LCCOMB_X35_Y22_N26
\bg_hstop~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~35_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~6_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~6_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(3),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~35_combout\);

-- Location: FF_X35_Y22_N27
\bg_hstop[3]\ : dffeas
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
	q => bg_hstop(3));

-- Location: LCCOMB_X34_Y23_N8
\Add13~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~8_combout\ = (bg_hstop(4) & ((GND) # (!\Add13~7\))) # (!bg_hstop(4) & (\Add13~7\ $ (GND)))
-- \Add13~9\ = CARRY((bg_hstop(4)) # (!\Add13~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(4),
	datad => VCC,
	cin => \Add13~7\,
	combout => \Add13~8_combout\,
	cout => \Add13~9\);

-- Location: LCCOMB_X35_Y22_N24
\bg_hstop~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~34_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~8_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~8_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(4),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~34_combout\);

-- Location: FF_X35_Y22_N25
\bg_hstop[4]\ : dffeas
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
	q => bg_hstop(4));

-- Location: LCCOMB_X34_Y23_N10
\Add13~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~10_combout\ = (bg_hstop(5) & (\Add13~9\ & VCC)) # (!bg_hstop(5) & (!\Add13~9\))
-- \Add13~11\ = CARRY((!bg_hstop(5) & !\Add13~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(5),
	datad => VCC,
	cin => \Add13~9\,
	combout => \Add13~10_combout\,
	cout => \Add13~11\);

-- Location: LCCOMB_X35_Y22_N30
\bg_hstop~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~33_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~10_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~10_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(5),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~33_combout\);

-- Location: FF_X35_Y22_N31
\bg_hstop[5]\ : dffeas
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
	q => bg_hstop(5));

-- Location: LCCOMB_X34_Y23_N12
\Add13~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~12_combout\ = (bg_hstop(6) & ((GND) # (!\Add13~11\))) # (!bg_hstop(6) & (\Add13~11\ $ (GND)))
-- \Add13~13\ = CARRY((bg_hstop(6)) # (!\Add13~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(6),
	datad => VCC,
	cin => \Add13~11\,
	combout => \Add13~12_combout\,
	cout => \Add13~13\);

-- Location: LCCOMB_X35_Y22_N28
\bg_hstop~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~41_combout\ = ((\LessThan0~8_combout\ & (\Add13~12_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(6))))) # (!\LessThan2~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~12_combout\,
	datac => bg_hstop(6),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~41_combout\);

-- Location: FF_X35_Y22_N29
\bg_hstop[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(6));

-- Location: LCCOMB_X34_Y23_N14
\Add13~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~14_combout\ = (bg_hstop(7) & (\Add13~13\ & VCC)) # (!bg_hstop(7) & (!\Add13~13\))
-- \Add13~15\ = CARRY((!bg_hstop(7) & !\Add13~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(7),
	datad => VCC,
	cin => \Add13~13\,
	combout => \Add13~14_combout\,
	cout => \Add13~15\);

-- Location: LCCOMB_X35_Y21_N16
\bg_hstop~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~40_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~14_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(7),
	datac => \Add13~14_combout\,
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~40_combout\);

-- Location: LCCOMB_X35_Y21_N20
\bg_hstop[7]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[7]~feeder_combout\ = \bg_hstop~40_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~40_combout\,
	combout => \bg_hstop[7]~feeder_combout\);

-- Location: FF_X35_Y21_N21
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

-- Location: LCCOMB_X34_Y23_N16
\Add13~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~16_combout\ = (bg_hstop(8) & ((GND) # (!\Add13~15\))) # (!bg_hstop(8) & (\Add13~15\ $ (GND)))
-- \Add13~17\ = CARRY((bg_hstop(8)) # (!\Add13~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(8),
	datad => VCC,
	cin => \Add13~15\,
	combout => \Add13~16_combout\,
	cout => \Add13~17\);

-- Location: LCCOMB_X34_Y23_N18
\Add13~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~18_combout\ = (bg_hstop(9) & (\Add13~17\ & VCC)) # (!bg_hstop(9) & (!\Add13~17\))
-- \Add13~19\ = CARRY((!bg_hstop(9) & !\Add13~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(9),
	datad => VCC,
	cin => \Add13~17\,
	combout => \Add13~18_combout\,
	cout => \Add13~19\);

-- Location: LCCOMB_X35_Y21_N14
\bg_hstop~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~32_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~18_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~18_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(9),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~32_combout\);

-- Location: LCCOMB_X35_Y21_N2
\bg_hstop[9]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[9]~feeder_combout\ = \bg_hstop~32_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~32_combout\,
	combout => \bg_hstop[9]~feeder_combout\);

-- Location: FF_X35_Y21_N3
\bg_hstop[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(9));

-- Location: LCCOMB_X34_Y23_N20
\Add13~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~20_combout\ = (bg_hstop(10) & ((GND) # (!\Add13~19\))) # (!bg_hstop(10) & (\Add13~19\ $ (GND)))
-- \Add13~21\ = CARRY((bg_hstop(10)) # (!\Add13~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(10),
	datad => VCC,
	cin => \Add13~19\,
	combout => \Add13~20_combout\,
	cout => \Add13~21\);

-- Location: LCCOMB_X36_Y23_N22
\bg_hstop~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~31_combout\ = ((\LessThan0~8_combout\ & (\Add13~20_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(10))))) # (!\LessThan2~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~20_combout\,
	datab => bg_hstop(10),
	datac => \LessThan2~20_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~31_combout\);

-- Location: FF_X36_Y23_N29
\bg_hstop[10]\ : dffeas
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
	q => bg_hstop(10));

-- Location: LCCOMB_X34_Y23_N22
\Add13~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~22_combout\ = (bg_hstop(11) & (\Add13~21\ & VCC)) # (!bg_hstop(11) & (!\Add13~21\))
-- \Add13~23\ = CARRY((!bg_hstop(11) & !\Add13~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(11),
	datad => VCC,
	cin => \Add13~21\,
	combout => \Add13~22_combout\,
	cout => \Add13~23\);

-- Location: LCCOMB_X36_Y23_N4
\bg_hstop~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~30_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~22_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~20_combout\,
	datab => \Add13~22_combout\,
	datac => bg_hstop(11),
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~30_combout\);

-- Location: FF_X36_Y23_N11
\bg_hstop[11]\ : dffeas
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
	q => bg_hstop(11));

-- Location: LCCOMB_X34_Y23_N24
\Add13~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~24_combout\ = (bg_hstop(12) & ((GND) # (!\Add13~23\))) # (!bg_hstop(12) & (\Add13~23\ $ (GND)))
-- \Add13~25\ = CARRY((bg_hstop(12)) # (!\Add13~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(12),
	datad => VCC,
	cin => \Add13~23\,
	combout => \Add13~24_combout\,
	cout => \Add13~25\);

-- Location: LCCOMB_X35_Y23_N2
\bg_hstop~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~29_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~24_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(12),
	datab => \Add13~24_combout\,
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~29_combout\);

-- Location: LCCOMB_X35_Y23_N20
\bg_hstop[12]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[12]~feeder_combout\ = \bg_hstop~29_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \bg_hstop~29_combout\,
	combout => \bg_hstop[12]~feeder_combout\);

-- Location: FF_X35_Y23_N21
\bg_hstop[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(12));

-- Location: LCCOMB_X34_Y23_N26
\Add13~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~26_combout\ = (bg_hstop(13) & (\Add13~25\ & VCC)) # (!bg_hstop(13) & (!\Add13~25\))
-- \Add13~27\ = CARRY((!bg_hstop(13) & !\Add13~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(13),
	datad => VCC,
	cin => \Add13~25\,
	combout => \Add13~26_combout\,
	cout => \Add13~27\);

-- Location: LCCOMB_X35_Y23_N8
\bg_hstop~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~28_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~26_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~26_combout\,
	datab => bg_hstop(13),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~28_combout\);

-- Location: LCCOMB_X35_Y23_N18
\bg_hstop[13]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[13]~feeder_combout\ = \bg_hstop~28_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~28_combout\,
	combout => \bg_hstop[13]~feeder_combout\);

-- Location: FF_X35_Y23_N19
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

-- Location: LCCOMB_X34_Y23_N28
\Add13~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~28_combout\ = (bg_hstop(14) & ((GND) # (!\Add13~27\))) # (!bg_hstop(14) & (\Add13~27\ $ (GND)))
-- \Add13~29\ = CARRY((bg_hstop(14)) # (!\Add13~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(14),
	datad => VCC,
	cin => \Add13~27\,
	combout => \Add13~28_combout\,
	cout => \Add13~29\);

-- Location: LCCOMB_X36_Y23_N2
\bg_hstop~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~27_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~28_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~28_combout\,
	datab => bg_hstop(14),
	datac => \LessThan2~20_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~27_combout\);

-- Location: FF_X36_Y23_N17
\bg_hstop[14]\ : dffeas
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
	q => bg_hstop(14));

-- Location: LCCOMB_X34_Y23_N30
\Add13~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~30_combout\ = (bg_hstop(15) & (\Add13~29\ & VCC)) # (!bg_hstop(15) & (!\Add13~29\))
-- \Add13~31\ = CARRY((!bg_hstop(15) & !\Add13~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(15),
	datad => VCC,
	cin => \Add13~29\,
	combout => \Add13~30_combout\,
	cout => \Add13~31\);

-- Location: LCCOMB_X36_Y22_N14
\bg_hstop~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~26_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~30_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(15),
	datac => \LessThan2~20_combout\,
	datad => \Add13~30_combout\,
	combout => \bg_hstop~26_combout\);

-- Location: LCCOMB_X36_Y22_N0
\bg_hstop[15]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[15]~feeder_combout\ = \bg_hstop~26_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~26_combout\,
	combout => \bg_hstop[15]~feeder_combout\);

-- Location: FF_X36_Y22_N1
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

-- Location: LCCOMB_X34_Y22_N0
\Add13~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~32_combout\ = (bg_hstop(16) & ((GND) # (!\Add13~31\))) # (!bg_hstop(16) & (\Add13~31\ $ (GND)))
-- \Add13~33\ = CARRY((bg_hstop(16)) # (!\Add13~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(16),
	datad => VCC,
	cin => \Add13~31\,
	combout => \Add13~32_combout\,
	cout => \Add13~33\);

-- Location: LCCOMB_X36_Y23_N8
\bg_hstop~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~25_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~32_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(16),
	datab => \Add13~32_combout\,
	datac => \LessThan2~20_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~25_combout\);

-- Location: LCCOMB_X36_Y23_N6
\bg_hstop[16]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[16]~feeder_combout\ = \bg_hstop~25_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~25_combout\,
	combout => \bg_hstop[16]~feeder_combout\);

-- Location: FF_X36_Y23_N7
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

-- Location: LCCOMB_X34_Y22_N2
\Add13~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~34_combout\ = (bg_hstop(17) & (\Add13~33\ & VCC)) # (!bg_hstop(17) & (!\Add13~33\))
-- \Add13~35\ = CARRY((!bg_hstop(17) & !\Add13~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(17),
	datad => VCC,
	cin => \Add13~33\,
	combout => \Add13~34_combout\,
	cout => \Add13~35\);

-- Location: LCCOMB_X36_Y23_N14
\bg_hstop~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~24_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~34_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(17),
	datac => \LessThan2~20_combout\,
	datad => \Add13~34_combout\,
	combout => \bg_hstop~24_combout\);

-- Location: LCCOMB_X36_Y23_N20
\bg_hstop[17]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[17]~feeder_combout\ = \bg_hstop~24_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~24_combout\,
	combout => \bg_hstop[17]~feeder_combout\);

-- Location: FF_X36_Y23_N21
\bg_hstop[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[17]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(17));

-- Location: LCCOMB_X34_Y22_N4
\Add13~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~36_combout\ = (bg_hstop(18) & ((GND) # (!\Add13~35\))) # (!bg_hstop(18) & (\Add13~35\ $ (GND)))
-- \Add13~37\ = CARRY((bg_hstop(18)) # (!\Add13~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(18),
	datad => VCC,
	cin => \Add13~35\,
	combout => \Add13~36_combout\,
	cout => \Add13~37\);

-- Location: LCCOMB_X35_Y23_N22
\bg_hstop~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~23_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~36_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~36_combout\,
	datab => bg_hstop(18),
	datac => \LessThan0~8_combout\,
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~23_combout\);

-- Location: LCCOMB_X35_Y23_N16
\bg_hstop[18]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[18]~feeder_combout\ = \bg_hstop~23_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~23_combout\,
	combout => \bg_hstop[18]~feeder_combout\);

-- Location: FF_X35_Y23_N17
\bg_hstop[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop[18]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(18));

-- Location: LCCOMB_X34_Y22_N6
\Add13~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~38_combout\ = (bg_hstop(19) & (\Add13~37\ & VCC)) # (!bg_hstop(19) & (!\Add13~37\))
-- \Add13~39\ = CARRY((!bg_hstop(19) & !\Add13~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(19),
	datad => VCC,
	cin => \Add13~37\,
	combout => \Add13~38_combout\,
	cout => \Add13~39\);

-- Location: LCCOMB_X36_Y23_N12
\bg_hstop~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~22_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~38_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(19),
	datab => \Add13~38_combout\,
	datac => \LessThan2~20_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~22_combout\);

-- Location: FF_X36_Y23_N19
\bg_hstop[19]\ : dffeas
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
	q => bg_hstop(19));

-- Location: LCCOMB_X34_Y22_N8
\Add13~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~40_combout\ = (bg_hstop(20) & ((GND) # (!\Add13~39\))) # (!bg_hstop(20) & (\Add13~39\ $ (GND)))
-- \Add13~41\ = CARRY((bg_hstop(20)) # (!\Add13~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(20),
	datad => VCC,
	cin => \Add13~39\,
	combout => \Add13~40_combout\,
	cout => \Add13~41\);

-- Location: LCCOMB_X36_Y23_N26
\bg_hstop~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~21_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~40_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(20)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(20),
	datac => \LessThan2~20_combout\,
	datad => \Add13~40_combout\,
	combout => \bg_hstop~21_combout\);

-- Location: LCCOMB_X36_Y23_N0
\bg_hstop[20]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop[20]~feeder_combout\ = \bg_hstop~21_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \bg_hstop~21_combout\,
	combout => \bg_hstop[20]~feeder_combout\);

-- Location: FF_X36_Y23_N1
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

-- Location: LCCOMB_X34_Y22_N10
\Add13~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~42_combout\ = (bg_hstop(21) & (\Add13~41\ & VCC)) # (!bg_hstop(21) & (!\Add13~41\))
-- \Add13~43\ = CARRY((!bg_hstop(21) & !\Add13~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(21),
	datad => VCC,
	cin => \Add13~41\,
	combout => \Add13~42_combout\,
	cout => \Add13~43\);

-- Location: LCCOMB_X36_Y22_N6
\bg_hstop~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~20_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~42_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~42_combout\,
	datac => bg_hstop(21),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~20_combout\);

-- Location: FF_X36_Y22_N7
\bg_hstop[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(21));

-- Location: LCCOMB_X34_Y22_N12
\Add13~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~44_combout\ = (bg_hstop(22) & ((GND) # (!\Add13~43\))) # (!bg_hstop(22) & (\Add13~43\ $ (GND)))
-- \Add13~45\ = CARRY((bg_hstop(22)) # (!\Add13~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(22),
	datad => VCC,
	cin => \Add13~43\,
	combout => \Add13~44_combout\,
	cout => \Add13~45\);

-- Location: LCCOMB_X36_Y22_N20
\bg_hstop~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~19_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~44_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(22)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(22),
	datac => \LessThan2~20_combout\,
	datad => \Add13~44_combout\,
	combout => \bg_hstop~19_combout\);

-- Location: FF_X36_Y22_N29
\bg_hstop[22]\ : dffeas
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
	q => bg_hstop(22));

-- Location: LCCOMB_X34_Y22_N14
\Add13~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~46_combout\ = (bg_hstop(23) & (\Add13~45\ & VCC)) # (!bg_hstop(23) & (!\Add13~45\))
-- \Add13~47\ = CARRY((!bg_hstop(23) & !\Add13~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(23),
	datad => VCC,
	cin => \Add13~45\,
	combout => \Add13~46_combout\,
	cout => \Add13~47\);

-- Location: LCCOMB_X36_Y22_N10
\LessThan2~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~10_combout\ = (\Add13~46_combout\) # ((\Add13~42_combout\) # (\Add13~44_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~46_combout\,
	datac => \Add13~42_combout\,
	datad => \Add13~44_combout\,
	combout => \LessThan2~10_combout\);

-- Location: LCCOMB_X34_Y22_N16
\Add13~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~48_combout\ = (bg_hstop(24) & ((GND) # (!\Add13~47\))) # (!bg_hstop(24) & (\Add13~47\ $ (GND)))
-- \Add13~49\ = CARRY((bg_hstop(24)) # (!\Add13~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(24),
	datad => VCC,
	cin => \Add13~47\,
	combout => \Add13~48_combout\,
	cout => \Add13~49\);

-- Location: LCCOMB_X36_Y22_N8
\bg_hstop~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~17_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~48_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(24))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~48_combout\,
	datac => bg_hstop(24),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~17_combout\);

-- Location: FF_X36_Y22_N9
\bg_hstop[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(24));

-- Location: LCCOMB_X34_Y22_N18
\Add13~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~50_combout\ = (bg_hstop(25) & (\Add13~49\ & VCC)) # (!bg_hstop(25) & (!\Add13~49\))
-- \Add13~51\ = CARRY((!bg_hstop(25) & !\Add13~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(25),
	datad => VCC,
	cin => \Add13~49\,
	combout => \Add13~50_combout\,
	cout => \Add13~51\);

-- Location: LCCOMB_X36_Y22_N12
\LessThan2~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~11_combout\ = (\Add13~48_combout\) # ((\Add13~58_combout\) # (\Add13~52_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add13~48_combout\,
	datac => \Add13~58_combout\,
	datad => \Add13~52_combout\,
	combout => \LessThan2~11_combout\);

-- Location: LCCOMB_X36_Y22_N30
\LessThan2~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~12_combout\ = (\LessThan2~10_combout\) # ((\Add13~54_combout\) # ((\Add13~50_combout\) # (\LessThan2~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~10_combout\,
	datab => \Add13~54_combout\,
	datac => \Add13~50_combout\,
	datad => \LessThan2~11_combout\,
	combout => \LessThan2~12_combout\);

-- Location: LCCOMB_X36_Y22_N28
\LessThan2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~4_combout\ = (bg_hstop(23)) # ((bg_hstop(24)) # ((bg_hstop(22)) # (bg_hstop(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(23),
	datab => bg_hstop(24),
	datac => bg_hstop(22),
	datad => bg_hstop(21),
	combout => \LessThan2~4_combout\);

-- Location: LCCOMB_X36_Y23_N16
\LessThan2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~6_combout\ = (bg_hstop(16)) # ((bg_hstop(15)) # ((bg_hstop(14)) # (bg_hstop(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(16),
	datab => bg_hstop(15),
	datac => bg_hstop(14),
	datad => bg_hstop(13),
	combout => \LessThan2~6_combout\);

-- Location: LCCOMB_X36_Y22_N22
\LessThan2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~3_combout\ = (bg_hstop(28)) # ((bg_hstop(26)) # ((bg_hstop(25)) # (bg_hstop(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(28),
	datab => bg_hstop(26),
	datac => bg_hstop(25),
	datad => bg_hstop(27),
	combout => \LessThan2~3_combout\);

-- Location: LCCOMB_X36_Y23_N18
\LessThan2~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~5_combout\ = (bg_hstop(18)) # ((bg_hstop(20)) # ((bg_hstop(19)) # (bg_hstop(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(18),
	datab => bg_hstop(20),
	datac => bg_hstop(19),
	datad => bg_hstop(17),
	combout => \LessThan2~5_combout\);

-- Location: LCCOMB_X36_Y23_N30
\LessThan2~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~7_combout\ = (\LessThan2~4_combout\) # ((\LessThan2~6_combout\) # ((\LessThan2~3_combout\) # (\LessThan2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~4_combout\,
	datab => \LessThan2~6_combout\,
	datac => \LessThan2~3_combout\,
	datad => \LessThan2~5_combout\,
	combout => \LessThan2~7_combout\);

-- Location: LCCOMB_X36_Y23_N10
\LessThan2~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~8_combout\ = (bg_hstop(12)) # ((bg_hstop(10)) # ((bg_hstop(11)) # (bg_hstop(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(12),
	datab => bg_hstop(10),
	datac => bg_hstop(11),
	datad => bg_hstop(29),
	combout => \LessThan2~8_combout\);

-- Location: LCCOMB_X36_Y23_N28
\LessThan2~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~9_combout\ = (\LessThan2~7_combout\) # ((bg_hstop(30)) # (\LessThan2~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~7_combout\,
	datab => bg_hstop(30),
	datad => \LessThan2~8_combout\,
	combout => \LessThan2~9_combout\);

-- Location: LCCOMB_X34_Y22_N28
\Add13~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~60_combout\ = (bg_hstop(30) & ((GND) # (!\Add13~59\))) # (!bg_hstop(30) & (\Add13~59\ $ (GND)))
-- \Add13~61\ = CARRY((bg_hstop(30)) # (!\Add13~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(30),
	datad => VCC,
	cin => \Add13~59\,
	combout => \Add13~60_combout\,
	cout => \Add13~61\);

-- Location: LCCOMB_X35_Y22_N16
\LessThan2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~0_combout\ = (\Add13~34_combout\) # ((\Add13~26_combout\) # ((\Add13~24_combout\) # (\Add13~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~34_combout\,
	datab => \Add13~26_combout\,
	datac => \Add13~24_combout\,
	datad => \Add13~28_combout\,
	combout => \LessThan2~0_combout\);

-- Location: LCCOMB_X35_Y22_N10
\LessThan2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~1_combout\ = (\Add13~30_combout\) # ((\LessThan2~0_combout\) # ((\Add13~32_combout\) # (\Add13~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~30_combout\,
	datab => \LessThan2~0_combout\,
	datac => \Add13~32_combout\,
	datad => \Add13~40_combout\,
	combout => \LessThan2~1_combout\);

-- Location: LCCOMB_X35_Y22_N12
\LessThan2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~2_combout\ = (\LessThan2~1_combout\) # ((\Add13~36_combout\) # ((\Add13~38_combout\) # (\Add13~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~1_combout\,
	datab => \Add13~36_combout\,
	datac => \Add13~38_combout\,
	datad => \Add13~22_combout\,
	combout => \LessThan2~2_combout\);

-- Location: LCCOMB_X35_Y22_N4
\LessThan2~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~21_combout\ = (\Add13~56_combout\) # ((\Add13~20_combout\) # ((\Add13~60_combout\) # (\LessThan2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~56_combout\,
	datab => \Add13~20_combout\,
	datac => \Add13~60_combout\,
	datad => \LessThan2~2_combout\,
	combout => \LessThan2~21_combout\);

-- Location: LCCOMB_X35_Y22_N6
\LessThan2~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~22_combout\ = (\LessThan0~8_combout\ & ((\LessThan2~12_combout\) # ((\LessThan2~21_combout\)))) # (!\LessThan0~8_combout\ & (((\LessThan2~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~12_combout\,
	datab => \LessThan2~9_combout\,
	datac => \LessThan2~21_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan2~22_combout\);

-- Location: LCCOMB_X35_Y22_N2
\bg_hstop~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~39_combout\ = (((\Add13~62_combout\ & \LessThan0~8_combout\)) # (!\bg_hstop~11_combout\)) # (!\LessThan2~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~22_combout\,
	datab => \Add13~62_combout\,
	datac => \bg_hstop~11_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~39_combout\);

-- Location: FF_X35_Y22_N3
\bg_hstop[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(8));

-- Location: LCCOMB_X35_Y22_N22
\bg_hstop~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~11_combout\ = (\LessThan0~8_combout\ & ((!\Add13~16_combout\))) # (!\LessThan0~8_combout\ & (!bg_hstop(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => bg_hstop(8),
	datad => \Add13~16_combout\,
	combout => \bg_hstop~11_combout\);

-- Location: LCCOMB_X35_Y22_N14
\Add13~65\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~65_combout\ = (\Add13~62_combout\ & \LessThan0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add13~62_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add13~65_combout\);

-- Location: LCCOMB_X35_Y22_N0
\LessThan2~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan2~20_combout\ = (!\Add13~65_combout\ & ((\LessThan2~22_combout\) # ((!\bg_hstop~11_combout\ & \LessThan2~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~11_combout\,
	datab => \Add13~65_combout\,
	datac => \LessThan2~19_combout\,
	datad => \LessThan2~22_combout\,
	combout => \LessThan2~20_combout\);

-- Location: LCCOMB_X36_Y22_N24
\bg_hstop~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~16_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & ((\Add13~50_combout\))) # (!\LessThan0~8_combout\ & (bg_hstop(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~20_combout\,
	datab => bg_hstop(25),
	datac => \LessThan0~8_combout\,
	datad => \Add13~50_combout\,
	combout => \bg_hstop~16_combout\);

-- Location: FF_X36_Y22_N23
\bg_hstop[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	asdata => \bg_hstop~16_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(25));

-- Location: LCCOMB_X34_Y22_N20
\Add13~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~52_combout\ = (bg_hstop(26) & ((GND) # (!\Add13~51\))) # (!bg_hstop(26) & (\Add13~51\ $ (GND)))
-- \Add13~53\ = CARRY((bg_hstop(26)) # (!\Add13~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(26),
	datad => VCC,
	cin => \Add13~51\,
	combout => \Add13~52_combout\,
	cout => \Add13~53\);

-- Location: LCCOMB_X36_Y22_N4
\bg_hstop~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~15_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~52_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~52_combout\,
	datac => bg_hstop(26),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~15_combout\);

-- Location: FF_X36_Y22_N5
\bg_hstop[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(26));

-- Location: LCCOMB_X34_Y22_N22
\Add13~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~54_combout\ = (bg_hstop(27) & (\Add13~53\ & VCC)) # (!bg_hstop(27) & (!\Add13~53\))
-- \Add13~55\ = CARRY((!bg_hstop(27) & !\Add13~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(27),
	datad => VCC,
	cin => \Add13~53\,
	combout => \Add13~54_combout\,
	cout => \Add13~55\);

-- Location: LCCOMB_X36_Y22_N2
\bg_hstop~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~14_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~54_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add13~54_combout\,
	datac => bg_hstop(27),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~14_combout\);

-- Location: FF_X36_Y22_N3
\bg_hstop[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(27));

-- Location: LCCOMB_X34_Y22_N24
\Add13~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~56_combout\ = (bg_hstop(28) & ((GND) # (!\Add13~55\))) # (!bg_hstop(28) & (\Add13~55\ $ (GND)))
-- \Add13~57\ = CARRY((bg_hstop(28)) # (!\Add13~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstop(28),
	datad => VCC,
	cin => \Add13~55\,
	combout => \Add13~56_combout\,
	cout => \Add13~57\);

-- Location: LCCOMB_X35_Y22_N8
\bg_hstop~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~13_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~56_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~56_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(28),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~13_combout\);

-- Location: FF_X35_Y22_N9
\bg_hstop[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(28));

-- Location: LCCOMB_X34_Y22_N26
\Add13~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add13~58_combout\ = (bg_hstop(29) & (\Add13~57\ & VCC)) # (!bg_hstop(29) & (!\Add13~57\))
-- \Add13~59\ = CARRY((!bg_hstop(29) & !\Add13~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstop(29),
	datad => VCC,
	cin => \Add13~57\,
	combout => \Add13~58_combout\,
	cout => \Add13~59\);

-- Location: LCCOMB_X36_Y22_N16
\bg_hstop~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~12_combout\ = (\LessThan2~20_combout\ & ((\LessThan0~8_combout\ & (\Add13~58_combout\)) # (!\LessThan0~8_combout\ & ((bg_hstop(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~58_combout\,
	datab => \LessThan0~8_combout\,
	datac => bg_hstop(29),
	datad => \LessThan2~20_combout\,
	combout => \bg_hstop~12_combout\);

-- Location: FF_X36_Y22_N17
\bg_hstop[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_hstop~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_hstop(29));

-- Location: LCCOMB_X34_Y22_N30
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

-- Location: LCCOMB_X35_Y21_N30
\bg_hstop~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_hstop~10_combout\ = (\LessThan0~8_combout\ & (!\Add13~62_combout\ & ((\Add13~60_combout\)))) # (!\LessThan0~8_combout\ & (((bg_hstop(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add13~62_combout\,
	datab => bg_hstop(30),
	datac => \Add13~60_combout\,
	datad => \LessThan0~8_combout\,
	combout => \bg_hstop~10_combout\);

-- Location: LCCOMB_X36_Y21_N2
\LessThan12~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~1_cout\ = CARRY((hposition(0) & !\bg_hstop~38_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => \bg_hstop~38_combout\,
	datad => VCC,
	cout => \LessThan12~1_cout\);

-- Location: LCCOMB_X36_Y21_N4
\LessThan12~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~3_cout\ = CARRY((hposition(1) & (\bg_hstop~37_combout\ & !\LessThan12~1_cout\)) # (!hposition(1) & ((\bg_hstop~37_combout\) # (!\LessThan12~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => \bg_hstop~37_combout\,
	datad => VCC,
	cin => \LessThan12~1_cout\,
	cout => \LessThan12~3_cout\);

-- Location: LCCOMB_X36_Y21_N6
\LessThan12~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~5_cout\ = CARRY((hposition(2) & ((!\LessThan12~3_cout\) # (!\bg_hstop~36_combout\))) # (!hposition(2) & (!\bg_hstop~36_combout\ & !\LessThan12~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => \bg_hstop~36_combout\,
	datad => VCC,
	cin => \LessThan12~3_cout\,
	cout => \LessThan12~5_cout\);

-- Location: LCCOMB_X36_Y21_N8
\LessThan12~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~7_cout\ = CARRY((hposition(3) & (\bg_hstop~35_combout\ & !\LessThan12~5_cout\)) # (!hposition(3) & ((\bg_hstop~35_combout\) # (!\LessThan12~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \bg_hstop~35_combout\,
	datad => VCC,
	cin => \LessThan12~5_cout\,
	cout => \LessThan12~7_cout\);

-- Location: LCCOMB_X36_Y21_N10
\LessThan12~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~9_cout\ = CARRY((hposition(4) & ((!\LessThan12~7_cout\) # (!\bg_hstop~34_combout\))) # (!hposition(4) & (!\bg_hstop~34_combout\ & !\LessThan12~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \bg_hstop~34_combout\,
	datad => VCC,
	cin => \LessThan12~7_cout\,
	cout => \LessThan12~9_cout\);

-- Location: LCCOMB_X36_Y21_N12
\LessThan12~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~11_cout\ = CARRY((\bg_hstop~33_combout\ & ((!\LessThan12~9_cout\) # (!hposition(5)))) # (!\bg_hstop~33_combout\ & (!hposition(5) & !\LessThan12~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~33_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan12~9_cout\,
	cout => \LessThan12~11_cout\);

-- Location: LCCOMB_X36_Y21_N14
\LessThan12~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~13_cout\ = CARRY((\bg_hstop~41_combout\ & (hposition(6) & !\LessThan12~11_cout\)) # (!\bg_hstop~41_combout\ & ((hposition(6)) # (!\LessThan12~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~41_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan12~11_cout\,
	cout => \LessThan12~13_cout\);

-- Location: LCCOMB_X36_Y21_N16
\LessThan12~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~15_cout\ = CARRY((\bg_hstop~40_combout\ & ((!\LessThan12~13_cout\) # (!hposition(7)))) # (!\bg_hstop~40_combout\ & (!hposition(7) & !\LessThan12~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~40_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan12~13_cout\,
	cout => \LessThan12~15_cout\);

-- Location: LCCOMB_X36_Y21_N18
\LessThan12~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~17_cout\ = CARRY((hposition(8) & ((!\LessThan12~15_cout\) # (!\bg_hstop~39_combout\))) # (!hposition(8) & (!\bg_hstop~39_combout\ & !\LessThan12~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \bg_hstop~39_combout\,
	datad => VCC,
	cin => \LessThan12~15_cout\,
	cout => \LessThan12~17_cout\);

-- Location: LCCOMB_X36_Y21_N20
\LessThan12~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~19_cout\ = CARRY((\bg_hstop~32_combout\ & ((!\LessThan12~17_cout\) # (!hposition(9)))) # (!\bg_hstop~32_combout\ & (!hposition(9) & !\LessThan12~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~32_combout\,
	datab => hposition(9),
	datad => VCC,
	cin => \LessThan12~17_cout\,
	cout => \LessThan12~19_cout\);

-- Location: LCCOMB_X36_Y21_N22
\LessThan12~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~21_cout\ = CARRY((\bg_hstop~31_combout\ & (hposition(10) & !\LessThan12~19_cout\)) # (!\bg_hstop~31_combout\ & ((hposition(10)) # (!\LessThan12~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~31_combout\,
	datab => hposition(10),
	datad => VCC,
	cin => \LessThan12~19_cout\,
	cout => \LessThan12~21_cout\);

-- Location: LCCOMB_X36_Y21_N24
\LessThan12~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~23_cout\ = CARRY((\bg_hstop~30_combout\ & ((!\LessThan12~21_cout\) # (!hposition(11)))) # (!\bg_hstop~30_combout\ & (!hposition(11) & !\LessThan12~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~30_combout\,
	datab => hposition(11),
	datad => VCC,
	cin => \LessThan12~21_cout\,
	cout => \LessThan12~23_cout\);

-- Location: LCCOMB_X36_Y21_N26
\LessThan12~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~25_cout\ = CARRY((\bg_hstop~29_combout\ & (hposition(12) & !\LessThan12~23_cout\)) # (!\bg_hstop~29_combout\ & ((hposition(12)) # (!\LessThan12~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~29_combout\,
	datab => hposition(12),
	datad => VCC,
	cin => \LessThan12~23_cout\,
	cout => \LessThan12~25_cout\);

-- Location: LCCOMB_X36_Y21_N28
\LessThan12~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~27_cout\ = CARRY((hposition(13) & (\bg_hstop~28_combout\ & !\LessThan12~25_cout\)) # (!hposition(13) & ((\bg_hstop~28_combout\) # (!\LessThan12~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \bg_hstop~28_combout\,
	datad => VCC,
	cin => \LessThan12~25_cout\,
	cout => \LessThan12~27_cout\);

-- Location: LCCOMB_X36_Y21_N30
\LessThan12~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~29_cout\ = CARRY((\bg_hstop~27_combout\ & (hposition(14) & !\LessThan12~27_cout\)) # (!\bg_hstop~27_combout\ & ((hposition(14)) # (!\LessThan12~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~27_combout\,
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan12~27_cout\,
	cout => \LessThan12~29_cout\);

-- Location: LCCOMB_X36_Y20_N0
\LessThan12~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~31_cout\ = CARRY((\bg_hstop~26_combout\ & ((!\LessThan12~29_cout\) # (!hposition(15)))) # (!\bg_hstop~26_combout\ & (!hposition(15) & !\LessThan12~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~26_combout\,
	datab => hposition(15),
	datad => VCC,
	cin => \LessThan12~29_cout\,
	cout => \LessThan12~31_cout\);

-- Location: LCCOMB_X36_Y20_N2
\LessThan12~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~33_cout\ = CARRY((hposition(16) & ((!\LessThan12~31_cout\) # (!\bg_hstop~25_combout\))) # (!hposition(16) & (!\bg_hstop~25_combout\ & !\LessThan12~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(16),
	datab => \bg_hstop~25_combout\,
	datad => VCC,
	cin => \LessThan12~31_cout\,
	cout => \LessThan12~33_cout\);

-- Location: LCCOMB_X36_Y20_N4
\LessThan12~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~35_cout\ = CARRY((hposition(17) & (\bg_hstop~24_combout\ & !\LessThan12~33_cout\)) # (!hposition(17) & ((\bg_hstop~24_combout\) # (!\LessThan12~33_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => \bg_hstop~24_combout\,
	datad => VCC,
	cin => \LessThan12~33_cout\,
	cout => \LessThan12~35_cout\);

-- Location: LCCOMB_X36_Y20_N6
\LessThan12~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~37_cout\ = CARRY((\bg_hstop~23_combout\ & (hposition(18) & !\LessThan12~35_cout\)) # (!\bg_hstop~23_combout\ & ((hposition(18)) # (!\LessThan12~35_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~23_combout\,
	datab => hposition(18),
	datad => VCC,
	cin => \LessThan12~35_cout\,
	cout => \LessThan12~37_cout\);

-- Location: LCCOMB_X36_Y20_N8
\LessThan12~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~39_cout\ = CARRY((hposition(19) & (\bg_hstop~22_combout\ & !\LessThan12~37_cout\)) # (!hposition(19) & ((\bg_hstop~22_combout\) # (!\LessThan12~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datab => \bg_hstop~22_combout\,
	datad => VCC,
	cin => \LessThan12~37_cout\,
	cout => \LessThan12~39_cout\);

-- Location: LCCOMB_X36_Y20_N10
\LessThan12~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~41_cout\ = CARRY((hposition(20) & ((!\LessThan12~39_cout\) # (!\bg_hstop~21_combout\))) # (!hposition(20) & (!\bg_hstop~21_combout\ & !\LessThan12~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \bg_hstop~21_combout\,
	datad => VCC,
	cin => \LessThan12~39_cout\,
	cout => \LessThan12~41_cout\);

-- Location: LCCOMB_X36_Y20_N12
\LessThan12~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~43_cout\ = CARRY((\bg_hstop~20_combout\ & ((!\LessThan12~41_cout\) # (!hposition(21)))) # (!\bg_hstop~20_combout\ & (!hposition(21) & !\LessThan12~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~20_combout\,
	datab => hposition(21),
	datad => VCC,
	cin => \LessThan12~41_cout\,
	cout => \LessThan12~43_cout\);

-- Location: LCCOMB_X36_Y20_N14
\LessThan12~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~45_cout\ = CARRY((hposition(22) & ((!\LessThan12~43_cout\) # (!\bg_hstop~19_combout\))) # (!hposition(22) & (!\bg_hstop~19_combout\ & !\LessThan12~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(22),
	datab => \bg_hstop~19_combout\,
	datad => VCC,
	cin => \LessThan12~43_cout\,
	cout => \LessThan12~45_cout\);

-- Location: LCCOMB_X36_Y20_N16
\LessThan12~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~47_cout\ = CARRY((hposition(23) & (\bg_hstop~18_combout\ & !\LessThan12~45_cout\)) # (!hposition(23) & ((\bg_hstop~18_combout\) # (!\LessThan12~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \bg_hstop~18_combout\,
	datad => VCC,
	cin => \LessThan12~45_cout\,
	cout => \LessThan12~47_cout\);

-- Location: LCCOMB_X36_Y20_N18
\LessThan12~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~49_cout\ = CARRY((hposition(24) & ((!\LessThan12~47_cout\) # (!\bg_hstop~17_combout\))) # (!hposition(24) & (!\bg_hstop~17_combout\ & !\LessThan12~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \bg_hstop~17_combout\,
	datad => VCC,
	cin => \LessThan12~47_cout\,
	cout => \LessThan12~49_cout\);

-- Location: LCCOMB_X36_Y20_N20
\LessThan12~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~51_cout\ = CARRY((\bg_hstop~16_combout\ & ((!\LessThan12~49_cout\) # (!hposition(25)))) # (!\bg_hstop~16_combout\ & (!hposition(25) & !\LessThan12~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~16_combout\,
	datab => hposition(25),
	datad => VCC,
	cin => \LessThan12~49_cout\,
	cout => \LessThan12~51_cout\);

-- Location: LCCOMB_X36_Y20_N22
\LessThan12~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~53_cout\ = CARRY((hposition(26) & ((!\LessThan12~51_cout\) # (!\bg_hstop~15_combout\))) # (!hposition(26) & (!\bg_hstop~15_combout\ & !\LessThan12~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(26),
	datab => \bg_hstop~15_combout\,
	datad => VCC,
	cin => \LessThan12~51_cout\,
	cout => \LessThan12~53_cout\);

-- Location: LCCOMB_X36_Y20_N24
\LessThan12~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~55_cout\ = CARRY((\bg_hstop~14_combout\ & ((!\LessThan12~53_cout\) # (!hposition(27)))) # (!\bg_hstop~14_combout\ & (!hposition(27) & !\LessThan12~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~14_combout\,
	datab => hposition(27),
	datad => VCC,
	cin => \LessThan12~53_cout\,
	cout => \LessThan12~55_cout\);

-- Location: LCCOMB_X36_Y20_N26
\LessThan12~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~57_cout\ = CARRY((hposition(28) & ((!\LessThan12~55_cout\) # (!\bg_hstop~13_combout\))) # (!hposition(28) & (!\bg_hstop~13_combout\ & !\LessThan12~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => \bg_hstop~13_combout\,
	datad => VCC,
	cin => \LessThan12~55_cout\,
	cout => \LessThan12~57_cout\);

-- Location: LCCOMB_X36_Y20_N28
\LessThan12~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~59_cout\ = CARRY((\bg_hstop~12_combout\ & ((!\LessThan12~57_cout\) # (!hposition(29)))) # (!\bg_hstop~12_combout\ & (!hposition(29) & !\LessThan12~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \bg_hstop~12_combout\,
	datab => hposition(29),
	datad => VCC,
	cin => \LessThan12~57_cout\,
	cout => \LessThan12~59_cout\);

-- Location: LCCOMB_X36_Y20_N30
\LessThan12~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan12~60_combout\ = (hposition(30) & ((!\bg_hstop~10_combout\) # (!\LessThan12~59_cout\))) # (!hposition(30) & (!\LessThan12~59_cout\ & !\bg_hstop~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(30),
	datad => \bg_hstop~10_combout\,
	cin => \LessThan12~59_cout\,
	combout => \LessThan12~60_combout\);

-- Location: LCCOMB_X40_Y20_N30
\process_0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~20_combout\ = (!\LessThan11~60_combout\ & (\process_0~21_combout\ & (\process_0~12_combout\ & !\LessThan12~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan11~60_combout\,
	datab => \process_0~21_combout\,
	datac => \process_0~12_combout\,
	datad => \LessThan12~60_combout\,
	combout => \process_0~20_combout\);

-- Location: FF_X41_Y20_N27
\bg_address[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[13]~14_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(13));

-- Location: LCCOMB_X40_Y20_N28
\Add20~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add20~28_combout\ = hposition(14) $ (\Add20~27\ $ (\bg_hstart~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datad => \bg_hstart~20_combout\,
	cin => \Add20~27\,
	combout => \Add20~28_combout\);

-- Location: LCCOMB_X41_Y20_N14
\Add21~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add21~10_combout\ = vposition(5) $ (\Add21~9\ $ (\Add20~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => vposition(5),
	datad => \Add20~28_combout\,
	cin => \Add21~9\,
	combout => \Add21~10_combout\);

-- Location: LCCOMB_X41_Y20_N28
\bg_address[14]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bg_address[14]~16_combout\ = \Add21~10_combout\ $ (\bg_address[13]~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add21~10_combout\,
	cin => \bg_address[13]~15\,
	combout => \bg_address[14]~16_combout\);

-- Location: FF_X41_Y20_N29
\bg_address[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[14]~16_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(14));

-- Location: LCCOMB_X41_Y20_N0
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\ = (bg_address(13) & !bg_address(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(13),
	datad => bg_address(14),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~0_combout\);

-- Location: FF_X40_Y20_N1
\bg_address[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~0_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(0));

-- Location: FF_X40_Y20_N3
\bg_address[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~2_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(1));

-- Location: FF_X40_Y20_N5
\bg_address[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~4_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(2));

-- Location: FF_X40_Y20_N7
\bg_address[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~6_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(3));

-- Location: FF_X40_Y20_N9
\bg_address[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~8_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(4));

-- Location: FF_X40_Y20_N11
\bg_address[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~10_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(5));

-- Location: FF_X40_Y20_N13
\bg_address[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~12_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(6));

-- Location: FF_X40_Y20_N15
\bg_address[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~14_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(7));

-- Location: FF_X40_Y20_N17
\bg_address[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \Add20~16_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(8));

-- Location: FF_X41_Y20_N19
\bg_address[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[9]~6_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(9));

-- Location: FF_X41_Y20_N21
\bg_address[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[10]~8_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(10));

-- Location: FF_X41_Y20_N23
\bg_address[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[11]~10_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(11));

-- Location: FF_X41_Y20_N25
\bg_address[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \bg_address[12]~12_combout\,
	ena => \process_0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => bg_address(12));

-- Location: M9K_X73_Y17_N0
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

-- Location: FF_X44_Y22_N7
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

-- Location: LCCOMB_X44_Y22_N10
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

-- Location: FF_X44_Y22_N11
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

-- Location: LCCOMB_X44_Y22_N28
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

-- Location: FF_X44_Y22_N29
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

-- Location: LCCOMB_X44_Y22_N0
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

-- Location: FF_X44_Y22_N1
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

-- Location: LCCOMB_X41_Y20_N16
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w[2]\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2) = (!bg_address(13) & !bg_address(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(13),
	datad => bg_address(14),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode206w\(2));

-- Location: M9K_X33_Y10_N0
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

-- Location: LCCOMB_X41_Y20_N2
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\ = (!bg_address(13) & bg_address(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(13),
	datad => bg_address(14),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~1_combout\);

-- Location: M9K_X53_Y23_N0
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

-- Location: LCCOMB_X44_Y22_N20
\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a8~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a32~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\);

-- Location: LCCOMB_X41_Y20_N30
\bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\ = (bg_address(13) & bg_address(14))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => bg_address(13),
	datad => bg_address(14),
	combout => \bgread|altsyncram_component|auto_generated|rden_decode|w_anode220w[2]~2_combout\);

-- Location: M9K_X53_Y20_N0
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

-- Location: LCCOMB_X44_Y22_N22
\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\ & 
-- ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a20~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~0_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a44~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\);

-- Location: LCCOMB_X37_Y22_N16
\process_0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~13_combout\ = (!hposition(31) & vposition(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => hposition(31),
	datad => vposition(9),
	combout => \process_0~13_combout\);

-- Location: LCCOMB_X37_Y22_N10
\process_0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~14_combout\ = (\r[3]~0_combout\ & (\process_0~13_combout\ & (!\LessThan12~60_combout\ & !\LessThan11~60_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r[3]~0_combout\,
	datab => \process_0~13_combout\,
	datac => \LessThan12~60_combout\,
	datad => \LessThan11~60_combout\,
	combout => \process_0~14_combout\);

-- Location: LCCOMB_X37_Y22_N8
\r~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~1_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[8]~1_combout\,
	datad => \process_0~14_combout\,
	combout => \r~1_combout\);

-- Location: LCCOMB_X43_Y21_N16
\LessThan20~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~1_combout\ = (vposition(0) & (vposition(2) & vposition(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(0),
	datac => vposition(2),
	datad => vposition(1),
	combout => \LessThan20~1_combout\);

-- Location: LCCOMB_X43_Y21_N26
\LessThan20~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan20~2_combout\ = (vposition(5) & ((vposition(4)) # ((\LessThan20~1_combout\) # (vposition(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => \LessThan20~1_combout\,
	datac => vposition(5),
	datad => vposition(3),
	combout => \LessThan20~2_combout\);

-- Location: LCCOMB_X43_Y21_N4
\r[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[3]~2_combout\ = (\r[3]~0_combout\ & (((\LessThan6~0_combout\ & !\LessThan20~2_combout\)) # (!\LessThan20~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan20~0_combout\,
	datab => \LessThan6~0_combout\,
	datac => \LessThan20~2_combout\,
	datad => \r[3]~0_combout\,
	combout => \r[3]~2_combout\);

-- Location: LCCOMB_X35_Y18_N2
\Add11~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~0_combout\ = obstacle_hstop(1) $ (VCC)
-- \Add11~1\ = CARRY(obstacle_hstop(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(1),
	datad => VCC,
	combout => \Add11~0_combout\,
	cout => \Add11~1\);

-- Location: LCCOMB_X36_Y19_N20
\obstacle_hstop~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~32_combout\ = (\Add11~0_combout\ & \LessThan4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~0_combout\,
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~32_combout\);

-- Location: LCCOMB_X36_Y19_N22
\obstacle_hstop[4]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop[4]~29_combout\ = (\LessThan0~8_combout\) # (!\LessThan4~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \LessThan4~8_combout\,
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop[4]~29_combout\);

-- Location: FF_X36_Y19_N21
\obstacle_hstop[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~32_combout\,
	ena => \obstacle_hstop[4]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(1));

-- Location: LCCOMB_X35_Y18_N4
\Add11~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~2_combout\ = (obstacle_hstop(2) & (\Add11~1\ & VCC)) # (!obstacle_hstop(2) & (!\Add11~1\))
-- \Add11~3\ = CARRY((!obstacle_hstop(2) & !\Add11~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(2),
	datad => VCC,
	cin => \Add11~1\,
	combout => \Add11~2_combout\,
	cout => \Add11~3\);

-- Location: LCCOMB_X36_Y19_N18
\obstacle_hstop~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~31_combout\ = (\Add11~2_combout\ & \LessThan4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add11~2_combout\,
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~31_combout\);

-- Location: FF_X36_Y19_N19
\obstacle_hstop[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~31_combout\,
	ena => \obstacle_hstop[4]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(2));

-- Location: LCCOMB_X35_Y18_N6
\Add11~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~4_combout\ = (obstacle_hstop(3) & ((GND) # (!\Add11~3\))) # (!obstacle_hstop(3) & (\Add11~3\ $ (GND)))
-- \Add11~5\ = CARRY((obstacle_hstop(3)) # (!\Add11~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(3),
	datad => VCC,
	cin => \Add11~3\,
	combout => \Add11~4_combout\,
	cout => \Add11~5\);

-- Location: LCCOMB_X36_Y19_N24
\obstacle_hstop~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~30_combout\ = (\Add11~4_combout\ & \LessThan4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add11~4_combout\,
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~30_combout\);

-- Location: FF_X36_Y19_N25
\obstacle_hstop[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~30_combout\,
	ena => \obstacle_hstop[4]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(3));

-- Location: LCCOMB_X35_Y18_N8
\Add11~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~6_combout\ = (obstacle_hstop(4) & (\Add11~5\ & VCC)) # (!obstacle_hstop(4) & (!\Add11~5\))
-- \Add11~7\ = CARRY((!obstacle_hstop(4) & !\Add11~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(4),
	datad => VCC,
	cin => \Add11~5\,
	combout => \Add11~6_combout\,
	cout => \Add11~7\);

-- Location: LCCOMB_X36_Y19_N30
\obstacle_hstop~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~28_combout\ = (\Add11~6_combout\ & \LessThan4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~6_combout\,
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~28_combout\);

-- Location: FF_X36_Y19_N31
\obstacle_hstop[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~28_combout\,
	ena => \obstacle_hstop[4]~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(4));

-- Location: LCCOMB_X35_Y18_N10
\Add11~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~8_combout\ = (obstacle_hstop(5) & ((GND) # (!\Add11~7\))) # (!obstacle_hstop(5) & (\Add11~7\ $ (GND)))
-- \Add11~9\ = CARRY((obstacle_hstop(5)) # (!\Add11~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(5),
	datad => VCC,
	cin => \Add11~7\,
	combout => \Add11~8_combout\,
	cout => \Add11~9\);

-- Location: LCCOMB_X34_Y18_N14
\obstacle_hstop~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~27_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~8_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~8_combout\,
	datac => obstacle_hstop(5),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~27_combout\);

-- Location: FF_X34_Y18_N15
\obstacle_hstop[5]\ : dffeas
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
	q => obstacle_hstop(5));

-- Location: LCCOMB_X35_Y18_N12
\Add11~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~10_combout\ = (obstacle_hstop(6) & (\Add11~9\ & VCC)) # (!obstacle_hstop(6) & (!\Add11~9\))
-- \Add11~11\ = CARRY((!obstacle_hstop(6) & !\Add11~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(6),
	datad => VCC,
	cin => \Add11~9\,
	combout => \Add11~10_combout\,
	cout => \Add11~11\);

-- Location: LCCOMB_X34_Y18_N4
\obstacle_hstop~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~26_combout\ = ((\LessThan0~8_combout\ & (\Add11~10_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(6))))) # (!\LessThan4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~10_combout\,
	datac => obstacle_hstop(6),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~26_combout\);

-- Location: FF_X34_Y18_N5
\obstacle_hstop[6]\ : dffeas
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
	q => obstacle_hstop(6));

-- Location: LCCOMB_X35_Y18_N14
\Add11~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~12_combout\ = (obstacle_hstop(7) & ((GND) # (!\Add11~11\))) # (!obstacle_hstop(7) & (\Add11~11\ $ (GND)))
-- \Add11~13\ = CARRY((obstacle_hstop(7)) # (!\Add11~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(7),
	datad => VCC,
	cin => \Add11~11\,
	combout => \Add11~12_combout\,
	cout => \Add11~13\);

-- Location: LCCOMB_X34_Y18_N26
\obstacle_hstop~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~25_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~12_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~12_combout\,
	datac => obstacle_hstop(7),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~25_combout\);

-- Location: FF_X34_Y18_N27
\obstacle_hstop[7]\ : dffeas
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
	q => obstacle_hstop(7));

-- Location: LCCOMB_X35_Y18_N16
\Add11~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~14_combout\ = (obstacle_hstop(8) & (\Add11~13\ & VCC)) # (!obstacle_hstop(8) & (!\Add11~13\))
-- \Add11~15\ = CARRY((!obstacle_hstop(8) & !\Add11~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(8),
	datad => VCC,
	cin => \Add11~13\,
	combout => \Add11~14_combout\,
	cout => \Add11~15\);

-- Location: LCCOMB_X34_Y18_N16
\obstacle_hstop~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~33_combout\ = ((\LessThan0~8_combout\ & (\Add11~14_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(8))))) # (!\LessThan4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~14_combout\,
	datac => obstacle_hstop(8),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~33_combout\);

-- Location: FF_X34_Y18_N17
\obstacle_hstop[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(8));

-- Location: LCCOMB_X34_Y18_N2
\obstacle_hstop~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~3_combout\ = (\LessThan0~8_combout\ & ((\Add11~14_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => obstacle_hstop(8),
	datad => \Add11~14_combout\,
	combout => \obstacle_hstop~3_combout\);

-- Location: LCCOMB_X34_Y18_N28
\LessThan4~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~7_combout\ = (obstacle_hstop(6) & ((\LessThan0~8_combout\ & ((\Add11~8_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(6),
	datab => obstacle_hstop(5),
	datac => \Add11~8_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan4~7_combout\);

-- Location: LCCOMB_X35_Y18_N18
\Add11~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~16_combout\ = (obstacle_hstop(9) & ((GND) # (!\Add11~15\))) # (!obstacle_hstop(9) & (\Add11~15\ $ (GND)))
-- \Add11~17\ = CARRY((obstacle_hstop(9)) # (!\Add11~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(9),
	datad => VCC,
	cin => \Add11~15\,
	combout => \Add11~16_combout\,
	cout => \Add11~17\);

-- Location: LCCOMB_X34_Y18_N30
\obstacle_hstop~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~24_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~16_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~16_combout\,
	datac => obstacle_hstop(9),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~24_combout\);

-- Location: FF_X34_Y18_N31
\obstacle_hstop[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(9));

-- Location: LCCOMB_X35_Y18_N20
\Add11~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~18_combout\ = (obstacle_hstop(10) & (\Add11~17\ & VCC)) # (!obstacle_hstop(10) & (!\Add11~17\))
-- \Add11~19\ = CARRY((!obstacle_hstop(10) & !\Add11~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(10),
	datad => VCC,
	cin => \Add11~17\,
	combout => \Add11~18_combout\,
	cout => \Add11~19\);

-- Location: LCCOMB_X34_Y18_N12
\obstacle_hstop~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~23_combout\ = ((\LessThan0~8_combout\ & (\Add11~18_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(10))))) # (!\LessThan4~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~18_combout\,
	datab => \LessThan4~18_combout\,
	datac => obstacle_hstop(10),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~23_combout\);

-- Location: FF_X34_Y18_N13
\obstacle_hstop[10]\ : dffeas
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
	q => obstacle_hstop(10));

-- Location: LCCOMB_X35_Y18_N22
\Add11~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~20_combout\ = (obstacle_hstop(11) & ((GND) # (!\Add11~19\))) # (!obstacle_hstop(11) & (\Add11~19\ $ (GND)))
-- \Add11~21\ = CARRY((obstacle_hstop(11)) # (!\Add11~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(11),
	datad => VCC,
	cin => \Add11~19\,
	combout => \Add11~20_combout\,
	cout => \Add11~21\);

-- Location: LCCOMB_X34_Y17_N4
\obstacle_hstop~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~22_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~20_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~20_combout\,
	datac => obstacle_hstop(11),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~22_combout\);

-- Location: FF_X34_Y17_N5
\obstacle_hstop[11]\ : dffeas
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
	q => obstacle_hstop(11));

-- Location: LCCOMB_X35_Y18_N24
\Add11~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~22_combout\ = (obstacle_hstop(12) & (\Add11~21\ & VCC)) # (!obstacle_hstop(12) & (!\Add11~21\))
-- \Add11~23\ = CARRY((!obstacle_hstop(12) & !\Add11~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(12),
	datad => VCC,
	cin => \Add11~21\,
	combout => \Add11~22_combout\,
	cout => \Add11~23\);

-- Location: LCCOMB_X34_Y17_N10
\obstacle_hstop~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~21_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~22_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~22_combout\,
	datac => obstacle_hstop(12),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~21_combout\);

-- Location: FF_X34_Y17_N11
\obstacle_hstop[12]\ : dffeas
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
	q => obstacle_hstop(12));

-- Location: LCCOMB_X35_Y18_N26
\Add11~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~24_combout\ = (obstacle_hstop(13) & ((GND) # (!\Add11~23\))) # (!obstacle_hstop(13) & (\Add11~23\ $ (GND)))
-- \Add11~25\ = CARRY((obstacle_hstop(13)) # (!\Add11~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(13),
	datad => VCC,
	cin => \Add11~23\,
	combout => \Add11~24_combout\,
	cout => \Add11~25\);

-- Location: LCCOMB_X36_Y19_N28
\obstacle_hstop~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~20_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~24_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~24_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(13),
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~20_combout\);

-- Location: FF_X36_Y19_N29
\obstacle_hstop[13]\ : dffeas
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
	q => obstacle_hstop(13));

-- Location: LCCOMB_X35_Y18_N28
\Add11~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~26_combout\ = (obstacle_hstop(14) & (\Add11~25\ & VCC)) # (!obstacle_hstop(14) & (!\Add11~25\))
-- \Add11~27\ = CARRY((!obstacle_hstop(14) & !\Add11~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(14),
	datad => VCC,
	cin => \Add11~25\,
	combout => \Add11~26_combout\,
	cout => \Add11~27\);

-- Location: LCCOMB_X36_Y19_N2
\obstacle_hstop~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~19_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~26_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add11~26_combout\,
	datac => obstacle_hstop(14),
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~19_combout\);

-- Location: FF_X36_Y19_N3
\obstacle_hstop[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(14));

-- Location: LCCOMB_X35_Y18_N30
\Add11~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~28_combout\ = (obstacle_hstop(15) & ((GND) # (!\Add11~27\))) # (!obstacle_hstop(15) & (\Add11~27\ $ (GND)))
-- \Add11~29\ = CARRY((obstacle_hstop(15)) # (!\Add11~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(15),
	datad => VCC,
	cin => \Add11~27\,
	combout => \Add11~28_combout\,
	cout => \Add11~29\);

-- Location: LCCOMB_X36_Y19_N8
\obstacle_hstop~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~18_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~28_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~28_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(15),
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~18_combout\);

-- Location: FF_X36_Y19_N9
\obstacle_hstop[15]\ : dffeas
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
	q => obstacle_hstop(15));

-- Location: LCCOMB_X35_Y17_N0
\Add11~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~30_combout\ = (obstacle_hstop(16) & (\Add11~29\ & VCC)) # (!obstacle_hstop(16) & (!\Add11~29\))
-- \Add11~31\ = CARRY((!obstacle_hstop(16) & !\Add11~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(16),
	datad => VCC,
	cin => \Add11~29\,
	combout => \Add11~30_combout\,
	cout => \Add11~31\);

-- Location: LCCOMB_X36_Y19_N6
\obstacle_hstop~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~17_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~30_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(16))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~30_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(16),
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~17_combout\);

-- Location: FF_X36_Y19_N7
\obstacle_hstop[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(16));

-- Location: LCCOMB_X35_Y17_N2
\Add11~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~32_combout\ = (obstacle_hstop(17) & ((GND) # (!\Add11~31\))) # (!obstacle_hstop(17) & (\Add11~31\ $ (GND)))
-- \Add11~33\ = CARRY((obstacle_hstop(17)) # (!\Add11~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(17),
	datad => VCC,
	cin => \Add11~31\,
	combout => \Add11~32_combout\,
	cout => \Add11~33\);

-- Location: LCCOMB_X36_Y19_N12
\obstacle_hstop~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~16_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~32_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~32_combout\,
	datac => obstacle_hstop(17),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~16_combout\);

-- Location: FF_X36_Y19_N13
\obstacle_hstop[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(17));

-- Location: LCCOMB_X35_Y17_N4
\Add11~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~34_combout\ = (obstacle_hstop(18) & (\Add11~33\ & VCC)) # (!obstacle_hstop(18) & (!\Add11~33\))
-- \Add11~35\ = CARRY((!obstacle_hstop(18) & !\Add11~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(18),
	datad => VCC,
	cin => \Add11~33\,
	combout => \Add11~34_combout\,
	cout => \Add11~35\);

-- Location: LCCOMB_X36_Y19_N26
\obstacle_hstop~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~15_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~34_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~34_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstop(18),
	datad => \LessThan4~18_combout\,
	combout => \obstacle_hstop~15_combout\);

-- Location: FF_X36_Y19_N27
\obstacle_hstop[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(18));

-- Location: LCCOMB_X35_Y17_N6
\Add11~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~36_combout\ = (obstacle_hstop(19) & ((GND) # (!\Add11~35\))) # (!obstacle_hstop(19) & (\Add11~35\ $ (GND)))
-- \Add11~37\ = CARRY((obstacle_hstop(19)) # (!\Add11~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(19),
	datad => VCC,
	cin => \Add11~35\,
	combout => \Add11~36_combout\,
	cout => \Add11~37\);

-- Location: LCCOMB_X36_Y19_N0
\obstacle_hstop~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~14_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~36_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(19))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~36_combout\,
	datac => obstacle_hstop(19),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~14_combout\);

-- Location: FF_X36_Y19_N1
\obstacle_hstop[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(19));

-- Location: LCCOMB_X35_Y17_N8
\Add11~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~38_combout\ = (obstacle_hstop(20) & (\Add11~37\ & VCC)) # (!obstacle_hstop(20) & (!\Add11~37\))
-- \Add11~39\ = CARRY((!obstacle_hstop(20) & !\Add11~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(20),
	datad => VCC,
	cin => \Add11~37\,
	combout => \Add11~38_combout\,
	cout => \Add11~39\);

-- Location: LCCOMB_X34_Y17_N16
\obstacle_hstop~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~13_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~38_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~38_combout\,
	datac => obstacle_hstop(20),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~13_combout\);

-- Location: FF_X34_Y17_N17
\obstacle_hstop[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(20));

-- Location: LCCOMB_X35_Y17_N10
\Add11~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~40_combout\ = (obstacle_hstop(21) & ((GND) # (!\Add11~39\))) # (!obstacle_hstop(21) & (\Add11~39\ $ (GND)))
-- \Add11~41\ = CARRY((obstacle_hstop(21)) # (!\Add11~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(21),
	datad => VCC,
	cin => \Add11~39\,
	combout => \Add11~40_combout\,
	cout => \Add11~41\);

-- Location: LCCOMB_X34_Y17_N14
\obstacle_hstop~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~12_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~40_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~40_combout\,
	datac => obstacle_hstop(21),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~12_combout\);

-- Location: FF_X34_Y17_N15
\obstacle_hstop[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(21));

-- Location: LCCOMB_X35_Y17_N12
\Add11~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~42_combout\ = (obstacle_hstop(22) & (\Add11~41\ & VCC)) # (!obstacle_hstop(22) & (!\Add11~41\))
-- \Add11~43\ = CARRY((!obstacle_hstop(22) & !\Add11~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(22),
	datad => VCC,
	cin => \Add11~41\,
	combout => \Add11~42_combout\,
	cout => \Add11~43\);

-- Location: LCCOMB_X34_Y17_N12
\obstacle_hstop~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~11_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~42_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(22))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~42_combout\,
	datac => obstacle_hstop(22),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~11_combout\);

-- Location: FF_X34_Y17_N13
\obstacle_hstop[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(22));

-- Location: LCCOMB_X35_Y17_N14
\Add11~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~44_combout\ = (obstacle_hstop(23) & ((GND) # (!\Add11~43\))) # (!obstacle_hstop(23) & (\Add11~43\ $ (GND)))
-- \Add11~45\ = CARRY((obstacle_hstop(23)) # (!\Add11~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(23),
	datad => VCC,
	cin => \Add11~43\,
	combout => \Add11~44_combout\,
	cout => \Add11~45\);

-- Location: LCCOMB_X34_Y17_N2
\obstacle_hstop~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~10_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~44_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~44_combout\,
	datac => obstacle_hstop(23),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~10_combout\);

-- Location: FF_X34_Y17_N3
\obstacle_hstop[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(23));

-- Location: LCCOMB_X35_Y17_N16
\Add11~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~46_combout\ = (obstacle_hstop(24) & (\Add11~45\ & VCC)) # (!obstacle_hstop(24) & (!\Add11~45\))
-- \Add11~47\ = CARRY((!obstacle_hstop(24) & !\Add11~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(24),
	datad => VCC,
	cin => \Add11~45\,
	combout => \Add11~46_combout\,
	cout => \Add11~47\);

-- Location: LCCOMB_X34_Y17_N24
\obstacle_hstop~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~9_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~46_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(24))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~46_combout\,
	datac => obstacle_hstop(24),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~9_combout\);

-- Location: FF_X34_Y17_N25
\obstacle_hstop[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(24));

-- Location: LCCOMB_X35_Y17_N18
\Add11~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~48_combout\ = (obstacle_hstop(25) & ((GND) # (!\Add11~47\))) # (!obstacle_hstop(25) & (\Add11~47\ $ (GND)))
-- \Add11~49\ = CARRY((obstacle_hstop(25)) # (!\Add11~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(25),
	datad => VCC,
	cin => \Add11~47\,
	combout => \Add11~48_combout\,
	cout => \Add11~49\);

-- Location: LCCOMB_X34_Y17_N30
\obstacle_hstop~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~8_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~48_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(25))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~48_combout\,
	datac => obstacle_hstop(25),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~8_combout\);

-- Location: FF_X34_Y17_N31
\obstacle_hstop[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(25));

-- Location: LCCOMB_X35_Y17_N20
\Add11~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~50_combout\ = (obstacle_hstop(26) & (\Add11~49\ & VCC)) # (!obstacle_hstop(26) & (!\Add11~49\))
-- \Add11~51\ = CARRY((!obstacle_hstop(26) & !\Add11~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(26),
	datad => VCC,
	cin => \Add11~49\,
	combout => \Add11~50_combout\,
	cout => \Add11~51\);

-- Location: LCCOMB_X34_Y17_N28
\obstacle_hstop~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~7_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~50_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~50_combout\,
	datac => obstacle_hstop(26),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~7_combout\);

-- Location: FF_X34_Y17_N29
\obstacle_hstop[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(26));

-- Location: LCCOMB_X35_Y17_N22
\Add11~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~52_combout\ = (obstacle_hstop(27) & ((GND) # (!\Add11~51\))) # (!obstacle_hstop(27) & (\Add11~51\ $ (GND)))
-- \Add11~53\ = CARRY((obstacle_hstop(27)) # (!\Add11~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(27),
	datad => VCC,
	cin => \Add11~51\,
	combout => \Add11~52_combout\,
	cout => \Add11~53\);

-- Location: LCCOMB_X34_Y17_N18
\obstacle_hstop~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~6_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~52_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~52_combout\,
	datac => obstacle_hstop(27),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~6_combout\);

-- Location: FF_X34_Y17_N19
\obstacle_hstop[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(27));

-- Location: LCCOMB_X35_Y17_N24
\Add11~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~54_combout\ = (obstacle_hstop(28) & (\Add11~53\ & VCC)) # (!obstacle_hstop(28) & (!\Add11~53\))
-- \Add11~55\ = CARRY((!obstacle_hstop(28) & !\Add11~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(28),
	datad => VCC,
	cin => \Add11~53\,
	combout => \Add11~54_combout\,
	cout => \Add11~55\);

-- Location: LCCOMB_X34_Y17_N8
\obstacle_hstop~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~5_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~54_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~54_combout\,
	datac => obstacle_hstop(28),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~5_combout\);

-- Location: FF_X34_Y17_N9
\obstacle_hstop[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(28));

-- Location: LCCOMB_X36_Y17_N30
\LessThan4~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~5_combout\ = (obstacle_hstop(25)) # ((obstacle_hstop(28)) # ((obstacle_hstop(27)) # (obstacle_hstop(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(25),
	datab => obstacle_hstop(28),
	datac => obstacle_hstop(27),
	datad => obstacle_hstop(26),
	combout => \LessThan4~5_combout\);

-- Location: LCCOMB_X34_Y17_N22
\LessThan4~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~3_combout\ = (obstacle_hstop(22)) # ((obstacle_hstop(24)) # ((obstacle_hstop(21)) # (obstacle_hstop(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(22),
	datab => obstacle_hstop(24),
	datac => obstacle_hstop(21),
	datad => obstacle_hstop(23),
	combout => \LessThan4~3_combout\);

-- Location: LCCOMB_X36_Y18_N0
\LessThan4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~0_combout\ = (obstacle_hstop(12)) # ((obstacle_hstop(9)) # ((obstacle_hstop(10)) # (obstacle_hstop(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(12),
	datab => obstacle_hstop(9),
	datac => obstacle_hstop(10),
	datad => obstacle_hstop(11),
	combout => \LessThan4~0_combout\);

-- Location: LCCOMB_X36_Y19_N14
\LessThan4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~1_combout\ = (obstacle_hstop(16)) # ((obstacle_hstop(14)) # ((obstacle_hstop(15)) # (obstacle_hstop(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(16),
	datab => obstacle_hstop(14),
	datac => obstacle_hstop(15),
	datad => obstacle_hstop(13),
	combout => \LessThan4~1_combout\);

-- Location: LCCOMB_X36_Y19_N16
\LessThan4~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~2_combout\ = (obstacle_hstop(18)) # ((obstacle_hstop(19)) # ((obstacle_hstop(20)) # (obstacle_hstop(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(18),
	datab => obstacle_hstop(19),
	datac => obstacle_hstop(20),
	datad => obstacle_hstop(17),
	combout => \LessThan4~2_combout\);

-- Location: LCCOMB_X36_Y19_N10
\LessThan4~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~4_combout\ = (\LessThan4~3_combout\) # ((\LessThan4~0_combout\) # ((\LessThan4~1_combout\) # (\LessThan4~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~3_combout\,
	datab => \LessThan4~0_combout\,
	datac => \LessThan4~1_combout\,
	datad => \LessThan4~2_combout\,
	combout => \LessThan4~4_combout\);

-- Location: LCCOMB_X34_Y18_N24
\LessThan4~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~6_combout\ = (obstacle_hstop(30)) # ((obstacle_hstop(29)) # ((\LessThan4~5_combout\) # (\LessThan4~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(30),
	datab => obstacle_hstop(29),
	datac => \LessThan4~5_combout\,
	datad => \LessThan4~4_combout\,
	combout => \LessThan4~6_combout\);

-- Location: LCCOMB_X34_Y18_N6
\LessThan4~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~8_combout\ = (\LessThan4~6_combout\) # ((\obstacle_hstop~3_combout\ & ((obstacle_hstop(7)) # (\LessThan4~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(7),
	datab => \obstacle_hstop~3_combout\,
	datac => \LessThan4~7_combout\,
	datad => \LessThan4~6_combout\,
	combout => \LessThan4~8_combout\);

-- Location: LCCOMB_X36_Y19_N4
\LessThan4~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~11_combout\ = (\Add11~30_combout\) # ((\Add11~32_combout\) # ((\Add11~28_combout\) # (\Add11~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~30_combout\,
	datab => \Add11~32_combout\,
	datac => \Add11~28_combout\,
	datad => \Add11~34_combout\,
	combout => \LessThan4~11_combout\);

-- Location: LCCOMB_X35_Y17_N28
\Add11~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~58_combout\ = (obstacle_hstop(30) & (\Add11~57\ & VCC)) # (!obstacle_hstop(30) & (!\Add11~57\))
-- \Add11~59\ = CARRY((!obstacle_hstop(30) & !\Add11~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstop(30),
	datad => VCC,
	cin => \Add11~57\,
	combout => \Add11~58_combout\,
	cout => \Add11~59\);

-- Location: LCCOMB_X35_Y17_N26
\Add11~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~56_combout\ = (obstacle_hstop(29) & ((GND) # (!\Add11~55\))) # (!obstacle_hstop(29) & (\Add11~55\ $ (GND)))
-- \Add11~57\ = CARRY((obstacle_hstop(29)) # (!\Add11~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(29),
	datad => VCC,
	cin => \Add11~55\,
	combout => \Add11~56_combout\,
	cout => \Add11~57\);

-- Location: LCCOMB_X34_Y18_N8
\LessThan4~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~9_combout\ = (\Add11~18_combout\) # ((\Add11~58_combout\) # ((\Add11~56_combout\) # (\Add11~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~18_combout\,
	datab => \Add11~58_combout\,
	datac => \Add11~56_combout\,
	datad => \Add11~16_combout\,
	combout => \LessThan4~9_combout\);

-- Location: LCCOMB_X35_Y18_N0
\LessThan4~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~10_combout\ = (\Add11~24_combout\) # ((\Add11~22_combout\) # ((\Add11~20_combout\) # (\Add11~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~24_combout\,
	datab => \Add11~22_combout\,
	datac => \Add11~20_combout\,
	datad => \Add11~26_combout\,
	combout => \LessThan4~10_combout\);

-- Location: LCCOMB_X34_Y17_N0
\LessThan4~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~12_combout\ = (\Add11~40_combout\) # ((\Add11~42_combout\) # ((\Add11~38_combout\) # (\Add11~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~40_combout\,
	datab => \Add11~42_combout\,
	datac => \Add11~38_combout\,
	datad => \Add11~36_combout\,
	combout => \LessThan4~12_combout\);

-- Location: LCCOMB_X34_Y17_N26
\LessThan4~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~13_combout\ = (\LessThan4~11_combout\) # ((\LessThan4~9_combout\) # ((\LessThan4~10_combout\) # (\LessThan4~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~11_combout\,
	datab => \LessThan4~9_combout\,
	datac => \LessThan4~10_combout\,
	datad => \LessThan4~12_combout\,
	combout => \LessThan4~13_combout\);

-- Location: LCCOMB_X34_Y17_N20
\LessThan4~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~14_combout\ = (\Add11~50_combout\) # ((\Add11~46_combout\) # ((\Add11~44_combout\) # (\Add11~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~50_combout\,
	datab => \Add11~46_combout\,
	datac => \Add11~44_combout\,
	datad => \Add11~48_combout\,
	combout => \LessThan4~14_combout\);

-- Location: LCCOMB_X34_Y17_N6
\LessThan4~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~15_combout\ = (\LessThan4~13_combout\) # ((\Add11~54_combout\) # ((\LessThan4~14_combout\) # (\Add11~52_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~13_combout\,
	datab => \Add11~54_combout\,
	datac => \LessThan4~14_combout\,
	datad => \Add11~52_combout\,
	combout => \LessThan4~15_combout\);

-- Location: LCCOMB_X34_Y18_N10
\LessThan4~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~16_combout\ = (\Add11~10_combout\ & ((\LessThan0~8_combout\ & ((\Add11~8_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstop(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(5),
	datab => \Add11~10_combout\,
	datac => \Add11~8_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan4~16_combout\);

-- Location: LCCOMB_X34_Y18_N20
\LessThan4~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~17_combout\ = (\LessThan4~15_combout\) # ((\obstacle_hstop~3_combout\ & ((\Add11~12_combout\) # (\LessThan4~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~15_combout\,
	datab => \obstacle_hstop~3_combout\,
	datac => \Add11~12_combout\,
	datad => \LessThan4~16_combout\,
	combout => \LessThan4~17_combout\);

-- Location: LCCOMB_X34_Y18_N22
\LessThan4~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan4~18_combout\ = (\LessThan0~8_combout\ & (((\LessThan4~17_combout\ & !\Add11~60_combout\)))) # (!\LessThan0~8_combout\ & (\LessThan4~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~8_combout\,
	datab => \LessThan4~17_combout\,
	datac => \Add11~60_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan4~18_combout\);

-- Location: LCCOMB_X34_Y18_N18
\obstacle_hstop~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~4_combout\ = (\LessThan4~18_combout\ & ((\LessThan0~8_combout\ & (\Add11~56_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstop(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan4~18_combout\,
	datab => \Add11~56_combout\,
	datac => obstacle_hstop(29),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~4_combout\);

-- Location: FF_X34_Y18_N19
\obstacle_hstop[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(29));

-- Location: LCCOMB_X35_Y17_N30
\Add11~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add11~60_combout\ = \Add11~59\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add11~59\,
	combout => \Add11~60_combout\);

-- Location: LCCOMB_X34_Y18_N0
\obstacle_hstop~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstop~2_combout\ = (\LessThan0~8_combout\ & (!\Add11~60_combout\ & (\Add11~58_combout\))) # (!\LessThan0~8_combout\ & (((obstacle_hstop(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add11~60_combout\,
	datab => \Add11~58_combout\,
	datac => obstacle_hstop(30),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstop~2_combout\);

-- Location: FF_X34_Y18_N1
\obstacle_hstop[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstop~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstop(30));

-- Location: LCCOMB_X36_Y18_N2
\LessThan22~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~1_cout\ = CARRY((obstacle_hstop(1) & !hposition(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(1),
	datab => hposition(1),
	datad => VCC,
	cout => \LessThan22~1_cout\);

-- Location: LCCOMB_X36_Y18_N4
\LessThan22~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~3_cout\ = CARRY((hposition(2) & ((!\LessThan22~1_cout\) # (!obstacle_hstop(2)))) # (!hposition(2) & (!obstacle_hstop(2) & !\LessThan22~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => obstacle_hstop(2),
	datad => VCC,
	cin => \LessThan22~1_cout\,
	cout => \LessThan22~3_cout\);

-- Location: LCCOMB_X36_Y18_N6
\LessThan22~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~5_cout\ = CARRY((hposition(3) & (obstacle_hstop(3) & !\LessThan22~3_cout\)) # (!hposition(3) & ((obstacle_hstop(3)) # (!\LessThan22~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => obstacle_hstop(3),
	datad => VCC,
	cin => \LessThan22~3_cout\,
	cout => \LessThan22~5_cout\);

-- Location: LCCOMB_X36_Y18_N8
\LessThan22~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~7_cout\ = CARRY((hposition(4) & ((!\LessThan22~5_cout\) # (!obstacle_hstop(4)))) # (!hposition(4) & (!obstacle_hstop(4) & !\LessThan22~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => obstacle_hstop(4),
	datad => VCC,
	cin => \LessThan22~5_cout\,
	cout => \LessThan22~7_cout\);

-- Location: LCCOMB_X36_Y18_N10
\LessThan22~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~9_cout\ = CARRY((obstacle_hstop(5) & ((!\LessThan22~7_cout\) # (!hposition(5)))) # (!obstacle_hstop(5) & (!hposition(5) & !\LessThan22~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(5),
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan22~7_cout\,
	cout => \LessThan22~9_cout\);

-- Location: LCCOMB_X36_Y18_N12
\LessThan22~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~11_cout\ = CARRY((obstacle_hstop(6) & (hposition(6) & !\LessThan22~9_cout\)) # (!obstacle_hstop(6) & ((hposition(6)) # (!\LessThan22~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(6),
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan22~9_cout\,
	cout => \LessThan22~11_cout\);

-- Location: LCCOMB_X36_Y18_N14
\LessThan22~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~13_cout\ = CARRY((obstacle_hstop(7) & ((!\LessThan22~11_cout\) # (!hposition(7)))) # (!obstacle_hstop(7) & (!hposition(7) & !\LessThan22~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(7),
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan22~11_cout\,
	cout => \LessThan22~13_cout\);

-- Location: LCCOMB_X36_Y18_N16
\LessThan22~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~15_cout\ = CARRY((hposition(8) & ((!\LessThan22~13_cout\) # (!obstacle_hstop(8)))) # (!hposition(8) & (!obstacle_hstop(8) & !\LessThan22~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => obstacle_hstop(8),
	datad => VCC,
	cin => \LessThan22~13_cout\,
	cout => \LessThan22~15_cout\);

-- Location: LCCOMB_X36_Y18_N18
\LessThan22~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~17_cout\ = CARRY((hposition(9) & (obstacle_hstop(9) & !\LessThan22~15_cout\)) # (!hposition(9) & ((obstacle_hstop(9)) # (!\LessThan22~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => obstacle_hstop(9),
	datad => VCC,
	cin => \LessThan22~15_cout\,
	cout => \LessThan22~17_cout\);

-- Location: LCCOMB_X36_Y18_N20
\LessThan22~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~19_cout\ = CARRY((obstacle_hstop(10) & (hposition(10) & !\LessThan22~17_cout\)) # (!obstacle_hstop(10) & ((hposition(10)) # (!\LessThan22~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(10),
	datab => hposition(10),
	datad => VCC,
	cin => \LessThan22~17_cout\,
	cout => \LessThan22~19_cout\);

-- Location: LCCOMB_X36_Y18_N22
\LessThan22~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~21_cout\ = CARRY((hposition(11) & (obstacle_hstop(11) & !\LessThan22~19_cout\)) # (!hposition(11) & ((obstacle_hstop(11)) # (!\LessThan22~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => obstacle_hstop(11),
	datad => VCC,
	cin => \LessThan22~19_cout\,
	cout => \LessThan22~21_cout\);

-- Location: LCCOMB_X36_Y18_N24
\LessThan22~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~23_cout\ = CARRY((obstacle_hstop(12) & (hposition(12) & !\LessThan22~21_cout\)) # (!obstacle_hstop(12) & ((hposition(12)) # (!\LessThan22~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(12),
	datab => hposition(12),
	datad => VCC,
	cin => \LessThan22~21_cout\,
	cout => \LessThan22~23_cout\);

-- Location: LCCOMB_X36_Y18_N26
\LessThan22~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~25_cout\ = CARRY((obstacle_hstop(13) & ((!\LessThan22~23_cout\) # (!hposition(13)))) # (!obstacle_hstop(13) & (!hposition(13) & !\LessThan22~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(13),
	datab => hposition(13),
	datad => VCC,
	cin => \LessThan22~23_cout\,
	cout => \LessThan22~25_cout\);

-- Location: LCCOMB_X36_Y18_N28
\LessThan22~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~27_cout\ = CARRY((obstacle_hstop(14) & (hposition(14) & !\LessThan22~25_cout\)) # (!obstacle_hstop(14) & ((hposition(14)) # (!\LessThan22~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(14),
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan22~25_cout\,
	cout => \LessThan22~27_cout\);

-- Location: LCCOMB_X36_Y18_N30
\LessThan22~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~29_cout\ = CARRY((hposition(15) & (obstacle_hstop(15) & !\LessThan22~27_cout\)) # (!hposition(15) & ((obstacle_hstop(15)) # (!\LessThan22~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datab => obstacle_hstop(15),
	datad => VCC,
	cin => \LessThan22~27_cout\,
	cout => \LessThan22~29_cout\);

-- Location: LCCOMB_X36_Y17_N0
\LessThan22~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~31_cout\ = CARRY((obstacle_hstop(16) & (hposition(16) & !\LessThan22~29_cout\)) # (!obstacle_hstop(16) & ((hposition(16)) # (!\LessThan22~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(16),
	datab => hposition(16),
	datad => VCC,
	cin => \LessThan22~29_cout\,
	cout => \LessThan22~31_cout\);

-- Location: LCCOMB_X36_Y17_N2
\LessThan22~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~33_cout\ = CARRY((hposition(17) & (obstacle_hstop(17) & !\LessThan22~31_cout\)) # (!hposition(17) & ((obstacle_hstop(17)) # (!\LessThan22~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => obstacle_hstop(17),
	datad => VCC,
	cin => \LessThan22~31_cout\,
	cout => \LessThan22~33_cout\);

-- Location: LCCOMB_X36_Y17_N4
\LessThan22~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~35_cout\ = CARRY((hposition(18) & ((!\LessThan22~33_cout\) # (!obstacle_hstop(18)))) # (!hposition(18) & (!obstacle_hstop(18) & !\LessThan22~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(18),
	datab => obstacle_hstop(18),
	datad => VCC,
	cin => \LessThan22~33_cout\,
	cout => \LessThan22~35_cout\);

-- Location: LCCOMB_X36_Y17_N6
\LessThan22~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~37_cout\ = CARRY((hposition(19) & (obstacle_hstop(19) & !\LessThan22~35_cout\)) # (!hposition(19) & ((obstacle_hstop(19)) # (!\LessThan22~35_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datab => obstacle_hstop(19),
	datad => VCC,
	cin => \LessThan22~35_cout\,
	cout => \LessThan22~37_cout\);

-- Location: LCCOMB_X36_Y17_N8
\LessThan22~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~39_cout\ = CARRY((obstacle_hstop(20) & (hposition(20) & !\LessThan22~37_cout\)) # (!obstacle_hstop(20) & ((hposition(20)) # (!\LessThan22~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(20),
	datab => hposition(20),
	datad => VCC,
	cin => \LessThan22~37_cout\,
	cout => \LessThan22~39_cout\);

-- Location: LCCOMB_X36_Y17_N10
\LessThan22~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~41_cout\ = CARRY((obstacle_hstop(21) & ((!\LessThan22~39_cout\) # (!hposition(21)))) # (!obstacle_hstop(21) & (!hposition(21) & !\LessThan22~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(21),
	datab => hposition(21),
	datad => VCC,
	cin => \LessThan22~39_cout\,
	cout => \LessThan22~41_cout\);

-- Location: LCCOMB_X36_Y17_N12
\LessThan22~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~43_cout\ = CARRY((obstacle_hstop(22) & (hposition(22) & !\LessThan22~41_cout\)) # (!obstacle_hstop(22) & ((hposition(22)) # (!\LessThan22~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(22),
	datab => hposition(22),
	datad => VCC,
	cin => \LessThan22~41_cout\,
	cout => \LessThan22~43_cout\);

-- Location: LCCOMB_X36_Y17_N14
\LessThan22~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~45_cout\ = CARRY((obstacle_hstop(23) & ((!\LessThan22~43_cout\) # (!hposition(23)))) # (!obstacle_hstop(23) & (!hposition(23) & !\LessThan22~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(23),
	datab => hposition(23),
	datad => VCC,
	cin => \LessThan22~43_cout\,
	cout => \LessThan22~45_cout\);

-- Location: LCCOMB_X36_Y17_N16
\LessThan22~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~47_cout\ = CARRY((hposition(24) & ((!\LessThan22~45_cout\) # (!obstacle_hstop(24)))) # (!hposition(24) & (!obstacle_hstop(24) & !\LessThan22~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => obstacle_hstop(24),
	datad => VCC,
	cin => \LessThan22~45_cout\,
	cout => \LessThan22~47_cout\);

-- Location: LCCOMB_X36_Y17_N18
\LessThan22~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~49_cout\ = CARRY((obstacle_hstop(25) & ((!\LessThan22~47_cout\) # (!hposition(25)))) # (!obstacle_hstop(25) & (!hposition(25) & !\LessThan22~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(25),
	datab => hposition(25),
	datad => VCC,
	cin => \LessThan22~47_cout\,
	cout => \LessThan22~49_cout\);

-- Location: LCCOMB_X36_Y17_N20
\LessThan22~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~51_cout\ = CARRY((hposition(26) & ((!\LessThan22~49_cout\) # (!obstacle_hstop(26)))) # (!hposition(26) & (!obstacle_hstop(26) & !\LessThan22~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(26),
	datab => obstacle_hstop(26),
	datad => VCC,
	cin => \LessThan22~49_cout\,
	cout => \LessThan22~51_cout\);

-- Location: LCCOMB_X36_Y17_N22
\LessThan22~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~53_cout\ = CARRY((hposition(27) & (obstacle_hstop(27) & !\LessThan22~51_cout\)) # (!hposition(27) & ((obstacle_hstop(27)) # (!\LessThan22~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => obstacle_hstop(27),
	datad => VCC,
	cin => \LessThan22~51_cout\,
	cout => \LessThan22~53_cout\);

-- Location: LCCOMB_X36_Y17_N24
\LessThan22~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~55_cout\ = CARRY((hposition(28) & ((!\LessThan22~53_cout\) # (!obstacle_hstop(28)))) # (!hposition(28) & (!obstacle_hstop(28) & !\LessThan22~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => obstacle_hstop(28),
	datad => VCC,
	cin => \LessThan22~53_cout\,
	cout => \LessThan22~55_cout\);

-- Location: LCCOMB_X36_Y17_N26
\LessThan22~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~57_cout\ = CARRY((obstacle_hstop(29) & ((!\LessThan22~55_cout\) # (!hposition(29)))) # (!obstacle_hstop(29) & (!hposition(29) & !\LessThan22~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(29),
	datab => hposition(29),
	datad => VCC,
	cin => \LessThan22~55_cout\,
	cout => \LessThan22~57_cout\);

-- Location: LCCOMB_X36_Y17_N28
\LessThan22~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan22~58_combout\ = (obstacle_hstop(30) & ((\LessThan22~57_cout\) # (!hposition(30)))) # (!obstacle_hstop(30) & (\LessThan22~57_cout\ & !hposition(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstop(30),
	datad => hposition(30),
	cin => \LessThan22~57_cout\,
	combout => \LessThan22~58_combout\);

-- Location: LCCOMB_X31_Y20_N2
\Add10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~0_combout\ = obstacle_hstart(1) $ (VCC)
-- \Add10~1\ = CARRY(obstacle_hstart(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(1),
	datad => VCC,
	combout => \Add10~0_combout\,
	cout => \Add10~1\);

-- Location: LCCOMB_X32_Y20_N26
\Add10~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~62_combout\ = (\LessThan0~8_combout\ & ((\Add10~14_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(8),
	datac => \Add10~14_combout\,
	datad => \LessThan0~8_combout\,
	combout => \Add10~62_combout\);

-- Location: LCCOMB_X34_Y21_N10
\Add10~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~63_combout\ = (\LessThan0~8_combout\ & ((\Add10~10_combout\))) # (!\LessThan0~8_combout\ & (obstacle_hstart(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => obstacle_hstart(6),
	datac => \Add10~10_combout\,
	combout => \Add10~63_combout\);

-- Location: LCCOMB_X31_Y20_N0
\LessThan3~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~17_combout\ = (\Add10~4_combout\) # ((\Add10~2_combout\) # ((\Add10~6_combout\) # (\Add10~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~4_combout\,
	datab => \Add10~2_combout\,
	datac => \Add10~6_combout\,
	datad => \Add10~0_combout\,
	combout => \LessThan3~17_combout\);

-- Location: LCCOMB_X32_Y20_N18
\LessThan3~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~18_combout\ = (\Add10~12_combout\) # ((\Add10~63_combout\ & ((\LessThan3~17_combout\) # (\Add10~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~12_combout\,
	datab => \Add10~63_combout\,
	datac => \LessThan3~17_combout\,
	datad => \Add10~8_combout\,
	combout => \LessThan3~18_combout\);

-- Location: LCCOMB_X31_Y21_N10
\LessThan3~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~11_combout\ = (\Add10~20_combout\) # ((\Add10~22_combout\) # ((\Add10~26_combout\) # (\Add10~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~20_combout\,
	datab => \Add10~22_combout\,
	datac => \Add10~26_combout\,
	datad => \Add10~24_combout\,
	combout => \LessThan3~11_combout\);

-- Location: LCCOMB_X31_Y21_N28
\LessThan3~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~12_combout\ = (\Add10~30_combout\) # ((\Add10~32_combout\) # ((\Add10~34_combout\) # (\Add10~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~30_combout\,
	datab => \Add10~32_combout\,
	datac => \Add10~34_combout\,
	datad => \Add10~28_combout\,
	combout => \LessThan3~12_combout\);

-- Location: LCCOMB_X31_Y21_N8
\LessThan3~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~10_combout\ = (\Add10~16_combout\) # ((\Add10~56_combout\) # ((\Add10~18_combout\) # (\Add10~58_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~16_combout\,
	datab => \Add10~56_combout\,
	datac => \Add10~18_combout\,
	datad => \Add10~58_combout\,
	combout => \LessThan3~10_combout\);

-- Location: LCCOMB_X32_Y19_N26
\LessThan3~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~13_combout\ = (\Add10~40_combout\) # ((\Add10~38_combout\) # ((\Add10~36_combout\) # (\Add10~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~40_combout\,
	datab => \Add10~38_combout\,
	datac => \Add10~36_combout\,
	datad => \Add10~42_combout\,
	combout => \LessThan3~13_combout\);

-- Location: LCCOMB_X31_Y21_N22
\LessThan3~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~14_combout\ = (\LessThan3~11_combout\) # ((\LessThan3~12_combout\) # ((\LessThan3~10_combout\) # (\LessThan3~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~11_combout\,
	datab => \LessThan3~12_combout\,
	datac => \LessThan3~10_combout\,
	datad => \LessThan3~13_combout\,
	combout => \LessThan3~14_combout\);

-- Location: LCCOMB_X32_Y19_N28
\LessThan3~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~15_combout\ = (\Add10~44_combout\) # ((\Add10~50_combout\) # ((\Add10~46_combout\) # (\Add10~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~44_combout\,
	datab => \Add10~50_combout\,
	datac => \Add10~46_combout\,
	datad => \Add10~48_combout\,
	combout => \LessThan3~15_combout\);

-- Location: LCCOMB_X32_Y19_N14
\LessThan3~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~16_combout\ = (\Add10~54_combout\) # ((\Add10~52_combout\) # ((\LessThan3~14_combout\) # (\LessThan3~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~54_combout\,
	datab => \Add10~52_combout\,
	datac => \LessThan3~14_combout\,
	datad => \LessThan3~15_combout\,
	combout => \LessThan3~16_combout\);

-- Location: LCCOMB_X32_Y20_N12
\LessThan3~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~19_combout\ = (\LessThan0~8_combout\ & ((\LessThan3~16_combout\) # ((\Add10~62_combout\ & \LessThan3~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~62_combout\,
	datab => \LessThan3~18_combout\,
	datac => \LessThan3~16_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan3~19_combout\);

-- Location: LCCOMB_X32_Y20_N28
\LessThan3~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~7_combout\ = (obstacle_hstart(3)) # ((obstacle_hstart(4)) # ((obstacle_hstart(2)) # (obstacle_hstart(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(3),
	datab => obstacle_hstart(4),
	datac => obstacle_hstart(2),
	datad => obstacle_hstart(1),
	combout => \LessThan3~7_combout\);

-- Location: LCCOMB_X32_Y20_N22
\LessThan3~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~8_combout\ = (obstacle_hstart(7)) # ((\Add10~63_combout\ & ((obstacle_hstart(5)) # (\LessThan3~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(5),
	datab => \LessThan3~7_combout\,
	datac => obstacle_hstart(7),
	datad => \Add10~63_combout\,
	combout => \LessThan3~8_combout\);

-- Location: LCCOMB_X32_Y19_N24
\LessThan3~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~5_combout\ = (obstacle_hstart(27)) # ((obstacle_hstart(28)) # ((obstacle_hstart(25)) # (obstacle_hstart(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(27),
	datab => obstacle_hstart(28),
	datac => obstacle_hstart(25),
	datad => obstacle_hstart(26),
	combout => \LessThan3~5_combout\);

-- Location: LCCOMB_X31_Y21_N12
\LessThan3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~2_combout\ = (obstacle_hstart(17)) # ((obstacle_hstart(20)) # ((obstacle_hstart(19)) # (obstacle_hstart(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(17),
	datab => obstacle_hstart(20),
	datac => obstacle_hstart(19),
	datad => obstacle_hstart(18),
	combout => \LessThan3~2_combout\);

-- Location: LCCOMB_X32_Y19_N6
\LessThan3~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~3_combout\ = (obstacle_hstart(23)) # ((obstacle_hstart(24)) # ((obstacle_hstart(21)) # (obstacle_hstart(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(23),
	datab => obstacle_hstart(24),
	datac => obstacle_hstart(21),
	datad => obstacle_hstart(22),
	combout => \LessThan3~3_combout\);

-- Location: LCCOMB_X31_Y21_N26
\LessThan3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~1_combout\ = (obstacle_hstart(13)) # ((obstacle_hstart(14)) # ((obstacle_hstart(16)) # (obstacle_hstart(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(13),
	datab => obstacle_hstart(14),
	datac => obstacle_hstart(16),
	datad => obstacle_hstart(15),
	combout => \LessThan3~1_combout\);

-- Location: LCCOMB_X34_Y20_N0
\LessThan3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~0_combout\ = (obstacle_hstart(9)) # ((obstacle_hstart(12)) # ((obstacle_hstart(10)) # (obstacle_hstart(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(9),
	datab => obstacle_hstart(12),
	datac => obstacle_hstart(10),
	datad => obstacle_hstart(11),
	combout => \LessThan3~0_combout\);

-- Location: LCCOMB_X31_Y21_N6
\LessThan3~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~4_combout\ = (\LessThan3~2_combout\) # ((\LessThan3~3_combout\) # ((\LessThan3~1_combout\) # (\LessThan3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~2_combout\,
	datab => \LessThan3~3_combout\,
	datac => \LessThan3~1_combout\,
	datad => \LessThan3~0_combout\,
	combout => \LessThan3~4_combout\);

-- Location: LCCOMB_X32_Y20_N16
\LessThan3~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~6_combout\ = (\LessThan3~5_combout\) # ((\LessThan3~4_combout\) # ((obstacle_hstart(29)) # (obstacle_hstart(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~5_combout\,
	datab => \LessThan3~4_combout\,
	datac => obstacle_hstart(29),
	datad => obstacle_hstart(30),
	combout => \LessThan3~6_combout\);

-- Location: LCCOMB_X32_Y20_N0
\LessThan3~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~9_combout\ = (!\LessThan0~8_combout\ & ((\LessThan3~6_combout\) # ((\LessThan3~8_combout\ & \Add10~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~8_combout\,
	datab => \LessThan3~6_combout\,
	datac => \Add10~62_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan3~9_combout\);

-- Location: LCCOMB_X31_Y19_N28
\Add10~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~58_combout\ = (obstacle_hstart(30) & (\Add10~57\ & VCC)) # (!obstacle_hstart(30) & (!\Add10~57\))
-- \Add10~59\ = CARRY((!obstacle_hstart(30) & !\Add10~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(30),
	datad => VCC,
	cin => \Add10~57\,
	combout => \Add10~58_combout\,
	cout => \Add10~59\);

-- Location: LCCOMB_X31_Y19_N30
\Add10~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~60_combout\ = \Add10~59\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add10~59\,
	combout => \Add10~60_combout\);

-- Location: LCCOMB_X32_Y20_N14
\LessThan3~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan3~20_combout\ = (\LessThan3~19_combout\ & (((!\LessThan0~8_combout\) # (!\Add10~60_combout\)))) # (!\LessThan3~19_combout\ & (\LessThan3~9_combout\ & ((!\LessThan0~8_combout\) # (!\Add10~60_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~19_combout\,
	datab => \LessThan3~9_combout\,
	datac => \Add10~60_combout\,
	datad => \LessThan0~8_combout\,
	combout => \LessThan3~20_combout\);

-- Location: LCCOMB_X32_Y20_N30
\obstacle_hstart~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~31_combout\ = ((\LessThan0~8_combout\ & (\Add10~0_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(1))))) # (!\LessThan3~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~0_combout\,
	datab => \LessThan3~20_combout\,
	datac => obstacle_hstart(1),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~31_combout\);

-- Location: FF_X32_Y20_N31
\obstacle_hstart[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(1));

-- Location: LCCOMB_X31_Y20_N4
\Add10~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~2_combout\ = (obstacle_hstart(2) & (\Add10~1\ & VCC)) # (!obstacle_hstart(2) & (!\Add10~1\))
-- \Add10~3\ = CARRY((!obstacle_hstart(2) & !\Add10~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(2),
	datad => VCC,
	cin => \Add10~1\,
	combout => \Add10~2_combout\,
	cout => \Add10~3\);

-- Location: LCCOMB_X32_Y20_N4
\obstacle_hstart~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~30_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~2_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~2_combout\,
	datab => \LessThan3~20_combout\,
	datac => obstacle_hstart(2),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~30_combout\);

-- Location: FF_X32_Y20_N5
\obstacle_hstart[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(2));

-- Location: LCCOMB_X31_Y20_N6
\Add10~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~4_combout\ = (obstacle_hstart(3) & ((GND) # (!\Add10~3\))) # (!obstacle_hstart(3) & (\Add10~3\ $ (GND)))
-- \Add10~5\ = CARRY((obstacle_hstart(3)) # (!\Add10~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(3),
	datad => VCC,
	cin => \Add10~3\,
	combout => \Add10~4_combout\,
	cout => \Add10~5\);

-- Location: LCCOMB_X32_Y20_N10
\obstacle_hstart~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~29_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~4_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~4_combout\,
	datab => \LessThan3~20_combout\,
	datac => obstacle_hstart(3),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~29_combout\);

-- Location: FF_X32_Y20_N11
\obstacle_hstart[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(3));

-- Location: LCCOMB_X31_Y20_N8
\Add10~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~6_combout\ = (obstacle_hstart(4) & (\Add10~5\ & VCC)) # (!obstacle_hstart(4) & (!\Add10~5\))
-- \Add10~7\ = CARRY((!obstacle_hstart(4) & !\Add10~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(4),
	datad => VCC,
	cin => \Add10~5\,
	combout => \Add10~6_combout\,
	cout => \Add10~7\);

-- Location: LCCOMB_X32_Y20_N24
\obstacle_hstart~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~28_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~6_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~6_combout\,
	datab => \LessThan3~20_combout\,
	datac => obstacle_hstart(4),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~28_combout\);

-- Location: FF_X32_Y20_N25
\obstacle_hstart[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(4));

-- Location: LCCOMB_X31_Y20_N10
\Add10~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~8_combout\ = (obstacle_hstart(5) & ((GND) # (!\Add10~7\))) # (!obstacle_hstart(5) & (\Add10~7\ $ (GND)))
-- \Add10~9\ = CARRY((obstacle_hstart(5)) # (!\Add10~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(5),
	datad => VCC,
	cin => \Add10~7\,
	combout => \Add10~8_combout\,
	cout => \Add10~9\);

-- Location: LCCOMB_X32_Y20_N6
\obstacle_hstart~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~27_combout\ = ((\LessThan0~8_combout\ & (\Add10~8_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(5))))) # (!\LessThan3~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~8_combout\,
	datab => \LessThan3~20_combout\,
	datac => obstacle_hstart(5),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~27_combout\);

-- Location: FF_X32_Y20_N7
\obstacle_hstart[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(5));

-- Location: LCCOMB_X31_Y20_N12
\Add10~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~10_combout\ = (obstacle_hstart(6) & (\Add10~9\ & VCC)) # (!obstacle_hstart(6) & (!\Add10~9\))
-- \Add10~11\ = CARRY((!obstacle_hstart(6) & !\Add10~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(6),
	datad => VCC,
	cin => \Add10~9\,
	combout => \Add10~10_combout\,
	cout => \Add10~11\);

-- Location: LCCOMB_X34_Y21_N16
\obstacle_hstart~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~33_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~10_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~10_combout\,
	datac => obstacle_hstart(6),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~33_combout\);

-- Location: FF_X34_Y21_N17
\obstacle_hstart[6]\ : dffeas
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
	q => obstacle_hstart(6));

-- Location: LCCOMB_X31_Y20_N14
\Add10~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~12_combout\ = (obstacle_hstart(7) & ((GND) # (!\Add10~11\))) # (!obstacle_hstart(7) & (\Add10~11\ $ (GND)))
-- \Add10~13\ = CARRY((obstacle_hstart(7)) # (!\Add10~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(7),
	datad => VCC,
	cin => \Add10~11\,
	combout => \Add10~12_combout\,
	cout => \Add10~13\);

-- Location: LCCOMB_X32_Y20_N20
\obstacle_hstart~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~26_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~12_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(7))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~12_combout\,
	datab => \LessThan3~20_combout\,
	datac => obstacle_hstart(7),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~26_combout\);

-- Location: FF_X32_Y20_N21
\obstacle_hstart[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(7));

-- Location: LCCOMB_X31_Y20_N16
\Add10~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~14_combout\ = (obstacle_hstart(8) & (\Add10~13\ & VCC)) # (!obstacle_hstart(8) & (!\Add10~13\))
-- \Add10~15\ = CARRY((!obstacle_hstart(8) & !\Add10~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(8),
	datad => VCC,
	cin => \Add10~13\,
	combout => \Add10~14_combout\,
	cout => \Add10~15\);

-- Location: LCCOMB_X32_Y20_N2
\obstacle_hstart~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~32_combout\ = ((\LessThan0~8_combout\ & (\Add10~14_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(8))))) # (!\LessThan3~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~14_combout\,
	datab => \LessThan3~20_combout\,
	datac => obstacle_hstart(8),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~32_combout\);

-- Location: FF_X32_Y20_N3
\obstacle_hstart[8]\ : dffeas
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
	q => obstacle_hstart(8));

-- Location: LCCOMB_X31_Y20_N18
\Add10~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~16_combout\ = (obstacle_hstart(9) & ((GND) # (!\Add10~15\))) # (!obstacle_hstart(9) & (\Add10~15\ $ (GND)))
-- \Add10~17\ = CARRY((obstacle_hstart(9)) # (!\Add10~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(9),
	datad => VCC,
	cin => \Add10~15\,
	combout => \Add10~16_combout\,
	cout => \Add10~17\);

-- Location: LCCOMB_X31_Y21_N0
\obstacle_hstart~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~25_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~16_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(9))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~16_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(9),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~25_combout\);

-- Location: FF_X31_Y21_N1
\obstacle_hstart[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(9));

-- Location: LCCOMB_X31_Y20_N20
\Add10~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~18_combout\ = (obstacle_hstart(10) & (\Add10~17\ & VCC)) # (!obstacle_hstart(10) & (!\Add10~17\))
-- \Add10~19\ = CARRY((!obstacle_hstart(10) & !\Add10~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(10),
	datad => VCC,
	cin => \Add10~17\,
	combout => \Add10~18_combout\,
	cout => \Add10~19\);

-- Location: LCCOMB_X32_Y19_N12
\obstacle_hstart~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~24_combout\ = ((\LessThan0~8_combout\ & (\Add10~18_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(10))))) # (!\LessThan3~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~18_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(10),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~24_combout\);

-- Location: FF_X32_Y19_N13
\obstacle_hstart[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(10));

-- Location: LCCOMB_X31_Y20_N22
\Add10~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~20_combout\ = (obstacle_hstart(11) & ((GND) # (!\Add10~19\))) # (!obstacle_hstart(11) & (\Add10~19\ $ (GND)))
-- \Add10~21\ = CARRY((obstacle_hstart(11)) # (!\Add10~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(11),
	datad => VCC,
	cin => \Add10~19\,
	combout => \Add10~20_combout\,
	cout => \Add10~21\);

-- Location: LCCOMB_X31_Y21_N30
\obstacle_hstart~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~23_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~20_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~20_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(11),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~23_combout\);

-- Location: FF_X31_Y21_N31
\obstacle_hstart[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(11));

-- Location: LCCOMB_X31_Y20_N24
\Add10~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~22_combout\ = (obstacle_hstart(12) & (\Add10~21\ & VCC)) # (!obstacle_hstart(12) & (!\Add10~21\))
-- \Add10~23\ = CARRY((!obstacle_hstart(12) & !\Add10~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(12),
	datad => VCC,
	cin => \Add10~21\,
	combout => \Add10~22_combout\,
	cout => \Add10~23\);

-- Location: LCCOMB_X32_Y21_N8
\obstacle_hstart~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~22_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~22_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~22_combout\,
	datac => obstacle_hstart(12),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~22_combout\);

-- Location: FF_X32_Y21_N9
\obstacle_hstart[12]\ : dffeas
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
	q => obstacle_hstart(12));

-- Location: LCCOMB_X31_Y20_N26
\Add10~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~24_combout\ = (obstacle_hstart(13) & ((GND) # (!\Add10~23\))) # (!obstacle_hstart(13) & (\Add10~23\ $ (GND)))
-- \Add10~25\ = CARRY((obstacle_hstart(13)) # (!\Add10~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(13),
	datad => VCC,
	cin => \Add10~23\,
	combout => \Add10~24_combout\,
	cout => \Add10~25\);

-- Location: LCCOMB_X31_Y21_N20
\obstacle_hstart~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~21_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~24_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(13))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~24_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(13),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~21_combout\);

-- Location: FF_X31_Y21_N21
\obstacle_hstart[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(13));

-- Location: LCCOMB_X31_Y20_N28
\Add10~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~26_combout\ = (obstacle_hstart(14) & (\Add10~25\ & VCC)) # (!obstacle_hstart(14) & (!\Add10~25\))
-- \Add10~27\ = CARRY((!obstacle_hstart(14) & !\Add10~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(14),
	datad => VCC,
	cin => \Add10~25\,
	combout => \Add10~26_combout\,
	cout => \Add10~27\);

-- Location: LCCOMB_X31_Y21_N2
\obstacle_hstart~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~20_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~26_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(14))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~26_combout\,
	datac => obstacle_hstart(14),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~20_combout\);

-- Location: FF_X31_Y21_N3
\obstacle_hstart[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(14));

-- Location: LCCOMB_X31_Y20_N30
\Add10~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~28_combout\ = (obstacle_hstart(15) & ((GND) # (!\Add10~27\))) # (!obstacle_hstart(15) & (\Add10~27\ $ (GND)))
-- \Add10~29\ = CARRY((obstacle_hstart(15)) # (!\Add10~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(15),
	datad => VCC,
	cin => \Add10~27\,
	combout => \Add10~28_combout\,
	cout => \Add10~29\);

-- Location: LCCOMB_X31_Y21_N16
\obstacle_hstart~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~19_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~28_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~28_combout\,
	datac => obstacle_hstart(15),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~19_combout\);

-- Location: FF_X31_Y21_N17
\obstacle_hstart[15]\ : dffeas
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
	q => obstacle_hstart(15));

-- Location: LCCOMB_X31_Y19_N0
\Add10~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~30_combout\ = (obstacle_hstart(16) & (\Add10~29\ & VCC)) # (!obstacle_hstart(16) & (!\Add10~29\))
-- \Add10~31\ = CARRY((!obstacle_hstart(16) & !\Add10~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(16),
	datad => VCC,
	cin => \Add10~29\,
	combout => \Add10~30_combout\,
	cout => \Add10~31\);

-- Location: LCCOMB_X31_Y21_N14
\obstacle_hstart~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~18_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~30_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(16))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~30_combout\,
	datac => obstacle_hstart(16),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~18_combout\);

-- Location: FF_X31_Y21_N15
\obstacle_hstart[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(16));

-- Location: LCCOMB_X31_Y19_N2
\Add10~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~32_combout\ = (obstacle_hstart(17) & ((GND) # (!\Add10~31\))) # (!obstacle_hstart(17) & (\Add10~31\ $ (GND)))
-- \Add10~33\ = CARRY((obstacle_hstart(17)) # (!\Add10~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(17),
	datad => VCC,
	cin => \Add10~31\,
	combout => \Add10~32_combout\,
	cout => \Add10~33\);

-- Location: LCCOMB_X31_Y21_N4
\obstacle_hstart~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~17_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~32_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(17))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~32_combout\,
	datac => obstacle_hstart(17),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~17_combout\);

-- Location: FF_X31_Y21_N5
\obstacle_hstart[17]\ : dffeas
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
	q => obstacle_hstart(17));

-- Location: LCCOMB_X31_Y19_N4
\Add10~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~34_combout\ = (obstacle_hstart(18) & (\Add10~33\ & VCC)) # (!obstacle_hstart(18) & (!\Add10~33\))
-- \Add10~35\ = CARRY((!obstacle_hstart(18) & !\Add10~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(18),
	datad => VCC,
	cin => \Add10~33\,
	combout => \Add10~34_combout\,
	cout => \Add10~35\);

-- Location: LCCOMB_X31_Y21_N18
\obstacle_hstart~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~16_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~34_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(18))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~34_combout\,
	datac => obstacle_hstart(18),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~16_combout\);

-- Location: FF_X31_Y21_N19
\obstacle_hstart[18]\ : dffeas
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
	q => obstacle_hstart(18));

-- Location: LCCOMB_X31_Y19_N6
\Add10~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~36_combout\ = (obstacle_hstart(19) & ((GND) # (!\Add10~35\))) # (!obstacle_hstart(19) & (\Add10~35\ $ (GND)))
-- \Add10~37\ = CARRY((obstacle_hstart(19)) # (!\Add10~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(19),
	datad => VCC,
	cin => \Add10~35\,
	combout => \Add10~36_combout\,
	cout => \Add10~37\);

-- Location: LCCOMB_X32_Y19_N18
\obstacle_hstart~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~15_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~36_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(19))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~36_combout\,
	datac => obstacle_hstart(19),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~15_combout\);

-- Location: FF_X32_Y19_N19
\obstacle_hstart[19]\ : dffeas
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
	q => obstacle_hstart(19));

-- Location: LCCOMB_X31_Y19_N8
\Add10~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~38_combout\ = (obstacle_hstart(20) & (\Add10~37\ & VCC)) # (!obstacle_hstart(20) & (!\Add10~37\))
-- \Add10~39\ = CARRY((!obstacle_hstart(20) & !\Add10~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(20),
	datad => VCC,
	cin => \Add10~37\,
	combout => \Add10~38_combout\,
	cout => \Add10~39\);

-- Location: LCCOMB_X32_Y19_N8
\obstacle_hstart~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~14_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~38_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(20))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~38_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(20),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~14_combout\);

-- Location: FF_X32_Y19_N9
\obstacle_hstart[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(20));

-- Location: LCCOMB_X31_Y19_N10
\Add10~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~40_combout\ = (obstacle_hstart(21) & ((GND) # (!\Add10~39\))) # (!obstacle_hstart(21) & (\Add10~39\ $ (GND)))
-- \Add10~41\ = CARRY((obstacle_hstart(21)) # (!\Add10~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(21),
	datad => VCC,
	cin => \Add10~39\,
	combout => \Add10~40_combout\,
	cout => \Add10~41\);

-- Location: LCCOMB_X32_Y19_N30
\obstacle_hstart~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~13_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~40_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(21))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~40_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(21),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~13_combout\);

-- Location: FF_X32_Y19_N31
\obstacle_hstart[21]\ : dffeas
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
	q => obstacle_hstart(21));

-- Location: LCCOMB_X31_Y19_N12
\Add10~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~42_combout\ = (obstacle_hstart(22) & (\Add10~41\ & VCC)) # (!obstacle_hstart(22) & (!\Add10~41\))
-- \Add10~43\ = CARRY((!obstacle_hstart(22) & !\Add10~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(22),
	datad => VCC,
	cin => \Add10~41\,
	combout => \Add10~42_combout\,
	cout => \Add10~43\);

-- Location: LCCOMB_X32_Y19_N20
\obstacle_hstart~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~12_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~42_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(22))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~42_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(22),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~12_combout\);

-- Location: FF_X32_Y19_N21
\obstacle_hstart[22]\ : dffeas
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
	q => obstacle_hstart(22));

-- Location: LCCOMB_X31_Y19_N14
\Add10~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~44_combout\ = (obstacle_hstart(23) & ((GND) # (!\Add10~43\))) # (!obstacle_hstart(23) & (\Add10~43\ $ (GND)))
-- \Add10~45\ = CARRY((obstacle_hstart(23)) # (!\Add10~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(23),
	datad => VCC,
	cin => \Add10~43\,
	combout => \Add10~44_combout\,
	cout => \Add10~45\);

-- Location: LCCOMB_X32_Y19_N2
\obstacle_hstart~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~11_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~44_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(23))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~44_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(23),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~11_combout\);

-- Location: FF_X32_Y19_N3
\obstacle_hstart[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(23));

-- Location: LCCOMB_X31_Y19_N16
\Add10~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~46_combout\ = (obstacle_hstart(24) & (\Add10~45\ & VCC)) # (!obstacle_hstart(24) & (!\Add10~45\))
-- \Add10~47\ = CARRY((!obstacle_hstart(24) & !\Add10~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(24),
	datad => VCC,
	cin => \Add10~45\,
	combout => \Add10~46_combout\,
	cout => \Add10~47\);

-- Location: LCCOMB_X32_Y19_N16
\obstacle_hstart~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~10_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~46_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(24))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~46_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(24),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~10_combout\);

-- Location: FF_X32_Y19_N17
\obstacle_hstart[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(24));

-- Location: LCCOMB_X31_Y19_N18
\Add10~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~48_combout\ = (obstacle_hstart(25) & ((GND) # (!\Add10~47\))) # (!obstacle_hstart(25) & (\Add10~47\ $ (GND)))
-- \Add10~49\ = CARRY((obstacle_hstart(25)) # (!\Add10~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(25),
	datad => VCC,
	cin => \Add10~47\,
	combout => \Add10~48_combout\,
	cout => \Add10~49\);

-- Location: LCCOMB_X32_Y19_N22
\obstacle_hstart~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~9_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~48_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(25))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~48_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(25),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~9_combout\);

-- Location: FF_X32_Y19_N23
\obstacle_hstart[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(25));

-- Location: LCCOMB_X31_Y19_N20
\Add10~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~50_combout\ = (obstacle_hstart(26) & (\Add10~49\ & VCC)) # (!obstacle_hstart(26) & (!\Add10~49\))
-- \Add10~51\ = CARRY((!obstacle_hstart(26) & !\Add10~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(26),
	datad => VCC,
	cin => \Add10~49\,
	combout => \Add10~50_combout\,
	cout => \Add10~51\);

-- Location: LCCOMB_X32_Y19_N4
\obstacle_hstart~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~8_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~50_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(26))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~50_combout\,
	datac => obstacle_hstart(26),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~8_combout\);

-- Location: FF_X32_Y19_N5
\obstacle_hstart[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(26));

-- Location: LCCOMB_X31_Y19_N22
\Add10~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~52_combout\ = (obstacle_hstart(27) & ((GND) # (!\Add10~51\))) # (!obstacle_hstart(27) & (\Add10~51\ $ (GND)))
-- \Add10~53\ = CARRY((obstacle_hstart(27)) # (!\Add10~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(27),
	datad => VCC,
	cin => \Add10~51\,
	combout => \Add10~52_combout\,
	cout => \Add10~53\);

-- Location: LCCOMB_X32_Y19_N10
\obstacle_hstart~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~7_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~52_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(27))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~52_combout\,
	datac => obstacle_hstart(27),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~7_combout\);

-- Location: FF_X32_Y19_N11
\obstacle_hstart[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(27));

-- Location: LCCOMB_X31_Y19_N24
\Add10~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~54_combout\ = (obstacle_hstart(28) & (\Add10~53\ & VCC)) # (!obstacle_hstart(28) & (!\Add10~53\))
-- \Add10~55\ = CARRY((!obstacle_hstart(28) & !\Add10~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => obstacle_hstart(28),
	datad => VCC,
	cin => \Add10~53\,
	combout => \Add10~54_combout\,
	cout => \Add10~55\);

-- Location: LCCOMB_X32_Y19_N0
\obstacle_hstart~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~6_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~54_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(28))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~54_combout\,
	datab => \LessThan0~8_combout\,
	datac => obstacle_hstart(28),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~6_combout\);

-- Location: FF_X32_Y19_N1
\obstacle_hstart[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(28));

-- Location: LCCOMB_X31_Y19_N26
\Add10~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add10~56_combout\ = (obstacle_hstart(29) & ((GND) # (!\Add10~55\))) # (!obstacle_hstart(29) & (\Add10~55\ $ (GND)))
-- \Add10~57\ = CARRY((obstacle_hstart(29)) # (!\Add10~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(29),
	datad => VCC,
	cin => \Add10~55\,
	combout => \Add10~56_combout\,
	cout => \Add10~57\);

-- Location: LCCOMB_X31_Y21_N24
\obstacle_hstart~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~5_combout\ = (\LessThan3~20_combout\ & ((\LessThan0~8_combout\ & (\Add10~56_combout\)) # (!\LessThan0~8_combout\ & ((obstacle_hstart(29))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan0~8_combout\,
	datab => \Add10~56_combout\,
	datac => obstacle_hstart(29),
	datad => \LessThan3~20_combout\,
	combout => \obstacle_hstart~5_combout\);

-- Location: FF_X31_Y21_N25
\obstacle_hstart[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(29));

-- Location: LCCOMB_X32_Y20_N8
\obstacle_hstart~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \obstacle_hstart~4_combout\ = (\LessThan0~8_combout\ & (\Add10~58_combout\ & (!\Add10~60_combout\))) # (!\LessThan0~8_combout\ & (((obstacle_hstart(30)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add10~58_combout\,
	datab => \Add10~60_combout\,
	datac => obstacle_hstart(30),
	datad => \LessThan0~8_combout\,
	combout => \obstacle_hstart~4_combout\);

-- Location: FF_X32_Y20_N9
\obstacle_hstart[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \obstacle_hstart~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => obstacle_hstart(30));

-- Location: LCCOMB_X34_Y20_N2
\LessThan21~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~1_cout\ = CARRY((!hposition(1) & obstacle_hstart(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => obstacle_hstart(1),
	datad => VCC,
	cout => \LessThan21~1_cout\);

-- Location: LCCOMB_X34_Y20_N4
\LessThan21~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~3_cout\ = CARRY((hposition(2) & ((!\LessThan21~1_cout\) # (!obstacle_hstart(2)))) # (!hposition(2) & (!obstacle_hstart(2) & !\LessThan21~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => obstacle_hstart(2),
	datad => VCC,
	cin => \LessThan21~1_cout\,
	cout => \LessThan21~3_cout\);

-- Location: LCCOMB_X34_Y20_N6
\LessThan21~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~5_cout\ = CARRY((obstacle_hstart(3) & ((!\LessThan21~3_cout\) # (!hposition(3)))) # (!obstacle_hstart(3) & (!hposition(3) & !\LessThan21~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(3),
	datab => hposition(3),
	datad => VCC,
	cin => \LessThan21~3_cout\,
	cout => \LessThan21~5_cout\);

-- Location: LCCOMB_X34_Y20_N8
\LessThan21~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~7_cout\ = CARRY((obstacle_hstart(4) & (hposition(4) & !\LessThan21~5_cout\)) # (!obstacle_hstart(4) & ((hposition(4)) # (!\LessThan21~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(4),
	datab => hposition(4),
	datad => VCC,
	cin => \LessThan21~5_cout\,
	cout => \LessThan21~7_cout\);

-- Location: LCCOMB_X34_Y20_N10
\LessThan21~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~9_cout\ = CARRY((obstacle_hstart(5) & ((!\LessThan21~7_cout\) # (!hposition(5)))) # (!obstacle_hstart(5) & (!hposition(5) & !\LessThan21~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(5),
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan21~7_cout\,
	cout => \LessThan21~9_cout\);

-- Location: LCCOMB_X34_Y20_N12
\LessThan21~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~11_cout\ = CARRY((obstacle_hstart(6) & (hposition(6) & !\LessThan21~9_cout\)) # (!obstacle_hstart(6) & ((hposition(6)) # (!\LessThan21~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(6),
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan21~9_cout\,
	cout => \LessThan21~11_cout\);

-- Location: LCCOMB_X34_Y20_N14
\LessThan21~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~13_cout\ = CARRY((obstacle_hstart(7) & ((!\LessThan21~11_cout\) # (!hposition(7)))) # (!obstacle_hstart(7) & (!hposition(7) & !\LessThan21~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(7),
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan21~11_cout\,
	cout => \LessThan21~13_cout\);

-- Location: LCCOMB_X34_Y20_N16
\LessThan21~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~15_cout\ = CARRY((obstacle_hstart(8) & (hposition(8) & !\LessThan21~13_cout\)) # (!obstacle_hstart(8) & ((hposition(8)) # (!\LessThan21~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(8),
	datab => hposition(8),
	datad => VCC,
	cin => \LessThan21~13_cout\,
	cout => \LessThan21~15_cout\);

-- Location: LCCOMB_X34_Y20_N18
\LessThan21~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~17_cout\ = CARRY((obstacle_hstart(9) & ((!\LessThan21~15_cout\) # (!hposition(9)))) # (!obstacle_hstart(9) & (!hposition(9) & !\LessThan21~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(9),
	datab => hposition(9),
	datad => VCC,
	cin => \LessThan21~15_cout\,
	cout => \LessThan21~17_cout\);

-- Location: LCCOMB_X34_Y20_N20
\LessThan21~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~19_cout\ = CARRY((hposition(10) & ((!\LessThan21~17_cout\) # (!obstacle_hstart(10)))) # (!hposition(10) & (!obstacle_hstart(10) & !\LessThan21~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => obstacle_hstart(10),
	datad => VCC,
	cin => \LessThan21~17_cout\,
	cout => \LessThan21~19_cout\);

-- Location: LCCOMB_X34_Y20_N22
\LessThan21~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~21_cout\ = CARRY((obstacle_hstart(11) & ((!\LessThan21~19_cout\) # (!hposition(11)))) # (!obstacle_hstart(11) & (!hposition(11) & !\LessThan21~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(11),
	datab => hposition(11),
	datad => VCC,
	cin => \LessThan21~19_cout\,
	cout => \LessThan21~21_cout\);

-- Location: LCCOMB_X34_Y20_N24
\LessThan21~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~23_cout\ = CARRY((hposition(12) & ((!\LessThan21~21_cout\) # (!obstacle_hstart(12)))) # (!hposition(12) & (!obstacle_hstart(12) & !\LessThan21~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => obstacle_hstart(12),
	datad => VCC,
	cin => \LessThan21~21_cout\,
	cout => \LessThan21~23_cout\);

-- Location: LCCOMB_X34_Y20_N26
\LessThan21~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~25_cout\ = CARRY((obstacle_hstart(13) & ((!\LessThan21~23_cout\) # (!hposition(13)))) # (!obstacle_hstart(13) & (!hposition(13) & !\LessThan21~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(13),
	datab => hposition(13),
	datad => VCC,
	cin => \LessThan21~23_cout\,
	cout => \LessThan21~25_cout\);

-- Location: LCCOMB_X34_Y20_N28
\LessThan21~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~27_cout\ = CARRY((obstacle_hstart(14) & (hposition(14) & !\LessThan21~25_cout\)) # (!obstacle_hstart(14) & ((hposition(14)) # (!\LessThan21~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(14),
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan21~25_cout\,
	cout => \LessThan21~27_cout\);

-- Location: LCCOMB_X34_Y20_N30
\LessThan21~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~29_cout\ = CARRY((obstacle_hstart(15) & ((!\LessThan21~27_cout\) # (!hposition(15)))) # (!obstacle_hstart(15) & (!hposition(15) & !\LessThan21~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(15),
	datab => hposition(15),
	datad => VCC,
	cin => \LessThan21~27_cout\,
	cout => \LessThan21~29_cout\);

-- Location: LCCOMB_X34_Y19_N0
\LessThan21~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~31_cout\ = CARRY((obstacle_hstart(16) & (hposition(16) & !\LessThan21~29_cout\)) # (!obstacle_hstart(16) & ((hposition(16)) # (!\LessThan21~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(16),
	datab => hposition(16),
	datad => VCC,
	cin => \LessThan21~29_cout\,
	cout => \LessThan21~31_cout\);

-- Location: LCCOMB_X34_Y19_N2
\LessThan21~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~33_cout\ = CARRY((obstacle_hstart(17) & ((!\LessThan21~31_cout\) # (!hposition(17)))) # (!obstacle_hstart(17) & (!hposition(17) & !\LessThan21~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(17),
	datab => hposition(17),
	datad => VCC,
	cin => \LessThan21~31_cout\,
	cout => \LessThan21~33_cout\);

-- Location: LCCOMB_X34_Y19_N4
\LessThan21~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~35_cout\ = CARRY((hposition(18) & ((!\LessThan21~33_cout\) # (!obstacle_hstart(18)))) # (!hposition(18) & (!obstacle_hstart(18) & !\LessThan21~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(18),
	datab => obstacle_hstart(18),
	datad => VCC,
	cin => \LessThan21~33_cout\,
	cout => \LessThan21~35_cout\);

-- Location: LCCOMB_X34_Y19_N6
\LessThan21~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~37_cout\ = CARRY((obstacle_hstart(19) & ((!\LessThan21~35_cout\) # (!hposition(19)))) # (!obstacle_hstart(19) & (!hposition(19) & !\LessThan21~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(19),
	datab => hposition(19),
	datad => VCC,
	cin => \LessThan21~35_cout\,
	cout => \LessThan21~37_cout\);

-- Location: LCCOMB_X34_Y19_N8
\LessThan21~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~39_cout\ = CARRY((obstacle_hstart(20) & (hposition(20) & !\LessThan21~37_cout\)) # (!obstacle_hstart(20) & ((hposition(20)) # (!\LessThan21~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(20),
	datab => hposition(20),
	datad => VCC,
	cin => \LessThan21~37_cout\,
	cout => \LessThan21~39_cout\);

-- Location: LCCOMB_X34_Y19_N10
\LessThan21~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~41_cout\ = CARRY((obstacle_hstart(21) & ((!\LessThan21~39_cout\) # (!hposition(21)))) # (!obstacle_hstart(21) & (!hposition(21) & !\LessThan21~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(21),
	datab => hposition(21),
	datad => VCC,
	cin => \LessThan21~39_cout\,
	cout => \LessThan21~41_cout\);

-- Location: LCCOMB_X34_Y19_N12
\LessThan21~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~43_cout\ = CARRY((obstacle_hstart(22) & (hposition(22) & !\LessThan21~41_cout\)) # (!obstacle_hstart(22) & ((hposition(22)) # (!\LessThan21~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(22),
	datab => hposition(22),
	datad => VCC,
	cin => \LessThan21~41_cout\,
	cout => \LessThan21~43_cout\);

-- Location: LCCOMB_X34_Y19_N14
\LessThan21~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~45_cout\ = CARRY((obstacle_hstart(23) & ((!\LessThan21~43_cout\) # (!hposition(23)))) # (!obstacle_hstart(23) & (!hposition(23) & !\LessThan21~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(23),
	datab => hposition(23),
	datad => VCC,
	cin => \LessThan21~43_cout\,
	cout => \LessThan21~45_cout\);

-- Location: LCCOMB_X34_Y19_N16
\LessThan21~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~47_cout\ = CARRY((obstacle_hstart(24) & (hposition(24) & !\LessThan21~45_cout\)) # (!obstacle_hstart(24) & ((hposition(24)) # (!\LessThan21~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(24),
	datab => hposition(24),
	datad => VCC,
	cin => \LessThan21~45_cout\,
	cout => \LessThan21~47_cout\);

-- Location: LCCOMB_X34_Y19_N18
\LessThan21~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~49_cout\ = CARRY((obstacle_hstart(25) & ((!\LessThan21~47_cout\) # (!hposition(25)))) # (!obstacle_hstart(25) & (!hposition(25) & !\LessThan21~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(25),
	datab => hposition(25),
	datad => VCC,
	cin => \LessThan21~47_cout\,
	cout => \LessThan21~49_cout\);

-- Location: LCCOMB_X34_Y19_N20
\LessThan21~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~51_cout\ = CARRY((obstacle_hstart(26) & (hposition(26) & !\LessThan21~49_cout\)) # (!obstacle_hstart(26) & ((hposition(26)) # (!\LessThan21~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(26),
	datab => hposition(26),
	datad => VCC,
	cin => \LessThan21~49_cout\,
	cout => \LessThan21~51_cout\);

-- Location: LCCOMB_X34_Y19_N22
\LessThan21~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~53_cout\ = CARRY((hposition(27) & (obstacle_hstart(27) & !\LessThan21~51_cout\)) # (!hposition(27) & ((obstacle_hstart(27)) # (!\LessThan21~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => obstacle_hstart(27),
	datad => VCC,
	cin => \LessThan21~51_cout\,
	cout => \LessThan21~53_cout\);

-- Location: LCCOMB_X34_Y19_N24
\LessThan21~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~55_cout\ = CARRY((obstacle_hstart(28) & (hposition(28) & !\LessThan21~53_cout\)) # (!obstacle_hstart(28) & ((hposition(28)) # (!\LessThan21~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(28),
	datab => hposition(28),
	datad => VCC,
	cin => \LessThan21~53_cout\,
	cout => \LessThan21~55_cout\);

-- Location: LCCOMB_X34_Y19_N26
\LessThan21~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~57_cout\ = CARRY((obstacle_hstart(29) & ((!\LessThan21~55_cout\) # (!hposition(29)))) # (!obstacle_hstart(29) & (!hposition(29) & !\LessThan21~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(29),
	datab => hposition(29),
	datad => VCC,
	cin => \LessThan21~55_cout\,
	cout => \LessThan21~57_cout\);

-- Location: LCCOMB_X34_Y19_N28
\LessThan21~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan21~58_combout\ = (obstacle_hstart(30) & ((\LessThan21~57_cout\) # (!hposition(30)))) # (!obstacle_hstart(30) & (\LessThan21~57_cout\ & !hposition(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => obstacle_hstart(30),
	datad => hposition(30),
	cin => \LessThan21~57_cout\,
	combout => \LessThan21~58_combout\);

-- Location: LCCOMB_X42_Y20_N30
\LessThan19~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~8_combout\ = (!vposition(6) & (!vposition(3) & !vposition(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(6),
	datab => vposition(3),
	datad => vposition(4),
	combout => \LessThan19~8_combout\);

-- Location: LCCOMB_X42_Y20_N8
\LessThan19~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~9_combout\ = ((\LessThan19~8_combout\ & (\LessThan19~7_combout\ & !vposition(5)))) # (!vposition(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~8_combout\,
	datab => \LessThan19~7_combout\,
	datac => vposition(5),
	datad => vposition(7),
	combout => \LessThan19~9_combout\);

-- Location: LCCOMB_X42_Y20_N18
\LessThan19~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan19~10_combout\ = (\LessThan19~6_combout\ & (((\LessThan19~9_combout\ & !vposition(8))) # (!vposition(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~6_combout\,
	datab => \LessThan19~9_combout\,
	datac => vposition(9),
	datad => vposition(8),
	combout => \LessThan19~10_combout\);

-- Location: LCCOMB_X42_Y20_N28
\r[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[3]~4_combout\ = (!hposition(31) & (\LessThan22~58_combout\ & (!\LessThan21~58_combout\ & !\LessThan19~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => hposition(31),
	datab => \LessThan22~58_combout\,
	datac => \LessThan21~58_combout\,
	datad => \LessThan19~10_combout\,
	combout => \r[3]~4_combout\);

-- Location: LCCOMB_X42_Y20_N6
\LessThan26~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~0_combout\ = (!vposition(5) & (((!vposition(3) & \LessThan19~7_combout\)) # (!vposition(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => vposition(5),
	datac => vposition(3),
	datad => \LessThan19~7_combout\,
	combout => \LessThan26~0_combout\);

-- Location: LCCOMB_X42_Y20_N16
\LessThan26~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan26~1_combout\ = ((!vposition(8) & ((\LessThan26~0_combout\) # (!\process_0~10_combout\)))) # (!vposition(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan26~0_combout\,
	datab => \process_0~10_combout\,
	datac => vposition(9),
	datad => vposition(8),
	combout => \LessThan26~1_combout\);

-- Location: LCCOMB_X39_Y20_N2
\Add30~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~1_cout\ = CARRY(bg_hstart(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(1),
	datad => VCC,
	cout => \Add30~1_cout\);

-- Location: LCCOMB_X39_Y20_N4
\Add30~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~2_combout\ = (bg_hstart(2) & (\Add30~1_cout\ & VCC)) # (!bg_hstart(2) & (!\Add30~1_cout\))
-- \Add30~3\ = CARRY((!bg_hstart(2) & !\Add30~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(2),
	datad => VCC,
	cin => \Add30~1_cout\,
	combout => \Add30~2_combout\,
	cout => \Add30~3\);

-- Location: LCCOMB_X39_Y20_N6
\Add30~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~4_combout\ = (bg_hstart(3) & ((GND) # (!\Add30~3\))) # (!bg_hstart(3) & (\Add30~3\ $ (GND)))
-- \Add30~5\ = CARRY((bg_hstart(3)) # (!\Add30~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(3),
	datad => VCC,
	cin => \Add30~3\,
	combout => \Add30~4_combout\,
	cout => \Add30~5\);

-- Location: LCCOMB_X39_Y20_N8
\Add30~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~6_combout\ = (bg_hstart(4) & (!\Add30~5\)) # (!bg_hstart(4) & ((\Add30~5\) # (GND)))
-- \Add30~7\ = CARRY((!\Add30~5\) # (!bg_hstart(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(4),
	datad => VCC,
	cin => \Add30~5\,
	combout => \Add30~6_combout\,
	cout => \Add30~7\);

-- Location: LCCOMB_X39_Y20_N10
\Add30~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~8_combout\ = (bg_hstart(5) & ((GND) # (!\Add30~7\))) # (!bg_hstart(5) & (\Add30~7\ $ (GND)))
-- \Add30~9\ = CARRY((bg_hstart(5)) # (!\Add30~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(5),
	datad => VCC,
	cin => \Add30~7\,
	combout => \Add30~8_combout\,
	cout => \Add30~9\);

-- Location: LCCOMB_X39_Y20_N12
\Add30~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~10_combout\ = (bg_hstart(6) & (\Add30~9\ & VCC)) # (!bg_hstart(6) & (!\Add30~9\))
-- \Add30~11\ = CARRY((!bg_hstart(6) & !\Add30~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(6),
	datad => VCC,
	cin => \Add30~9\,
	combout => \Add30~10_combout\,
	cout => \Add30~11\);

-- Location: LCCOMB_X39_Y20_N14
\Add30~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~12_combout\ = (bg_hstart(7) & ((GND) # (!\Add30~11\))) # (!bg_hstart(7) & (\Add30~11\ $ (GND)))
-- \Add30~13\ = CARRY((bg_hstart(7)) # (!\Add30~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(7),
	datad => VCC,
	cin => \Add30~11\,
	combout => \Add30~12_combout\,
	cout => \Add30~13\);

-- Location: LCCOMB_X39_Y20_N16
\Add30~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~14_combout\ = (bg_hstart(8) & (!\Add30~13\)) # (!bg_hstart(8) & ((\Add30~13\) # (GND)))
-- \Add30~15\ = CARRY((!\Add30~13\) # (!bg_hstart(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(8),
	datad => VCC,
	cin => \Add30~13\,
	combout => \Add30~14_combout\,
	cout => \Add30~15\);

-- Location: LCCOMB_X39_Y20_N18
\Add30~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~16_combout\ = (bg_hstart(9) & ((GND) # (!\Add30~15\))) # (!bg_hstart(9) & (\Add30~15\ $ (GND)))
-- \Add30~17\ = CARRY((bg_hstart(9)) # (!\Add30~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(9),
	datad => VCC,
	cin => \Add30~15\,
	combout => \Add30~16_combout\,
	cout => \Add30~17\);

-- Location: LCCOMB_X39_Y20_N20
\Add30~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~18_combout\ = (bg_hstart(10) & (!\Add30~17\)) # (!bg_hstart(10) & ((\Add30~17\) # (GND)))
-- \Add30~19\ = CARRY((!\Add30~17\) # (!bg_hstart(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(10),
	datad => VCC,
	cin => \Add30~17\,
	combout => \Add30~18_combout\,
	cout => \Add30~19\);

-- Location: LCCOMB_X39_Y20_N22
\Add30~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~20_combout\ = (bg_hstart(11) & (\Add30~19\ $ (GND))) # (!bg_hstart(11) & (!\Add30~19\ & VCC))
-- \Add30~21\ = CARRY((bg_hstart(11) & !\Add30~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datad => VCC,
	cin => \Add30~19\,
	combout => \Add30~20_combout\,
	cout => \Add30~21\);

-- Location: LCCOMB_X39_Y20_N24
\Add30~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~22_combout\ = (bg_hstart(12) & (!\Add30~21\)) # (!bg_hstart(12) & ((\Add30~21\) # (GND)))
-- \Add30~23\ = CARRY((!\Add30~21\) # (!bg_hstart(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(12),
	datad => VCC,
	cin => \Add30~21\,
	combout => \Add30~22_combout\,
	cout => \Add30~23\);

-- Location: LCCOMB_X39_Y20_N26
\Add30~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~24_combout\ = (bg_hstart(13) & (\Add30~23\ $ (GND))) # (!bg_hstart(13) & (!\Add30~23\ & VCC))
-- \Add30~25\ = CARRY((bg_hstart(13) & !\Add30~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(13),
	datad => VCC,
	cin => \Add30~23\,
	combout => \Add30~24_combout\,
	cout => \Add30~25\);

-- Location: LCCOMB_X39_Y20_N28
\Add30~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~26_combout\ = (bg_hstart(14) & (!\Add30~25\)) # (!bg_hstart(14) & ((\Add30~25\) # (GND)))
-- \Add30~27\ = CARRY((!\Add30~25\) # (!bg_hstart(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(14),
	datad => VCC,
	cin => \Add30~25\,
	combout => \Add30~26_combout\,
	cout => \Add30~27\);

-- Location: LCCOMB_X39_Y20_N30
\Add30~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~28_combout\ = (bg_hstart(15) & (\Add30~27\ $ (GND))) # (!bg_hstart(15) & (!\Add30~27\ & VCC))
-- \Add30~29\ = CARRY((bg_hstart(15) & !\Add30~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(15),
	datad => VCC,
	cin => \Add30~27\,
	combout => \Add30~28_combout\,
	cout => \Add30~29\);

-- Location: LCCOMB_X39_Y19_N0
\Add30~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~30_combout\ = (bg_hstart(16) & (!\Add30~29\)) # (!bg_hstart(16) & ((\Add30~29\) # (GND)))
-- \Add30~31\ = CARRY((!\Add30~29\) # (!bg_hstart(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(16),
	datad => VCC,
	cin => \Add30~29\,
	combout => \Add30~30_combout\,
	cout => \Add30~31\);

-- Location: LCCOMB_X39_Y19_N2
\Add30~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~32_combout\ = (bg_hstart(17) & (\Add30~31\ $ (GND))) # (!bg_hstart(17) & (!\Add30~31\ & VCC))
-- \Add30~33\ = CARRY((bg_hstart(17) & !\Add30~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(17),
	datad => VCC,
	cin => \Add30~31\,
	combout => \Add30~32_combout\,
	cout => \Add30~33\);

-- Location: LCCOMB_X39_Y19_N4
\Add30~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~34_combout\ = (bg_hstart(18) & (!\Add30~33\)) # (!bg_hstart(18) & ((\Add30~33\) # (GND)))
-- \Add30~35\ = CARRY((!\Add30~33\) # (!bg_hstart(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(18),
	datad => VCC,
	cin => \Add30~33\,
	combout => \Add30~34_combout\,
	cout => \Add30~35\);

-- Location: LCCOMB_X39_Y19_N6
\Add30~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~36_combout\ = (bg_hstart(19) & (\Add30~35\ $ (GND))) # (!bg_hstart(19) & (!\Add30~35\ & VCC))
-- \Add30~37\ = CARRY((bg_hstart(19) & !\Add30~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(19),
	datad => VCC,
	cin => \Add30~35\,
	combout => \Add30~36_combout\,
	cout => \Add30~37\);

-- Location: LCCOMB_X39_Y19_N8
\Add30~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~38_combout\ = (bg_hstart(20) & (!\Add30~37\)) # (!bg_hstart(20) & ((\Add30~37\) # (GND)))
-- \Add30~39\ = CARRY((!\Add30~37\) # (!bg_hstart(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(20),
	datad => VCC,
	cin => \Add30~37\,
	combout => \Add30~38_combout\,
	cout => \Add30~39\);

-- Location: LCCOMB_X39_Y19_N10
\Add30~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~40_combout\ = (bg_hstart(21) & (\Add30~39\ $ (GND))) # (!bg_hstart(21) & (!\Add30~39\ & VCC))
-- \Add30~41\ = CARRY((bg_hstart(21) & !\Add30~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(21),
	datad => VCC,
	cin => \Add30~39\,
	combout => \Add30~40_combout\,
	cout => \Add30~41\);

-- Location: LCCOMB_X39_Y19_N12
\Add30~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~42_combout\ = (bg_hstart(22) & (!\Add30~41\)) # (!bg_hstart(22) & ((\Add30~41\) # (GND)))
-- \Add30~43\ = CARRY((!\Add30~41\) # (!bg_hstart(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(22),
	datad => VCC,
	cin => \Add30~41\,
	combout => \Add30~42_combout\,
	cout => \Add30~43\);

-- Location: LCCOMB_X39_Y19_N14
\Add30~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~44_combout\ = (bg_hstart(23) & (\Add30~43\ $ (GND))) # (!bg_hstart(23) & (!\Add30~43\ & VCC))
-- \Add30~45\ = CARRY((bg_hstart(23) & !\Add30~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(23),
	datad => VCC,
	cin => \Add30~43\,
	combout => \Add30~44_combout\,
	cout => \Add30~45\);

-- Location: LCCOMB_X39_Y19_N16
\Add30~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~46_combout\ = (bg_hstart(24) & (!\Add30~45\)) # (!bg_hstart(24) & ((\Add30~45\) # (GND)))
-- \Add30~47\ = CARRY((!\Add30~45\) # (!bg_hstart(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(24),
	datad => VCC,
	cin => \Add30~45\,
	combout => \Add30~46_combout\,
	cout => \Add30~47\);

-- Location: LCCOMB_X39_Y19_N18
\Add30~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~48_combout\ = (bg_hstart(25) & (\Add30~47\ $ (GND))) # (!bg_hstart(25) & (!\Add30~47\ & VCC))
-- \Add30~49\ = CARRY((bg_hstart(25) & !\Add30~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(25),
	datad => VCC,
	cin => \Add30~47\,
	combout => \Add30~48_combout\,
	cout => \Add30~49\);

-- Location: LCCOMB_X39_Y19_N20
\Add30~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~50_combout\ = (bg_hstart(26) & (!\Add30~49\)) # (!bg_hstart(26) & ((\Add30~49\) # (GND)))
-- \Add30~51\ = CARRY((!\Add30~49\) # (!bg_hstart(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(26),
	datad => VCC,
	cin => \Add30~49\,
	combout => \Add30~50_combout\,
	cout => \Add30~51\);

-- Location: LCCOMB_X39_Y19_N22
\Add30~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~52_combout\ = (bg_hstart(27) & (\Add30~51\ $ (GND))) # (!bg_hstart(27) & (!\Add30~51\ & VCC))
-- \Add30~53\ = CARRY((bg_hstart(27) & !\Add30~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(27),
	datad => VCC,
	cin => \Add30~51\,
	combout => \Add30~52_combout\,
	cout => \Add30~53\);

-- Location: LCCOMB_X39_Y19_N24
\Add30~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~54_combout\ = (bg_hstart(28) & (!\Add30~53\)) # (!bg_hstart(28) & ((\Add30~53\) # (GND)))
-- \Add30~55\ = CARRY((!\Add30~53\) # (!bg_hstart(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(28),
	datad => VCC,
	cin => \Add30~53\,
	combout => \Add30~54_combout\,
	cout => \Add30~55\);

-- Location: LCCOMB_X39_Y19_N26
\Add30~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~56_combout\ = (bg_hstart(29) & (\Add30~55\ $ (GND))) # (!bg_hstart(29) & (!\Add30~55\ & VCC))
-- \Add30~57\ = CARRY((bg_hstart(29) & !\Add30~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(29),
	datad => VCC,
	cin => \Add30~55\,
	combout => \Add30~56_combout\,
	cout => \Add30~57\);

-- Location: LCCOMB_X39_Y19_N28
\Add30~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~58_combout\ = (bg_hstart(30) & (!\Add30~57\)) # (!bg_hstart(30) & ((\Add30~57\) # (GND)))
-- \Add30~59\ = CARRY((!\Add30~57\) # (!bg_hstart(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(30),
	datad => VCC,
	cin => \Add30~57\,
	combout => \Add30~58_combout\,
	cout => \Add30~59\);

-- Location: LCCOMB_X39_Y19_N30
\Add30~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add30~60_combout\ = !\Add30~59\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add30~59\,
	combout => \Add30~60_combout\);

-- Location: LCCOMB_X38_Y20_N0
\LessThan27~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~1_cout\ = CARRY((!hposition(0) & bg_hstart(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => bg_hstart(0),
	datad => VCC,
	cout => \LessThan27~1_cout\);

-- Location: LCCOMB_X38_Y20_N2
\LessThan27~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~3_cout\ = CARRY((hposition(1) & ((bg_hstart(1)) # (!\LessThan27~1_cout\))) # (!hposition(1) & (bg_hstart(1) & !\LessThan27~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => bg_hstart(1),
	datad => VCC,
	cin => \LessThan27~1_cout\,
	cout => \LessThan27~3_cout\);

-- Location: LCCOMB_X38_Y20_N4
\LessThan27~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~5_cout\ = CARRY((\Add30~2_combout\ & ((!\LessThan27~3_cout\) # (!hposition(2)))) # (!\Add30~2_combout\ & (!hposition(2) & !\LessThan27~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~2_combout\,
	datab => hposition(2),
	datad => VCC,
	cin => \LessThan27~3_cout\,
	cout => \LessThan27~5_cout\);

-- Location: LCCOMB_X38_Y20_N6
\LessThan27~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~7_cout\ = CARRY((\Add30~4_combout\ & (hposition(3) & !\LessThan27~5_cout\)) # (!\Add30~4_combout\ & ((hposition(3)) # (!\LessThan27~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~4_combout\,
	datab => hposition(3),
	datad => VCC,
	cin => \LessThan27~5_cout\,
	cout => \LessThan27~7_cout\);

-- Location: LCCOMB_X38_Y20_N8
\LessThan27~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~9_cout\ = CARRY((\Add30~6_combout\ & ((!\LessThan27~7_cout\) # (!hposition(4)))) # (!\Add30~6_combout\ & (!hposition(4) & !\LessThan27~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~6_combout\,
	datab => hposition(4),
	datad => VCC,
	cin => \LessThan27~7_cout\,
	cout => \LessThan27~9_cout\);

-- Location: LCCOMB_X38_Y20_N10
\LessThan27~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~11_cout\ = CARRY((hposition(5) & ((!\LessThan27~9_cout\) # (!\Add30~8_combout\))) # (!hposition(5) & (!\Add30~8_combout\ & !\LessThan27~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datab => \Add30~8_combout\,
	datad => VCC,
	cin => \LessThan27~9_cout\,
	cout => \LessThan27~11_cout\);

-- Location: LCCOMB_X38_Y20_N12
\LessThan27~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~13_cout\ = CARRY((hposition(6) & (\Add30~10_combout\ & !\LessThan27~11_cout\)) # (!hposition(6) & ((\Add30~10_combout\) # (!\LessThan27~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datab => \Add30~10_combout\,
	datad => VCC,
	cin => \LessThan27~11_cout\,
	cout => \LessThan27~13_cout\);

-- Location: LCCOMB_X38_Y20_N14
\LessThan27~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~15_cout\ = CARRY((hposition(7) & ((!\LessThan27~13_cout\) # (!\Add30~12_combout\))) # (!hposition(7) & (!\Add30~12_combout\ & !\LessThan27~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(7),
	datab => \Add30~12_combout\,
	datad => VCC,
	cin => \LessThan27~13_cout\,
	cout => \LessThan27~15_cout\);

-- Location: LCCOMB_X38_Y20_N16
\LessThan27~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~17_cout\ = CARRY((\Add30~14_combout\ & ((!\LessThan27~15_cout\) # (!hposition(8)))) # (!\Add30~14_combout\ & (!hposition(8) & !\LessThan27~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~14_combout\,
	datab => hposition(8),
	datad => VCC,
	cin => \LessThan27~15_cout\,
	cout => \LessThan27~17_cout\);

-- Location: LCCOMB_X38_Y20_N18
\LessThan27~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~19_cout\ = CARRY((hposition(9) & ((!\LessThan27~17_cout\) # (!\Add30~16_combout\))) # (!hposition(9) & (!\Add30~16_combout\ & !\LessThan27~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => \Add30~16_combout\,
	datad => VCC,
	cin => \LessThan27~17_cout\,
	cout => \LessThan27~19_cout\);

-- Location: LCCOMB_X38_Y20_N20
\LessThan27~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~21_cout\ = CARRY((hposition(10) & (\Add30~18_combout\ & !\LessThan27~19_cout\)) # (!hposition(10) & ((\Add30~18_combout\) # (!\LessThan27~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \Add30~18_combout\,
	datad => VCC,
	cin => \LessThan27~19_cout\,
	cout => \LessThan27~21_cout\);

-- Location: LCCOMB_X38_Y20_N22
\LessThan27~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~23_cout\ = CARRY((hposition(11) & ((!\LessThan27~21_cout\) # (!\Add30~20_combout\))) # (!hposition(11) & (!\Add30~20_combout\ & !\LessThan27~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \Add30~20_combout\,
	datad => VCC,
	cin => \LessThan27~21_cout\,
	cout => \LessThan27~23_cout\);

-- Location: LCCOMB_X38_Y20_N24
\LessThan27~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~25_cout\ = CARRY((hposition(12) & (\Add30~22_combout\ & !\LessThan27~23_cout\)) # (!hposition(12) & ((\Add30~22_combout\) # (!\LessThan27~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \Add30~22_combout\,
	datad => VCC,
	cin => \LessThan27~23_cout\,
	cout => \LessThan27~25_cout\);

-- Location: LCCOMB_X38_Y20_N26
\LessThan27~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~27_cout\ = CARRY((\Add30~24_combout\ & (hposition(13) & !\LessThan27~25_cout\)) # (!\Add30~24_combout\ & ((hposition(13)) # (!\LessThan27~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~24_combout\,
	datab => hposition(13),
	datad => VCC,
	cin => \LessThan27~25_cout\,
	cout => \LessThan27~27_cout\);

-- Location: LCCOMB_X38_Y20_N28
\LessThan27~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~29_cout\ = CARRY((hposition(14) & (\Add30~26_combout\ & !\LessThan27~27_cout\)) # (!hposition(14) & ((\Add30~26_combout\) # (!\LessThan27~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datab => \Add30~26_combout\,
	datad => VCC,
	cin => \LessThan27~27_cout\,
	cout => \LessThan27~29_cout\);

-- Location: LCCOMB_X38_Y20_N30
\LessThan27~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~31_cout\ = CARRY((\Add30~28_combout\ & (hposition(15) & !\LessThan27~29_cout\)) # (!\Add30~28_combout\ & ((hposition(15)) # (!\LessThan27~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~28_combout\,
	datab => hposition(15),
	datad => VCC,
	cin => \LessThan27~29_cout\,
	cout => \LessThan27~31_cout\);

-- Location: LCCOMB_X38_Y19_N0
\LessThan27~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~33_cout\ = CARRY((hposition(16) & (\Add30~30_combout\ & !\LessThan27~31_cout\)) # (!hposition(16) & ((\Add30~30_combout\) # (!\LessThan27~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(16),
	datab => \Add30~30_combout\,
	datad => VCC,
	cin => \LessThan27~31_cout\,
	cout => \LessThan27~33_cout\);

-- Location: LCCOMB_X38_Y19_N2
\LessThan27~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~35_cout\ = CARRY((\Add30~32_combout\ & (hposition(17) & !\LessThan27~33_cout\)) # (!\Add30~32_combout\ & ((hposition(17)) # (!\LessThan27~33_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~32_combout\,
	datab => hposition(17),
	datad => VCC,
	cin => \LessThan27~33_cout\,
	cout => \LessThan27~35_cout\);

-- Location: LCCOMB_X38_Y19_N4
\LessThan27~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~37_cout\ = CARRY((\Add30~34_combout\ & ((!\LessThan27~35_cout\) # (!hposition(18)))) # (!\Add30~34_combout\ & (!hposition(18) & !\LessThan27~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~34_combout\,
	datab => hposition(18),
	datad => VCC,
	cin => \LessThan27~35_cout\,
	cout => \LessThan27~37_cout\);

-- Location: LCCOMB_X38_Y19_N6
\LessThan27~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~39_cout\ = CARRY((\Add30~36_combout\ & (hposition(19) & !\LessThan27~37_cout\)) # (!\Add30~36_combout\ & ((hposition(19)) # (!\LessThan27~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~36_combout\,
	datab => hposition(19),
	datad => VCC,
	cin => \LessThan27~37_cout\,
	cout => \LessThan27~39_cout\);

-- Location: LCCOMB_X38_Y19_N8
\LessThan27~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~41_cout\ = CARRY((hposition(20) & (\Add30~38_combout\ & !\LessThan27~39_cout\)) # (!hposition(20) & ((\Add30~38_combout\) # (!\LessThan27~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \Add30~38_combout\,
	datad => VCC,
	cin => \LessThan27~39_cout\,
	cout => \LessThan27~41_cout\);

-- Location: LCCOMB_X38_Y19_N10
\LessThan27~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~43_cout\ = CARRY((hposition(21) & ((!\LessThan27~41_cout\) # (!\Add30~40_combout\))) # (!hposition(21) & (!\Add30~40_combout\ & !\LessThan27~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => \Add30~40_combout\,
	datad => VCC,
	cin => \LessThan27~41_cout\,
	cout => \LessThan27~43_cout\);

-- Location: LCCOMB_X38_Y19_N12
\LessThan27~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~45_cout\ = CARRY((hposition(22) & (\Add30~42_combout\ & !\LessThan27~43_cout\)) # (!hposition(22) & ((\Add30~42_combout\) # (!\LessThan27~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(22),
	datab => \Add30~42_combout\,
	datad => VCC,
	cin => \LessThan27~43_cout\,
	cout => \LessThan27~45_cout\);

-- Location: LCCOMB_X38_Y19_N14
\LessThan27~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~47_cout\ = CARRY((hposition(23) & ((!\LessThan27~45_cout\) # (!\Add30~44_combout\))) # (!hposition(23) & (!\Add30~44_combout\ & !\LessThan27~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \Add30~44_combout\,
	datad => VCC,
	cin => \LessThan27~45_cout\,
	cout => \LessThan27~47_cout\);

-- Location: LCCOMB_X38_Y19_N16
\LessThan27~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~49_cout\ = CARRY((hposition(24) & (\Add30~46_combout\ & !\LessThan27~47_cout\)) # (!hposition(24) & ((\Add30~46_combout\) # (!\LessThan27~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \Add30~46_combout\,
	datad => VCC,
	cin => \LessThan27~47_cout\,
	cout => \LessThan27~49_cout\);

-- Location: LCCOMB_X38_Y19_N18
\LessThan27~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~51_cout\ = CARRY((hposition(25) & ((!\LessThan27~49_cout\) # (!\Add30~48_combout\))) # (!hposition(25) & (!\Add30~48_combout\ & !\LessThan27~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(25),
	datab => \Add30~48_combout\,
	datad => VCC,
	cin => \LessThan27~49_cout\,
	cout => \LessThan27~51_cout\);

-- Location: LCCOMB_X38_Y19_N20
\LessThan27~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~53_cout\ = CARRY((hposition(26) & (\Add30~50_combout\ & !\LessThan27~51_cout\)) # (!hposition(26) & ((\Add30~50_combout\) # (!\LessThan27~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(26),
	datab => \Add30~50_combout\,
	datad => VCC,
	cin => \LessThan27~51_cout\,
	cout => \LessThan27~53_cout\);

-- Location: LCCOMB_X38_Y19_N22
\LessThan27~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~55_cout\ = CARRY((hposition(27) & ((!\LessThan27~53_cout\) # (!\Add30~52_combout\))) # (!hposition(27) & (!\Add30~52_combout\ & !\LessThan27~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => \Add30~52_combout\,
	datad => VCC,
	cin => \LessThan27~53_cout\,
	cout => \LessThan27~55_cout\);

-- Location: LCCOMB_X38_Y19_N24
\LessThan27~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~57_cout\ = CARRY((hposition(28) & (\Add30~54_combout\ & !\LessThan27~55_cout\)) # (!hposition(28) & ((\Add30~54_combout\) # (!\LessThan27~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => \Add30~54_combout\,
	datad => VCC,
	cin => \LessThan27~55_cout\,
	cout => \LessThan27~57_cout\);

-- Location: LCCOMB_X38_Y19_N26
\LessThan27~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~59_cout\ = CARRY((\Add30~56_combout\ & (hposition(29) & !\LessThan27~57_cout\)) # (!\Add30~56_combout\ & ((hposition(29)) # (!\LessThan27~57_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~56_combout\,
	datab => hposition(29),
	datad => VCC,
	cin => \LessThan27~57_cout\,
	cout => \LessThan27~59_cout\);

-- Location: LCCOMB_X38_Y19_N28
\LessThan27~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~61_cout\ = CARRY((hposition(30) & (\Add30~58_combout\ & !\LessThan27~59_cout\)) # (!hposition(30) & ((\Add30~58_combout\) # (!\LessThan27~59_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(30),
	datab => \Add30~58_combout\,
	datad => VCC,
	cin => \LessThan27~59_cout\,
	cout => \LessThan27~61_cout\);

-- Location: LCCOMB_X38_Y19_N30
\LessThan27~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan27~62_combout\ = (\Add30~60_combout\ & (hposition(31) & \LessThan27~61_cout\)) # (!\Add30~60_combout\ & ((hposition(31)) # (\LessThan27~61_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add30~60_combout\,
	datab => hposition(31),
	cin => \LessThan27~61_cout\,
	combout => \LessThan27~62_combout\);

-- Location: LCCOMB_X42_Y23_N4
\Add31~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~0_combout\ = (bg_hstart(3) & (bg_hstart(4) $ (VCC))) # (!bg_hstart(3) & (bg_hstart(4) & VCC))
-- \Add31~1\ = CARRY((bg_hstart(3) & bg_hstart(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(3),
	datab => bg_hstart(4),
	datad => VCC,
	combout => \Add31~0_combout\,
	cout => \Add31~1\);

-- Location: LCCOMB_X42_Y23_N6
\Add31~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~2_combout\ = (bg_hstart(5) & (!\Add31~1\)) # (!bg_hstart(5) & ((\Add31~1\) # (GND)))
-- \Add31~3\ = CARRY((!\Add31~1\) # (!bg_hstart(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(5),
	datad => VCC,
	cin => \Add31~1\,
	combout => \Add31~2_combout\,
	cout => \Add31~3\);

-- Location: LCCOMB_X42_Y23_N8
\Add31~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~4_combout\ = (bg_hstart(6) & ((GND) # (!\Add31~3\))) # (!bg_hstart(6) & (\Add31~3\ $ (GND)))
-- \Add31~5\ = CARRY((bg_hstart(6)) # (!\Add31~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(6),
	datad => VCC,
	cin => \Add31~3\,
	combout => \Add31~4_combout\,
	cout => \Add31~5\);

-- Location: LCCOMB_X42_Y23_N10
\Add31~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~6_combout\ = (bg_hstart(7) & (!\Add31~5\)) # (!bg_hstart(7) & ((\Add31~5\) # (GND)))
-- \Add31~7\ = CARRY((!\Add31~5\) # (!bg_hstart(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(7),
	datad => VCC,
	cin => \Add31~5\,
	combout => \Add31~6_combout\,
	cout => \Add31~7\);

-- Location: LCCOMB_X42_Y23_N12
\Add31~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~8_combout\ = (bg_hstart(8) & ((GND) # (!\Add31~7\))) # (!bg_hstart(8) & (\Add31~7\ $ (GND)))
-- \Add31~9\ = CARRY((bg_hstart(8)) # (!\Add31~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(8),
	datad => VCC,
	cin => \Add31~7\,
	combout => \Add31~8_combout\,
	cout => \Add31~9\);

-- Location: LCCOMB_X42_Y23_N14
\Add31~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~10_combout\ = (bg_hstart(9) & (\Add31~9\ & VCC)) # (!bg_hstart(9) & (!\Add31~9\))
-- \Add31~11\ = CARRY((!bg_hstart(9) & !\Add31~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(9),
	datad => VCC,
	cin => \Add31~9\,
	combout => \Add31~10_combout\,
	cout => \Add31~11\);

-- Location: LCCOMB_X42_Y23_N16
\Add31~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~12_combout\ = (bg_hstart(10) & (\Add31~11\ $ (GND))) # (!bg_hstart(10) & (!\Add31~11\ & VCC))
-- \Add31~13\ = CARRY((bg_hstart(10) & !\Add31~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(10),
	datad => VCC,
	cin => \Add31~11\,
	combout => \Add31~12_combout\,
	cout => \Add31~13\);

-- Location: LCCOMB_X42_Y23_N18
\Add31~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~14_combout\ = (bg_hstart(11) & (!\Add31~13\)) # (!bg_hstart(11) & ((\Add31~13\) # (GND)))
-- \Add31~15\ = CARRY((!\Add31~13\) # (!bg_hstart(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datad => VCC,
	cin => \Add31~13\,
	combout => \Add31~14_combout\,
	cout => \Add31~15\);

-- Location: LCCOMB_X42_Y23_N20
\Add31~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~16_combout\ = (bg_hstart(12) & (\Add31~15\ $ (GND))) # (!bg_hstart(12) & (!\Add31~15\ & VCC))
-- \Add31~17\ = CARRY((bg_hstart(12) & !\Add31~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(12),
	datad => VCC,
	cin => \Add31~15\,
	combout => \Add31~16_combout\,
	cout => \Add31~17\);

-- Location: LCCOMB_X42_Y23_N22
\Add31~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~18_combout\ = (bg_hstart(13) & (!\Add31~17\)) # (!bg_hstart(13) & ((\Add31~17\) # (GND)))
-- \Add31~19\ = CARRY((!\Add31~17\) # (!bg_hstart(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(13),
	datad => VCC,
	cin => \Add31~17\,
	combout => \Add31~18_combout\,
	cout => \Add31~19\);

-- Location: LCCOMB_X42_Y23_N24
\Add31~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~20_combout\ = (bg_hstart(14) & (\Add31~19\ $ (GND))) # (!bg_hstart(14) & (!\Add31~19\ & VCC))
-- \Add31~21\ = CARRY((bg_hstart(14) & !\Add31~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(14),
	datad => VCC,
	cin => \Add31~19\,
	combout => \Add31~20_combout\,
	cout => \Add31~21\);

-- Location: LCCOMB_X42_Y23_N26
\Add31~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~22_combout\ = (bg_hstart(15) & (!\Add31~21\)) # (!bg_hstart(15) & ((\Add31~21\) # (GND)))
-- \Add31~23\ = CARRY((!\Add31~21\) # (!bg_hstart(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(15),
	datad => VCC,
	cin => \Add31~21\,
	combout => \Add31~22_combout\,
	cout => \Add31~23\);

-- Location: LCCOMB_X42_Y23_N28
\Add31~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~24_combout\ = (bg_hstart(16) & (\Add31~23\ $ (GND))) # (!bg_hstart(16) & (!\Add31~23\ & VCC))
-- \Add31~25\ = CARRY((bg_hstart(16) & !\Add31~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(16),
	datad => VCC,
	cin => \Add31~23\,
	combout => \Add31~24_combout\,
	cout => \Add31~25\);

-- Location: LCCOMB_X42_Y23_N30
\Add31~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~26_combout\ = (bg_hstart(17) & (!\Add31~25\)) # (!bg_hstart(17) & ((\Add31~25\) # (GND)))
-- \Add31~27\ = CARRY((!\Add31~25\) # (!bg_hstart(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(17),
	datad => VCC,
	cin => \Add31~25\,
	combout => \Add31~26_combout\,
	cout => \Add31~27\);

-- Location: LCCOMB_X42_Y22_N0
\Add31~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~28_combout\ = (bg_hstart(18) & (\Add31~27\ $ (GND))) # (!bg_hstart(18) & (!\Add31~27\ & VCC))
-- \Add31~29\ = CARRY((bg_hstart(18) & !\Add31~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(18),
	datad => VCC,
	cin => \Add31~27\,
	combout => \Add31~28_combout\,
	cout => \Add31~29\);

-- Location: LCCOMB_X42_Y22_N2
\Add31~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~30_combout\ = (bg_hstart(19) & (!\Add31~29\)) # (!bg_hstart(19) & ((\Add31~29\) # (GND)))
-- \Add31~31\ = CARRY((!\Add31~29\) # (!bg_hstart(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(19),
	datad => VCC,
	cin => \Add31~29\,
	combout => \Add31~30_combout\,
	cout => \Add31~31\);

-- Location: LCCOMB_X42_Y22_N4
\Add31~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~32_combout\ = (bg_hstart(20) & (\Add31~31\ $ (GND))) # (!bg_hstart(20) & (!\Add31~31\ & VCC))
-- \Add31~33\ = CARRY((bg_hstart(20) & !\Add31~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(20),
	datad => VCC,
	cin => \Add31~31\,
	combout => \Add31~32_combout\,
	cout => \Add31~33\);

-- Location: LCCOMB_X42_Y22_N6
\Add31~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~34_combout\ = (bg_hstart(21) & (!\Add31~33\)) # (!bg_hstart(21) & ((\Add31~33\) # (GND)))
-- \Add31~35\ = CARRY((!\Add31~33\) # (!bg_hstart(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(21),
	datad => VCC,
	cin => \Add31~33\,
	combout => \Add31~34_combout\,
	cout => \Add31~35\);

-- Location: LCCOMB_X42_Y22_N8
\Add31~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~36_combout\ = (bg_hstart(22) & (\Add31~35\ $ (GND))) # (!bg_hstart(22) & (!\Add31~35\ & VCC))
-- \Add31~37\ = CARRY((bg_hstart(22) & !\Add31~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(22),
	datad => VCC,
	cin => \Add31~35\,
	combout => \Add31~36_combout\,
	cout => \Add31~37\);

-- Location: LCCOMB_X42_Y22_N10
\Add31~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~38_combout\ = (bg_hstart(23) & (!\Add31~37\)) # (!bg_hstart(23) & ((\Add31~37\) # (GND)))
-- \Add31~39\ = CARRY((!\Add31~37\) # (!bg_hstart(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(23),
	datad => VCC,
	cin => \Add31~37\,
	combout => \Add31~38_combout\,
	cout => \Add31~39\);

-- Location: LCCOMB_X42_Y22_N12
\Add31~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~40_combout\ = (bg_hstart(24) & (\Add31~39\ $ (GND))) # (!bg_hstart(24) & (!\Add31~39\ & VCC))
-- \Add31~41\ = CARRY((bg_hstart(24) & !\Add31~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(24),
	datad => VCC,
	cin => \Add31~39\,
	combout => \Add31~40_combout\,
	cout => \Add31~41\);

-- Location: LCCOMB_X42_Y22_N14
\Add31~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~42_combout\ = (bg_hstart(25) & (!\Add31~41\)) # (!bg_hstart(25) & ((\Add31~41\) # (GND)))
-- \Add31~43\ = CARRY((!\Add31~41\) # (!bg_hstart(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(25),
	datad => VCC,
	cin => \Add31~41\,
	combout => \Add31~42_combout\,
	cout => \Add31~43\);

-- Location: LCCOMB_X42_Y22_N16
\Add31~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~44_combout\ = (bg_hstart(26) & (\Add31~43\ $ (GND))) # (!bg_hstart(26) & (!\Add31~43\ & VCC))
-- \Add31~45\ = CARRY((bg_hstart(26) & !\Add31~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(26),
	datad => VCC,
	cin => \Add31~43\,
	combout => \Add31~44_combout\,
	cout => \Add31~45\);

-- Location: LCCOMB_X42_Y22_N18
\Add31~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~46_combout\ = (bg_hstart(27) & (!\Add31~45\)) # (!bg_hstart(27) & ((\Add31~45\) # (GND)))
-- \Add31~47\ = CARRY((!\Add31~45\) # (!bg_hstart(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(27),
	datad => VCC,
	cin => \Add31~45\,
	combout => \Add31~46_combout\,
	cout => \Add31~47\);

-- Location: LCCOMB_X42_Y22_N20
\Add31~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~48_combout\ = (bg_hstart(28) & (\Add31~47\ $ (GND))) # (!bg_hstart(28) & (!\Add31~47\ & VCC))
-- \Add31~49\ = CARRY((bg_hstart(28) & !\Add31~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(28),
	datad => VCC,
	cin => \Add31~47\,
	combout => \Add31~48_combout\,
	cout => \Add31~49\);

-- Location: LCCOMB_X42_Y22_N22
\Add31~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~50_combout\ = (bg_hstart(29) & (!\Add31~49\)) # (!bg_hstart(29) & ((\Add31~49\) # (GND)))
-- \Add31~51\ = CARRY((!\Add31~49\) # (!bg_hstart(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(29),
	datad => VCC,
	cin => \Add31~49\,
	combout => \Add31~50_combout\,
	cout => \Add31~51\);

-- Location: LCCOMB_X42_Y22_N24
\Add31~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~52_combout\ = (bg_hstart(30) & (\Add31~51\ $ (GND))) # (!bg_hstart(30) & (!\Add31~51\ & VCC))
-- \Add31~53\ = CARRY((bg_hstart(30) & !\Add31~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(30),
	datad => VCC,
	cin => \Add31~51\,
	combout => \Add31~52_combout\,
	cout => \Add31~53\);

-- Location: LCCOMB_X42_Y22_N26
\Add31~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add31~54_combout\ = \Add31~53\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add31~53\,
	combout => \Add31~54_combout\);

-- Location: LCCOMB_X43_Y23_N0
\LessThan28~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~1_cout\ = CARRY((hposition(0) & !bg_hstart(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(0),
	datab => bg_hstart(0),
	datad => VCC,
	cout => \LessThan28~1_cout\);

-- Location: LCCOMB_X43_Y23_N2
\LessThan28~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~3_cout\ = CARRY((bg_hstart(1) & ((!\LessThan28~1_cout\) # (!hposition(1)))) # (!bg_hstart(1) & (!hposition(1) & !\LessThan28~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(1),
	datab => hposition(1),
	datad => VCC,
	cin => \LessThan28~1_cout\,
	cout => \LessThan28~3_cout\);

-- Location: LCCOMB_X43_Y23_N4
\LessThan28~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~5_cout\ = CARRY((hposition(2) & ((!\LessThan28~3_cout\) # (!bg_hstart(2)))) # (!hposition(2) & (!bg_hstart(2) & !\LessThan28~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => bg_hstart(2),
	datad => VCC,
	cin => \LessThan28~3_cout\,
	cout => \LessThan28~5_cout\);

-- Location: LCCOMB_X43_Y23_N6
\LessThan28~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~7_cout\ = CARRY((hposition(3) & (!bg_hstart(3) & !\LessThan28~5_cout\)) # (!hposition(3) & ((!\LessThan28~5_cout\) # (!bg_hstart(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => bg_hstart(3),
	datad => VCC,
	cin => \LessThan28~5_cout\,
	cout => \LessThan28~7_cout\);

-- Location: LCCOMB_X43_Y23_N8
\LessThan28~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~9_cout\ = CARRY((\Add31~0_combout\ & (hposition(4) & !\LessThan28~7_cout\)) # (!\Add31~0_combout\ & ((hposition(4)) # (!\LessThan28~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~0_combout\,
	datab => hposition(4),
	datad => VCC,
	cin => \LessThan28~7_cout\,
	cout => \LessThan28~9_cout\);

-- Location: LCCOMB_X43_Y23_N10
\LessThan28~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~11_cout\ = CARRY((hposition(5) & (\Add31~2_combout\ & !\LessThan28~9_cout\)) # (!hposition(5) & ((\Add31~2_combout\) # (!\LessThan28~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(5),
	datab => \Add31~2_combout\,
	datad => VCC,
	cin => \LessThan28~9_cout\,
	cout => \LessThan28~11_cout\);

-- Location: LCCOMB_X43_Y23_N12
\LessThan28~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~13_cout\ = CARRY((\Add31~4_combout\ & (hposition(6) & !\LessThan28~11_cout\)) # (!\Add31~4_combout\ & ((hposition(6)) # (!\LessThan28~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~4_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan28~11_cout\,
	cout => \LessThan28~13_cout\);

-- Location: LCCOMB_X43_Y23_N14
\LessThan28~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~15_cout\ = CARRY((\Add31~6_combout\ & ((!\LessThan28~13_cout\) # (!hposition(7)))) # (!\Add31~6_combout\ & (!hposition(7) & !\LessThan28~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~6_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan28~13_cout\,
	cout => \LessThan28~15_cout\);

-- Location: LCCOMB_X43_Y23_N16
\LessThan28~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~17_cout\ = CARRY((\Add31~8_combout\ & (hposition(8) & !\LessThan28~15_cout\)) # (!\Add31~8_combout\ & ((hposition(8)) # (!\LessThan28~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~8_combout\,
	datab => hposition(8),
	datad => VCC,
	cin => \LessThan28~15_cout\,
	cout => \LessThan28~17_cout\);

-- Location: LCCOMB_X43_Y23_N18
\LessThan28~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~19_cout\ = CARRY((\Add31~10_combout\ & ((!\LessThan28~17_cout\) # (!hposition(9)))) # (!\Add31~10_combout\ & (!hposition(9) & !\LessThan28~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~10_combout\,
	datab => hposition(9),
	datad => VCC,
	cin => \LessThan28~17_cout\,
	cout => \LessThan28~19_cout\);

-- Location: LCCOMB_X43_Y23_N20
\LessThan28~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~21_cout\ = CARRY((\Add31~12_combout\ & (hposition(10) & !\LessThan28~19_cout\)) # (!\Add31~12_combout\ & ((hposition(10)) # (!\LessThan28~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~12_combout\,
	datab => hposition(10),
	datad => VCC,
	cin => \LessThan28~19_cout\,
	cout => \LessThan28~21_cout\);

-- Location: LCCOMB_X43_Y23_N22
\LessThan28~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~23_cout\ = CARRY((hposition(11) & (\Add31~14_combout\ & !\LessThan28~21_cout\)) # (!hposition(11) & ((\Add31~14_combout\) # (!\LessThan28~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \Add31~14_combout\,
	datad => VCC,
	cin => \LessThan28~21_cout\,
	cout => \LessThan28~23_cout\);

-- Location: LCCOMB_X43_Y23_N24
\LessThan28~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~25_cout\ = CARRY((hposition(12) & ((!\LessThan28~23_cout\) # (!\Add31~16_combout\))) # (!hposition(12) & (!\Add31~16_combout\ & !\LessThan28~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \Add31~16_combout\,
	datad => VCC,
	cin => \LessThan28~23_cout\,
	cout => \LessThan28~25_cout\);

-- Location: LCCOMB_X43_Y23_N26
\LessThan28~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~27_cout\ = CARRY((hposition(13) & (\Add31~18_combout\ & !\LessThan28~25_cout\)) # (!hposition(13) & ((\Add31~18_combout\) # (!\LessThan28~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \Add31~18_combout\,
	datad => VCC,
	cin => \LessThan28~25_cout\,
	cout => \LessThan28~27_cout\);

-- Location: LCCOMB_X43_Y23_N28
\LessThan28~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~29_cout\ = CARRY((hposition(14) & ((!\LessThan28~27_cout\) # (!\Add31~20_combout\))) # (!hposition(14) & (!\Add31~20_combout\ & !\LessThan28~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(14),
	datab => \Add31~20_combout\,
	datad => VCC,
	cin => \LessThan28~27_cout\,
	cout => \LessThan28~29_cout\);

-- Location: LCCOMB_X43_Y23_N30
\LessThan28~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~31_cout\ = CARRY((\Add31~22_combout\ & ((!\LessThan28~29_cout\) # (!hposition(15)))) # (!\Add31~22_combout\ & (!hposition(15) & !\LessThan28~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~22_combout\,
	datab => hposition(15),
	datad => VCC,
	cin => \LessThan28~29_cout\,
	cout => \LessThan28~31_cout\);

-- Location: LCCOMB_X43_Y22_N0
\LessThan28~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~33_cout\ = CARRY((hposition(16) & ((!\LessThan28~31_cout\) # (!\Add31~24_combout\))) # (!hposition(16) & (!\Add31~24_combout\ & !\LessThan28~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(16),
	datab => \Add31~24_combout\,
	datad => VCC,
	cin => \LessThan28~31_cout\,
	cout => \LessThan28~33_cout\);

-- Location: LCCOMB_X43_Y22_N2
\LessThan28~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~35_cout\ = CARRY((hposition(17) & (\Add31~26_combout\ & !\LessThan28~33_cout\)) # (!hposition(17) & ((\Add31~26_combout\) # (!\LessThan28~33_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => \Add31~26_combout\,
	datad => VCC,
	cin => \LessThan28~33_cout\,
	cout => \LessThan28~35_cout\);

-- Location: LCCOMB_X43_Y22_N4
\LessThan28~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~37_cout\ = CARRY((\Add31~28_combout\ & (hposition(18) & !\LessThan28~35_cout\)) # (!\Add31~28_combout\ & ((hposition(18)) # (!\LessThan28~35_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~28_combout\,
	datab => hposition(18),
	datad => VCC,
	cin => \LessThan28~35_cout\,
	cout => \LessThan28~37_cout\);

-- Location: LCCOMB_X43_Y22_N6
\LessThan28~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~39_cout\ = CARRY((\Add31~30_combout\ & ((!\LessThan28~37_cout\) # (!hposition(19)))) # (!\Add31~30_combout\ & (!hposition(19) & !\LessThan28~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~30_combout\,
	datab => hposition(19),
	datad => VCC,
	cin => \LessThan28~37_cout\,
	cout => \LessThan28~39_cout\);

-- Location: LCCOMB_X43_Y22_N8
\LessThan28~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~41_cout\ = CARRY((hposition(20) & ((!\LessThan28~39_cout\) # (!\Add31~32_combout\))) # (!hposition(20) & (!\Add31~32_combout\ & !\LessThan28~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \Add31~32_combout\,
	datad => VCC,
	cin => \LessThan28~39_cout\,
	cout => \LessThan28~41_cout\);

-- Location: LCCOMB_X43_Y22_N10
\LessThan28~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~43_cout\ = CARRY((hposition(21) & (\Add31~34_combout\ & !\LessThan28~41_cout\)) # (!hposition(21) & ((\Add31~34_combout\) # (!\LessThan28~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(21),
	datab => \Add31~34_combout\,
	datad => VCC,
	cin => \LessThan28~41_cout\,
	cout => \LessThan28~43_cout\);

-- Location: LCCOMB_X43_Y22_N12
\LessThan28~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~45_cout\ = CARRY((\Add31~36_combout\ & (hposition(22) & !\LessThan28~43_cout\)) # (!\Add31~36_combout\ & ((hposition(22)) # (!\LessThan28~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~36_combout\,
	datab => hposition(22),
	datad => VCC,
	cin => \LessThan28~43_cout\,
	cout => \LessThan28~45_cout\);

-- Location: LCCOMB_X43_Y22_N14
\LessThan28~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~47_cout\ = CARRY((hposition(23) & (\Add31~38_combout\ & !\LessThan28~45_cout\)) # (!hposition(23) & ((\Add31~38_combout\) # (!\LessThan28~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \Add31~38_combout\,
	datad => VCC,
	cin => \LessThan28~45_cout\,
	cout => \LessThan28~47_cout\);

-- Location: LCCOMB_X43_Y22_N16
\LessThan28~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~49_cout\ = CARRY((\Add31~40_combout\ & (hposition(24) & !\LessThan28~47_cout\)) # (!\Add31~40_combout\ & ((hposition(24)) # (!\LessThan28~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~40_combout\,
	datab => hposition(24),
	datad => VCC,
	cin => \LessThan28~47_cout\,
	cout => \LessThan28~49_cout\);

-- Location: LCCOMB_X43_Y22_N18
\LessThan28~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~51_cout\ = CARRY((\Add31~42_combout\ & ((!\LessThan28~49_cout\) # (!hposition(25)))) # (!\Add31~42_combout\ & (!hposition(25) & !\LessThan28~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~42_combout\,
	datab => hposition(25),
	datad => VCC,
	cin => \LessThan28~49_cout\,
	cout => \LessThan28~51_cout\);

-- Location: LCCOMB_X43_Y22_N20
\LessThan28~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~53_cout\ = CARRY((\Add31~44_combout\ & (hposition(26) & !\LessThan28~51_cout\)) # (!\Add31~44_combout\ & ((hposition(26)) # (!\LessThan28~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~44_combout\,
	datab => hposition(26),
	datad => VCC,
	cin => \LessThan28~51_cout\,
	cout => \LessThan28~53_cout\);

-- Location: LCCOMB_X43_Y22_N22
\LessThan28~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~55_cout\ = CARRY((hposition(27) & (\Add31~46_combout\ & !\LessThan28~53_cout\)) # (!hposition(27) & ((\Add31~46_combout\) # (!\LessThan28~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => \Add31~46_combout\,
	datad => VCC,
	cin => \LessThan28~53_cout\,
	cout => \LessThan28~55_cout\);

-- Location: LCCOMB_X43_Y22_N24
\LessThan28~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~57_cout\ = CARRY((\Add31~48_combout\ & (hposition(28) & !\LessThan28~55_cout\)) # (!\Add31~48_combout\ & ((hposition(28)) # (!\LessThan28~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~48_combout\,
	datab => hposition(28),
	datad => VCC,
	cin => \LessThan28~55_cout\,
	cout => \LessThan28~57_cout\);

-- Location: LCCOMB_X43_Y22_N26
\LessThan28~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~59_cout\ = CARRY((hposition(29) & (\Add31~50_combout\ & !\LessThan28~57_cout\)) # (!hposition(29) & ((\Add31~50_combout\) # (!\LessThan28~57_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(29),
	datab => \Add31~50_combout\,
	datad => VCC,
	cin => \LessThan28~57_cout\,
	cout => \LessThan28~59_cout\);

-- Location: LCCOMB_X43_Y22_N28
\LessThan28~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~61_cout\ = CARRY((hposition(30) & ((!\LessThan28~59_cout\) # (!\Add31~52_combout\))) # (!hposition(30) & (!\Add31~52_combout\ & !\LessThan28~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(30),
	datab => \Add31~52_combout\,
	datad => VCC,
	cin => \LessThan28~59_cout\,
	cout => \LessThan28~61_cout\);

-- Location: LCCOMB_X43_Y22_N30
\LessThan28~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan28~62_combout\ = (\Add31~54_combout\ & ((\LessThan28~61_cout\) # (!hposition(31)))) # (!\Add31~54_combout\ & (\LessThan28~61_cout\ & !hposition(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011111010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add31~54_combout\,
	datad => hposition(31),
	cin => \LessThan28~61_cout\,
	combout => \LessThan28~62_combout\);

-- Location: LCCOMB_X42_Y20_N26
\r[3]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[3]~5_combout\ = (!\LessThan27~62_combout\ & (!\LessThan28~62_combout\ & ((!\LessThan26~1_combout\) # (!\LessThan19~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~6_combout\,
	datab => \LessThan26~1_combout\,
	datac => \LessThan27~62_combout\,
	datad => \LessThan28~62_combout\,
	combout => \r[3]~5_combout\);

-- Location: LCCOMB_X43_Y21_N22
\LessThan23~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~0_combout\ = (!vposition(4) & ((\LessThan19~7_combout\) # (!vposition(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(4),
	datab => \LessThan19~7_combout\,
	datad => vposition(3),
	combout => \LessThan23~0_combout\);

-- Location: LCCOMB_X42_Y20_N24
\LessThan23~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~1_combout\ = ((!vposition(6) & ((\LessThan23~0_combout\) # (!vposition(5))))) # (!vposition(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(7),
	datab => \LessThan23~0_combout\,
	datac => vposition(5),
	datad => vposition(6),
	combout => \LessThan23~1_combout\);

-- Location: LCCOMB_X42_Y20_N2
\LessThan23~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan23~2_combout\ = (\LessThan19~6_combout\ & (((\LessThan23~1_combout\ & !vposition(8))) # (!vposition(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan19~6_combout\,
	datab => \LessThan23~1_combout\,
	datac => vposition(9),
	datad => vposition(8),
	combout => \LessThan23~2_combout\);

-- Location: LCCOMB_X40_Y19_N4
\Add28~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~1_cout\ = CARRY(bg_hstart(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datad => VCC,
	cout => \Add28~1_cout\);

-- Location: LCCOMB_X40_Y19_N6
\Add28~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~2_combout\ = (bg_hstart(5) & (\Add28~1_cout\ & VCC)) # (!bg_hstart(5) & (!\Add28~1_cout\))
-- \Add28~3\ = CARRY((!bg_hstart(5) & !\Add28~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(5),
	datad => VCC,
	cin => \Add28~1_cout\,
	combout => \Add28~2_combout\,
	cout => \Add28~3\);

-- Location: LCCOMB_X40_Y19_N8
\Add28~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~4_combout\ = (bg_hstart(6) & (\Add28~3\ $ (GND))) # (!bg_hstart(6) & (!\Add28~3\ & VCC))
-- \Add28~5\ = CARRY((bg_hstart(6) & !\Add28~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(6),
	datad => VCC,
	cin => \Add28~3\,
	combout => \Add28~4_combout\,
	cout => \Add28~5\);

-- Location: LCCOMB_X40_Y19_N10
\Add28~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~6_combout\ = (bg_hstart(7) & (!\Add28~5\)) # (!bg_hstart(7) & ((\Add28~5\) # (GND)))
-- \Add28~7\ = CARRY((!\Add28~5\) # (!bg_hstart(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(7),
	datad => VCC,
	cin => \Add28~5\,
	combout => \Add28~6_combout\,
	cout => \Add28~7\);

-- Location: LCCOMB_X40_Y19_N12
\Add28~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~8_combout\ = (bg_hstart(8) & (\Add28~7\ $ (GND))) # (!bg_hstart(8) & (!\Add28~7\ & VCC))
-- \Add28~9\ = CARRY((bg_hstart(8) & !\Add28~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(8),
	datad => VCC,
	cin => \Add28~7\,
	combout => \Add28~8_combout\,
	cout => \Add28~9\);

-- Location: LCCOMB_X40_Y19_N14
\Add28~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~10_combout\ = (bg_hstart(9) & (\Add28~9\ & VCC)) # (!bg_hstart(9) & (!\Add28~9\))
-- \Add28~11\ = CARRY((!bg_hstart(9) & !\Add28~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(9),
	datad => VCC,
	cin => \Add28~9\,
	combout => \Add28~10_combout\,
	cout => \Add28~11\);

-- Location: LCCOMB_X40_Y19_N16
\Add28~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~12_combout\ = (bg_hstart(10) & (\Add28~11\ $ (GND))) # (!bg_hstart(10) & (!\Add28~11\ & VCC))
-- \Add28~13\ = CARRY((bg_hstart(10) & !\Add28~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(10),
	datad => VCC,
	cin => \Add28~11\,
	combout => \Add28~12_combout\,
	cout => \Add28~13\);

-- Location: LCCOMB_X40_Y19_N18
\Add28~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~14_combout\ = (bg_hstart(11) & (!\Add28~13\)) # (!bg_hstart(11) & ((\Add28~13\) # (GND)))
-- \Add28~15\ = CARRY((!\Add28~13\) # (!bg_hstart(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(11),
	datad => VCC,
	cin => \Add28~13\,
	combout => \Add28~14_combout\,
	cout => \Add28~15\);

-- Location: LCCOMB_X40_Y19_N20
\Add28~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~16_combout\ = (bg_hstart(12) & (\Add28~15\ $ (GND))) # (!bg_hstart(12) & (!\Add28~15\ & VCC))
-- \Add28~17\ = CARRY((bg_hstart(12) & !\Add28~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(12),
	datad => VCC,
	cin => \Add28~15\,
	combout => \Add28~16_combout\,
	cout => \Add28~17\);

-- Location: LCCOMB_X40_Y19_N22
\Add28~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~18_combout\ = (bg_hstart(13) & (!\Add28~17\)) # (!bg_hstart(13) & ((\Add28~17\) # (GND)))
-- \Add28~19\ = CARRY((!\Add28~17\) # (!bg_hstart(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(13),
	datad => VCC,
	cin => \Add28~17\,
	combout => \Add28~18_combout\,
	cout => \Add28~19\);

-- Location: LCCOMB_X40_Y19_N24
\Add28~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~20_combout\ = (bg_hstart(14) & (\Add28~19\ $ (GND))) # (!bg_hstart(14) & (!\Add28~19\ & VCC))
-- \Add28~21\ = CARRY((bg_hstart(14) & !\Add28~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(14),
	datad => VCC,
	cin => \Add28~19\,
	combout => \Add28~20_combout\,
	cout => \Add28~21\);

-- Location: LCCOMB_X40_Y19_N26
\Add28~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~22_combout\ = (bg_hstart(15) & (!\Add28~21\)) # (!bg_hstart(15) & ((\Add28~21\) # (GND)))
-- \Add28~23\ = CARRY((!\Add28~21\) # (!bg_hstart(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(15),
	datad => VCC,
	cin => \Add28~21\,
	combout => \Add28~22_combout\,
	cout => \Add28~23\);

-- Location: LCCOMB_X40_Y19_N28
\Add28~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~24_combout\ = (bg_hstart(16) & (\Add28~23\ $ (GND))) # (!bg_hstart(16) & (!\Add28~23\ & VCC))
-- \Add28~25\ = CARRY((bg_hstart(16) & !\Add28~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(16),
	datad => VCC,
	cin => \Add28~23\,
	combout => \Add28~24_combout\,
	cout => \Add28~25\);

-- Location: LCCOMB_X40_Y19_N30
\Add28~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~26_combout\ = (bg_hstart(17) & (!\Add28~25\)) # (!bg_hstart(17) & ((\Add28~25\) # (GND)))
-- \Add28~27\ = CARRY((!\Add28~25\) # (!bg_hstart(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(17),
	datad => VCC,
	cin => \Add28~25\,
	combout => \Add28~26_combout\,
	cout => \Add28~27\);

-- Location: LCCOMB_X40_Y18_N0
\Add28~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~28_combout\ = (bg_hstart(18) & (\Add28~27\ $ (GND))) # (!bg_hstart(18) & (!\Add28~27\ & VCC))
-- \Add28~29\ = CARRY((bg_hstart(18) & !\Add28~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(18),
	datad => VCC,
	cin => \Add28~27\,
	combout => \Add28~28_combout\,
	cout => \Add28~29\);

-- Location: LCCOMB_X40_Y18_N2
\Add28~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~30_combout\ = (bg_hstart(19) & (!\Add28~29\)) # (!bg_hstart(19) & ((\Add28~29\) # (GND)))
-- \Add28~31\ = CARRY((!\Add28~29\) # (!bg_hstart(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(19),
	datad => VCC,
	cin => \Add28~29\,
	combout => \Add28~30_combout\,
	cout => \Add28~31\);

-- Location: LCCOMB_X40_Y18_N4
\Add28~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~32_combout\ = (bg_hstart(20) & (\Add28~31\ $ (GND))) # (!bg_hstart(20) & (!\Add28~31\ & VCC))
-- \Add28~33\ = CARRY((bg_hstart(20) & !\Add28~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(20),
	datad => VCC,
	cin => \Add28~31\,
	combout => \Add28~32_combout\,
	cout => \Add28~33\);

-- Location: LCCOMB_X40_Y18_N6
\Add28~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~34_combout\ = (bg_hstart(21) & (!\Add28~33\)) # (!bg_hstart(21) & ((\Add28~33\) # (GND)))
-- \Add28~35\ = CARRY((!\Add28~33\) # (!bg_hstart(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(21),
	datad => VCC,
	cin => \Add28~33\,
	combout => \Add28~34_combout\,
	cout => \Add28~35\);

-- Location: LCCOMB_X40_Y18_N8
\Add28~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~36_combout\ = (bg_hstart(22) & (\Add28~35\ $ (GND))) # (!bg_hstart(22) & (!\Add28~35\ & VCC))
-- \Add28~37\ = CARRY((bg_hstart(22) & !\Add28~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(22),
	datad => VCC,
	cin => \Add28~35\,
	combout => \Add28~36_combout\,
	cout => \Add28~37\);

-- Location: LCCOMB_X40_Y18_N10
\Add28~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~38_combout\ = (bg_hstart(23) & (!\Add28~37\)) # (!bg_hstart(23) & ((\Add28~37\) # (GND)))
-- \Add28~39\ = CARRY((!\Add28~37\) # (!bg_hstart(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(23),
	datad => VCC,
	cin => \Add28~37\,
	combout => \Add28~38_combout\,
	cout => \Add28~39\);

-- Location: LCCOMB_X40_Y18_N12
\Add28~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~40_combout\ = (bg_hstart(24) & (\Add28~39\ $ (GND))) # (!bg_hstart(24) & (!\Add28~39\ & VCC))
-- \Add28~41\ = CARRY((bg_hstart(24) & !\Add28~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(24),
	datad => VCC,
	cin => \Add28~39\,
	combout => \Add28~40_combout\,
	cout => \Add28~41\);

-- Location: LCCOMB_X40_Y18_N14
\Add28~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~42_combout\ = (bg_hstart(25) & (!\Add28~41\)) # (!bg_hstart(25) & ((\Add28~41\) # (GND)))
-- \Add28~43\ = CARRY((!\Add28~41\) # (!bg_hstart(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(25),
	datad => VCC,
	cin => \Add28~41\,
	combout => \Add28~42_combout\,
	cout => \Add28~43\);

-- Location: LCCOMB_X40_Y18_N16
\Add28~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~44_combout\ = (bg_hstart(26) & (\Add28~43\ $ (GND))) # (!bg_hstart(26) & (!\Add28~43\ & VCC))
-- \Add28~45\ = CARRY((bg_hstart(26) & !\Add28~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(26),
	datad => VCC,
	cin => \Add28~43\,
	combout => \Add28~44_combout\,
	cout => \Add28~45\);

-- Location: LCCOMB_X40_Y18_N18
\Add28~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~46_combout\ = (bg_hstart(27) & (!\Add28~45\)) # (!bg_hstart(27) & ((\Add28~45\) # (GND)))
-- \Add28~47\ = CARRY((!\Add28~45\) # (!bg_hstart(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(27),
	datad => VCC,
	cin => \Add28~45\,
	combout => \Add28~46_combout\,
	cout => \Add28~47\);

-- Location: LCCOMB_X40_Y18_N20
\Add28~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~48_combout\ = (bg_hstart(28) & (\Add28~47\ $ (GND))) # (!bg_hstart(28) & (!\Add28~47\ & VCC))
-- \Add28~49\ = CARRY((bg_hstart(28) & !\Add28~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(28),
	datad => VCC,
	cin => \Add28~47\,
	combout => \Add28~48_combout\,
	cout => \Add28~49\);

-- Location: LCCOMB_X40_Y18_N22
\Add28~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~50_combout\ = (bg_hstart(29) & (!\Add28~49\)) # (!bg_hstart(29) & ((\Add28~49\) # (GND)))
-- \Add28~51\ = CARRY((!\Add28~49\) # (!bg_hstart(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(29),
	datad => VCC,
	cin => \Add28~49\,
	combout => \Add28~50_combout\,
	cout => \Add28~51\);

-- Location: LCCOMB_X40_Y18_N24
\Add28~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~52_combout\ = (bg_hstart(30) & (\Add28~51\ $ (GND))) # (!bg_hstart(30) & (!\Add28~51\ & VCC))
-- \Add28~53\ = CARRY((bg_hstart(30) & !\Add28~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(30),
	datad => VCC,
	cin => \Add28~51\,
	combout => \Add28~52_combout\,
	cout => \Add28~53\);

-- Location: LCCOMB_X40_Y18_N26
\Add28~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add28~54_combout\ = \Add28~53\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add28~53\,
	combout => \Add28~54_combout\);

-- Location: LCCOMB_X37_Y19_N0
\LessThan25~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~1_cout\ = CARRY((!bg_hstart(0) & hposition(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(0),
	datab => hposition(0),
	datad => VCC,
	cout => \LessThan25~1_cout\);

-- Location: LCCOMB_X37_Y19_N2
\LessThan25~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~3_cout\ = CARRY((hposition(1) & (bg_hstart(1) & !\LessThan25~1_cout\)) # (!hposition(1) & ((bg_hstart(1)) # (!\LessThan25~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(1),
	datab => bg_hstart(1),
	datad => VCC,
	cin => \LessThan25~1_cout\,
	cout => \LessThan25~3_cout\);

-- Location: LCCOMB_X37_Y19_N4
\LessThan25~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~5_cout\ = CARRY((hposition(2) & ((!\LessThan25~3_cout\) # (!bg_hstart(2)))) # (!hposition(2) & (!bg_hstart(2) & !\LessThan25~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(2),
	datab => bg_hstart(2),
	datad => VCC,
	cin => \LessThan25~3_cout\,
	cout => \LessThan25~5_cout\);

-- Location: LCCOMB_X37_Y19_N6
\LessThan25~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~7_cout\ = CARRY((bg_hstart(3) & ((!\LessThan25~5_cout\) # (!hposition(3)))) # (!bg_hstart(3) & (!hposition(3) & !\LessThan25~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(3),
	datab => hposition(3),
	datad => VCC,
	cin => \LessThan25~5_cout\,
	cout => \LessThan25~7_cout\);

-- Location: LCCOMB_X37_Y19_N8
\LessThan25~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~9_cout\ = CARRY((bg_hstart(4) & ((hposition(4)) # (!\LessThan25~7_cout\))) # (!bg_hstart(4) & (hposition(4) & !\LessThan25~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datab => hposition(4),
	datad => VCC,
	cin => \LessThan25~7_cout\,
	cout => \LessThan25~9_cout\);

-- Location: LCCOMB_X37_Y19_N10
\LessThan25~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~11_cout\ = CARRY((\Add28~2_combout\ & ((!\LessThan25~9_cout\) # (!hposition(5)))) # (!\Add28~2_combout\ & (!hposition(5) & !\LessThan25~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~2_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan25~9_cout\,
	cout => \LessThan25~11_cout\);

-- Location: LCCOMB_X37_Y19_N12
\LessThan25~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~13_cout\ = CARRY((hposition(6) & ((!\LessThan25~11_cout\) # (!\Add28~4_combout\))) # (!hposition(6) & (!\Add28~4_combout\ & !\LessThan25~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(6),
	datab => \Add28~4_combout\,
	datad => VCC,
	cin => \LessThan25~11_cout\,
	cout => \LessThan25~13_cout\);

-- Location: LCCOMB_X37_Y19_N14
\LessThan25~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~15_cout\ = CARRY((hposition(7) & (\Add28~6_combout\ & !\LessThan25~13_cout\)) # (!hposition(7) & ((\Add28~6_combout\) # (!\LessThan25~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(7),
	datab => \Add28~6_combout\,
	datad => VCC,
	cin => \LessThan25~13_cout\,
	cout => \LessThan25~15_cout\);

-- Location: LCCOMB_X37_Y19_N16
\LessThan25~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~17_cout\ = CARRY((hposition(8) & ((!\LessThan25~15_cout\) # (!\Add28~8_combout\))) # (!hposition(8) & (!\Add28~8_combout\ & !\LessThan25~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(8),
	datab => \Add28~8_combout\,
	datad => VCC,
	cin => \LessThan25~15_cout\,
	cout => \LessThan25~17_cout\);

-- Location: LCCOMB_X37_Y19_N18
\LessThan25~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~19_cout\ = CARRY((hposition(9) & (\Add28~10_combout\ & !\LessThan25~17_cout\)) # (!hposition(9) & ((\Add28~10_combout\) # (!\LessThan25~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(9),
	datab => \Add28~10_combout\,
	datad => VCC,
	cin => \LessThan25~17_cout\,
	cout => \LessThan25~19_cout\);

-- Location: LCCOMB_X37_Y19_N20
\LessThan25~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~21_cout\ = CARRY((hposition(10) & ((!\LessThan25~19_cout\) # (!\Add28~12_combout\))) # (!hposition(10) & (!\Add28~12_combout\ & !\LessThan25~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \Add28~12_combout\,
	datad => VCC,
	cin => \LessThan25~19_cout\,
	cout => \LessThan25~21_cout\);

-- Location: LCCOMB_X37_Y19_N22
\LessThan25~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~23_cout\ = CARRY((\Add28~14_combout\ & ((!\LessThan25~21_cout\) # (!hposition(11)))) # (!\Add28~14_combout\ & (!hposition(11) & !\LessThan25~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~14_combout\,
	datab => hposition(11),
	datad => VCC,
	cin => \LessThan25~21_cout\,
	cout => \LessThan25~23_cout\);

-- Location: LCCOMB_X37_Y19_N24
\LessThan25~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~25_cout\ = CARRY((hposition(12) & ((!\LessThan25~23_cout\) # (!\Add28~16_combout\))) # (!hposition(12) & (!\Add28~16_combout\ & !\LessThan25~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \Add28~16_combout\,
	datad => VCC,
	cin => \LessThan25~23_cout\,
	cout => \LessThan25~25_cout\);

-- Location: LCCOMB_X37_Y19_N26
\LessThan25~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~27_cout\ = CARRY((hposition(13) & (\Add28~18_combout\ & !\LessThan25~25_cout\)) # (!hposition(13) & ((\Add28~18_combout\) # (!\LessThan25~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \Add28~18_combout\,
	datad => VCC,
	cin => \LessThan25~25_cout\,
	cout => \LessThan25~27_cout\);

-- Location: LCCOMB_X37_Y19_N28
\LessThan25~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~29_cout\ = CARRY((\Add28~20_combout\ & (hposition(14) & !\LessThan25~27_cout\)) # (!\Add28~20_combout\ & ((hposition(14)) # (!\LessThan25~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~20_combout\,
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan25~27_cout\,
	cout => \LessThan25~29_cout\);

-- Location: LCCOMB_X37_Y19_N30
\LessThan25~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~31_cout\ = CARRY((hposition(15) & (\Add28~22_combout\ & !\LessThan25~29_cout\)) # (!hposition(15) & ((\Add28~22_combout\) # (!\LessThan25~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datab => \Add28~22_combout\,
	datad => VCC,
	cin => \LessThan25~29_cout\,
	cout => \LessThan25~31_cout\);

-- Location: LCCOMB_X37_Y18_N0
\LessThan25~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~33_cout\ = CARRY((hposition(16) & ((!\LessThan25~31_cout\) # (!\Add28~24_combout\))) # (!hposition(16) & (!\Add28~24_combout\ & !\LessThan25~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(16),
	datab => \Add28~24_combout\,
	datad => VCC,
	cin => \LessThan25~31_cout\,
	cout => \LessThan25~33_cout\);

-- Location: LCCOMB_X37_Y18_N2
\LessThan25~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~35_cout\ = CARRY((hposition(17) & (\Add28~26_combout\ & !\LessThan25~33_cout\)) # (!hposition(17) & ((\Add28~26_combout\) # (!\LessThan25~33_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(17),
	datab => \Add28~26_combout\,
	datad => VCC,
	cin => \LessThan25~33_cout\,
	cout => \LessThan25~35_cout\);

-- Location: LCCOMB_X37_Y18_N4
\LessThan25~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~37_cout\ = CARRY((hposition(18) & ((!\LessThan25~35_cout\) # (!\Add28~28_combout\))) # (!hposition(18) & (!\Add28~28_combout\ & !\LessThan25~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(18),
	datab => \Add28~28_combout\,
	datad => VCC,
	cin => \LessThan25~35_cout\,
	cout => \LessThan25~37_cout\);

-- Location: LCCOMB_X37_Y18_N6
\LessThan25~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~39_cout\ = CARRY((\Add28~30_combout\ & ((!\LessThan25~37_cout\) # (!hposition(19)))) # (!\Add28~30_combout\ & (!hposition(19) & !\LessThan25~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~30_combout\,
	datab => hposition(19),
	datad => VCC,
	cin => \LessThan25~37_cout\,
	cout => \LessThan25~39_cout\);

-- Location: LCCOMB_X37_Y18_N8
\LessThan25~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~41_cout\ = CARRY((hposition(20) & ((!\LessThan25~39_cout\) # (!\Add28~32_combout\))) # (!hposition(20) & (!\Add28~32_combout\ & !\LessThan25~39_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \Add28~32_combout\,
	datad => VCC,
	cin => \LessThan25~39_cout\,
	cout => \LessThan25~41_cout\);

-- Location: LCCOMB_X37_Y18_N10
\LessThan25~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~43_cout\ = CARRY((\Add28~34_combout\ & ((!\LessThan25~41_cout\) # (!hposition(21)))) # (!\Add28~34_combout\ & (!hposition(21) & !\LessThan25~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~34_combout\,
	datab => hposition(21),
	datad => VCC,
	cin => \LessThan25~41_cout\,
	cout => \LessThan25~43_cout\);

-- Location: LCCOMB_X37_Y18_N12
\LessThan25~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~45_cout\ = CARRY((\Add28~36_combout\ & (hposition(22) & !\LessThan25~43_cout\)) # (!\Add28~36_combout\ & ((hposition(22)) # (!\LessThan25~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~36_combout\,
	datab => hposition(22),
	datad => VCC,
	cin => \LessThan25~43_cout\,
	cout => \LessThan25~45_cout\);

-- Location: LCCOMB_X37_Y18_N14
\LessThan25~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~47_cout\ = CARRY((hposition(23) & (\Add28~38_combout\ & !\LessThan25~45_cout\)) # (!hposition(23) & ((\Add28~38_combout\) # (!\LessThan25~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(23),
	datab => \Add28~38_combout\,
	datad => VCC,
	cin => \LessThan25~45_cout\,
	cout => \LessThan25~47_cout\);

-- Location: LCCOMB_X37_Y18_N16
\LessThan25~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~49_cout\ = CARRY((hposition(24) & ((!\LessThan25~47_cout\) # (!\Add28~40_combout\))) # (!hposition(24) & (!\Add28~40_combout\ & !\LessThan25~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(24),
	datab => \Add28~40_combout\,
	datad => VCC,
	cin => \LessThan25~47_cout\,
	cout => \LessThan25~49_cout\);

-- Location: LCCOMB_X37_Y18_N18
\LessThan25~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~51_cout\ = CARRY((hposition(25) & (\Add28~42_combout\ & !\LessThan25~49_cout\)) # (!hposition(25) & ((\Add28~42_combout\) # (!\LessThan25~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(25),
	datab => \Add28~42_combout\,
	datad => VCC,
	cin => \LessThan25~49_cout\,
	cout => \LessThan25~51_cout\);

-- Location: LCCOMB_X37_Y18_N20
\LessThan25~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~53_cout\ = CARRY((\Add28~44_combout\ & (hposition(26) & !\LessThan25~51_cout\)) # (!\Add28~44_combout\ & ((hposition(26)) # (!\LessThan25~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~44_combout\,
	datab => hposition(26),
	datad => VCC,
	cin => \LessThan25~51_cout\,
	cout => \LessThan25~53_cout\);

-- Location: LCCOMB_X37_Y18_N22
\LessThan25~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~55_cout\ = CARRY((\Add28~46_combout\ & ((!\LessThan25~53_cout\) # (!hposition(27)))) # (!\Add28~46_combout\ & (!hposition(27) & !\LessThan25~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~46_combout\,
	datab => hposition(27),
	datad => VCC,
	cin => \LessThan25~53_cout\,
	cout => \LessThan25~55_cout\);

-- Location: LCCOMB_X37_Y18_N24
\LessThan25~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~57_cout\ = CARRY((\Add28~48_combout\ & (hposition(28) & !\LessThan25~55_cout\)) # (!\Add28~48_combout\ & ((hposition(28)) # (!\LessThan25~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~48_combout\,
	datab => hposition(28),
	datad => VCC,
	cin => \LessThan25~55_cout\,
	cout => \LessThan25~57_cout\);

-- Location: LCCOMB_X37_Y18_N26
\LessThan25~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~59_cout\ = CARRY((hposition(29) & (\Add28~50_combout\ & !\LessThan25~57_cout\)) # (!hposition(29) & ((\Add28~50_combout\) # (!\LessThan25~57_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(29),
	datab => \Add28~50_combout\,
	datad => VCC,
	cin => \LessThan25~57_cout\,
	cout => \LessThan25~59_cout\);

-- Location: LCCOMB_X37_Y18_N28
\LessThan25~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~61_cout\ = CARRY((\Add28~52_combout\ & (hposition(30) & !\LessThan25~59_cout\)) # (!\Add28~52_combout\ & ((hposition(30)) # (!\LessThan25~59_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add28~52_combout\,
	datab => hposition(30),
	datad => VCC,
	cin => \LessThan25~59_cout\,
	cout => \LessThan25~61_cout\);

-- Location: LCCOMB_X37_Y18_N30
\LessThan25~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan25~62_combout\ = (hposition(31) & (\LessThan25~61_cout\ & \Add28~54_combout\)) # (!hposition(31) & ((\LessThan25~61_cout\) # (\Add28~54_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(31),
	datad => \Add28~54_combout\,
	cin => \LessThan25~61_cout\,
	combout => \LessThan25~62_combout\);

-- Location: LCCOMB_X41_Y19_N4
\Add27~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~0_combout\ = (bg_hstart(2) & (bg_hstart(3) $ (VCC))) # (!bg_hstart(2) & (bg_hstart(3) & VCC))
-- \Add27~1\ = CARRY((bg_hstart(2) & bg_hstart(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(2),
	datab => bg_hstart(3),
	datad => VCC,
	combout => \Add27~0_combout\,
	cout => \Add27~1\);

-- Location: LCCOMB_X41_Y19_N6
\Add27~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~2_combout\ = (bg_hstart(4) & (\Add27~1\ & VCC)) # (!bg_hstart(4) & (!\Add27~1\))
-- \Add27~3\ = CARRY((!bg_hstart(4) & !\Add27~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(4),
	datad => VCC,
	cin => \Add27~1\,
	combout => \Add27~2_combout\,
	cout => \Add27~3\);

-- Location: LCCOMB_X41_Y19_N8
\Add27~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~4_combout\ = (bg_hstart(5) & ((GND) # (!\Add27~3\))) # (!bg_hstart(5) & (\Add27~3\ $ (GND)))
-- \Add27~5\ = CARRY((bg_hstart(5)) # (!\Add27~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(5),
	datad => VCC,
	cin => \Add27~3\,
	combout => \Add27~4_combout\,
	cout => \Add27~5\);

-- Location: LCCOMB_X41_Y19_N10
\Add27~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~6_combout\ = (bg_hstart(6) & (\Add27~5\ & VCC)) # (!bg_hstart(6) & (!\Add27~5\))
-- \Add27~7\ = CARRY((!bg_hstart(6) & !\Add27~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(6),
	datad => VCC,
	cin => \Add27~5\,
	combout => \Add27~6_combout\,
	cout => \Add27~7\);

-- Location: LCCOMB_X41_Y19_N12
\Add27~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~8_combout\ = (bg_hstart(7) & ((GND) # (!\Add27~7\))) # (!bg_hstart(7) & (\Add27~7\ $ (GND)))
-- \Add27~9\ = CARRY((bg_hstart(7)) # (!\Add27~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(7),
	datad => VCC,
	cin => \Add27~7\,
	combout => \Add27~8_combout\,
	cout => \Add27~9\);

-- Location: LCCOMB_X41_Y19_N14
\Add27~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~10_combout\ = (bg_hstart(8) & (\Add27~9\ & VCC)) # (!bg_hstart(8) & (!\Add27~9\))
-- \Add27~11\ = CARRY((!bg_hstart(8) & !\Add27~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(8),
	datad => VCC,
	cin => \Add27~9\,
	combout => \Add27~10_combout\,
	cout => \Add27~11\);

-- Location: LCCOMB_X41_Y19_N16
\Add27~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~12_combout\ = (bg_hstart(9) & (\Add27~11\ $ (GND))) # (!bg_hstart(9) & (!\Add27~11\ & VCC))
-- \Add27~13\ = CARRY((bg_hstart(9) & !\Add27~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(9),
	datad => VCC,
	cin => \Add27~11\,
	combout => \Add27~12_combout\,
	cout => \Add27~13\);

-- Location: LCCOMB_X41_Y19_N18
\Add27~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~14_combout\ = (bg_hstart(10) & (!\Add27~13\)) # (!bg_hstart(10) & ((\Add27~13\) # (GND)))
-- \Add27~15\ = CARRY((!\Add27~13\) # (!bg_hstart(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(10),
	datad => VCC,
	cin => \Add27~13\,
	combout => \Add27~14_combout\,
	cout => \Add27~15\);

-- Location: LCCOMB_X41_Y19_N20
\Add27~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~16_combout\ = (bg_hstart(11) & (\Add27~15\ $ (GND))) # (!bg_hstart(11) & (!\Add27~15\ & VCC))
-- \Add27~17\ = CARRY((bg_hstart(11) & !\Add27~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(11),
	datad => VCC,
	cin => \Add27~15\,
	combout => \Add27~16_combout\,
	cout => \Add27~17\);

-- Location: LCCOMB_X41_Y19_N22
\Add27~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~18_combout\ = (bg_hstart(12) & (!\Add27~17\)) # (!bg_hstart(12) & ((\Add27~17\) # (GND)))
-- \Add27~19\ = CARRY((!\Add27~17\) # (!bg_hstart(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(12),
	datad => VCC,
	cin => \Add27~17\,
	combout => \Add27~18_combout\,
	cout => \Add27~19\);

-- Location: LCCOMB_X41_Y19_N24
\Add27~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~20_combout\ = (bg_hstart(13) & (\Add27~19\ $ (GND))) # (!bg_hstart(13) & (!\Add27~19\ & VCC))
-- \Add27~21\ = CARRY((bg_hstart(13) & !\Add27~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(13),
	datad => VCC,
	cin => \Add27~19\,
	combout => \Add27~20_combout\,
	cout => \Add27~21\);

-- Location: LCCOMB_X41_Y19_N26
\Add27~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~22_combout\ = (bg_hstart(14) & (!\Add27~21\)) # (!bg_hstart(14) & ((\Add27~21\) # (GND)))
-- \Add27~23\ = CARRY((!\Add27~21\) # (!bg_hstart(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(14),
	datad => VCC,
	cin => \Add27~21\,
	combout => \Add27~22_combout\,
	cout => \Add27~23\);

-- Location: LCCOMB_X41_Y19_N28
\Add27~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~24_combout\ = (bg_hstart(15) & (\Add27~23\ $ (GND))) # (!bg_hstart(15) & (!\Add27~23\ & VCC))
-- \Add27~25\ = CARRY((bg_hstart(15) & !\Add27~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(15),
	datad => VCC,
	cin => \Add27~23\,
	combout => \Add27~24_combout\,
	cout => \Add27~25\);

-- Location: LCCOMB_X41_Y19_N30
\Add27~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~26_combout\ = (bg_hstart(16) & (!\Add27~25\)) # (!bg_hstart(16) & ((\Add27~25\) # (GND)))
-- \Add27~27\ = CARRY((!\Add27~25\) # (!bg_hstart(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(16),
	datad => VCC,
	cin => \Add27~25\,
	combout => \Add27~26_combout\,
	cout => \Add27~27\);

-- Location: LCCOMB_X41_Y18_N0
\Add27~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~28_combout\ = (bg_hstart(17) & (\Add27~27\ $ (GND))) # (!bg_hstart(17) & (!\Add27~27\ & VCC))
-- \Add27~29\ = CARRY((bg_hstart(17) & !\Add27~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(17),
	datad => VCC,
	cin => \Add27~27\,
	combout => \Add27~28_combout\,
	cout => \Add27~29\);

-- Location: LCCOMB_X41_Y18_N2
\Add27~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~30_combout\ = (bg_hstart(18) & (!\Add27~29\)) # (!bg_hstart(18) & ((\Add27~29\) # (GND)))
-- \Add27~31\ = CARRY((!\Add27~29\) # (!bg_hstart(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(18),
	datad => VCC,
	cin => \Add27~29\,
	combout => \Add27~30_combout\,
	cout => \Add27~31\);

-- Location: LCCOMB_X41_Y18_N4
\Add27~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~32_combout\ = (bg_hstart(19) & (\Add27~31\ $ (GND))) # (!bg_hstart(19) & (!\Add27~31\ & VCC))
-- \Add27~33\ = CARRY((bg_hstart(19) & !\Add27~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(19),
	datad => VCC,
	cin => \Add27~31\,
	combout => \Add27~32_combout\,
	cout => \Add27~33\);

-- Location: LCCOMB_X41_Y18_N6
\Add27~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~34_combout\ = (bg_hstart(20) & (!\Add27~33\)) # (!bg_hstart(20) & ((\Add27~33\) # (GND)))
-- \Add27~35\ = CARRY((!\Add27~33\) # (!bg_hstart(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(20),
	datad => VCC,
	cin => \Add27~33\,
	combout => \Add27~34_combout\,
	cout => \Add27~35\);

-- Location: LCCOMB_X41_Y18_N8
\Add27~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~36_combout\ = (bg_hstart(21) & (\Add27~35\ $ (GND))) # (!bg_hstart(21) & (!\Add27~35\ & VCC))
-- \Add27~37\ = CARRY((bg_hstart(21) & !\Add27~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(21),
	datad => VCC,
	cin => \Add27~35\,
	combout => \Add27~36_combout\,
	cout => \Add27~37\);

-- Location: LCCOMB_X41_Y18_N10
\Add27~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~38_combout\ = (bg_hstart(22) & (!\Add27~37\)) # (!bg_hstart(22) & ((\Add27~37\) # (GND)))
-- \Add27~39\ = CARRY((!\Add27~37\) # (!bg_hstart(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(22),
	datad => VCC,
	cin => \Add27~37\,
	combout => \Add27~38_combout\,
	cout => \Add27~39\);

-- Location: LCCOMB_X41_Y18_N12
\Add27~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~40_combout\ = (bg_hstart(23) & (\Add27~39\ $ (GND))) # (!bg_hstart(23) & (!\Add27~39\ & VCC))
-- \Add27~41\ = CARRY((bg_hstart(23) & !\Add27~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(23),
	datad => VCC,
	cin => \Add27~39\,
	combout => \Add27~40_combout\,
	cout => \Add27~41\);

-- Location: LCCOMB_X41_Y18_N14
\Add27~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~42_combout\ = (bg_hstart(24) & (!\Add27~41\)) # (!bg_hstart(24) & ((\Add27~41\) # (GND)))
-- \Add27~43\ = CARRY((!\Add27~41\) # (!bg_hstart(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(24),
	datad => VCC,
	cin => \Add27~41\,
	combout => \Add27~42_combout\,
	cout => \Add27~43\);

-- Location: LCCOMB_X41_Y18_N16
\Add27~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~44_combout\ = (bg_hstart(25) & (\Add27~43\ $ (GND))) # (!bg_hstart(25) & (!\Add27~43\ & VCC))
-- \Add27~45\ = CARRY((bg_hstart(25) & !\Add27~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(25),
	datad => VCC,
	cin => \Add27~43\,
	combout => \Add27~44_combout\,
	cout => \Add27~45\);

-- Location: LCCOMB_X41_Y18_N18
\Add27~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~46_combout\ = (bg_hstart(26) & (!\Add27~45\)) # (!bg_hstart(26) & ((\Add27~45\) # (GND)))
-- \Add27~47\ = CARRY((!\Add27~45\) # (!bg_hstart(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(26),
	datad => VCC,
	cin => \Add27~45\,
	combout => \Add27~46_combout\,
	cout => \Add27~47\);

-- Location: LCCOMB_X41_Y18_N20
\Add27~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~48_combout\ = (bg_hstart(27) & (\Add27~47\ $ (GND))) # (!bg_hstart(27) & (!\Add27~47\ & VCC))
-- \Add27~49\ = CARRY((bg_hstart(27) & !\Add27~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(27),
	datad => VCC,
	cin => \Add27~47\,
	combout => \Add27~48_combout\,
	cout => \Add27~49\);

-- Location: LCCOMB_X41_Y18_N22
\Add27~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~50_combout\ = (bg_hstart(28) & (!\Add27~49\)) # (!bg_hstart(28) & ((\Add27~49\) # (GND)))
-- \Add27~51\ = CARRY((!\Add27~49\) # (!bg_hstart(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(28),
	datad => VCC,
	cin => \Add27~49\,
	combout => \Add27~50_combout\,
	cout => \Add27~51\);

-- Location: LCCOMB_X41_Y18_N24
\Add27~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~52_combout\ = (bg_hstart(29) & (\Add27~51\ $ (GND))) # (!bg_hstart(29) & (!\Add27~51\ & VCC))
-- \Add27~53\ = CARRY((bg_hstart(29) & !\Add27~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(29),
	datad => VCC,
	cin => \Add27~51\,
	combout => \Add27~52_combout\,
	cout => \Add27~53\);

-- Location: LCCOMB_X41_Y18_N26
\Add27~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~54_combout\ = (bg_hstart(30) & (!\Add27~53\)) # (!bg_hstart(30) & ((\Add27~53\) # (GND)))
-- \Add27~55\ = CARRY((!\Add27~53\) # (!bg_hstart(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => bg_hstart(30),
	datad => VCC,
	cin => \Add27~53\,
	combout => \Add27~54_combout\,
	cout => \Add27~55\);

-- Location: LCCOMB_X41_Y18_N28
\Add27~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add27~56_combout\ = !\Add27~55\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add27~55\,
	combout => \Add27~56_combout\);

-- Location: LCCOMB_X42_Y19_N0
\LessThan24~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~1_cout\ = CARRY((bg_hstart(0) & !hposition(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(0),
	datab => hposition(0),
	datad => VCC,
	cout => \LessThan24~1_cout\);

-- Location: LCCOMB_X42_Y19_N2
\LessThan24~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~3_cout\ = CARRY((bg_hstart(1) & (hposition(1) & !\LessThan24~1_cout\)) # (!bg_hstart(1) & ((hposition(1)) # (!\LessThan24~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(1),
	datab => hposition(1),
	datad => VCC,
	cin => \LessThan24~1_cout\,
	cout => \LessThan24~3_cout\);

-- Location: LCCOMB_X42_Y19_N4
\LessThan24~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~5_cout\ = CARRY((bg_hstart(2) & (!hposition(2) & !\LessThan24~3_cout\)) # (!bg_hstart(2) & ((!\LessThan24~3_cout\) # (!hposition(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => bg_hstart(2),
	datab => hposition(2),
	datad => VCC,
	cin => \LessThan24~3_cout\,
	cout => \LessThan24~5_cout\);

-- Location: LCCOMB_X42_Y19_N6
\LessThan24~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~7_cout\ = CARRY((hposition(3) & ((!\LessThan24~5_cout\) # (!\Add27~0_combout\))) # (!hposition(3) & (!\Add27~0_combout\ & !\LessThan24~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(3),
	datab => \Add27~0_combout\,
	datad => VCC,
	cin => \LessThan24~5_cout\,
	cout => \LessThan24~7_cout\);

-- Location: LCCOMB_X42_Y19_N8
\LessThan24~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~9_cout\ = CARRY((hposition(4) & (\Add27~2_combout\ & !\LessThan24~7_cout\)) # (!hposition(4) & ((\Add27~2_combout\) # (!\LessThan24~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(4),
	datab => \Add27~2_combout\,
	datad => VCC,
	cin => \LessThan24~7_cout\,
	cout => \LessThan24~9_cout\);

-- Location: LCCOMB_X42_Y19_N10
\LessThan24~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~11_cout\ = CARRY((\Add27~4_combout\ & (hposition(5) & !\LessThan24~9_cout\)) # (!\Add27~4_combout\ & ((hposition(5)) # (!\LessThan24~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~4_combout\,
	datab => hposition(5),
	datad => VCC,
	cin => \LessThan24~9_cout\,
	cout => \LessThan24~11_cout\);

-- Location: LCCOMB_X42_Y19_N12
\LessThan24~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~13_cout\ = CARRY((\Add27~6_combout\ & ((!\LessThan24~11_cout\) # (!hposition(6)))) # (!\Add27~6_combout\ & (!hposition(6) & !\LessThan24~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~6_combout\,
	datab => hposition(6),
	datad => VCC,
	cin => \LessThan24~11_cout\,
	cout => \LessThan24~13_cout\);

-- Location: LCCOMB_X42_Y19_N14
\LessThan24~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~15_cout\ = CARRY((\Add27~8_combout\ & (hposition(7) & !\LessThan24~13_cout\)) # (!\Add27~8_combout\ & ((hposition(7)) # (!\LessThan24~13_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~8_combout\,
	datab => hposition(7),
	datad => VCC,
	cin => \LessThan24~13_cout\,
	cout => \LessThan24~15_cout\);

-- Location: LCCOMB_X42_Y19_N16
\LessThan24~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~17_cout\ = CARRY((\Add27~10_combout\ & ((!\LessThan24~15_cout\) # (!hposition(8)))) # (!\Add27~10_combout\ & (!hposition(8) & !\LessThan24~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~10_combout\,
	datab => hposition(8),
	datad => VCC,
	cin => \LessThan24~15_cout\,
	cout => \LessThan24~17_cout\);

-- Location: LCCOMB_X42_Y19_N18
\LessThan24~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~19_cout\ = CARRY((\Add27~12_combout\ & (hposition(9) & !\LessThan24~17_cout\)) # (!\Add27~12_combout\ & ((hposition(9)) # (!\LessThan24~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~12_combout\,
	datab => hposition(9),
	datad => VCC,
	cin => \LessThan24~17_cout\,
	cout => \LessThan24~19_cout\);

-- Location: LCCOMB_X42_Y19_N20
\LessThan24~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~21_cout\ = CARRY((hposition(10) & (\Add27~14_combout\ & !\LessThan24~19_cout\)) # (!hposition(10) & ((\Add27~14_combout\) # (!\LessThan24~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(10),
	datab => \Add27~14_combout\,
	datad => VCC,
	cin => \LessThan24~19_cout\,
	cout => \LessThan24~21_cout\);

-- Location: LCCOMB_X42_Y19_N22
\LessThan24~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~23_cout\ = CARRY((hposition(11) & ((!\LessThan24~21_cout\) # (!\Add27~16_combout\))) # (!hposition(11) & (!\Add27~16_combout\ & !\LessThan24~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(11),
	datab => \Add27~16_combout\,
	datad => VCC,
	cin => \LessThan24~21_cout\,
	cout => \LessThan24~23_cout\);

-- Location: LCCOMB_X42_Y19_N24
\LessThan24~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~25_cout\ = CARRY((hposition(12) & (\Add27~18_combout\ & !\LessThan24~23_cout\)) # (!hposition(12) & ((\Add27~18_combout\) # (!\LessThan24~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(12),
	datab => \Add27~18_combout\,
	datad => VCC,
	cin => \LessThan24~23_cout\,
	cout => \LessThan24~25_cout\);

-- Location: LCCOMB_X42_Y19_N26
\LessThan24~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~27_cout\ = CARRY((hposition(13) & ((!\LessThan24~25_cout\) # (!\Add27~20_combout\))) # (!hposition(13) & (!\Add27~20_combout\ & !\LessThan24~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(13),
	datab => \Add27~20_combout\,
	datad => VCC,
	cin => \LessThan24~25_cout\,
	cout => \LessThan24~27_cout\);

-- Location: LCCOMB_X42_Y19_N28
\LessThan24~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~29_cout\ = CARRY((\Add27~22_combout\ & ((!\LessThan24~27_cout\) # (!hposition(14)))) # (!\Add27~22_combout\ & (!hposition(14) & !\LessThan24~27_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~22_combout\,
	datab => hposition(14),
	datad => VCC,
	cin => \LessThan24~27_cout\,
	cout => \LessThan24~29_cout\);

-- Location: LCCOMB_X42_Y19_N30
\LessThan24~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~31_cout\ = CARRY((hposition(15) & ((!\LessThan24~29_cout\) # (!\Add27~24_combout\))) # (!hposition(15) & (!\Add27~24_combout\ & !\LessThan24~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(15),
	datab => \Add27~24_combout\,
	datad => VCC,
	cin => \LessThan24~29_cout\,
	cout => \LessThan24~31_cout\);

-- Location: LCCOMB_X42_Y18_N0
\LessThan24~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~33_cout\ = CARRY((\Add27~26_combout\ & ((!\LessThan24~31_cout\) # (!hposition(16)))) # (!\Add27~26_combout\ & (!hposition(16) & !\LessThan24~31_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~26_combout\,
	datab => hposition(16),
	datad => VCC,
	cin => \LessThan24~31_cout\,
	cout => \LessThan24~33_cout\);

-- Location: LCCOMB_X42_Y18_N2
\LessThan24~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~35_cout\ = CARRY((\Add27~28_combout\ & (hposition(17) & !\LessThan24~33_cout\)) # (!\Add27~28_combout\ & ((hposition(17)) # (!\LessThan24~33_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~28_combout\,
	datab => hposition(17),
	datad => VCC,
	cin => \LessThan24~33_cout\,
	cout => \LessThan24~35_cout\);

-- Location: LCCOMB_X42_Y18_N4
\LessThan24~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~37_cout\ = CARRY((\Add27~30_combout\ & ((!\LessThan24~35_cout\) # (!hposition(18)))) # (!\Add27~30_combout\ & (!hposition(18) & !\LessThan24~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~30_combout\,
	datab => hposition(18),
	datad => VCC,
	cin => \LessThan24~35_cout\,
	cout => \LessThan24~37_cout\);

-- Location: LCCOMB_X42_Y18_N6
\LessThan24~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~39_cout\ = CARRY((hposition(19) & ((!\LessThan24~37_cout\) # (!\Add27~32_combout\))) # (!hposition(19) & (!\Add27~32_combout\ & !\LessThan24~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(19),
	datab => \Add27~32_combout\,
	datad => VCC,
	cin => \LessThan24~37_cout\,
	cout => \LessThan24~39_cout\);

-- Location: LCCOMB_X42_Y18_N8
\LessThan24~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~41_cout\ = CARRY((hposition(20) & (\Add27~34_combout\ & !\LessThan24~39_cout\)) # (!hposition(20) & ((\Add27~34_combout\) # (!\LessThan24~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(20),
	datab => \Add27~34_combout\,
	datad => VCC,
	cin => \LessThan24~39_cout\,
	cout => \LessThan24~41_cout\);

-- Location: LCCOMB_X42_Y18_N10
\LessThan24~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~43_cout\ = CARRY((\Add27~36_combout\ & (hposition(21) & !\LessThan24~41_cout\)) # (!\Add27~36_combout\ & ((hposition(21)) # (!\LessThan24~41_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~36_combout\,
	datab => hposition(21),
	datad => VCC,
	cin => \LessThan24~41_cout\,
	cout => \LessThan24~43_cout\);

-- Location: LCCOMB_X42_Y18_N12
\LessThan24~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~45_cout\ = CARRY((\Add27~38_combout\ & ((!\LessThan24~43_cout\) # (!hposition(22)))) # (!\Add27~38_combout\ & (!hposition(22) & !\LessThan24~43_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~38_combout\,
	datab => hposition(22),
	datad => VCC,
	cin => \LessThan24~43_cout\,
	cout => \LessThan24~45_cout\);

-- Location: LCCOMB_X42_Y18_N14
\LessThan24~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~47_cout\ = CARRY((\Add27~40_combout\ & (hposition(23) & !\LessThan24~45_cout\)) # (!\Add27~40_combout\ & ((hposition(23)) # (!\LessThan24~45_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~40_combout\,
	datab => hposition(23),
	datad => VCC,
	cin => \LessThan24~45_cout\,
	cout => \LessThan24~47_cout\);

-- Location: LCCOMB_X42_Y18_N16
\LessThan24~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~49_cout\ = CARRY((\Add27~42_combout\ & ((!\LessThan24~47_cout\) # (!hposition(24)))) # (!\Add27~42_combout\ & (!hposition(24) & !\LessThan24~47_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~42_combout\,
	datab => hposition(24),
	datad => VCC,
	cin => \LessThan24~47_cout\,
	cout => \LessThan24~49_cout\);

-- Location: LCCOMB_X42_Y18_N18
\LessThan24~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~51_cout\ = CARRY((\Add27~44_combout\ & (hposition(25) & !\LessThan24~49_cout\)) # (!\Add27~44_combout\ & ((hposition(25)) # (!\LessThan24~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~44_combout\,
	datab => hposition(25),
	datad => VCC,
	cin => \LessThan24~49_cout\,
	cout => \LessThan24~51_cout\);

-- Location: LCCOMB_X42_Y18_N20
\LessThan24~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~53_cout\ = CARRY((hposition(26) & (\Add27~46_combout\ & !\LessThan24~51_cout\)) # (!hposition(26) & ((\Add27~46_combout\) # (!\LessThan24~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(26),
	datab => \Add27~46_combout\,
	datad => VCC,
	cin => \LessThan24~51_cout\,
	cout => \LessThan24~53_cout\);

-- Location: LCCOMB_X42_Y18_N22
\LessThan24~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~55_cout\ = CARRY((hposition(27) & ((!\LessThan24~53_cout\) # (!\Add27~48_combout\))) # (!hposition(27) & (!\Add27~48_combout\ & !\LessThan24~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(27),
	datab => \Add27~48_combout\,
	datad => VCC,
	cin => \LessThan24~53_cout\,
	cout => \LessThan24~55_cout\);

-- Location: LCCOMB_X42_Y18_N24
\LessThan24~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~57_cout\ = CARRY((hposition(28) & (\Add27~50_combout\ & !\LessThan24~55_cout\)) # (!hposition(28) & ((\Add27~50_combout\) # (!\LessThan24~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(28),
	datab => \Add27~50_combout\,
	datad => VCC,
	cin => \LessThan24~55_cout\,
	cout => \LessThan24~57_cout\);

-- Location: LCCOMB_X42_Y18_N26
\LessThan24~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~59_cout\ = CARRY((hposition(29) & ((!\LessThan24~57_cout\) # (!\Add27~52_combout\))) # (!hposition(29) & (!\Add27~52_combout\ & !\LessThan24~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => hposition(29),
	datab => \Add27~52_combout\,
	datad => VCC,
	cin => \LessThan24~57_cout\,
	cout => \LessThan24~59_cout\);

-- Location: LCCOMB_X42_Y18_N28
\LessThan24~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~61_cout\ = CARRY((\Add27~54_combout\ & ((!\LessThan24~59_cout\) # (!hposition(30)))) # (!\Add27~54_combout\ & (!hposition(30) & !\LessThan24~59_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add27~54_combout\,
	datab => hposition(30),
	datad => VCC,
	cin => \LessThan24~59_cout\,
	cout => \LessThan24~61_cout\);

-- Location: LCCOMB_X42_Y18_N30
\LessThan24~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan24~62_combout\ = (hposition(31) & ((\LessThan24~61_cout\) # (!\Add27~56_combout\))) # (!hposition(31) & (\LessThan24~61_cout\ & !\Add27~56_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => hposition(31),
	datad => \Add27~56_combout\,
	cin => \LessThan24~61_cout\,
	combout => \LessThan24~62_combout\);

-- Location: LCCOMB_X42_Y20_N20
\r[3]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[3]~3_combout\ = (!\LessThan23~2_combout\ & (!\LessThan25~62_combout\ & !\LessThan24~62_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \LessThan23~2_combout\,
	datac => \LessThan25~62_combout\,
	datad => \LessThan24~62_combout\,
	combout => \r[3]~3_combout\);

-- Location: LCCOMB_X42_Y20_N12
\r[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r[3]~6_combout\ = (\r[3]~2_combout\ & ((\r[3]~4_combout\) # ((\r[3]~5_combout\) # (\r[3]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \r[3]~2_combout\,
	datab => \r[3]~4_combout\,
	datac => \r[3]~5_combout\,
	datad => \r[3]~3_combout\,
	combout => \r[3]~6_combout\);

-- Location: FF_X37_Y22_N9
\r[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~1_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[0]~reg0_q\);

-- Location: M9K_X5_Y27_N0
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

-- Location: M9K_X33_Y23_N0
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

-- Location: M9K_X33_Y9_N0
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

-- Location: LCCOMB_X38_Y23_N24
\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a21~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a9~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\);

-- Location: M9K_X73_Y16_N0
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

-- Location: LCCOMB_X38_Y23_N26
\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\) # 
-- ((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\ & 
-- \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a45~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~2_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a33~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\);

-- Location: LCCOMB_X37_Y22_N2
\r~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~7_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[9]~3_combout\,
	datad => \process_0~14_combout\,
	combout => \r~7_combout\);

-- Location: FF_X37_Y22_N3
\r[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~7_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[1]~reg0_q\);

-- Location: M9K_X53_Y33_N0
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

-- Location: M9K_X53_Y29_N0
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

-- Location: M9K_X53_Y15_N0
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

-- Location: LCCOMB_X44_Y22_N24
\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a10~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a34~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\);

-- Location: M9K_X33_Y15_N0
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

-- Location: LCCOMB_X44_Y22_N26
\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\ & 
-- ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a22~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~4_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a46~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\);

-- Location: LCCOMB_X37_Y22_N4
\r~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~8_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[10]~5_combout\,
	datad => \process_0~14_combout\,
	combout => \r~8_combout\);

-- Location: FF_X37_Y22_N5
\r[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~8_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[2]~reg0_q\);

-- Location: M9K_X33_Y27_N0
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

-- Location: M9K_X5_Y23_N0
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

-- Location: LCCOMB_X38_Y23_N12
\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a11~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a23~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\);

-- Location: M9K_X5_Y19_N0
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

-- Location: M9K_X53_Y25_N0
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

-- Location: LCCOMB_X38_Y23_N30
\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\ & (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~6_combout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a35~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a47~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\);

-- Location: LCCOMB_X37_Y22_N14
\r~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \r~9_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[11]~7_combout\,
	datad => \process_0~14_combout\,
	combout => \r~9_combout\);

-- Location: FF_X37_Y22_N15
\r[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \r~9_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \r[3]~reg0_q\);

-- Location: M9K_X53_Y8_N0
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

-- Location: M9K_X5_Y21_N0
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

-- Location: M9K_X33_Y20_N0
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

-- Location: LCCOMB_X38_Y23_N0
\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\) # 
-- (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\ & 
-- ((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a4~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a28~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\);

-- Location: M9K_X5_Y28_N0
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

-- Location: LCCOMB_X38_Y23_N18
\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\) # 
-- ((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\ & 
-- \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a40~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~8_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a16~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\);

-- Location: LCCOMB_X37_Y22_N0
\g~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~0_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[4]~9_combout\,
	datad => \process_0~14_combout\,
	combout => \g~0_combout\);

-- Location: FF_X37_Y22_N1
\g[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~0_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[0]~reg0_q\);

-- Location: M9K_X5_Y14_N0
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

-- Location: M9K_X33_Y29_N0
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

-- Location: M9K_X53_Y30_N0
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

-- Location: LCCOMB_X38_Y23_N28
\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a17~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a5~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\);

-- Location: M9K_X53_Y26_N0
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

-- Location: LCCOMB_X38_Y23_N6
\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\ & 
-- ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a29~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~10_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a41~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\);

-- Location: LCCOMB_X37_Y22_N26
\g~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~1_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[5]~11_combout\,
	datad => \process_0~14_combout\,
	combout => \g~1_combout\);

-- Location: FF_X37_Y22_N27
\g[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~1_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[1]~reg0_q\);

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

-- Location: M9K_X53_Y17_N0
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

-- Location: LCCOMB_X44_Y22_N12
\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)) # 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\)))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a30~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a6~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~12_combout\);

-- Location: M9K_X33_Y22_N0
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

-- Location: M9K_X53_Y19_N0
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

-- Location: LCCOMB_X44_Y22_N30
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

-- Location: LCCOMB_X37_Y22_N28
\g~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~2_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\process_0~12_combout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[6]~13_combout\,
	datac => \process_0~12_combout\,
	datad => \process_0~14_combout\,
	combout => \g~2_combout\);

-- Location: FF_X37_Y22_N29
\g[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~2_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[2]~reg0_q\);

-- Location: M9K_X53_Y27_N0
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

-- Location: M9K_X33_Y14_N0
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

-- Location: LCCOMB_X38_Y23_N8
\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\)) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a19~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a7~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\);

-- Location: M9K_X33_Y28_N0
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

-- Location: LCCOMB_X38_Y23_N10
\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\ & 
-- ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a31~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~14_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a43~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\);

-- Location: LCCOMB_X37_Y22_N22
\g~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \g~3_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[7]~15_combout\,
	datad => \process_0~14_combout\,
	combout => \g~3_combout\);

-- Location: FF_X37_Y22_N23
\g[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \g~3_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \g[3]~reg0_q\);

-- Location: M9K_X5_Y15_N0
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

-- Location: M9K_X53_Y24_N0
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

-- Location: LCCOMB_X44_Y22_N8
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

-- Location: M9K_X53_Y21_N0
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

-- Location: LCCOMB_X44_Y22_N2
\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\) # 
-- ((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\ & 
-- \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a36~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~16_combout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a12~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\);

-- Location: LCCOMB_X37_Y22_N24
\b~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~0_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[0]~17_combout\,
	datad => \process_0~14_combout\,
	combout => \b~0_combout\);

-- Location: FF_X37_Y22_N25
\b[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~0_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[0]~reg0_q\);

-- Location: M9K_X5_Y26_N0
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

-- Location: M9K_X33_Y26_N0
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

-- Location: M9K_X33_Y24_N0
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

-- Location: M9K_X33_Y13_N0
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

-- Location: LCCOMB_X38_Y23_N4
\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (\bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a1~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a13~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\);

-- Location: LCCOMB_X38_Y23_N22
\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\ = (\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a37~portadataout\) # 
-- ((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\ & (((\bgread|altsyncram_component|auto_generated|ram_block1a25~portadataout\ & 
-- \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a37~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a25~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~18_combout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\);

-- Location: LCCOMB_X37_Y22_N18
\b~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~1_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[1]~19_combout\,
	datad => \process_0~14_combout\,
	combout => \b~1_combout\);

-- Location: FF_X37_Y22_N19
\b[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~1_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[1]~reg0_q\);

-- Location: M9K_X33_Y25_N0
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

-- Location: M9K_X33_Y21_N0
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

-- Location: M9K_X53_Y22_N0
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

-- Location: LCCOMB_X44_Y22_N4
\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\) # 
-- (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0))))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (\bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\ & 
-- ((!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a2~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a26~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\);

-- Location: M9K_X53_Y32_N0
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

-- Location: LCCOMB_X44_Y22_N14
\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ & 
-- ((\bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\))) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\ & (\bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\)))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a14~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~20_combout\,
	datad => \bgread|altsyncram_component|auto_generated|ram_block1a38~portadataout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\);

-- Location: LCCOMB_X37_Y22_N20
\b~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~2_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[2]~21_combout\,
	datad => \process_0~14_combout\,
	combout => \b~2_combout\);

-- Location: FF_X37_Y22_N21
\b[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~2_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[2]~reg0_q\);

-- Location: M9K_X33_Y16_N0
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

-- Location: M9K_X5_Y25_N0
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

-- Location: M9K_X33_Y18_N0
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

-- Location: M9K_X73_Y29_N0
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

-- Location: LCCOMB_X44_Y22_N16
\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & ((\bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\) # 
-- ((\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1))))) # (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(0) & (((\bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\ & 
-- !\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|ram_block1a15~portadataout\,
	datab => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(0),
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a3~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\);

-- Location: LCCOMB_X44_Y22_N18
\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\ = (\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & ((\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ & 
-- (\bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\)) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\ & ((\bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\))))) # 
-- (!\bgread|altsyncram_component|auto_generated|out_address_reg_a\(1) & (((\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bgread|altsyncram_component|auto_generated|out_address_reg_a\(1),
	datab => \bgread|altsyncram_component|auto_generated|ram_block1a39~portadataout\,
	datac => \bgread|altsyncram_component|auto_generated|ram_block1a27~portadataout\,
	datad => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~22_combout\,
	combout => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\);

-- Location: LCCOMB_X37_Y22_N30
\b~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \b~3_combout\ = (!\process_0~8_combout\ & (((!\process_0~14_combout\) # (!\bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\)) # (!\process_0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~8_combout\,
	datab => \process_0~12_combout\,
	datac => \bgread|altsyncram_component|auto_generated|mux2|result_node[3]~23_combout\,
	datad => \process_0~14_combout\,
	combout => \b~3_combout\);

-- Location: FF_X37_Y22_N31
\b[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \b~3_combout\,
	clrn => \ALT_INV_r[3]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \b[3]~reg0_q\);

-- Location: LCCOMB_X38_Y18_N12
\process_0~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~15_combout\ = ((hposition(7) & ((hposition(6)) # (hposition(5))))) # (!\LessThan17~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan17~1_combout\,
	datab => hposition(7),
	datac => hposition(6),
	datad => hposition(5),
	combout => \process_0~15_combout\);

-- Location: LCCOMB_X38_Y18_N22
\process_0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~16_combout\ = (!hposition(6) & (!hposition(7) & ((!hposition(3)) # (!hposition(4)))))

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
	combout => \process_0~16_combout\);

-- Location: LCCOMB_X38_Y18_N8
\process_0~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~17_combout\ = (\process_0~15_combout\) # (((\process_0~16_combout\ & !hposition(5))) # (!\process_0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~15_combout\,
	datab => \process_0~16_combout\,
	datac => \process_0~4_combout\,
	datad => hposition(5),
	combout => \process_0~17_combout\);

-- Location: FF_X38_Y18_N9
\hsync~reg0\ : dffeas
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
	q => \hsync~reg0_q\);

-- Location: LCCOMB_X43_Y21_N0
\process_0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~18_combout\ = ((\process_0~3_combout\ & ((!vposition(1)) # (!vposition(0))))) # (!\LessThan23~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => vposition(0),
	datab => \process_0~3_combout\,
	datac => \LessThan23~0_combout\,
	datad => vposition(1),
	combout => \process_0~18_combout\);

-- Location: LCCOMB_X43_Y21_N24
\process_0~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \process_0~19_combout\ = ((vposition(9)) # ((vposition(8)) # (\process_0~18_combout\))) # (!\process_0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \process_0~2_combout\,
	datab => vposition(9),
	datac => vposition(8),
	datad => \process_0~18_combout\,
	combout => \process_0~19_combout\);

-- Location: FF_X43_Y21_N25
\vsync~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \disp_clk|altpll_component|auto_generated|wire_pll1_clk[1]~clkctrl_outclk\,
	d => \process_0~19_combout\,
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

-- Location: IOIBUF_X78_Y3_N8
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

-- Location: IOIBUF_X54_Y0_N29
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


