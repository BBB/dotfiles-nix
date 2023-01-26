{ pkgs, lib, ... }:

{

  home.username = "ollie";
  home.homeDirectory = "/Users/ollie";

  home.stateVersion = "22.05";

  home.packages = import ./packages.nix pkgs;

  home.file = import ./files.nix;

  programs.home-manager = { enable = true; };

  programs.zsh = import ./zsh.nix;
  programs.tmux = import ./tmux.nix pkgs;
  programs.git = import ./git.nix pkgs;
  programs.neovim = import ./neovim.nix;
  programs.direnv = import ./direnv.nix;
  programs.starship = import ./starship.nix;
}
