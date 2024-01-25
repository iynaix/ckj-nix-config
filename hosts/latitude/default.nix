_: {
  imports = [
    ../../nixos/gnome.nix
    ../../nixos/emacs.nix
    ../../nixos/flatpak.nix
    ../../nixos/steam.nix
    ../../nixos/virt-manager.nix
#    ../../nixos/xfce.nix
  ];

  programs = {
    obs-studio = {
      enable =  true;
    };
  };  
}
