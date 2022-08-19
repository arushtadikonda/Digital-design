entity onebitxorgate is
	port( x_xor,y_xor: in bit;z_xor: out bit);
end onebitxorgate;

architecture behaviour of onebitxorgate is 

begin
z_xor <= x_xor xor y_xor ;

end behaviour; 