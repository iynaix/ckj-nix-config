{ config, pkgs, lib, ... }:

{
  environment = {
    shells = with pkgs; [ 
      bashInterative
      zsh 
    ];
    systemPackages = with pkgs; [
      ];
  };

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting = {
        enable = true;
      };
      autosuggestions = {
        enable = true;
      };
      interactiveShellInit = ''
        export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
        export FZF_BASE=${pkgs.fzf}/share/fzf/
        # Customize your oh-my-zsh options here
        ZSH_THEME="robbyrussell"
        plugins=(git fzf )
        HISTFILESIZE=500000
        HISTSIZE=500000
        setopt SHARE_HISTORY
        setopt HIST_IGNORE_ALL_DUPS
        setopt HIST_IGNORE_DUPS
        setopt INC_APPEND_HISTORY
        autoload -U compinit && compinit
        unsetopt menu_complete
        setopt completealiases
  
  if [ -f ~/.aliases ]; then
    source ~/.aliases
  fi

  source $ZSH/oh-my-zsh.sh
  '';
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
  };
}
