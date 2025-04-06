# nix-instantiate --eval --strict --json src/04-function.nix | jq

let
  add_one = a: a + 1;
  add = a: b: a + b;
  add_two = add 2;
  add_attrs = {a, b}: a + b;
  add_attrs_default = {a, b ? 2}: a + b;
  add_attrs_extra = {a, b, ...}: a + b;
  add_attrs_at = attrs@{a, b, ...}: a + attrs.b + attrs.c;
in { 
  result_01 = add_one 1;
  result_02 = add 1 2;
  result_03 = add_two 1;
  result_04 = add_attrs {a = 1; b = 2;};
  result_05 = add_attrs_default {a = 1;};
  result_06 = add_attrs_default {a = 1; b = 3;};
  result_07 = add_attrs_extra {a = 1; b = 2; c = 3;};
  result_08 = add_attrs_at {a = 1; b = 2; c = 3;};
}
