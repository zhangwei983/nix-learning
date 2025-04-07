# nix-instantiate --eval --strict --json src/03-attributes.nix | jq

let
  bKey = "b";
  attrs_01 = {
    a = 1;
    ${bKey} = 2;
    "$!@#" = "special"; # special characters are allowed.
    ${null} = true; # null will be skipped.
  };

  attrs_02 = {
    a = attrs_01.a;
    b = attrs_01.${bKey};
    c = attrs_01.c or "c not exists";
    "$!@#" = attrs_01."$!@#";
  };

  attrs_callable_define = { __functor = self: x: x + self.x; };
  attrs_callable = attrs_callable_define // { x = 7; }; # Update the value of `self.x`.

  attrs_rec = rec {
    a = 1;
    b = a + 1;
    c = b + 1;
  };
in {
  attrs_01 = attrs_01;
  attrs_02 = attrs_02;
  attrs_callable = attrs_callable 2;
  attrs_rec = attrs_rec;
}
