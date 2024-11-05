{ pkgs, nixpkgs, user, mac-app-util, ... }:
{
  services = {
    nix-daemon.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      mac-app-util.homeManagerModules.default
    ];
  };

  system.stateVersion = 5;

  security = {
    pam.enableSudoTouchIdAuth = true;
  };

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
