{ config, pkgs, ... }:

{
  imports =
    [ 
      ./default.nix
      ./hardware-configuration.nix
      ./packages.nix
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
    hostName = "desktop";
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
    mutableUsers = false;
    users = {
      jwrhine = {
        isNormalUser = true;
        description = "John";
        extraGroups = [
	  "wheel"
	  "networkmanager"
        ];
	hashedPasswordFile = config.sops.secrets.userpassword.path;
        packages = with pkgs; [];
      };
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
