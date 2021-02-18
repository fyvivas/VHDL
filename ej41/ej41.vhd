library ieee;
use ieee.std_logic_1164.all;
use ieee. numeric_std.all;

entity INV1 is
	port
	(
		-- Input ports
		A	: in  bit;
		-- Output ports
		F	: out bit
	);
end INV1;


architecture INV1_arch of INV1 is

begin
	F <= not A after 1ns;
end INV1_arch;


entity AND3 is
	port
	(
		-- Input ports
		A, B, C	: in  bit;
		-- Output ports
		F	: out bit
	);
end AND3;

entity OR3 is
	port
	(
		-- Input ports
		A, B, C	: in  bit;
		-- Output ports
		F	: out bit
	);
end OR3;


entity ej41 is
	port
	(
		-- Input ports
		A, B, C	: in  bit;
		-- Output ports
		F	: out bit
	);
end ej41;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture ej41_arch of ej41 is

	-- Declarations (optional)
	component INV1
		port
		(
			A	: in  bit;
			F	: out bit
		);
	end component;

	component AND3
		port
		(
			A, B, C	: in  bit;
			F	: out bit
		);
	end component;

	component OR3
		port
		(
			A, B, C	: in  bit;
			F	: out bit
		);
	end component;

	signal An, Bn, Cn : bit;
	signal m0, m2, m6 : bit;
	
	
begin

	U1 : INV1 port map (A=>A, F=>An);

end ej41_arch;

