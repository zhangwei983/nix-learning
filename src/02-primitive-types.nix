# nix-instantiate --eval --strict --json src/02-primitive-types.nix | jq

let
  a = "1";
in {
  type_01_str_double_quotes = "foo bar \r \t \n \\ \${";
  type_02_str_with_interpolation = "a: ${a}";
  type_03_str_two_single_quotes = ''
    foo bar
    \n \t \r
    baz
  '';

  type_04_str_url = https://rectcircle.cn;
  type_05_num_int = 1;
  type_06_num_float = 1.1;
  type_07_num_e = .27e13;

  type_08_path_abs_path = /bin/sh;
  type_09_path_rel_path1 = ./dependent_path/a;
  type_10_path_rel_path2 = dependent_path/a;
  type_11_path_home_path = ~/.bashrc;

  type_12_bool_true = true;
  type_13_bool_false = false;

  type_14_null = null;
}
