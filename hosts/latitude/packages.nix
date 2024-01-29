{ config, pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      acpi
      arc-theme
      breeze-plymouth
      brightnessctl
      btop
      (callPackage ../../modules/nixos/spotify-adblock.nix {})
      (callPackage ../../packages/boxbuddyrs/boxbuddyrs.nix {})
      cbonsai
      cmatrix
      distrobox
      espanso-wayland
      fastfetch
      feh
      floorp
      fractal
      gimp
      glib
      ifuse
      jq
      killall
      libimobiledevice
      libnotify
      lm_sensors
      lsd
      neofetch
      mpv
      nix-ld
      obs-studio
      parsec-bin
      # fix nix package count for nitch
      (pkgs.nitch.overrideAttrs (o: {
        patches = (o.patches or []) ++ [../overlays/nitch-nix-pkgs-count.patch];
      }))
      pkgs.python311Full
      plymouth
      ranger
      sops
      spotify
      spotifywm
      swappy
      usbmuxd
      wallust
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
