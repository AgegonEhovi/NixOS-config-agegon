{ config, pkgs, ... }:

{
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # System Packages for Gaming
  environment.systemPackages = with pkgs; [
    # steam-run # Already included via programs.steam
    lutris
    bottles
  ];
}
