# shell.nix
{ pkgs ? import <nixpkgs> {} }:
let
  # fontmake-pkg = pkgs.callPackage ./fontmake.nix {};
  my-python = pkgs.python3;
  my-fontforge = pkgs.fontforge.override { withGTK = true; };
  python-with-my-packages = my-python.withPackages (p: with p; [
    fonttools
    pip
    # fontmake-pkg
    # other python packages you want
  ]);
in
# pkgs.mkShell {
#   buildInputs = [
#     python-with-my-packages
#     pkgs.harfbuzz
#     pkgs.fontforge
#     # other dependencies
#   ];
#   shellHook = ''
#     PYTHONPATH=${python-with-my-packages}/${python-with-my-packages.sitePackages}
#     # maybe set more env-vars
#   '';
# }


(pkgs.buildFHSUserEnv {
  name = "hoi-experiment";
  targetPkgs = pkgs: (with pkgs;
    [ harfbuzz
      my-fontforge
      python-with-my-packages
    ]) ++ (with pkgs.xorg;
    [ ]);
  multiPkgs = pkgs: (with pkgs;
    [ ]);
  runScript = "bash";
}).env
