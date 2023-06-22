{ config, pkgs, ... }:

let
  username = builtins.getEnv "USER";
  homeDirectory = builtins.getEnv "HOME";
  pkgsUnstable = import <nixpkgs-unstable> { };
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = homeDirectory;

  home.stateVersion = "22.05"; # Please read the comment before changing.
  #home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    ##############################################
    # terminal tools
    ##############################################

    #iterm2 # Mac Only?
    alacritty
    pkgsUnstable.zellij
    tmux
    direnv
    fish
    zsh
    starship

    ##############################################
    # MCIT
    ##############################################
    awscli2
    pkgsUnstable.terraform
    pkgsUnstable.terraform-ls

    ##############################################
    # Languages support
    ##############################################
    # python
    python3
    python3Packages.pip
    python3Packages.black
    python3Packages.ipython
    python3Packages.pyflakes
    python3Packages.pygments
    python3Packages.pyls-isort
    # python3Packages.pylsp-mypy
    python3Packages.pytest
    python3Packages.python-lsp-server
    python3Packages.oracledb

    # rust
    # pkgsUnstable.cargo
    # pkgsUnstable.rustc
    # pkgsUnstable.rustfmt
    # pkgsUnstable.rust-analyzer
    # pkgsUnstable.clippy
    libiconv
    pkgsUnstable.rustup
    cargo-nextest
    #cargo
    #rustc

    # lua
    luarocks

    # javascript
    nodejs
    yarn

    # C and friends
    gcc

    # go and friends
    pkgsUnstable.go

    ##############################################
    # dev tools
    ##############################################
    sqlite

    ##############################################
    # GUI Tools
    ##############################################
    #firefox
    #google-chrome

    ##############################################
    # neovim
    ##############################################
    pkgsUnstable.neovim # install newer version

    helix # editor with intresting modal model
    hexyl # hex viewer

    ##############################################
    # cli tools
    ##############################################
    curl
    jq
    xclip
    wget
    htop
    btop # visual system viewer
    zip
    unzip
    fzf
    ripgrep
    ack
    zoxide
    exa
    tree
    lazygit
    fd # find alternative
    sd # simpler than sed
    du-dust # disk usage
    dogdns # alternative to dig (DNS)
    xh # curl/wget
    duf # df alternative
    ncdu # du alternative
    bat # cat alternative
    atuin # shell history tool (DB, shared storage over hosts)
    bottom
    broot # tree alternative
    tokei # stats on a code base
    tldr
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = import ./files.nix;

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    EDITOR = "nvim";
    VISUAL = "$EDITOR";
    NVIM_APPNAME = "nvim_apps/astro";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true; # This is failing for me in wsl on windows right now?
  programs.git = {
    enable = true;
    userName = "Farrell, Gabriel";
    userEmail = "Gabriel.Farrell@nyulangone.org";

    extraConfig = {
      init.defaultBranch = "main";
      color.ui = true;
    };
  };


  # move to own file?
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    initExtra = ''
      bindkey '^ ' autosuggest-accept
      # vim binding mode
      bindkey -v
      
      # functions
      ${builtins.readFile ./zsh/functions.zsh}

      # completion
      autoload bashcompinit                                                                                                                                                                                                                                                                            │
      bashcompinit                                                                                                                                                                                                                                                                                     │

      complete -C aws_completer aws
      complete -o nospace -C terraform terraform

      # Setup PATH

      # Homebrew
      export PATH=/opt/homebrew/bin:$PATH
      export PATH=/opt/homebrew/sbin:$PATH

      # PyEnv
      export PYENV_ROOT="$HOME/.pyenv"
      command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"
    '';

    shellAliases = import ./zsh/aliases.zsh;

    prezto = {
      enable = true;
      pmodules = [
        "completion"
        "git"
      ];
      editor.keymap = "vi";
    };

    # sessionVariables = {
    #   # TODO: own file?
    #   LANG = "en_US.UTF-8";
    #
    #   EDITOR = "nvim";
    #   VISUAL = "$EDITOR";
    #   NVIM_APPNAME = "nvim_apps/astro";
    # };
  };

  # TODO: Add Neovim configuration

  # programs.neovim = {
  #   enable = true;
  #   viAlias = true;
  #   vimAlias = true;
  #   
  #   # plugins = with pkgs.vimPlugins; [
  #   #   vim-nix
  #   # ];
  # };

  # TODO: some neovim config I'm accumulating
  # set clipboard=autoselect  -- visual mode highlights get copied to system clipboard


  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
  };
}
