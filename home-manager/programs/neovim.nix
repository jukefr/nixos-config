{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = ''
      set autoread
      set updatetime=300
      nmap <C-P> :FZF<CR>
      syntax on
      set modeline
      set expandtab
      set tabstop=2
      set shiftwidth=2
      set exrc
      set secure
      autocmd BufRead,BufNewFile * set signcolumn=yes
      autocmd FileType tagbar,nerdtree set signcolumn=no
      set foldmethod=indent
      set nofoldenable
      set number relativenumber
      set diffopt+=vertical
      let g:airline_theme="dracula"

      :augroup numbertoggle
      :  autocmd!
      :  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
      :  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
      :augroup END

      if (has("nvim"))
        let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
      endif

      set cursorline

       hi clear ALEErrorSign
       hi clear ALEWarningSign
       let g:ale_echo_msg_format = "[%linter%] %s [%severity%]"
       let g:ale_sign_error = "🔥"
       let g:ale_sign_warning = "⚠️"
       hi Error    ctermfg=204 ctermbg=NONE guifg=#ff5f87 guibg=NONE
       hi Warning  ctermfg=178 ctermbg=NONE guifg=#D7AF00 guibg=NONE
       hi ALEError ctermfg=204 guifg=#ff5f87 ctermbg=52 guibg=#5f0000 cterm=undercurl gui=undercurl
       hi link ALEErrorSign    Error
       hi link ALEWarningSign  Warning

       let g:ale_linters = {
                   \ "python": ["pylint"],
                   \ "javascript": ["eslint"],
                   \ "go": ["gobuild", "gofmt"],
                   \ "rust": ["rls"]
                   \}
       let g:ale_fixers = {
                   \ '*': ['remove_trailing_lines', 'trim_whitespace'],
                   \ "python": ["autopep8"],
                   \ "javascript": ["prettier"],
                   \ "go": ["gofmt", "goimports"],
                   \ "nix": ["nixpkgs-fmt"],
                   \ "rust": ["rustfmt"]
                   \}
       let g:ale_fix_on_save = 1
       let $FZF_DEFAULT_COMMAND = 'rg --files --follow --hidden'
       let g:gitgutter_set_sign_backgrounds = 0
    '';
    plugins = with pkgs.vimPlugins; [
      vim-surround
      vim-gitgutter
      dracula-vim
      vim-airline
      nerdcommenter
      vim-gutentags
      ale
      vim-polyglot
      fzf-vim
      coc-nvim
      coc-json
      coc-tsserver
    ];
    extraPackages = with pkgs; [
      nodePackages.eslint
      nodePackages.prettier
      nixpkgs-fmt
      fzf
    ];
  };
}
