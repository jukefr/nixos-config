{ config, pkgs, ... }:

{
  programs.htop = {
    enable = true;
    fields = [ "PID" "USER" "PERCENT_CPU" "PERCENT_MEM" "OOM" "IO_PRIORITY" "IO_READ_RATE" "IO_WRITE_RATE" "COMM" ];
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
        {
          kind = "Swap";
          mode = 1;
        }
      ];
    };
  };
}
