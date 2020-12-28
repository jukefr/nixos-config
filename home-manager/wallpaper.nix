{ config, pkgs, ... }:

{
  #home.packages = with pkgs; [ waifu2x-converter-cpp ];
  home.file.".background-image".source = ../wallpapers/background-image;
  #home.file.".background-image".onChange = ''
  #   ${pkgs.waifu2x-converter-cpp}/bin/waifu2x-converter-cpp -i ${config.home.file.".background-image".source} -o ${config.home.homeDirectory}/.background-image2x.png 
  #  '';
  home.file.".lockscreen-image".source = ../wallpapers/lockscreen-image;
}
