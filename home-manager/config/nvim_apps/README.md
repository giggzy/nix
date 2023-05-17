# NVIM Apps

Neovim has the concept of apps which allows having multiple configurations on the same host. Different configurations can be picked up by setting the NVIM_APPNAME environmental variable.

```sh
NVIM_APPNAME=astro nvim
```

Neovim will look in `$XDG_CONFIG/$NVIM_APPNAME` instead of `$XDG_CONFIG/nvim`.

