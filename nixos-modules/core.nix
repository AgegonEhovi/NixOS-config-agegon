{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "kvm-amd" "fuse" ];
  boot.kernelParams = [ "hugepages=2048" "elevator=mq-deadline" ];
  boot.tmp.useTmpfs = true;

  boot.kernel.sysctl = {
    "kernel.unprivileged_userns_clone" = 1;
  };

  environment.variables = {
    GSK_RENDERER = "ngl"; 
  };

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
    tree
    telegram-desktop
    # hiddify-app
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
    qbittorrent
    python3
    go
    distrobox
    wl-clipboard
	obs-studio

	python313Packages.psutil
  ];

  services.earlyoom = {
    enable = true;
  };
	
  # OpenSSH daemon
  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
