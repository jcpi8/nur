{ stdenv, fetchFromGitHub, ncurses, yacc, lib }:
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
  meta = with lib; {
    description = "Curses-based spreadsheet calculator.";

    longDescription = ''
      This is a fork of the old sc-7.16 application with attention paid to
      reduced compiler warnings, bugfixes, and functionality improvements
      (e.g. mouse suport, configurability via .scrc).
      See CHANGES-git or README.md for a full list of changes.
    '';

    homepage = "https://github.com/n-t-roff/sc";

    # Unsure if n-t-roff considers thier work public domain, no license found
    license = licenses.publicDomain;

    # Might not work on windows, but I do see DOS support in source.
    platforms = platforms.all;
  };
}
