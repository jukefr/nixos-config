{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "jukefr";
    userEmail = "gh@juke.fr";
    signing = {
      key = "DA196F75E61208AF";
      signByDefault = true;
    };
    extraConfig = { core = { editor = "nvim"; }; pull = { rebase = false; }; };
  };
}
