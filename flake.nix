{
  description = "My Home Manager Flake";

  inputs = {
    mac-app-util.url = "github:hraban/mac-app-util";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs
    , nix-darwin
    , home-manager
    , mac-app-util
    , ...
    }: {
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
      darwinConfigurations = {
        "MGC1W9MXY070" = nix-darwin.lib.darwinSystem {
          modules = [
            ./hosts/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                users.orelph = import ./user/orelph/home.nix;
              };
            }
          ];
          specialArgs = { user = "orelph"; inherit mac-app-util; };
        };
        "MacBook-Pro" = nix-darwin.lib.darwinSystem {
          modules = [
            ./hosts/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                users.ollie = import ./user/ollie/home.nix;
              };
            }
          ];
          specialArgs = { user = "ollie"; inherit mac-app-util; };
        };
      };
    };
}
