{ config, pkgs, lib, ... }:

{
  imports =
    [
      ../../modules/media/audio.nix
      ../../modules/fonts/fonts.nix
      ../../modules/packages/git.nix
      ../../modules/desktop-environments/gnome.nix
      ../../modules/packages/packages.nix
      ../../modules/printing/printing.nix
      ../../modules/packages/steam.nix
      ../../modules/packages/vm.nix
      ../../modules/shells/zsh.nix
      ./hardware-configuration.nix
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
    bluetooth = {
      enable = true;
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

##########

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = { 
    users.jwrhine = {
      isNormalUser = true;
      description = "John";
      extraGroups = [
        "wheel"
	"docker"
	"networkmanager"
	"plugdev"
	"tty"
        "video"
      ];
      packages = with pkgs; [];
    };
  };

  system = {
    stateVersion = "23.11";
  };

}
