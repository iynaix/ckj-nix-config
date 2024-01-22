{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
#      corefonts
#      dina-font
#      fira-code
#      fira-code-symbols
#      liberation_ttf
#      mplus-outline-fonts.githubRelease
#      noto-fonts
#      noto-fonts-cjk
#      noto-fonts-emoji
#      proggyfonts
      (nerdfonts.override {
        fonts = [
     "JetBrainsMono"
#     "Hack"
#     "Iosveka"
#     "Meslo"
        ];
      })
    ];  
  };
}
