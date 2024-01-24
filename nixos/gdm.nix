{ config, pkgs, lib, ... }:

{
  services = {
    udev = {
      packages = with pkgs; [ 
        gnome.gnome-settings-daemon 
        ];
      };
    xserver = {
      displayManager = {
        gdm = {
          enable = true;
        };
      };	
    };
  };

  systemd = {
    services = {
      "getty@tty1".enable = false; # fixes autologin with gdm
      "autovt@tty1".enable = false; # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
    };
  };
}
