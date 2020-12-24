{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [ ranger atool ];
    file = {
      ".config/ranger/rc.conf".text = ''
        set preview_images true
        set preview_images_method kitty
        set show_hidden true
        map DD shell mv %s ${config.home.homeDirectory}/.local/share/Trash/files/
      '';
    };
  };
}
