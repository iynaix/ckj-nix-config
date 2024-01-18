{ config, pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      acpi
      arc-theme
      breeze-plymouth
      brightnessctl
      btop
      (callPackage ../../nixos/spotify-adblock.nix {})
      cmatrix
      espanso-wayland
      floorp
      fractal
      gimp
      glib
      ifuse
      jq
      killall
      libimobiledevice
      libnotify
      librewolf
      mpv
      nix-ld
      parsec-bin
      pkgs.python311Full
      plymouth
      ranger
      sops
      spotify
      spotifywm
      swappy
      usbmuxd
      webcord
      wl-clipboard
      wlogout
      wlr-randr
      wofi
      zoom-us
      ];
  };
}
