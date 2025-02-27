{
  stdenv,
  lib,
}: let
  awesome = ./src;
in
  stdenv.mkDerivation {
    pname = "tawm";
    version = "0.1.0";

    buildCommand = ''
      mkdir -p $out
      cp -r ${awesome}/* "$out/"
    '';

    meta = with lib; {
      description = "tux's awesomeWM config";
      homepage = "https://tux.rs";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
