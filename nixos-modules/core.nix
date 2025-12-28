{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelModules = [ "kvm-amd" "fuse"];
  boot.kernelParams = [ "hugepages=2048" "elevator=mq-deadline" ];
  boot.tmp.useTmpfs = true;

  boot.kernel.sysctl = {
    "kernel.unprivileged_userns_clone" = 1;
    "vm.swappiness" = 180;     
    "vm.vfs_cache_pressure" = 500; 
    "vm.watermark_boost_factor" = 0;    
    "vm.watermark_scale_factor" = 200;
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
    wget
    git
    tree
    telegram-desktop
    keepassxc
    htop
    ranger
    anki-bin
    obsidian
    firefox
    easyeffects
    steam-run
    xray
    sing-box
    qbittorrent
    python3
    go
    distrobox
    wl-clipboard
	  obs-studio
	  vscode-fhs
    proxychains-ng
  ];
  
  programs.java = {
    enable = true;
  };
  

  # zramSwap = {
  #     enable = true;
  #     algorithm = "zstd";           
  #     memoryPercent = 50;           
  #     priority = 100;              
  # };

  services.earlyoom = {
    enable = true;
  };

  programs.amnezia-vpn.enable = true;
	
  # OpenSSH daemon
  services.openssh.enable = true;

  system.stateVersion = "25.05";
}
