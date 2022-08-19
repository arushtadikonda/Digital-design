 entity onebitandgate is
	port(P,Q : in bit ; R : out bit);
end onebitandgate;

architecture behavofand of onebitandgate is
begin
	R <= P and Q;
end behavofand;