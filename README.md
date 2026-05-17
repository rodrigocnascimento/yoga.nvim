# yoga.nvim

Personal Neovim configuration focused on a compact coding workflow, WSL-friendly defaults, fast project navigation, Git review tools, LSP setup, database helpers, and a custom HUD/statusline style.

This is a full Neovim config, not a standalone plugin. It is intended to live at `~/.config/nvim`.

## Requirements

- Neovim 0.11 or newer
- Git
- `make` and a C compiler for `telescope-fzf-native.nvim`
- Node.js/npm for `markdown-preview.nvim`
- A Nerd Font for icons

The LSP setup currently installs and enables:

- `lua_ls`
- `gopls`
- `ts_ls`

## Installation

Back up your existing Neovim config first:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone this repository:

```sh
git clone https://github.com/rodrigocnascimento/yoga.nvim ~/.config/nvim
```

Start Neovim:

```sh
nvim
```

`lazy.nvim` is bootstrapped automatically on first launch. After the first startup, run:

```vim
:Lazy sync
```

## Structure

```text
.
├── init.lua
├── lua
│   ├── config
│   │   ├── lazy.lua
│   │   ├── keymaps.lua
│   │   └── options.lua
│   └── plugins
│       ├── dadbod.lua
│       ├── diffview.lua
│       ├── doom.lua
│       ├── json-cheatsheets.lua
│       ├── lsp.lua
│       ├── lualine.lua
│       ├── markdown.lua
│       ├── oil.lua
│       ├── supermaven.lua
│       └── telescope.lua
└── cheatsheets
```

## Included Plugins

- `lazy.nvim` for plugin management
- `doom-hud.nvim` for the custom UI/HUD theme
- `lualine.nvim` using the Doom HUD lualine config
- `oil.nvim` as the default file explorer
- `telescope.nvim` with `telescope-fzf-native.nvim`
- `mason.nvim`, `mason-lspconfig.nvim`, and `nvim-lspconfig`
- `diffview.nvim` for Git diff and file history views
- `vim-dadbod`, `vim-dadbod-ui`, and `vim-dadbod-completion`
- `markdown-preview.nvim`
- `supermaven-nvim`
- local `json-cheats.nvim` integration from `~/code/json-cheats.nvim`

## Keymaps

Leader is set to Space.

| Keymap | Mode | Action |
| --- | --- | --- |
| `-` | Normal | Open Oil file explorer |
| `<leader>ff` | Normal | Find files with Telescope |
| `<leader>fg` | Normal | Live grep with Telescope |
| `<leader>fb` | Normal | List open buffers with Telescope |
| `<leader>fw` | Normal | Grep word under cursor with Telescope |
| `<leader>gd` | Normal | Open Diffview |
| `<leader>gD` | Normal | Close Diffview |
| `<leader>gh` | Normal | Show current file history in Diffview |
| `<leader>bt` | Normal | Toggle Dadbod UI |
| `<leader>bf` | Normal | Find current DB buffer in Dadbod UI |
| `<leader>bl` | Normal | Show last Dadbod query info |
| `<leader>jc` | Normal | Open JSON cheatsheets picker |
| `<leader>B` | Normal | Show current Git branch |

## Options

The config enables:

- absolute and relative line numbers
- true color
- system clipboard integration
- mouse support
- global statusline
- two-space indentation
- WSL clipboard integration through `clip.exe` and PowerShell
- lower timeout values for a more responsive terminal experience

## Notes

The `json-cheatsheets.lua` plugin entry uses a local plugin path:

```lua
dir = "~/code/json-cheats.nvim"
```

If that directory does not exist on your machine, remove that plugin spec or update the path.

Database connections for Dadbod are intentionally left empty in `lua/plugins/dadbod.lua`. Add your own connection entries there if you want the DB UI to open predefined databases.
