{ pkgs ? import <nixpkgs> { } }:

{
  # The `lib`, `modules`, and `overlay` names are special
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  sc = pkgs.callPackage ./pkgs/sc { };
  chatterino7 = pkgs.libsForQt5.callPackage ./pkgs/chatterino7 { };
}
