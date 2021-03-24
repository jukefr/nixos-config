{ config, pkgs, ... }:

{
  imports = [
    ./filesystems.nix
    ./boot-grub.nix
    ./hardware-configuration.nix
    ./ledger.nix
  ];
  #boot.kernelPackages = pkgs.linuxPackages_5_4;
  #boot.extraModulePackages = [ v4l2loopback-dc ];

  services.openssh.permitRootLogin = "no";
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  services.openssh.forwardX11 = true;
  hardware.opengl.driSupport = true;
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
  environment.systemPackages = with pkgs; [
    (steam.override { extraPkgs = pkgs: [ mono gtk3 gtk3-x11 libgdiplus zlib ]; nativeOnly = true; }).run
    ntfs3g
    #droidcam
  ];
  services.gnome3.gnome-keyring.enable = true;
  hardware.steam-hardware.enable = true; # for vr stuff
  programs.steam.enable = true;
  environment.pathsToLink = [ "/libexec" ];
  networking.hostName = "nixos";
  time.timeZone = "Europe/Paris";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.layout = "us";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  services.fail2ban.enable = true;

  users.groups.plugdev = { };
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "docker" "power" "plugdev" ];
    shell = pkgs.fish;
  };
  nix.trustedUsers = [
    "root"
    "user"
    "@wheel"
  ];
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  fonts.enableDefaultFonts = true;
  services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;
  fonts.fonts = with pkgs; [ hack-font powerline-fonts terminus_font siji ];
  networking.hosts = {
    "127.0.0.1" = [
      "front.cs"
      "bo.cs"
      "monolith.cs"
      "qe.cs"
      "es.cs"
      "amqp.cs"
      "tika.cs"
      "minio.cs"
    ];
  };

  fileSystems."/home/user/repositories/fr/2b2t/backup" =
  { device = "/dev/sdd1";
    fsType = "ext4";
  };


  system.stateVersion = "20.09";

}
