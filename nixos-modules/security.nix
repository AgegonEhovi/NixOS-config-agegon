{ config, pkgs, ... }:

{
  # Firewall settings are mostly in networking.nix and virtualisation.nix

  # Security wrappers for specific programs
  # programs.throne.tunMode.enable = true;

  programs.throne = {
    enable = true;              # обязательно включить сам модуль
    package = pkgs.throne;      # или pkgs.unstable.throne, если в unstable
    tunMode.enable = true;      # именно это даёт capabilities/setuid wrapper
  };
}
