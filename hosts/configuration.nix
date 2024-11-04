{ pkgs, nixpkgs, user, ... }:
{
  services = {
    nix-daemon.enable = true;
  };
  system.stateVersion = 5;

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
  };

  users = {
    users.ollie = {
      name = "ollie";
      home = "/Users/ollie";
    };
  };
}
