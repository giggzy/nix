# Neovim

The lua based fork of vim.

## ZSH convenience aliases and functions

- [aliases](./zsh/aliases.zsh?#L14)
- [functions](./zsh/functions.zsh)

## Astronvim User Customization

I've decided to use a symbolic link for my Astronvim customizations for faster iterations in change testing loop.

```sh
mkdir -p ~/.config/nvim_apps/astronvim/lua
ln -s ./config/nvim_apps/astronvim_user ~/.config/nvim_apps/astronvim/lua/user
```

[ ] Decide to move bootstrapping to _home.nix_?

## Submodule management

```bash
git submodule add <remote_url> <destination_folder>     # Add a submodule
git submodule update --recursive --remote               # Update all submodules:
```
