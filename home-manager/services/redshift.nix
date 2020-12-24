{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    latitude = "48.864716";
    longitude = "2.349014";
    temperature.night = 2500;
  };
}
