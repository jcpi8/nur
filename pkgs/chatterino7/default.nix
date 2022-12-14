{ stdenv
# FIXME fetchFromGithub is supposed to use fetchgit as a fallback
#       Doesn't work.
# , fetchFromGitHub
, fetchgit
, openssl
, boost
, qt5
, pkg-config
, cmake }:
stdenv.mkDerivation {
  name = "chatterino7";
  version = "v7.4.0";
  #src = fetchFromGitHub {
  src = fetchgit {
    url = "https://github.com/SevenTV/chatterino7";
    rev = "v7.4.0";
    sha256 = "sha256-F0Cs115C/N9Ul5L992e6Jwe976Pk2Qy6ZKIUA4RVgDg=";
    fetchSubmodules = true;
  };
  buildInputs = [ openssl boost qt5.full pkg-config cmake ];
}
