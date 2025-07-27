{ config, pkgs, ... }:

{
  # Nix Settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  auto-optimise-store = true;

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
