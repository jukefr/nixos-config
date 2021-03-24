{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> { config = { }; };
in {
  home.packages = with pkgs; [
    unstable.nodejs-15_x
    yarn
  ];
}
