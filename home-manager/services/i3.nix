{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
  ];
  xsession.windowManager.i3 =
    let
      cfg =
        if builtins.getEnv "CURRENT_HOST" == "surface"
        then {
          inner = 10;
          outer = 0;
          xrandr = "xrandr --output eDP1 --auto --primary";
          extra = ''
            workspace 1 output eDP1
          '';
        }
        else {
          inner = 50;
          outer = 10;
          xrandr = "xrandr --output DP-2 --auto --primary --below DP-4";
          extra = ''
            workspace 1 output DP-2
            workspace 2 output DP-4
          '';
        };
    in
    {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = "Mod1";
        gaps = {
          inner = cfg.inner;
          outer = cfg.outer;
        };
        bars = [ ];
        colors = {
          background = "#F8F8F2";
          focused = {
            border = "#6272A4";
            background = "#6272A4";
            text = "#F8F8F2";
            indicator = "#6272A4";
            childBorder = "#6272A4";
          };
          focusedInactive = {
            border = "#44475A";
            background = "#44475A";
            text = "#F8F8F2";
            indicator = "#44475A";
            childBorder = "#44475A";
          };
          unfocused = {
            border = "#282A36";
            background = "#282A36";
            text = "#BFBFBF";
            indicator = "#282A36";
            childBorder = "#282A36";
          };
          urgent = {
            border = "#44475A";
            background = "#FF5555";
            text = "#F8F8F2";
            indicator = "#FF5555";
            childBorder = "#FF5555";
          };
          placeholder = {
            border = "#282A36";
            background = "#282A36";
            text = "#F8F8F2";
            indicator = "#282A36";
            childBorder = "#282A36";
          };
        };
        floating = {
          criteria = [
            { class = "battle.net.exe"; }
            { class = "explorer.exe"; }
            { class = "tsmapplication.exe"; }
          ];
        };
        startup = [
          {
            command = "${cfg.xrandr}";
            always = true;
            notification = false;
          }
          {
            command = "xset dpms 0 0 300";
            always = true;
            notification = false;
          }
          {
            command = "systemctl --user restart picom";
            always = true;
            notification = false;
          }
          {
            command = "systemctl --user restart dunst";
            always = true;
            notification = false;
          }
          {
            command = "systemctl --user restart redshift";
            always = true;
            notification = false;
          }
          {
            command = "systemctl --user restart polybar";
            always = true;
            notification = false;
          }
          {
            command =
              "${pkgs.feh}/bin/feh --no-fehbg --bg-tile '${config.home.homeDirectory}/.background-image'";
            always = true;
            notification = false;
          }
        ];
        terminal = "kitty";
        window = { border = 3; };
        menu = ''"${pkgs.rofi}/bin/rofi -modi drun,run -show drun"'';
        keybindings =
          let modifier = config.xsession.windowManager.i3.config.modifier;
          in
          pkgs.lib.mkOptionDefault {
            "${modifier}+q" = "kill";
            "${modifier}+h" = "move left";
            "${modifier}+j" = "move down";
            "${modifier}+k" = "move up";
            "${modifier}+l" = "move right";
            "${modifier}+c" = "split h";
            "${modifier}+space" = "floating toggle";
            "${modifier}+Escape" =
              "exec ${pkgs.scrot}/bin/scrot ${config.home.homeDirectory}/screenshots/`date +%Y-%m-%d_%H:%M:%S`.png";

          };
          keycodebindings =  pkgs.lib.mkOptionDefault {
              "232" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 10%-";
              "233" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +10%";
              "121" = "exec ${pkgs.alsaUtils}/bin/amixer set Master toggle";
              "122" = "exec ${pkgs.alsaUtils}/bin/amixer set Master 10%-";
              "123" = "exec ${pkgs.alsaUtils}/bin/amixer set Master 10%+";
            };
      };
      extraConfig = "${cfg.extra}";
    };
}
