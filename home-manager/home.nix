{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "user";
  home.homeDirectory = "/home/user";
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    awscli
    binutils
    docker-compose
    ctags
    etcd
    fd
    hugo
    gimp
    google-chrome # only for ms teams...
    gnumake
    grpc
    gcc
    gparted
    hexyl
    imagemagick
    jetbrains.webstorm
    lutris
    lxappearance
    pavucontrol
    python
    rclone
    ripgrep
    scrot
    spotify
    steam
    stow
    thefuck
    tldr
    transmission
    unzip
    virt-manager
    vlc
    wget
    xclip
  ];

  imports =
    [ ./systemd.nix ./xresources.nix ./xsession.nix ./programs ./services ];

  home.stateVersion = "21.03";
}
