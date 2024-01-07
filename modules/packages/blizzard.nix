{pkgs, ... }:

{
 users.users.jwrhine.packages = with pkgs; [
   (wineWowPackages.full.override {
     wineRelease = "staging";
     mingwSupport = true;
   })
   winetricks
 ];
}
