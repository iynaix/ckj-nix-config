{
  environment = {
    shellAliases = {
      
      # Neovim Commands

      v="nvim";
      sv="sudo nvim";
      
      # Move Through Directories
      "~"="cd";
      "."="cd ~/dotfiles";
      ".."="cd ..";
      
      # Show Contents of Directories

      ls="lsd";
      ll="lsd -l";
      la="lsd -a";
      lal="lsd -al";
     
      # Show Contents of .Config Directory

      conf="lsd ~/.config";
     
      # Git Commands

      ga="git add";
      "ga."="git add .";
      gc="git commit -m";
      gf="git fetch";
      gpull="git pull";
      gpush="git push";
     
      # Neofetch

      neo="neofetch";
     
      # Doom Emacs Upgrade

      doom-up="~/.config/emacs/bin/doom upgrade";
      
      # Flake Commands

      flake="v nixos/flake.nix";
      flake-up="cd ~/dotfiles; nix flake update; cd ~";
      
      # Desktop Commands

      home-hp="v ~/dotfiles/hosts/desktop/home.nix";
      nc-hp="v ~/dotfiles/hosts/desktop/configuration.nix";
      nrs-hp="nh os switch --nom --hostname desktop";

      # Latitude Commands

      home-dell="v ~/dotfiles/hosts/latitude/home.nix";
      nc-dell="v ~/dotfiles/hosts/latitude/configuration.nix";
      nrs-dell="nh os switch --nom --hostname latitude";
      
      # Scripts

      ko="./dotfiles/scripts/kitty_opacity";
    };
  };
}
