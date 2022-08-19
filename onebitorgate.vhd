entity onebitorgate is
	port( I,J: in bit;K: out bit);
end onebitorgate;

architecture behaviour of onebitorgate is 

begin
K <= I or J ;

end behaviour; 