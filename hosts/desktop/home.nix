_: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../modules/home-manager/default.nix
    ../../nixos/default.nix
    ../../nixos/xfce.nix
  ];
}
