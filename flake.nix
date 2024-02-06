{
  description = "My Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
    homeConfigurations = {
      "ollie" = home-manager.lib.homeManagerConfiguration {
        # Note: I am sure this could be done better with flake-utils or something
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        modules = [ ./user/ollie/home.nix ];
      };
      "orelph" = home-manager.lib.homeManagerConfiguration {
        # Note: I am sure this could be done better with flake-utils or something
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        modules = [ ./user/orelph/home.nix ];
      };

    };
  };
}
