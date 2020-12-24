{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [ neofetch pciutils ];
    file = let
     cfg =
       if builtins.getEnv "CURRENT_HOST" == "surface"
       then {
         imgSize = "400";
       }
       else {
         imgSize = "200";
       };
   in {
      ".config/neofetch/config.conf".text = ''
        # https://github.com/dylanaraps/neofetch/wiki/Customizing-Info
        print_info() {
            info title
            info underline

            info "os" distro
            #info "Host" model
            info "kern" kernel
            info "upt" uptime
            #info "Packages" packages
            info "shel" shell
            info "res" resolution
            info "de" de
            info "wm" wm
            #info "WM Theme" wm_theme
            #info "Theme" theme
            #info "Icons" icons
            info "term" term
            info "font" term_font
            info "cpu" cpu
            info "gpu" gpu
            info "mem" memory

            # info "GPU Driver" gpu_driver  # Linux/macOS only
            # info "CPU Usage" cpu_usage
            # info "Disk" disk
            # info "Battery" battery
            # info "Font" font
            # info "Song" song
            # [[ "$player" ]] && prin "Music Player" "$player"
            # info "Local IP" local_ip
            # info "Public IP" public_ip
            # info "Users" users
            # info "Locale" locale  # This only works on glibc systems.

            info cols
        }

        title_fqdn="on"
        kernel_shorthand="on"
        distro_shorthand="on"
        os_arch="off"
        uptime_shorthand="on"
        memory_percent="on"
        memory_unit="gib"
        package_managers="off"
        shell_path="off"
        shell_version="on"
        speed_type="bios_limit"
        speed_shorthand="on"
        cpu_brand="off"
        cpu_speed="on"
        cpu_cores="logical"
        cpu_temp="on"
        gpu_brand="off"
        gpu_type="all"
        refresh_rate="on"
        gtk_shorthand="off"
        gtk2="on"
        gtk3="on"
        public_ip_host="http://ident.me"
        public_ip_timeout=2
        de_version="on"
        disk_show=('/')
        disk_subtitle="mount"
        disk_percent="on"
        music_player="auto"
        song_format="%artist% - %album% - %title%"
        song_shorthand="off"
        mpc_args=()
        colors=(distro)
        bold="on"
        underline_enabled="on"
        underline_char="-"
        separator=" "
        block_range=(0 15)
        color_blocks="on"
        block_width=3
        block_height=1
        col_offset="auto"
        bar_char_elapsed="-"
        bar_char_total="="
        bar_border="on"
        bar_length=15
        bar_color_elapsed="distro"
        bar_color_total="distro"
        cpu_display="on"
        memory_display="on"
        battery_display="off"
        disk_display="off"
        image_backend="kitty"
        image_source="${config.home.homeDirectory}/.background-image"
        ascii_distro="auto"
        ascii_colors=(distro)
        ascii_bold="on"
        image_loop="off"
        thumbnail_dir="''${XDG_CACHE_HOME:-''${HOME}/.cache}/thumbnails/neofetch"
        crop_mode="normal"
        crop_offset="center"
        image_size="${cfg.imgSize}px"
        gap=3
        yoffset=2
        background_color=
        stdout="off"
      '';
    };
  };
}
