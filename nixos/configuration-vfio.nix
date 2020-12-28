{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModprobeConfig = "options kvm_intel nested=1";
  boot.kernelParams = [ "pcie_acs_override=downstream,multifunction" "intel_iommu=on" "video=vesafb:off video=efifb:off" "vfio-pci.ids=10de:1b82,10de:10f0" ];
  boot.kernelPatches = [{
    name = "add-acs-overrides";
    patch = ./acs.patch;
  }];
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" ];
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  services.openssh.forwardX11 = true;
  nixpkgs.config.allowUnfree = true;
  boot.kernelModules = [ "kvm-intel" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
  boot.postBootCommands = ''
    DEVS="0000:01:00.0 0000:01:00.1"

    for DEV in $DEVS; do
      echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
    modprobe -i vfio-pci
  '';
  hardware.pulseaudio.support32Bit = true;
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

  system.stateVersion = "20.09";

}
