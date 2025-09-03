{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    caelestia-shell.url = "github:caelestia-dots/shell";
    caelestia-cli.url = "github:caelestia-dots/cli";

    nvf.url = "github:notashelf/nvf";
    
  };

  outputs = { self, nixpkgs, home-manager, caelestia-shell, caelestia-cli, nvf, ... }@inputs: {
    # Please replace my-nixos with your hostname

    packages."x86_64-linux".default = 
      (nvf.lib.neovimConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        modules = [ ./home/nvim/nvim.nix];
    }).neovim;

    nixosConfigurations = {
      Kamino = let
        username = "yousef";

      in
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [

            ./hosts/kamino/default.nix
            home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
                  inherit username;
                } // inputs;

                home-manager.users.${username} = import ./users/${username}/home.nix;

                # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
              }
              nvf.nixosModules.default
            
          ];
          specialArgs = {
            inherit username;
            caelestiaShell = caelestia-shell.packages.x86_64-linux.default;
            caelestiaCLI   = caelestia-cli.packages.x86_64-linux.default;
          };
        };

      Tantiss = let
        username = "yousef";

      in
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [

            ./hosts/tantiss/default.nix
            home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
                  inherit username;
                } // inputs;

                home-manager.users.${username} = import ./users/${username}/home.nix;

                # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
              }
              nvf.nixosModules.default
            
          ];
          specialArgs = {
            inherit username;
            caelestiaShell = caelestia-shell.packages.x86_64-linux.default;
            caelestiaCLI   = caelestia-cli.packages.x86_64-linux.default;
          };
        };

      Endor = let
        username = "admin";

      in
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [

            ./hosts/endor/default.nix
            home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = {
                  inherit username;
                } // inputs;

                home-manager.users.${username} = import ./users/${username}/home.nix;

                # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
              }
              nvf.nixosModules.default
            
          ];
          specialArgs = {
            inherit username;
          };
        };

    };
  };
}

