{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
#      ../../modules/desktops/gnome.nix
      ../../modules/desktops/xfce.nix
#      ../../modules/editors/emacs.nix
      ../../modules/fonts/fonts.nix
      ../../modules/media/audio.nix
      ../../modules/nix/nix.nix
#      ../../modules/packages/flatpak.nix
      ../../modules/packages/git.nix
      ../../modules/packages/nh.nix
      ../../modules/packages/hp-packages.nix
#      ../../modules/packages/steam.nix
#      ../../modules/packages/vm.nix
#      ../../modules/printing/printing.nix
      ../../modules/shells/zsh.nix
    ];

  boot = {
    loader = {
      grub = {
        enable = true;
	device = "/dev/sda";
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "hp-desktop";
    networkmanager = {
      enable = true;
    };  
    # wireless = {
      # enable = true;
    # };  
    # proxy = {
      # default = "http://user:password@proxy:port/";
      # noProxy = "127.0.0.1,localhost,internal.domain";
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

  powerManagement = {
    cpuFreqGovernor = "performance";
  };  

  services = {
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      # remove xterm by default
      excludePackages = [pkgs.xterm];
    };

##########

#    tailscale = {
#      enable = true;
#    };
  };
 
  hardware = {
    enableAllFirmware = true;
  };

##########

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = { 
    users.jwrhine = {
      isNormalUser = true;
      description = "John";
      extraGroups = [
        "wheel"
	"networkmanager"
      ];
      packages = with pkgs; [];
    };
    users.amreed = {
      isNormalUser = true;
      description = "Aiden";
      extraGroups = [
      ];
      packages = with pkgs; [];
    };
    users.gcreed = {
      isNormalUser = true;
      description = "Gavin";
      extraGroups = [
      ];
      packages = with pkgs; [];
    };
  };

  system = {
    stateVersion = "23.11";
  };

} 
