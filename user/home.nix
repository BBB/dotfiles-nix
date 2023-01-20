{ pkgs, ... }:

{
  home.username = "ollie";
  home.homeDirectory = "/Users/ollie";

  home.stateVersion = "22.05";

  home.packages = import ./packages.nix pkgs;

  home.file = import ./files.nix;

  programs.home-manager = { enable = true; };

  programs.zsh = import ./zsh.nix;
  programs.git = import ./git.nix;
  programs.neovim = import ./neovim.nix;
  programs.direnv = import ./direnv.nix;
  programs.starship = import ./starship.nix;
}
