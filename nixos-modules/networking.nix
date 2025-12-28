{ config, pkgs, ... }:

{
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    # Разрешить базовые службы
    allowedTCPPorts = [ 22 8000]; 
    allowedUDPPorts = [
      5353 # mDNS (обнаружение устройств в сети)
    ];
    allowPing = true;
  };

  
}
