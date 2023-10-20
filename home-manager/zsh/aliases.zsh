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
  avim = "NVIM_APPNAME=nvim_apps/astro nvim";
  luvim = "NVIM_APPNAME=nvim_apps/LunarVim nvim";
  lvim = "NVIM_APPNAME=nvim_apps/lazynvim nvim";

  # TODO: fix broken config
  nvim-lazy="NVIM_APPNAME=lazynvim nvim"; 
  nvim-kick="NVIM_APPNAME=kickstart nvim";
  nvim-chad="NVIM_APPNAME=NvChad nvim";
  nvim-astro="NVIM_APPNAME=AstroNvim nvim";
  # End TODO

  reload = "exec zsh -l"; # relaunch zsh and login

  # Nix
  xx = "home-manager switch && reload";

}
