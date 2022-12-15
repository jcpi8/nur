{ mkDerivation
# FIXME fetchFromGithub is supposed to use fetchgit as a fallback
#       Doesn't work.
# , fetchFromGitHub
, qtbase
, qtsvg
, qtmultimedia
, qmake
, wrapQtAppsHook
, lib
, fetchgit
, openssl
, boost
, cmake
, stdenv
# , qt5
, pkg-config }:
mkDerivation {
  name = "chatterino7";
  version = "v7.4.0";
  #src = fetchFromGitHub {
  src = fetchgit {
    url = "https://github.com/SevenTV/chatterino7";
    rev = "v7.4.0";
    sha256 = "sha256-F0Cs115C/N9Ul5L992e6Jwe976Pk2Qy6ZKIUA4RVgDg=";
    fetchSubmodules = true;
  };
  nativeBuildInputs = [ qmake pkg-config wrapQtAppsHook ];
  buildInputs = [ openssl boost qtbase qtsvg qtmultimedia ];
  meta = with lib; {
    description = "Twitch client, Chatterino2 fork that supports 7TV emotes.";
    homepage = "https://www.github.com/SevenTV/chatterino7";
    license = licenses.mit;
    platforms = platforms.all;
    broken = true;
    # QtWebkit upstream is unmaintained and receives no security updates, see
    # https://blogs.gnome.org/mcatanzaro/2022/11/04/stop-using-qtwebkit/
  };
}
