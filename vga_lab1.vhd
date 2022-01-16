library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga_lab1 is
generic(bg_width        : INTEGER := 512; -- Width of bac
        bg_Height       : INTEGER := 40; -- Height of image in memory
        dataSize        : INTEGER := 11;  -- MSB of each row in memory
        addressSize     : integer := 15;
        bgAddressSize   : integer := 14); 
port(clk50MHz  : in std_logic;
     chooseRes : in std_logic;
	  moveUp : in std_logic;
	  moveDown : in std_logic;
     r         : out std_logic_vector(3 downto 0);
     g         : out std_logic_vector(3 downto 0);
     b         : out std_logic_vector(3 downto 0);
     hsync     : out std_logic;
	  HEX0      : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	  HEX1      : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
     vsync     : out std_logic);
end entity vga_lab1;

architecture display of vga_lab1 is

	-- Parameters for a 1024x768 display
	constant hfp768p  : integer   := 24;
	constant hsp768p  : integer   := 136;
	constant hbp768p  : integer   := 160;
	constant hva768p  : integer   := 1024;
	constant vfp768p  : integer   := 3;
	constant vsp768p  : integer   := 6;
	constant vbp768p  : integer   := 29;
	constant vva768p  : integer   := 768;
	-- Signals that will hold the front port etc that we will acutally use
	signal   hfp      : integer; -- horizontal front porch
	signal   hsp      : integer; -- horizontal sync pulse
	signal   hbp      : integer; -- horizontal back porch
	signal   hva      : integer; -- horizontal visible area
	signal   vfp      : integer; -- vertical front porch
	signal   vsp      : integer; -- vertical sync pulse
	signal   vbp      : integer; -- vertical back porch
	signal   vva      : integer; -- vertical visible area
	-- Signal to hold the clock we will use for the display
	signal   sync2_clk : std_logic := '0';
	-- Signals for each of the clocks available to us
	signal   clk25      : std_logic := '0';
	signal   clk65      : std_logic := '0';
	-- Signals to hold the present horizontal and vertical positions.
	signal   hposition  : integer   := 0;
	signal   vposition  : integer   := 0;
	-- Signals to hold the present memory address to be read and the data read
	signal data_address : std_logic_vector(addressSize downto 0) := (others=>'0');
	signal bg_address   : std_logic_vector(bgAddressSize downto 0) := (others=>'0');
	signal raw_data     : std_logic_vector(dataSize downto 0)    := (others=>'0');
	signal bg_data     : std_logic_vector(dataSize downto 0)    := (others=>'0');
	signal tsocre    : std_logic_vector(3 downto 0)    := "1000";
	signal score: unsigned(3 downto 0) :="0000";
component dizzy IS
	PORT( score: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  diz0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		  diz1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END component;
begin
	sync2_clk<= clk65;
	hfp      <= hfp768p;
	hsp      <= hsp768p;
	hbp      <= hbp768p;
	hva      <= hva768p;
	vfp      <= vfp768p;
	vsp      <= vsp768p;
	vbp      <= vbp768p;
	vva      <= vva768p;
	
	disp_clk: work.sync_clk port map(inclk0 => clk50MHz,
                                    c0     => clk25,
                                    c1     => clk65);
	scoredisp: dizzy port map(std_logic_vector(score), HEX0,HEX1);
	
	imRead: work.image_mem port map(address => data_address,
                                  clock    => sync2_clk,
                                  q        => raw_data);
	bgread: work.bg_spry port map(address => bg_address,
                                  clock    => sync2_clk,
                                  q        => bg_data);
--	bg_vstart <= bg_vstart-20 when (moveUp = '1') else bg_vstart;
--	bg_vstart <= bg_vstop-20 when (moveUp = '1') else bg_vstop;
	
	process(sync2_clk,moveUp,moveDown)
	variable hcentre            : integer := hfp + hsp + hbp + (hva/2);
	variable hstart 				 : integer := hfp + hsp + hbp;
	variable vcentre            : integer := vfp + vsp + vbp + (vva/2);
	variable vbottom				 : integer := vfp + vsp + vbp + (vva);
	variable hend               : integer := hfp + hsp + hbp + (hva);
	variable bg_hstart          : integer :=  hend - bg_width;--hcentre      - bg_width/2;
	variable bg_hstop           : integer := hend;--bg_hstart + bg_width;
	variable bg_vstart          : integer := vbottom    - bg_Height-5;
	variable bg_vstop           : integer := vbottom-5;
	variable image_pixel_col    : integer := 0;
	variable image_pixel_row    : integer := 0;
	variable image_pixel_number : integer := 0;
	variable obstacle_width		 : integer := 30;
	variable obstacle_hstart	 : integer := hend - obstacle_width;
	variable obstacle_hstop     : integer := hend; 	
	variable obstacle_vstart    : integer := bg_vstart-120; 	
	variable mem_Address        : unsigned(addressSize downto 0) := (others=>'0');
	variable bgMem_Address      : unsigned(bgAddressSize downto 0) := (others=>'0');
	variable object_vstart		 : integer := vbottom-180;
	variable object_height		 : integer := 75;
	variable object_vstop		 : integer := object_vstart + object_height;
	
--	variable imgOffset          : integer := 4;
	variable count: integer   :=0;
	variable o_count: integer :=0;
	variable speed: integer   :=1;
	variable count_2: integer :=0;
	
	begin
	
--	if rising_edge(moveDown) then
--			object_vstart := object_vstart-70;	
--	end if;
	
		if rising_edge(sync2_clk) then
			-- Always increment the horizontal position counter with each active clock pulse
			hposition <= hposition + 1;
			
			if count >= 1000000 then
					obstacle_hstart := obstacle_hstart -speed;
					obstacle_hstop := obstacle_hstop -speed;
					bg_hstart := bg_hstart - 1;
					bg_hstop  := bg_hstop -  1;
					count :=0;
			else
				count := count+1;
			end if;
			
			if count_2 >= 500000000 then
					speed := speed + 1;
					count_2 :=0;
					score <= score +1;
				
			else
				count_2 := count_2+1;
			end if;
			
			---- restating the background loop
			if  bg_hstart <= (hfp+hsp+hbp) then
				bg_hstart := hend - bg_width;
			end if;
			if  bg_hstop <= (hfp+hsp+hbp+bg_width) then
				bg_hstop := hend;
			end if;
			
			
			if  obstacle_hstart <= (hfp+hsp+hbp) then
				obstacle_hstart := hend - obstacle_width;
			end if;
			if  obstacle_hstop <= (hfp+hsp+hbp+obstacle_width) then
				obstacle_hstop := hend;
			end if;
			
			
		---	if  bg_hstart <= 0 then
	--			bg_hstart := (hfp+hsp+hbp+hva);
		--	end if;
		--	if  bg_hstop <= 0 then
		--		bg_hstop := (hfp+hsp+hbp+hva);
		--	end if;
			-- When horizontal position counter gets to the last pixel in a row, go back
			-- to zero and increment the vertical counter (i.e. go to start of next line)
			
			if hposition >= (hfp+hsp+hbp+hva) then
				hposition <= 0;
				-- when vertical position counter gets to the end of rows, go back to the
				-- start of the first row
				if vposition >= (vfp+vsp+vbp+vva) then
					vposition <= 0;
				else
					vposition <= vposition + 1;
				end if;
			end if;
			
			
			-- Generate horizontal synch pulse whenever the hposition is between the front
			-- porch and the back porch
			if (hposition >= hfp) and (hposition < (hfp+hsp)) then
				hsync <= '0';
			else
				hsync <= '1';
			end if;

			-- Generate vertical synch pulse whenever the vposition is between the front
			-- porch and the back porch
			if (vposition >= vfp) and (vposition < (vfp+vsp)) then
				vsync <= '0';
			else
				vsync <= '1';
			end if;
			
			
			
			
			if ((hposition >= bg_hstart and hposition <= bg_hstop) and (vposition >= bg_vstart and vposition <= bg_vstop)) then
				image_pixel_col := hposition - bg_hstart;
				image_pixel_row := vposition - bg_vstart;
				image_pixel_number := image_pixel_col + image_pixel_row*bg_width;
				bgMem_Address  := to_unsigned(image_pixel_number, bgMem_Address'length);
				bg_address <= std_logic_vector(bgMem_Address);
				r <= bg_data(11 downto 8);
				g <= bg_data(7 downto 4);
				b <= bg_data(3 downto 0);
				-- r <= x"F";
				-- g <= x"F";
				-- b <= x"F";
			else
			   r <= x"0";
		      g <= x"0";
		      b <= x"0";
			end if;
	----- for bg line----------------------------------------------------------------------			
			if ((vposition >= bg_vstart+9 and vposition < bg_vstart+11) and (hposition >=hfp+hsp+hbp  and hposition <= hend )) then
				r <= x"F";
				g <= x"F";
				b <= x"F";
			end if;
		--- for obstacles------------------
		if obstacle_hstart <= (hfp+hsp+hbp+1) and o_count < 2 then
			o_count := o_count + 1;
		elsif obstacle_hstart <= (hfp+hsp+hbp+1) and o_count >= 2 then
			o_count := 0;
		end if;
		
		if o_count = 0 then
			obstacle_width := 30;
			obstacle_vstart := bg_vstart-120;
			if((vposition >= obstacle_vstart and vposition <= vbottom) and (hposition >= obstacle_hstart and hposition < obstacle_hstop )) then
				r <= x"F";
				g <= x"F";
				b <= x"F";			
			end if;
		elsif o_count = 1 then
			obstacle_width := 70;
			obstacle_vstart := bg_vstart-90;
			if((vposition >= obstacle_vstart and vposition <= vbottom) and (hposition >= obstacle_hstart and hposition < obstacle_hstop )) then
				r <= x"F";
				g <= x"F";
				b <= x"F";			
			end if;
		elsif o_count = 2 then
			obstacle_width := 90;
			obstacle_vstart := bg_vstart-50;
			if((vposition >= obstacle_vstart and vposition <= vbottom) and (hposition >= obstacle_hstart and hposition < obstacle_hstop )) then
				r <= x"F";
				g <= x"F";
				b <= x"F";			
			end if;
		end if;	
		
--			object_vstart <= object_vstart-20 when (moveUp'event and moveUp = '1') else object_vstart;
		
		------- Player Object--------------
		
		if((vposition >= object_vstart and vposition <= object_vstop) and (hposition >= hstart+30 and hposition < hstart+70 )) then
				r <= x"F";
				g <= x"F";
				b <= x"F";			
			end if;
			
	---------- Collision Detection---------------------		
		if((object_vstop >= obstacle_vstart) and (obstacle_hstart < hstart+70)) then
		  score <= "0000";
		  speed := 1;
		  obstacle_hstart := hend - obstacle_width;
	     obstacle_hstop  := hend;
--				if((vposition >= object_vstart and vposition <= object_vstop) and (hposition >= hstart+30 and hposition < hstart+70 )) then
--				r <= x"F";
--				g <= x"F";
--				b <= x"F";			
--			end if;
		end if;
		
		end if;
			
	if rising_edge(moveUp) then
			object_vstart := object_vstart-170;	
			
			if  object_vstart <= vbottom-360 then
				object_vstart := vbottom-75;
			end if;
		
	end if;
	
	end process;

	

	
end architecture display;