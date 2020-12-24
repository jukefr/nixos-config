{ config, pkgs, ... }:

{
  imports = [ ./dunst.nix ./redshift.nix ./picom.nix ./polybar.nix ./i3.nix ];
}
