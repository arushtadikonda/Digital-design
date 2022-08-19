entity node_init is
port (x, y: in bit; g,p: out bit);
end entity node_init;


architecture Struct of node_init is


begin
-- Propogate.
p<= (x xor y);
-- Generate.
g <= (x and y);
end Struct;