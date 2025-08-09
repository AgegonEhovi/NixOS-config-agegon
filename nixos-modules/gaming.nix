{ config, pkgs, ... }:

{
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };

  # Gamemode
  # programs.gamemode.enable = true;

  # System Packages for Gaming
  environment.systemPackages = with pkgs; [
    # mangohud
    # vulkan-tools
  ];
}
