library IEEE;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;


entity codec is
	port
	(
		-- Input ports
		A, B, C, D	: in  std_logic;
		-- Output ports
		Y, Z	: out std_logic
	);
end codec;


architecture arch_codec of codec is

	signal yz: std_logic_vector(1 downto 0); -- Declarations (optional)

begin

	-- Conditional Signal Assignment (optional)
	
	cond_codec: yz <= 
		"00" when (A='1' and B='0' and C='0' and D='0') else
		"01" when (A='0' and B='1' and C='0' and D='0') else 
		"10" when (A='0' and B='0' and C='1' and D='0') else
		"11" when (A='0' and B='0' and C='0' and D='1') else
		"00";

-- 	yz <= "00" when (A='1' and B='0' and C='0' and D='0') else
--			"01" when (A='0' and B='1' and C='0' and D='0') else 
--			"10" when (A='0' and B='0' and C='1' and D='0') else
--			"11" when (A='0' and B='0' and C='0' and D='1') else
--			"00";

-- 	yz <= "00" when (A='1' and B='0' and C='0' and D='0') else
--			"01" when (A='0' and B='1' and C='0' and D='0') else 
--			"10" when (A='0' and B='0' and C='1' and D='0') else
--			"11" when (A='0' and B='0' and C='0' and D='1');

-- 	yz <= "00" when (A='1' and B='0' and C='0' and D='0') else
--			"01" when (A='0' and B='1' and C='0' and D='0') else 
--			"10" when (A='0' and B='0' and C='1' and D='0') else
--			"11";

		
		
	Y <= yz(1);
	Z <= yz(0);
	
end arch_codec;

