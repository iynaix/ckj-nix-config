{
  environment = {
    shellAliases = {
      v="nvim";
      sv="sudo nvim";
      ".."="cd ..";
      ls="lsd";
      ll="lsd -l";
      la="lsd -a";
      lal="lsd -al";
      config="lsd ~/.config";
      ga="git add";
      ga.="git add .";
      gc="git commit -m";
      gpull="git pull";
      gpush="git push";
      neo="neofetch";
      doom-update="~/.config/emacs/bin/doom upgrade";
      flake="sv nixos/flake.nix";
      home-dell="sv nixos/hosts/laptop/home.nix";
      nc-dell="sv nixos/hosts/laptop/configuration.nix";
      flake-up="cd ~/nixos; nix flake update; cd ~";
      nrs-dell="nh os switch --nom --hostname laptop";
      ko="./nixos/modules/scripts/kitty_opacity.nix";
}
