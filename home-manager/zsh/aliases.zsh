{
  # File listings
  sl = "exa";
  ls = "exa";
  l = "exa -l";
  la = "exa -la";

  # Directory navigation
  cd = "z";

  # better cat
  cat = "bat";

  # Neovim shell aliases
  xnvim="NVIM_APPNAME=nvim_apps/lazynvim nvim";
  lvim-lazy="NVIM_APPNAME=nvim_apps/lazynvim nvim";
  avim = "NVIM_APPNAME=nvim_apps/astro nvim";
  luvim = "NVIM_APPNAME=nvim_apps/LunarVim nvim";
  # lvim = "NVIM_APPNAME=nvim_apps/lazynvim /opt/homebrew/bin/nvim";

  #
  # TODO: fix broken config
  nvim-lazy="NVIM_APPNAME=nvim_apps/lazynvim nvim";
  nvim-kick="NVIM_APPNAME=nvim_apps/kickstart nvim";
  nvim-chad="NVIM_APPNAME=nvim_apps/NvChad nvim";
  nvim-astro="NVIM_APPNAME=nvim_apps/AstroNvim nvim";
  # End TODO

  reload = "exec zsh -l"; # relaunch zsh and login

  # Nix
  xx = "home-manager switch && reload";

  # Docker
  docker="podman";
}
