{ config, pkgs, ... }:

{
  # Firewall settings are mostly in networking.nix and virtualisation.nix

  # Security wrappers for specific programs
  programs.nekoray.tunMode.enable = true;
  security.wrappers = {
    nekobox_core = {
      owner = "root";
      group = "root";
      source = "${pkgs.nekoray.nekobox-core}/bin/nekobox_core";
      capabilities = "cap_net_admin=ep";
    };
  };
}
