_:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../home-manager/default.nix
    ../../modules/home-manager/default.nix
    ../../nixos/default.nix
    ../../nixos/xfce.nix
  ];
}
