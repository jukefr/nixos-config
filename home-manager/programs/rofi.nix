{ config, pkgs, ... }:

{
  programs.rofi =
    let
      cfg =
        if builtins.getEnv "CURRENT_HOST" == "surface"
        then {
          theme = ./rofi-surface.rasi;
        }
        else {
          theme = ./rofi.rasi;
        };
    in
    {
      enable = true;
      theme = cfg.theme;
    };
}
