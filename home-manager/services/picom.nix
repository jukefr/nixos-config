{ config, pkgs, ... }:

{
  services.picom = {
    experimentalBackends = true;
    enable = true;
    backend = "glx"; # buggy with glx sadly
    vSync = true;
    shadow = true;
    shadowOffsets = [ 8 8 ];
    shadowOpacity = "0.5";
    shadowExclude =
      [ "class_g = 'Dunst'" "class_g = 'wow.exe'" "class_g = 'Polybar'" ];
  };
}
