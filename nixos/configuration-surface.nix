{ config, pkgs, ... }:

{
  imports = [
    ./boot-grub.nix
    ./hardware-configuration-surface.nix
    ../../nixos-surface/surface.nix
    ../../nixos-config-private/wifi.nix
  ];
  boot.loader.grub.fontSize = 32;
  networking.wireless.userControlled.enable = true;
  services.xserver.libinput.enable = true;
  networking.enableIPv6 = false;
  networking.nameservers = [ "1.1.1.1" "8.8.8.8" ];
  networking.hostId = "f1250e3b";
  powerManagement.cpuFreqGovernor = "performance";
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  hardware.opengl.driSupport = true;
  nixpkgs.config.allowUnfree = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;
  environment.pathsToLink = [ "/libexec" ];
  services.xserver.enable = true;
  nix.buildMachines = [{
    hostName = "builder";
    system = "x86_64-linux";
    maxJobs = 1;
    speedFactor = 2;
    supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
    mandatoryFeatures = [ ];
  }];
  nix.distributedBuilds = true;
  nix.extraOptions = ''
    builders-use-substitutes = true
  '';
  services.xserver.dpi = 192;
  networking.hostName = "nixos";
  time.timeZone = "Europe/Paris";
  networking.useDHCP = false;
  networking.wireless.enable = true;
  networking.interfaces.wlp1s0.useDHCP = true;
  #networking.interfaces.enp0s20f0u1u4.useDHCP = true;
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.layout = "us";
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" "libvirtd" "docker" "power" ];
  };
  system.autoUpgrade.enable = true;
  services.fail2ban.enable = true;
  system.autoUpgrade.allowReboot = false;
      nixpkgs.config.packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
          inherit pkgs;
        };
      };
 
  environment.systemPackages = [
    pkgs.acpi
    pkgs.acpid
    pkgs.nur.repos.clefru.parsecgaming 	
  ];
  fonts.enableDefaultFonts = true;
  fonts.fonts = with pkgs; [ hack-font powerline-fonts terminus_font siji ];

 services.openssh.enable = true;
  services.openssh.passwordAuthentication = false;
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
