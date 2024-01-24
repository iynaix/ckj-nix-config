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

#  services = {
#    xserver = {
#      displayManager = {
#        autoLogin = {
#	  user = "jwrhine";
#        };
#      };
#    };  
#    getty = {
#      autologinUser = "jwrhine";
#    };	
#  };

#  systemd = {
#    services = {
#      "getty@tty1".enable = false; # fixes autologin with gdm
#      "autovt@tty1".enable = false; # https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
#    };
#  };

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
