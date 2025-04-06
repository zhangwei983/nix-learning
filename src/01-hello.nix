# nix-instantiate --eval src/01-hello.nix

let
  msg = "hello world";
in 
  msg
