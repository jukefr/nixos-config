{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Kevin Jullien";
    userEmail = "git@juke.fr";
    extraConfig = { core = { editor = "nvim"; }; };
  };
}
