{ config, pkgs, ... }:

{
  # Define a user account.
  users.users.agegon = {
    isNormalUser = true;
    description = "agegon";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" ]; # Добавлены группы из других модулей
    packages = with pkgs; [
      # thunderbird
    ];
  };
}
