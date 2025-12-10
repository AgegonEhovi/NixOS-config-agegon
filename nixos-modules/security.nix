{ config, pkgs, ... }:

{
  # Firewall settings are mostly in networking.nix and virtualisation.nix

  # Security wrappers for specific programs
  programs.nekoray.tunMode.enable = true;
}
