# init.lua
Personal nvim config 
Intended to be used with dev-env

### Install External Dependencies
External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on the platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true

if not using dev-env:
```sh
git clone https://github.com/lhorsl/init.lua "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

