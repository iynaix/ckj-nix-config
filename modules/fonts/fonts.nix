{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
     "JetBrainsMono"
     "Hack"
     "Iosveka"
     "Meslo"
    ];
      })
    ];
  };
}
