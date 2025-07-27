{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  # Если вы используете Podman, добавьте его здесь
  # virtualisation.podman = {
  #   enable = true;
  #   # dockerCompat = true; # Для совместимости с Docker CLI
  # };
}
