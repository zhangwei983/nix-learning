# nix-instantiate --eval --strict src/03-rec.nix

let
  set = rec {
    one = 1;
    two = one + 1;
    three = two + 1;
  };
in {
  inherit (set) three two;
}
