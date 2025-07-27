{ config, pkgs, ... }:

{
  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [ "hugepages=2048" "elevator=bfq" ];

  # Graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Timezone and Locale
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "ru_RU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    micro
    vim
    wget
    git
    telegram-desktop
    hiddify-app
    keepassxc
    htop
    ranger
    anki-bin
    obsidian
    firefox
    easyeffects
    steam-run
    xray
    nekoray
    sing-box
    lutris
    bottles
    qbittorrent
    wl-clipboard
    python3
    go
    distrobox
  ];

  # OpenSSH daemon
  services.openssh.enable = true;
}
