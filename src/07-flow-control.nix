# nix-instantiate --eval --strict --json src/07-flow-control.nix | jq

let
  x = 1;
  list = [1 2 3 4 5];
in {
  x_greater_than_0 = if x > 0 then "x > 0" else "x <= 0";
  filter_map = builtins.map (x: x * 2) (builtins.filter (x: x > 2) list);
}
