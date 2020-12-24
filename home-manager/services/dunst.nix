{ config, pkgs, ... }:

{
  services.dunst =
    let
      #TODO
      geometry =
        if builtins.getEnv "CURRENT_HOST" == "surface"
        then 192
        else 96;
    in
    {
      enable = true;
      settings = {
        global = {
          title = "Dunst";
          class = "Dunst";
          monitor = 0;
          follow = "none";
          geometry = "0x0-98+76";
          indicate_hidden = "yes";
          shrink = "yes";
          line_height = 0;
          startup_notification = true;
          corner_radius = 0;

          separator_height = 0;
          padding = 5;
          horizontal_padding = 20;

          frame_width = 0;
          frame_color = "#3d3d5c";
          separator_color = "#e5f5f5";
          font = "mplus nerd font 12";
          markup = "full";
          format = ''
            <span size='x-large' font_desc='mplus nerd font 10' weight='bold' foreground='#00b38f'>%s</span>
            %b'';
          alignment = "center";
          vertical_alignment = "center";
          idle_threshold = 120;
          show_age_threshold = 60;
          sort = "no";
          word_wrap = "yes";
          ignore_newline = "no";
          stack_duplicates = false;
          hide_duplicate_count = "yes";
          show_indicators = "no";
          sticky_history = "no";
          history_length = 20;
          always_run_script = false;
          verbosity = "mesg";
          transparency = 10;

          icon_position = "left";
          min_icon_size = 0;
          max_icon_size = 80;

          browser = "${pkgs.firefox}/bin/firefox -new-tab";
          mouse_left_click = "close_current";
          mouse_middle_click = "do_action";
          mouse_right_click = "close_all";

        };

        urgency_normal = {
          background = "#0e1619";
          foreground = "#0e1619";
          timeout = 6;
        };

        urgency_low = {
          timeout = 3;
          background = "#0e1619";
          foreground = "#dfdfdf";
        };

        urgency_critical = {
          timeout = 0;
          background = "#0e1619";
          foreground = "#bf616a";
        };

        scrot = {
          appname = "scrot";
          format = ''
            <span size='x-large'>📷<b>  %s </b></span>
            <i>%b</i>'';

        };
      };
    };
}
