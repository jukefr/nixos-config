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
    tree
    efibootmgr
    dotnet-sdk
    ngrok
    gnome3.gnome-disk-utility
    maven
    ark
    chromium
    dconf
    cargo
    parted
    wimlib
    parted
    zip
    nixpkgs-fmt
    monero-gui
    rmapi
    unp
    openssl
    peek
    dbeaver
    etcher
    ffmpeg
    filezilla
    gnome3.gedit
    gnome3.gnome-screenshot
    gradle
    jetbrains.idea-community
    insomnia
    ledger-live-desktop
    ncdu
    nmap
    jdk11
    unrar
    multimc
    minecraft
    youtube-dl
    awscli
    gifsicle
    piper
    gnome3.nautilus
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
    gimp-with-plugins
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
      #../../nixos-config-private/aws.nix
      #../../nixos-config-private/ssh.nix
      #../../nixos-config-private/npm.nix

    ];

  home.stateVersion = "21.03";
}
