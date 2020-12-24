{ config, pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./cava.nix
    ./feh.nix
    ./firefox.nix
    ./fish.nix
    ./git.nix
    ./htop.nix
    ./jq.nix
    ./neofetch.nix
    ./node.nix
    ./obs-studio.nix
    ./ranger.nix
    ./rofi.nix
    ./urxvt.nix
    ./kitty.nix
    ./neovim.nix
  ];
}
