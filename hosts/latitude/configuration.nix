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
    };
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
 #     root = {
 #       hashedPasswordFile = config.sops.secrets.rp.path;
 #     };  
      jwrhine = {
        isNormalUser = true;
        description = "John";
        extraGroups = [
          "wheel"
	  "networkmanager"
        ];
#	initialPassword = "password";
        hashedPasswordFile = config.sops.secrets.userpassword.path;
        packages = with pkgs; [];
      };
    };
  };
}
