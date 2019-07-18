{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Dev
    wget
    git
    gitAndTools.tig
    zsh
    oh-my-zsh
    fzf
    ctags
    docker_compose
    docker
    libcap # for go
    gcc    # for go
    gnumake
    ffmpeg-full
    teamviewer
    nodejs
    inotify-tools
    sqlite

    libGLU
    libGL
    libGL_driver

    yakuake

    ## Lang
    erlang
    elixir_1_8
    rustup
    go
    (python35.withPackages(ps: with ps; [ 
      litecli
    ]))

    ## Editors
    vscode
    sublime3
    jetbrains.pycharm-community
    jetbrains.idea-community
    vim
    emacs
    typora

    # Other
    vivaldi
    google-chrome
    tdesktop
    mc
    inkscape
    flameshot
    vlc
    tree
    zoom-us
    smartgithg
    gitkraken
    meld
    gnome3.gnome-shell-extensions
    chrome-gnome-shell
    thunderbird
    obs-studio
    steam
    feh
    arandr
    discord
    ntfs3g
    vte
    glava
    i3-easyfocus

    tmux
    tmuxp

    ## Network
    openconnect
    networkmanager

    # Fonts
    fira-code
    source-code-pro
  ];

  programs.zsh.enable = true;
  programs.zsh.interactiveShellInit = ''
    export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
    export FZF_BASE="$(whereis fzf)"

    # Customize your oh-my-zsh options here
    ZSH_THEME="bureau"
    plugins=(git docker fzf ssh-agent docker-compose git-promt emoji zsh-autosuggestions)

    bindkey '\e[5~' history-beginning-search-backward
    bindkey '\e[6~' history-beginning-search-forward

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
  programs.zsh.promptInit = "";
}
