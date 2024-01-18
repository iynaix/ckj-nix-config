{pkgs, ...}: 

{
  environment = {
    sessionVariables = {
      FLAKE = "/home/jwrhine/dotfiles";
    };  
    systemPackages = with pkgs; [
      nh
      ];
  };
}


