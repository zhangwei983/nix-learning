# nix-instantiate --eval --strict --json src/08-error-handling.nix | jq

let
  divide = a: b: assert (b != 0); a / b;
in {
  divide_01 = divide 4 2;
  divide_02 = builtins.tryEval (divide 4 0);
  divide_03 = builtins.tryEval (divide 4 2);
  # divide_04 = builtins.tryEval (4 / 0); # dividing by zero cannot be caught.
  throw_05 = builtins.tryEval (builtins.throw "error");
  # abort_06 = builtins.tryEval (builtins.abort "error"); # abort cannot be caught.
}
