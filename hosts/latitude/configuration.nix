{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./default.nix
      ./hardware-configuration.nix
      ./intel-zfs.nix
      ./impermanence.nix
      ./packages.nix
      ../../modules/nixos/persistence.nix
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
#      luks.devices."luks-223bbc57-f4e3-44ab-983f-6d4a66789c94".device = "/dev/disk/by-uuid/223bbc57-f4e3-44ab-983f-6d4a66789c94";
#    };
    kernelParams = ["quiet"];
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };
  
#  environment = {
#    etc."NetworkManager/system-connections" = {
#      source = "/persist/etc/NetworkManager/system-connections/";
#    };
#  };  

  networking = {
    hostName = "latitude";
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

  custom = {
    impermanence = {
      enable = true;
    };
  };  
}
