{ config, pkgs, ... }:

{
  programs.htop = {
    enable = true;
    fields = [ "PID" "USER" "PERCENT_CPU" "PERCENT_MEM" "TIME" "COMM" ];
    highlightBaseName = true;
    vimMode = true;
    showCpuUsage = true;
    showCpuFrequency = true;
    enableMouse = false;
    meters = {
      left = [
        {
          kind = "CPU";
          mode = 3;
        }
        {
          kind = "Memory";
          mode = 1;
        }
      ];
    };
  };
}
