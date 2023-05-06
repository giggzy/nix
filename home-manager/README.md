# Home-Mangager

## Installing

Add the nix-channel for Home-Mangager.
```sh
$ nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
$ nix-channel --update
```

Run the installer
```sh
nix-shell '<home-manager>' -A install
```
