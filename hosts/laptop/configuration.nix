{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/desktops/gnome.nix
      ../../modules/editors/emacs.nix
      ../../modules/packages/flatpak.nix
      ../../modules/packages/laptop-packages.nix
      ../../modules/packages/steam.nix
#      ../../modules/packages/vm.nix
    ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi = {
        canTouchEfiVariables = true;
      };
    };
    initrd = {
      systemd = {
        enable = true;
      };
      luks.devices."luks-223bbc57-f4e3-44ab-983f-6d4a66789c94".device = "/dev/disk/by-uuid/223bbc57-f4e3-44ab-983f-6d4a66789c94";
    };
    kernelParams = ["quiet"];
    plymouth = {
      enable = true;
      theme = "breeze";
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "laptop";
    # proxy = {
      # default = "http://user:password@proxy:port/";
      # noProxy = "127.0.0.1,localhost,internal.domain";
    # };  
  };
 
  hardware = {
    bluetooth = {
      enable = true;
    };
  };
}
