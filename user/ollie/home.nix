{ pkgs, lib, ... }:

{
  home.username = "ollie";
  home.homeDirectory = "/Users/ollie";

  home.stateVersion = "22.05";

  home.packages = import ../shared/packages.nix pkgs;

  home.file = import ../shared/files.nix;

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        insert_final_newline = true;
        indent_style = "space";
        indent_size = 2;
      };
      "*.md" = {
        trim_trailing_whitespace = false;
      };
    };
  };

  programs.home-manager = { enable = true; };

  programs.zsh = import ../shared/zsh.nix;
  programs.tmux = import ../shared/tmux.nix pkgs;
  programs.git = import ../shared/git.nix pkgs;
  programs.neovim = import ../shared/neovim.nix;
  programs.direnv = import ../shared/direnv.nix;
  programs.starship = import ../shared/starship.nix;

  fonts = {
    fontconfig.enable = true;
  };
}
