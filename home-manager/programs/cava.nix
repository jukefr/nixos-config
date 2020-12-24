{ config, pkgs, ... }:

{
  home = {
    packages = with pkgs; [ cava ];
    # file = {
    #   ".config/cava/config".text = 
    #   ''
    #   [general]
    #   mode = normal
    #   framerate = 75
    #   sensitivity = 100
    #   bars = 0
    #   bar_width = 2
    #   bar_spacing = 1

    #   [input]
    #   method = pulse
    #   source = auto

    #   [output]
    #   method = ncurses
    #   channels = stereo
    #   raw_target = /dev/stdout
    #   data_format = binary
    #   bit_format = 16bit
    #   ascii_max_range = 1000
    #   bar_delimiter = 59
    #   frame_delimiter = 10

    #   [color]
    #   gradient = 1
    #   gradient_color_1 = '#7575a3'
    #   gradient_color_2 = '#66d9ff'
    #   gradient_color_3 = '#99ffeb'
    #   gradient_color_4 = '#b3ecff'
    #   gradient_color_5 = '#ccfff5'
    #   gradient_color_6 = '#ffb3b3'

    #   [smoothing]
    #   integral = 70

    #   # Monstercat smoothing
    #   monstercat = 1
    #   waves = 0;

    #   # Smoothing gravity
    #   gravity = 50

    #   # ========================
    #   # Equalizer Configurations
    #   # ========================
    #   [eq]
    #   # Keys
    #   1 = 1
    #   2 = 1
    #   3 = 1
    #   4 = 1
    #   5 = 1

    #   '';
    # };
  };
}
