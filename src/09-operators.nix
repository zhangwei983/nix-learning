# nix-instantiate --eval --strict --json src/09-operators.nix | jq

let
  attrs = {
    x = 1;
  };
  list_01 = [1 2];
  list_02 = [3 4];
in {
  demo_01_attrs_x = attrs ? x;
  demo_02_attrs_y = attrs ? y;
  demo_03_attrs_x_dot_y = attrs ? x.y;

  demo_04_list = list_01 ++ list_02;

  demo_05_str = "hello" + " world";
  demo_06_str = "dependent_path/a" + dependent_path/b;

  # demo_07_path = dependent_path/a + dependent_path/b; # Path does not exist.
  # demo_08_path = dependent_path/a + "dependent_path/b"; # Path does not exist.

  demo_09_attrs = attrs;
  demo_10_attrs = attrs // { y = 2; };

  demo_11 = false -> true; # !false || true
}
