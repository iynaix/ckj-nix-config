{ config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./default.nix
    ];

  boot = {
    tmp = {
      cleanOnBoot = true;
      };
  };

  networking = {
    networkmanager = {
      enable = true;
    };  
    # wireless = {
      # enable = true;
    # };  
  };

  time = {
    timeZone = "America/New_York";
  };  

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      # remove xterm by default
      excludePackages = [pkgs.xterm];
    };  
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
    enableAllFirmware = true;
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
