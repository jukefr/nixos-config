{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "user";
  home.homeDirectory = "/home/user";
  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    MOZ_USE_XINPUT2 = 1;
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
  };

  manual.html.enable = true;

  home.packages = with pkgs; [
    awscli
    tigervnc
    xss-lock
    bless
    i3lock
    binutils
    bluez
    bluez-alsa
    bluez-tools
    tmux
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
    openvpn
    hexyl
    noip
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
    [
      ./wallpaper.nix
      ./xresources.nix
      ./xsession.nix
      ./programs
      ./services
      ../../nixos-config-private/aws.nix
      ../../nixos-config-private/ssh.nix
      ../../nixos-config-private/npm.nix

    ];

  home.stateVersion = "21.03";
}
