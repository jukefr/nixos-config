{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    #../nixos-surface/builder.nix 
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = "options kvm_intel nested=1";
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
  services.xserver.enable = true;
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.desktopManager.session = [{
    name = "i3-gaps";
    start = ''
      ${pkgs.runtimeShell} $HOME/.xsession &
      waitPID=$!
    '';
  }];
  networking.hostName = "nixos";
  time.timeZone = "Europe/Paris";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.layout = "us";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "docker" "power" ];
    shell = pkgs.fish;
  };
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;
  fonts.enableDefaultFonts = true;
  services.sshd.enable = true;
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
