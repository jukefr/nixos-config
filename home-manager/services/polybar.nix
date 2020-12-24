{ config, pkgs, ... }:

{
  services.polybar =
    let
      cfg =
        if builtins.getEnv "CURRENT_HOST" == "surface"
        then {
          fontsize1 = "18;6";
          fontsize2 = "18;4";
          fontsize3 = "18;4";
          barheight = 36;
          script = "MONITOR=eDP1 polybar main &";
          modulesLeft = "i3 separator cpu_i cpu separator memory_i memory separator filesystem_i filesystem";
          modulesRight = "alsa_i alsa separator network_i network separator battery_i battery separator date_i date";
        }
        else {
          fontsize1 = "12;2";
          fontsize2 = "12;2";
          fontsize3 = "12;2";
          barheight = 18;
          script = ''
            MONITOR=DP-2 polybar main &
            MONITOR=DP-4 polybar main &
          '';
          modulesLeft = "i3";
          modulesRight = "alsa_i alsa separator cpu_i cpu separator memory_i memory separator filesystem_i filesystem separator network_i network separator date_i date";
        };
    in
    {
      enable = true;
      package = pkgs.polybar.override {
        i3GapsSupport = true;
        alsaSupport = true;
      };
      config = {
        "global/wm" = {
          margin-bottom = 0;
          margin-top = 0;
        };

        "color" = {
          bg = "#282a36";
          fg = "#282a36";
          fg-alt = "#f8f8f2";
          mf = "#f8f8f2";
          ac = "#6272a4";
          bn = "#308634";
          bm = "#50fa7b";
          bd = "#ff5555";
          trans = "#00000000";
          white = "#f8f8f2";
          black = "#282a36";
          red = "#ff5555";
          pink = "#ff79c6";
          purple = "#bd93f9";
          blue = "#ff79c6";
          cyan = "#8be9fd";
          teal = "#8be9fd";
          green = "#50fa7b";
          lime = "#B9C244";
          yellow = "#f1fa8c";
          amber = "#ffb86c";
          orange = "#ffb86c";
          brown = "#bd93f9";
          grey = "#8C8C8C";
          indigo = "#8be9fd";
          blue-gray = "#44475a";
        };

        "module/alsa" = {
          type = "internal/alsa";
          format-volume = "<label-volume>";
          format-volume-background = "\${color.mf}";
          format-volume-foreground = "\${color.fg}";
          format-volume-padding = 1;
          label-volume = "%percentage%%";
          format-muted-background = "\${color.mf}";
          format-muted-foreground = "\${color.red}";
          format-muted-padding = 1;
          label-muted = "0%";
          label-muted-foreground = "\${color.red}";
        };

        "module/alsa_i" = {
          type = "internal/alsa";
          format-volume = "<ramp-volume>";
          format-volume-background = "\${color.blue}";
          format-volume-foreground = "\${color.fg}";
          format-volume-padding = 1;
          format-muted-background = "\${color.blue}";
          format-muted-foreground = "\${color.red}";
          format-muted-padding = 1;
          label-muted = "";
          label-muted-foreground = "\${color.fg}";
          ramp-volume-0 = "";
          ramp-volume-1 = "";
          ramp-volume-2 = "";
          ramp-volume-3 = "";
          ramp-volume-4 = "";
          ramp-headphones-0 = "";
          ramp-headphones-1 = "";
        };

        "module/cpu" = {
          type = "internal/cpu";
          interval = "0.5";
          format = "<label>";
          format-background = "\${color.mf}";
          format-foreground = "\${color.fg}";
          format-padding = 1;
          label = "%percentage%%";
        };

        "module/cpu_i" = {
          type = "internal/cpu";
          interval = "0.5";
          format = "";
          format-background = "\${color.teal}";
          format-foreground = "\${color.fg}";
          format-padding = 1;
        };

        "module/date" = {
          type = "internal/date";
          interval = "1.0";
          time = "%I:%M %p";
          time-alt = "%Y-%m-%d%";
          format = "<label>";
          format-background = "\${color.mf}";
          format-foreground = "\${color.fg}";
          format-padding = 1;
          label = "%time%";
        };

        "module/date_i" = {
          type = "internal/date";
          interval = "1.0";
          time = "";
          time-alt = "";
          format = "<label>";
          format-background = "\${color.amber}";
          format-foreground = "\${color.fg}";
          format-padding = 1;
          label = "%time%";
        };

        "module/filesystem" = {
          type = "internal/fs";
          mount-0 = "/";
          interval = 10;
          fixed-values = true;
          format-mounted = "<label-mounted>";
          format-mounted-background = "\${color.mf}";
          format-mounted-foreground = "\${color.fg}";
          format-mounted-padding = 1;
          format-unmounted = "<label-unmounted>";
          format-unmounted-background = "\${color.mf}";
          format-unmounted-foreground = "\${color.fg}";
          format-unmounted-padding = 1;
          label-mounted = "%free%";
          label-unmounted = "%mountpoint%: not mounted";
        };

        "module/filesystem_i" = {
          type = "internal/fs";
          mount-0 = "/";
          interval = 10;
          fixed-values = true;
          format-mounted = "";
          format-mounted-background = "\${color.green}";
          format-mounted-foreground = "\${color.fg}";
          format-mounted-padding = 1;
          format-unmounted = "";
          format-unmounted-background = "\${color.red}";
          format-unmounted-foreground = "\${color.fg}";
          format-unmounted-padding = 1;
        };

        "module/i3" = {
          type = "internal/i3";
          pin-workspaces = true;
          strip-wsnumbers = true;
          index-sort = true;
          enable-click = true;
          enable-scroll = true;
          wrapping-scroll = false;
          reverse-scroll = false;
          format = "<label-state> <label-mode>";
          label-focused = "%index%";
          label-focused-foreground = "\${color.fg}";
          label-focused-background = "\${color.ac}";
          label-focused-underline = "\${color.ac}";
          label-focused-padding = 1;
          label-unfocused = "%index%";
          label-unfocused-foreground = "\${color.fg}";
          label-unfocused-background = "\${color.blue-gray}";
          label-unfocused-underline = "\${color.blue-gray}";
          label-unfocused-padding = 1;
          label-visible = "%index%";
          label-visible-underline = "\${color.ac}";
          label-visible-padding = 2;
          label-mode = "%mode%";
          label-mode-padding = 2;
          label-mode-background = "\${color.ac}";
          label-urgent = "%index%";
          label-urgent-foreground = "\${color.fg}";
          label-urgent-background = "\${color.red}";
          label-urgent-padding = 1;
        };

        "module/memory" = {
          type = "internal/memory";
          interval = 3;
          format = "<label>";
          format-background = "\${color.mf}";
          format-foreground = "\${color.fg}";
          format-padding = 1;
          label = "%mb_used%";
        };

        "module/memory_i" = {
          type = "internal/memory";
          interval = 3;
          format = "";
          format-background = "\${color.brown}";
          format-foreground = "\${color.fg}";
          format-padding = 1;
        };

        "module/title" = {
          type = "internal/xwindow";
          format = "<label>";
          format-foreground = "\${color.fg-alt}";
          label = " %title%";
          label-maxlen = 20;
        };

        "module/separator" = {
          type = "custom/text";
          content = "|";
          content-background = "\${color.bg}";
          content-foreground = "\${color.bg}";
          content-padding = "0.5";
        };

        "module/network" = {
          type = "internal/network";
          interface = "wlp1s0";
          interval = "1.0";
          accumulate-stats = "true";
          unknown-as-up = "true";
          format-connected = "<label-connected>";
          format-connected-background = "\${color.mf}";
          format-connected-foreground = "\${color.fg}";
          format-connected-padding = "1";
          format-disconnected = "<label-disconnected>";
          format-disconnected-background = "\${color.mf}";
          format-disconnected-foreground = "\${color.fg}";
          format-disconnected-padding = "1";
          label-connected = "%local_ip%";
          label-disconnected = "404";
        };

        "module/network_i" = {
          type = "internal/network";
          interface = "wlp1s0";
          interval = "1.0";
          accumulate-stats = "true";
          unknown-as-up = "true";
          format-connected = "<ramp-signal>";
          format-connected-background = "\${color.purple}";
          format-connected-foreground = "\${color.fg}";
          format-connected-padding = "1";
          format-disconnected = "<label-disconnected>";
          format-disconnected-background = "\${color.purple}";
          format-disconnected-foreground = "\${color.fg}";
          format-disconnected-padding = "1";
          label-disconnected = "";
          ramp-signal-0 = "";
          ramp-signal-1 = "";
          ramp-signal-2 = "";
          ramp-signal-3 = "";
          ramp-signal-4 = "";
        };

        "module/battery" = {
          type = "internal/battery";
          full-at = "99";
          battery = "BAT1";
          adapter = "ACAD";
          poll-interval = "2";
          time-format = "%H:%M";
          format-charging = "<label-charging>";
          format-charging-background = "\${color.mf}";
          format-charging-foreground = "\${color.fg}";
          format-charging-padding = "1";
          format-discharging = "<label-discharging>";
          format-discharging-background = "\${color.mf}";
          format-discharging-foreground = "\${color.fg}";
          format-discharging-padding = "1";
          label-charging = "%percentage%%";
          label-discharging = "%percentage%%";
          label-full = "100%";
          label-full-foreground = "\${color.fg}";
          label-full-background = "\${color.mf}";
          label-full-padding = "1";
        };

        "module/battery_i" = {
          type = "internal/battery";
          full-at = "99";
          battery = "BAT1";
          adapter = "ACAD";
          poll-interval = "2";
          time-format = "%H:%M";
          format-charging = "<animation-charging>";
          format-charging-background = "\${color.green}";
          format-charging-foreground = "\${color.fg}";
          format-charging-padding = "1";
          format-discharging = "<ramp-capacity>";
          format-discharging-background = "\${color.pink}";
          format-discharging-foreground = "\${color.fg}";
          format-discharging-padding = "1";
          label-charging = "%percentage%%";
          label-discharging = "%percentage%%";
          label-full = "";
          label-full-background = "\${color.green}";
          label-full-foreground = "\${color.fg}";
          label-full-padding = "1";
          ramp-capacity-0 = "";
          ramp-capacity-1 = "";
          ramp-capacity-2 = "";
          ramp-capacity-3 = "";
          ramp-capacity-4 = "";
          animation-charging-0 = "";
          animation-charging-1 = "";
          animation-charging-2 = "";
          animation-charging-3 = "";
          animation-charging-4 = "";
          animation-charging-5 = "";
          animation-charging-framerate = "750";
        };

        "bar/main" = {
          monitor = "\${env:MONITOR}";
          monitor-fallback = "";
          monitor-strict = false;
          override-redirect = false;
          bottom = false;
          fixed-center = true;
          width = "100%";
          height = cfg.barheight;
          offset-x = 0;
          offset-y = 0;
          background = "\${color.bg}";
          foreground = "\${color.fg}";
          radius-top = "0.0";
          radius-bottom = "0.0";
          overline-size = 2;
          overline-color = "\${color.ac}";
          border-size = 4;
          border-color = "\${color.bg}";
          padding = 1;
          module-margin-left = 0;
          module-margin-right = 0;
          font-0 = "Termsyn:size=${cfg.fontsize1}";
          font-1 = "Siji:size=${cfg.fontsize2}";
          font-2 = "Terminus:size=${cfg.fontsize3}";
          modules-left = cfg.modulesLeft;
          modules-center = "title";
          modules-right = cfg.modulesRight;
          separator = "";
          spacing = 0;
          dim-value = "1.0";
          wm-name = "";
          locale = "";
          tray-position = "none";
          tray-detached = false;
          tray-maxsize = 16;
          tray-transparent = false;
          tray-background = "\${color.bg}";
          tray-offset-x = 0;
          tray-offset-y = 0;
          tray-padding = 0;
          tray-scale = "1.0";
          enable-ipc = true;
          click-left = "";
          click-middle = "";
          click-right = "";
          scroll-up = "";
          scroll-down = "";
          double-click-left = "";
          double-click-middle = "";
          double-click-right = "";
          cursor-click = "";
          cursor-scroll = "";
        };

        "settings" = {
          throttle-output = 5;
          throttle-output-for = 10;
          throttle-input-for = 30;
          screenchange-reload = false;
          compositing-background = "source";
          compositing-foreground = "over";
          compositing-overline = "over";
          compositing-underline = "over";
          compositing-border = "over";
          format-foreground = "";
          format-background = "";
          format-underline = "";
          format-overline = "";
          format-spacing = "";
          format-padding = "";
          format-margin = "";
          format-offset = "";
          pseudo-transparency = false;
        };
      };
      script = cfg.script;
    };
}
