{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./hardware-configuration.nix
  ];
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  hardware.opengl.driSupport = true;
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
  hardware.steam-hardware.enable = true; # for vr stuff
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
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "docker" "power" ];
    shell = pkgs.fish;
  };
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

  system.stateVersion = "20.09";

}
