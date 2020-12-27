{ config, pkgs, ... }:

{
  home.file.".background-image".source = ../wallpapers/background-image;
  home.file.".lockscreen-image".source = ../wallpapers/lockscreen-image;
}
