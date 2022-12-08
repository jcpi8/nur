{ stdenv, fetchFromGitHub, ncurses, yacc }:
stdenv.mkDerivation {
  pname = "sc";
  version = "git";
  src = fetchFromGitHub {
    repo = "sc";
    owner = "n-t-roff";
    rev = "b2df04230ec5ac7eef5c16cfdf629ebd5da4bfe2";
    sha256 = "sha256-GJbqfHG5uEemNSPmN86pFy2VbYuFX+mAsR9IylyvAZc=";
  };

  buildInputs = [ yacc ];
  nativeBuildInputs = [ ncurses ];

  # Wierd because prefix isn't set until makefile is run.
  # Other scripts use configure to set the prefix, but sc seems to not accept
  # the `--prefix` argument in the configure script.
  installFlags=[ "prefix=$(out)"];
  # configurePhase = "mkdir -p $out; ./configure";
  configurePhase = "./configure";
  outputs = [ "out" ];
}
