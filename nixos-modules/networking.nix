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
    allowedTCPPorts = [ 22 ]; # SSH
    allowedUDPPorts = [
      5353 # mDNS (обнаружение устройств в сети)
      9993 # ZeroTier
    ];
    # Разрешить виртуализацию (Moved to virtualisation.nix firewall rules)
    # extraCommands = ''
    #   # Разрешить трафик для libvirt/KVM
    #   iptables -I FORWARD -i virbr0 -j ACCEPT
    #   iptables -I FORWARD -o virbr0 -j ACCEPT
    #   # Разрешить доступ к SPICE (виртуальные машины)
    #   iptables -A INPUT -p tcp --dport 5900:6900 -j ACCEPT
    # '';
    # Разрешить ping
    allowPing = true;
  };
}
