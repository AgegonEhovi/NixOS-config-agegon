{ config, pkgs, ... }:

{
  virtualisation.spiceUSBRedirection.enable = true;
  users.groups.libvirtd.members = [ "agegon" ];
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "start";
  };

  # Добавляем правила фаервола для виртуализации
  networking.firewall.extraCommands = ''
    # Разрешить трафик для libvirt/KVM
    iptables -I FORWARD -i virbr0 -j ACCEPT
    iptables -I FORWARD -o virbr0 -j ACCEPT
    # Разрешить доступ к SPICE (виртуальные машины)
    iptables -A INPUT -p tcp --dport 5900:6900 -j ACCEPT
  '';

  # System Packages for Virtualisation
  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    libvirt
    spice
    virtiofsd
    libguestfs
    virt-viewer
  ];
}
