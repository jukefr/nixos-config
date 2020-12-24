{ config, pkgs, ... }:

{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set nocompatible
      set nobackup
      let g:airline_theme='dracula'
      autocmd bufwritepost *.nix silent !nixfmt %
    '';
    plugins = with pkgs.vimPlugins; [
      vim-surround
      vim-gitgutter
      dracula-vim
      vim-airline
      syntastic
      nerdcommenter
    ];
  };
}
