{ pkgs, ... }:

{
  # Базовые настройки
  home.username = "agegon";
  home.homeDirectory = "/home/agegon";
  home.stateVersion = "25.05";

  # Включение управления GNOME через dconf
  dconf.enable = true;

  # Обои
  dconf.settings."org/gnome/desktop/background".picture-uri = "file:///etc/nixos/wallpaper.jpg";

  # Настройки GNOME
  dconf.settings = {
    # Темная тема
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Adwaita-dark";
    };

    # Фиксированные 4 рабочих стола
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;
    };

    # Запуск приложений на текущем рабочем столе
    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    # Настройки клавиш
    "org/gnome/desktop/wm/keybindings" = {
      # Закрытие окна
      close = ["<Super>w"];
      
      # Переключение между рабочими столами
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      
      # Перемещение окон
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
    };

	# Скриншот
    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = ["<Shift><Super>s"];
    };

    # Отключение аппаратного ускорения мыши
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };

    # Кастомные команды
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
      ];
    };
    
    # Firefox
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      name = "Launch Firefox";
      command = "firefox";
      binding = "<Super>F1";
    };
    
    # Telegram
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      name = "Launch Telegram";
      command = "telegram-desktop";
      binding = "<Super>F2";
    };
    
    # Hiddify
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      name = "Launch Hiddify";
      command = "hiddify-app";
      binding = "<Super>F3";
    };
    
    # Terminal
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      name = "Launch Terminal";
      command = "kgx";
      binding = "<Super>Return";
    };
  };

  # Установка необходимых пакетов
  home.packages = with pkgs; [
  ];

  # Включение Home Manager
  programs.home-manager.enable = true;
}
