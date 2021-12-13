{ lib, pkgs }:

pkgs.python3Packages.buildPythonPackage rec {
  pname = "fontmake";
  version = "3.0.0";

  src = pkgs.python3Packages.fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "sha256-hkmDy2Nsc51z3IWfBRinSAzs3QYeKzSE4bRXtdt+yq4=";
  };

  doCheck = false;

  # build time deps
  nativeBuildInputs = [ pkgs.python3Packages.setuptools-scm ];

  propagatedBuildInputs = [
    ufo2ft
  ];

  # src = pkgs.fetchFromGitHub {
  #   owner = "googlefonts";
  #   repo = "fontmake";
  #   rev = "v3.0.0";
  #   sha256 = "sha256-nUI9kDXFEy55vPHogSLD4fSinnDH5vzUB2SGWO6iY0k=";
  # };

  # meta = with lib; {
  #   homepage = "http://github.com/googlefonts/fontmake/";
  #   description = "fontmake compiles fonts from various sources (.glyphs, .ufo, designspace) into binaries (.otf, .ttf). You can use it to create static instances and variable fonts.";
  #   licenses = ["Apache-2.0"];
  # };
}
