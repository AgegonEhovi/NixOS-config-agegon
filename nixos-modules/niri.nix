{ config, pkgs, ... }:

{

  # Niri
  programs.niri.enable = true;
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = {};
  environment.systemPackages = with pkgs; [ alacritty fuzzel swaylock mako swayidle swaybg xwayland-satellite dunst vanilla-dmz xdg-desktop-portal xdg-desktop-portal-wlr];
  programs.xwayland.enable = true;

}