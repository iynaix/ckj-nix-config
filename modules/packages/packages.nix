{ config, pkgs, lib, ... }:

{
  services = {
    flatpak = {
      enable = true;
    };
  };  
  
  environment = {
    shells = with pkgs; [ zsh ];
    systemPackages = with pkgs; [
      acpi
      arc-theme
      breeze-plymouth
      brightnessctl
      btop
      (callPackage ./spotify-adblock.nix {})
      cmatrix
      distrobox
      element-desktop
      espanso-wayland
      firefox
      fractal
      gimp
      glib
      ifuse
      jq
      killall
      kitty
      libimobiledevice
      libnotify
      librewolf
      lm_sensors
      lutris
      lsd
      mako
      mpv
      neofetch
      neovim
      nix-ld
      parsec-bin
      pkgs.python311Full
      plymouth
      ranger
      spotify
      spotifywm
      swappy
      usbmuxd
      webcord
      wget
      wl-clipboard
      wlogout
      wlr-randr
      wofi
      zoom-us
      ];
  };
}
