entity Testbench is
end Testbench;

architecture tb of Testbench is

signal x, y : bit_vector(15 downto 0); -- inputs
signal s0,s1 : bit; -- inputs
signal result : bit_vector(15 downto 0); -- outputs
signal carry, zero_bit : bit; -- outputs


component ALU is
port (A, B: in bit_vector(15 downto 0); sel0, sel1: in bit; R: buffer bit_vector(15 downto 0); C, z: out bit);
end component;


begin
-- Connecting test bench signals with ALU 
dut_instance: ALU
port map (A => x, B => y, sel0 => s0, sel1 => s1, R => result, C => carry, z => zero_bit);

process-- inputs
begin

--both inputs are zeroes
x <= "0111111111111111";
y <= "0111111111111111";
s0 <= '1';
s1 <= '0';

wait for 5 ns;
--both inputs are zeroes
x <= "0000000000000000";
y <= "0000000000000000";
s0 <= '0';
s1 <= '0';

wait for 5 ns;

x <= "0000000000000000";
y <= "0000000000000000";
s0 <= '1';
s1 <= '0';

wait for 5 ns;

x <= "0000000000000000";
y <= "0000000000000000";
s0 <= '0';
s1 <= '1';

wait for 5 ns;

x <= "0000000000000000";
y <= "0000000000000000";
s0 <= '1';
s1 <= '1';

wait for 5 ns;


--both inputs are ones

x <= "1111111111111111";
y <= "1111111111111111";
s0 <= '0';
s1 <= '0';

wait for 5 ns;

x <= "1111111111111111";
y <= "1111111111111111";
s0 <= '1';
s1 <= '0';

wait for 5 ns;

x <= "1111111111111111";
y <= "1111111111111111";
s0 <= '0';
s1 <= '1';

wait for 5 ns;

x <= "1111111111111111";
y <= "1111111111111111";
s0 <= '1';
s1 <= '1';

wait for 5 ns;

-- one positive and one negative input
x <= "1001100010000100";
y <= "0100100001001100";
s0 <= '0';
s1 <= '0';

wait for 5 ns;

x <= "1001100010000100";
y <= "0100100001001100";
s0 <= '1';
s1 <= '0';

wait for 5 ns;

x <= "1001100010000100";
y <= "0100100001001100";
s0 <= '0';
s1 <= '1';

wait for 5 ns;

x <= "1001100010000100";
y <= "0100100001001100";
s0 <= '1';
s1 <= '1';

wait for 5 ns;

-- both positive inputs

x <= "0101101010010100";
y <= "0100101001001101";
s0 <= '0';
s1 <= '0';

wait for 5 ns;

x <= "0101101010010100";
y <= "0100101001001101";
s0 <= '1';
s1 <= '0';

wait for 5 ns;

--both negative inputs

x <= "1101101010010100";
y <= "1100101010001111";
s0 <= '0';
s1 <= '0';

wait for 5 ns;

x <= "1101101010010100";
y <= "1100101010001111";
s0 <= '1';
s1 <= '0';

wait for 5 ns;



end process;

end tb ;