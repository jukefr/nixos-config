{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ nodejs yarn ];

  home.file = {
    ".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
    '';
  };
}
