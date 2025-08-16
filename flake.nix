{
  description = "A modular NixOS flake for agegon's system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      nixosConfigDir = "/home/agegon/nixos-config";
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit nixosConfigDir; };
        modules = [
          # Импортируем основной конфиг хоста
          ./hosts/desktop/configuration.nix

          # Подключаем модули NixOS
          ./nixos-modules/core.nix
          ./nixos-modules/nvidia.nix
          ./nixos-modules/networking.nix
          ./nixos-modules/gnome.nix
          ./nixos-modules/audio.nix
          ./nixos-modules/virtualisation.nix
          ./nixos-modules/containerization.nix
          ./nixos-modules/gaming.nix
          ./nixos-modules/nix.nix
          ./nixos-modules/users.nix
          ./nixos-modules/security.nix

          # Подключаем Home Manager
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit nixosConfigDir; };
            home-manager.users.agegon = import ./home-manager/agegon/home.nix;
          }
        ];
      };
    };
}
