{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "sushi-dracula";
        src = pkgs.fetchFromGitHub {
          owner = "jukefr";
          repo = "sushi-dracula";
          rev = "2ac88947f919cd4e17dbee3a506cb088b9c383f4";
          sha256 = "129q9v7qnd0p9xm8a9h40fiyanwmn3ihxp1jdldss39xpsxh3l4m";
        };
      }
      {
        name = "thefuck";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-thefuck";
          rev = "3570c4464bdfd0f312e22a0b407a8c0ba98b7e0d";
          sha256 = "0ih35vxvc05wc708i1ifr94s1p20k27bydqjlyk2gpv1cr8jf6j2";
        };
      }
    ];
    functions = {
      fish_user_key_bindings = ''
        bind \cf 'thefuck-command-line'
      '';
      docker-aws-login = ''
        eval (${pkgs.awscli}/bin/aws ecr get-login --no-include-email --region eu-west-3 --profile $argv)
      '';
      fish_greeting = ''
        echo NixOS (nixos-version) 
      '';

      # work stuff

      # create a work branch from master 
      gb = ''
        set stashed (git stash)

        if test "$stashed" = "No local changes to save"
            set stashed 0
        else 
            set stashed 1
        end

        git checkout develop
        git pull
        git checkout -b (string sub --length 8 (uuidgen))

        if test "$stashed" = "1"
            git stash pop
        end
      '';

      # push the random branch to the correct origin feature branch
      gp = ''
        set ticket (git log -1 --pretty=%B | head -n 1 | string split , | tail -1 | string trim)

        if not test (string sub --length 4 $ticket) = "CSV-"
            set ticket (git branch --show-current)
        end

        git push --set-upstream origin (git branch --show-current):feature/$ticket
      '';
    };
    shellInit = ''
      set -gx PATH ${config.home.homeDirectory}/.npm-global/bin $PATH
      set -gx EDITOR ${pkgs.neovim}/bin/nvim
      set -gx VISUAL ${pkgs.neovim}/bin/nvim
      set -gx SHELL ${pkgs.fish}/bin/fish
    '';
  };
}
