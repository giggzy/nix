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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    ##############################################
    # terminal tools
    ##############################################

    alacritty
    pkgsUnstable.zellij
    tmux
    direnv
    fish
    zsh
    starship

    ##############################################
    # Languages support
    ##############################################
    # python
    python3
    python3Packages.black
    python3Packages.ipython
    python3Packages.pyflakes
    python3Packages.pygments
    python3Packages.pyls-isort
    # python3Packages.pylsp-mypy
    # python3Packages.pytest
    # python3Packages.python-lsp-server

    # rust
    # pkgsUnstable.cargo
    # pkgsUnstable.rustc
    # pkgsUnstable.rustfmt
    # pkgsUnstable.rust-analyzer
    # pkgsUnstable.clippy
    pkgsUnstable.rustup
    #cargo
    #rustc

    # lua
    luarocks

    # javascript
    nodejs

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
    firefox
    google-chrome

    ##############################################
    # neovim
    ##############################################
    pkgsUnstable.neovim # install newer version

    helix

    ##############################################
    # cli tools
    ##############################################
    curl
    xclip
    wget
    htop
    zip
    unzip
    fzf
    ripgrep
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
    userName = "Gabriel Farrell";
    userEmail = "gabriel.farrell@gmail.com";

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


    initExtra = ''
      bindkey '^ ' autosuggest-accept
      # vim binding mode
      bindkey -v
      
      # functions
      ${builtins.readFile ./zsh/functions.zsh}
    '';

    shellAliases = import ./zsh/aliases.zsh;

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
