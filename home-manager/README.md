# Home-Manager

## Installing

### Add the nix-channel for Home-Manager

```sh
 nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
 nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
 nix-channel --update

```

#### Link the bootstrapping config file

Create any missing directories manually

```sh
ln -s `pwd`/home.nix ~/.config/home-manager/
```

#### Run the installer

```sh

nix-shell '<home-manager>' -A install
# or
nix-env -iA nixpkgs.home-manager
```

Note an alias _xx_ is created that switches to the new configuration and initializes the zsh.

[ ] Install nerdfonts

## Usage

Some good [docs](https://nix-community.github.io/home-manager/index.html#ch-usage).

## Change Configuration

This git repo has my configuration for nix to apply any edits run `xx` which is a shortcut

```
xx = "home-manager switch && reload";
```

## Upgrade Packages

```sh
nix-channel --update
home-manager switch # I use shortcut xx
```

## Remapping keys

On windows I've used the _powertoys_ utility which has a keyboard remapper to map **CAPSLOCK** to **ESC**.

## Key Repeating

On some OSes the default is to prevent key repeats which is annoying for navigating with VIM keybindings.

[Article on key repeat settings](https://vimforvscode.com/enable-key-repeat-vim)

#### MacOS

```sh
# per specific app
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false
defaults write com.jetbrains.pycharm ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# Global (Note this prevents the access to accented characters on hold)
defaults write -g ApplePressAndHoldEnabled -bool false
```

## Display Management on MacOS

Setting resolution and placement on MacOS via the command line I'm using [displayplacer](https://github.com/jakehilborn/displayplacer).

##### Install

```sh
brew tap jakehilborn/jakehilborn && brew install displayplacer
```

##### Some Presets

# current home setup with two external monitors

```sh
displayplacer "id:37D8832A-2D66-02CA-B9F7-8F30A301B230 res:1512x982 hz:120 color_depth:8 enabled:true scaling:on origin:(0,0) degree:0" "id:64B0B9CB-DBC0-4B40-9067-003180CA6686 res:3008x1692 hz:60 color_depth:7 enabled:true scaling:on origin:(3204,-761) degree:0" "id:9D804D51-C2D4-4706-AF4F-8F1A78CDF19D res:1692x3008 hz:60 color_depth:8 enabled:true scaling:on origin:(1512,-761) degree:90"
```

## Links

[My Neovim Documentation](./Neovim.md)

### Troubleshooting and Tips

#### MacOS updates breaks nix

[Reddit Tread About](https://www.reddit.com/r/Nix/comments/11ynxa5/every_macos_update_needs_me_to_rerun_the_nix/) has a discussion. Starting up the nix-daemon worked for me.

```sh
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ];
then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
```

May add this to my zshrc.

