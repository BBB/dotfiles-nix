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
  system.defaults = {
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
      static-only = true;
    };
    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXEnableExtensionChangeWarning = false;
    };
    NSGlobalDomain = {
      "com.apple.keyboard.fnState" = true;
    };
  };
}
