{ config, pkgs, ... }:

{
  programs.urxvt = {
    enable = true;
    fonts = [
      "xft:Hack:pixelsize=16"
      "xft:Inconsolatas\\ for\\ Powerline:pixelsize=16"
    ];
    iso14755 = false;
    keybindings = {
      "End" = "\\033OF";
      "Home" = "\\033OH";
      "Shift-k" = "\\033[1;2A";
      "Shift-j" = "\\033[1;2B";
      "Shift-l" = "\\033[1;2C";
      "Shift-h" = "\\033[1;2D";
      "Control-k" = "\\033[1;5A";
      "Control-j" = "\\033[1;5B";
      "Control-l" = "\\033[1;5C";
      "Control-h" = "\\033[1;5D";
      "Shift-Control-C" = "eval:selection_to_clipboard";
      "Shift-Control-V" = "eval:paste_clipboard";
    };
    scroll.bar.enable = false;
    extraConfig = {
      perl-ext = "default,matcher,clipboard-osc";
      depth = 24;
      cursorUnderline = true;
      url-launcher = "${pkgs.firefox}/bin/firefox";
      "matcher.button" = 1;
      letterSpace = -1;
      iso14755_52 = false;
      termName = "xterm-256color";
      imLocale = "en_US.UTF-8";
      internalBorder = 20;

    };
  };
}
