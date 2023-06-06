# Home-Mangager

## Installing

#### Add the nix-channel for Home-Mangager.
```sh
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
$ nix-channel --update

```

#### Link the bootstrapping config file

Create any missing directories manually

```sh
ln -s `pwd`/home.nix ~/.config/home-manager/
```

#### Run the installer
```sh
nix-shell '<home-manager>' -A install
```

Note an alias *xx* is created that switches to the new configuration and initializses the zsh.

[ ] Install nerdfonts


## Usage

Some good [docs](https://nix-community.github.io/home-manager/index.html#ch-usage).

## Remapping keys

On windows I've used the _powertoys_ utility which has a keyboard remapper to map **CAPSLOCK** to **ESC**.
