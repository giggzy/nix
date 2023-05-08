{ config, pkgs, ... }:

let
  username = builtins.getEnv "USER";
  homeDirectory = builtins.getEnv "HOME";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = homeDirectory;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    # terminal tools
    alacritty
    zellij
    tmux
    direnv

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
    cargo
    rustc

    # neovim
    neovim

    # cli tools
    fzf
    ripgrep
    zoxide
    exa
    tree

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = import ./files.nix;

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/gabrielfarrell/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Gabriel Farrell";
    userEmail = "gabriel.farrell@gmail.com";
  };


  # move to own file?
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    enableCompletion = true;
    shellAliases = {
      sl = "exa";
      ls = "exa";
      l = "exa -l";
      la = "exa -la";
      # ip = "ip --color=auto";
      vim = "nvim";
    };

    initExtra = ''
      bindkey '^ ' autosuggest-accept
      # vim binding mode
      bindkey -v
    '';
  };

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

  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
  };
}
