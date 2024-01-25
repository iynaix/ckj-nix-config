{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./default.nix
      ./hardware-configuration.nix
      ./intel-zfs.nix
      ./impermanence.nix
      ./packages.nix
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
    };
    kernelParams = ["quiet"];
    plymouth = {
      enable = true;
      theme = "breeze";
    };
  };
  
  networking = {
    hostName = "latitude";
    # proxy = {
      # default = "http://user:password@proxy:port/";
      # noProxy = "127.0.0.1,localhost,internal.domain";
    # };  
  };

  services = {
    xserver = {
      displayManager = {
        autoLogin = {
	  user = "jwrhine";
        };
      };
    };  
    getty = {
      autologinUser = "jwrhine";
    };	
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

  users = {
    mutableUsers = false;
    users = {
      root = {
        initialPassword = "password";
      };  
      jwrhine = {
	initialPassword = "password";
      };
    };
  };
}
