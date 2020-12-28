{ config, pkgs, ... }:

{

  boot.loader.grub = {
     devices = [ "nodev"];
     efiSupport = true;
     enable = true;
     font = "${pkgs.hack-font}/share/fonts/hack/Hack-Regular.ttf";
     };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.extraModprobeConfig = "options kvm_intel nested=1";
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.background = ../wallpapers/lockscreen-image;
  services.xserver.displayManager.lightdm.greeters.mini.enable = true;
  services.xserver.displayManager.lightdm.greeters.mini.user = "user";
  services.xserver.displayManager.lightdm.greeters.mini.extraConfig = ''
    [greeter-theme]
    window-color = "#bd93f9"
  '';
  services.xserver.desktopManager.xterm.enable = false;
  services.xserver.desktopManager.session = [{
    name = "i3-gaps";
    start = ''
      ${pkgs.runtimeShell} $HOME/.xsession &
      waitPID=$!
    '';
  }];
}
