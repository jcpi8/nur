{ stdenv
, lib
, fetchFromGitHub
, openssl
, qttools
, boost
, qtbase
, qtsvg
, qtimageformats
, qtmultimedia
, pkg-config
, wrapQtAppsHook
, cmake
, libsecret }:
stdenv.mkDerivation rec {
  pname = "chatterino7";
  version = "7.4.2";
  src = fetchFromGitHub {
    owner= "SevenTV";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-WHdrFUTTuPN+U9BIsE6Ht2EdwIqWfVJzlwDg0Bwvr/w=";
    fetchSubmodules = true;
  };
  nativeBuildInputs = [ libsecret pkg-config wrapQtAppsHook ];
  buildInputs = [ cmake qtimageformats qttools qtbase qtsvg qtmultimedia openssl boost ];
  meta = with lib; {
    description = "Dedicated twitch chat client, with experimental support for 7TV emotes.";
    longDescription = ''
      Chatterino7 is a Chatterino2 fork that supports 7TV emotes.  Since it
      largely uses the codebase of Chatterino2, it reuses the settings set by
      Chatterino2. This makes it easy to switch-in and switch-out.
    '';
    homepage = "https://www.github.com/SevenTV/chatterino7";
    license = licenses.mit;
    # After viewing the chatterino2 package, it seems like I'm missing some of
    # the niceties offered to MacOS.
    platforms = platforms.linux;
    mainProgram = "chatterino";
  };
}
