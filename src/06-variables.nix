# nix-instantiate --eval --strict --json src/06-variables.nix | jq

let
  a = 1;
  b = 2;
  attrs_01 = {
    x = 3;
    y = 4;
  };
  attrs_02 = {
    m = 5;
    n = 6;
  };
in with attrs_02; {
  inherit a b; # inherit variables, equivalent to `a = a; b = b;`.
  inherit (attrs_01) x y; # inherit attributes, equivalent to `x = attrs_01.x; y = attrs_01.y;`.
  m = m;
  inherit n;
}
