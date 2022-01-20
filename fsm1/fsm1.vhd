library IEEE;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;


entity fsm1 is
	port
	(
		-- Input ports
		Press	: in  std_logic;
		clk, reset: in std_logic;
		-- Output ports
		Open_CW, Close_CCW	: out std_logic
	);
end fsm1;

architecture arch_fsm of fsm1 is

	--signal D_bus, Q_bus: std_logic_vector(2 downto 0); -- Declarations (optional)
	type State_Type is (w_closed, w_open);
	signal current_state, next_state: State_Type;
	
begin

	STATE_MEMORY : PROCESS (clk, reset) IS
		BEGIN
			IF reset = '0' THEN
           current_state <= w_closed;
         ELSIF clk='1' AND clk'event THEN
           current_state <= next_state;
         END IF;
      END PROCESS;

	
	NEXT_STATE_LOGIC : PROCESS (current_state, Press) IS
		BEGIN
			case(current_state) is
				when w_closed =>
					IF (Press = '1') THEN
						next_state <= w_open;
					ELSE
						next_state <= w_closed;
               END IF;
				when w_open =>
					IF (Press = '1') THEN
						next_state <= w_closed;
					ELSE
						next_state <= w_open;
               END IF;
				when others => next_state <= w_closed;
			END CASE;
		END PROCESS;

	OUTPUT_LOGIC : process (current_state, Press)
		begin
			case (current_state) is
				when w_closed => 	if (Press = '1') then
											Open_CW <= '1'; Close_CCW <= '0';
										else
											Open_CW <= '0'; Close_CCW <= '0';
										end if;
				when w_open => 	if (Press = '1') then
											Open_CW <= '0'; Close_CCW <= '1';
										else
											Open_CW <= '0'; Close_CCW <= '0';
										end if;
				when others => Open_CW <= '0'; Close_CCW <= '0';
			end case;
		end process;

end arch_fsm;
