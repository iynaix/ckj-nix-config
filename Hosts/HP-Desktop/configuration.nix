{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../Desktops/xfce.nix
      ../../Packages/hp-packages.nix
    ];

  boot = {
    loader = {
      grub = {
        enable = true;
	device = "/dev/sda";
      };
    };  
  };

  networking = {
    hostName = "hp-desktop";
    # proxy = {
      # default = "http://user:password@proxy:port/";
      # noProxy = "127.0.0.1,localhost,internal.domain";
    # };  
  };

  powerManagement = {
    cpuFreqGovernor = "performance";
  };  

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = { 
    users = {
      amreed = {
        isNormalUser = true;
        description = "Aiden";
        extraGroups = [
        ];
        packages = with pkgs; [];
      };
      gcreed = {
        isNormalUser = true;
        description = "Gavin";
        extraGroups = [
        ];
        packages = with pkgs; [];
      };
    };
  };
} 
