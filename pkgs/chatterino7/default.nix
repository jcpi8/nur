{ stdenv
# FIXME fetchFromGithub is supposed to use fetchgit as a fallback
#       Doesn't work.
# , fetchFromGitHub
, lib
, fetchgit
, fetchFromGitHub
, openssl
, boost
, qtbase
, qtsvg
, qtmultimedia
, pkg-config
, wrapQtAppsHook
, qmake
, cmake }:
stdenv.mkDerivation rec {
  pname = "chatterino7";
  version = "7.4.0";
  src = fetchFromGitHub {
  # src = fetchgit {
    owner= "SevenTV";
    repo = pname;
    # url = "https://github.com/SevenTV/chatterino7";
    rev = "v${version}";
    sha256 = "sha256-F0Cs115C/N9Ul5L992e6Jwe976Pk2Qy6ZKIUA4RVgDg=";
    fetchSubmodules = true;
  };
  qmakeFlags = "-makefile";
  nativeBuildInputs = [ pkg-config wrapQtAppsHook ];
  buildInputs = [ cmake qtbase qtsvg qtmultimedia openssl boost  ];
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
