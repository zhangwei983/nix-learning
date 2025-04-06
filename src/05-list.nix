# nix-instantiate --eval --strict --json src/05-list.nix |jq

let
  add_attrs = {a, b}: a + b;
  list_01 = [ 123 dependent_path/a "abc" (add_attrs {a = 1; b = 2;}) ];
  list_02 = [ 123 dependent_path/a "abc" add_attrs {a = 1; b = 2;} ];
in {
  list_01 = list_01;
  list_01_length = builtins.length list_01;
  #list_02 = list_02; # error as `add_attrs` cannot be converted to json.
  list_02_length = builtins.length list_02;
}
