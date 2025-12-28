{ config, pkgs, ... }:

{
  # Firewall settings are mostly in networking.nix and virtualisation.nix

  # Security wrappers for specific programs
  # programs.throne.tunMode.enable = true;

  programs.throne = {
    enable = true;            
    package = pkgs.throne;     
    tunMode.enable = true;      
  };
}
