# nix-instantiate --eval --strict --json src/10-builtin-fetch.nix | jq
let 
  fetchurl = builtins.fetchurl;
  fetchGit = builtins.fetchGit;
  fetchTarball = builtins.fetchTarball;
in {
  # https://nix.dev/manual/nix/2.24/language/builtins.html#builtins-fetchurl
  demo_01_fetchurl = fetchurl {
    url = "http://ftp.nluug.nl/pub/gnu/hello/hello-2.1.1.tar.gz";
    sha256 = "1md7jsfd8pa45z73bz1kszpp01yw6x5ljkjk2hx7wl800any6465";
  };

  # https://nix.dev/manual/nix/2.24/language/builtins.html#builtins-fetchGit
  demo_02_fetchGit = fetchGit {
    name = "nix-learning";
    url = "https://github.com/zhangwei983/nix-learning.git";
    rev = "548bccfb8b0715abf04a83b8af5bd357b9f3bcee";
    ref = "main";
    shallow = true;
  };

  # https://nix.dev/manual/nix/2.24/language/builtins.html#builtins-fetchTarball
  demo_03_fetchTarball = fetchTarball {
    url = "http://ftp.nluug.nl/pub/gnu/hello/hello-2.1.1.tar.gz";
    sha256 = "1yhzklq58816kik9w8xss481wf9mk8mi9sfvk03ghdxi2q0fi0ci";
  };
}
