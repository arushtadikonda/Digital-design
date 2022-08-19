entity node_op is
port (g_in1,g_in2,p_in1,p_in2: in bit; g_out,p_out: out bit);
end entity node_op;


architecture Struct of node_op is


begin

p_out<= (p_in1 and p_in2);

g_out <= (g_in1 or (p_in1 and g_in2));

end Struct;