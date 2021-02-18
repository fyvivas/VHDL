library ieee;
use ieee.std_logic_1164.all;
use ieee. numeric_std.all;

entity full_adder_4bits is
	port
	(
		-- Input ports
		A, B	: in  std_logic_vector(3 downto 0);

		-- Output ports
		Sum	: out std_logic_vector(3 downto 0);
		Cout	: out std_logic
	);
end full_adder_4bits;


architecture full_adder_4bits_arch of full_adder_4bits is

	component full_adder
		port (A, B, Cin    : in std_logic;
			Sum, Cout   : out std_logic);
	end component;
	-- Declarations
	signal C1, C2, C3: std_logic;
	--constant add : std_logic := '0';
	
begin

	FA0 : full_adder port map (A(0), B(0), '0', Sum(0), C1);
	FA1 : full_adder port map (A(1), B(1), C1, Sum(1), C2);
	FA2 : full_adder port map (A(2), B(2), C2, Sum(2), C3);
	FA3 : full_adder port map (A(3), B(3), C3, Sum(3), Cout);
	
end full_adder_4bits_arch;
