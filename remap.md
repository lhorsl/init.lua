# Neovim Key Remaps Documentation

## Core Navigation & Editing

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<Esc>` | Normal | Clear search highlights | Removes search highlighting |
| `<Esc><Esc>` | Terminal | Exit terminal mode | Returns to normal mode from terminal |
| `<C-h/j/k/l>` | Normal | Window navigation | Move focus between splits |
| `<leader>v` | Normal | Vertical split | Create vertical window split |
| `<leader>pv` | Normal | File explorer | Open netrw file explorer |

## Search & Find (Telescope)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>ff` | Normal | Git files | Find files in git repo |
| `<leader>sf` | Normal | Find files | Search all files |
| `<leader>sw` | Normal | Grep word | Search current word |
| `<leader>sg` | Normal | Live grep | Interactive text search |
| `<leader><leader>` | Normal | Buffers | Find open buffers |
| `<leader>/` | Normal | Buffer search | Fuzzy find in current buffer |

## LSP Operations

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `gd` | Normal | Go to definition | Jump to symbol definition |
| `gr` | Normal | References | Show symbol references |
| `<leader>rn` | Normal | Rename | Rename symbol |
| `<leader>ca` | Normal/Visual | Code actions | Show available code actions |
| `<leader>f` | Normal | Format | Format current buffer |

## Git Operations (GitSigns)

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `]c` / `[c` | Normal | Next/prev hunk | Navigate git changes |
| `<leader>hs` | Normal/Visual | Stage hunk | Stage git changes |
| `<leader>hr` | Normal/Visual | Reset hunk | Undo git changes |
| `<leader>hp` | Normal | Preview hunk | Show git diff |
| `<leader>hb` | Normal | Blame line | Show git blame |

## Text Editing Enhancements

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `J` / `K` | Visual | Move selection | Move highlighted text up/down |
| `<leader>p` | Visual | Paste without yank | Paste without overwriting register |
| `<leader>y` | Normal/Visual | System clipboard yank | Copy to system clipboard |
| `<C-d>` / `<C-u>` | Normal | Centered scrolling | Page up/down with cursor centered |
| `n` / `N` | Normal | Centered search | Next/prev search result, centered |

## Debug Controls

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<F5>` | Normal | Start/Continue debug | Begin or continue debugging |
| `<F1>` / `<F2>` / `<F3>` | Normal | Step into/over/out | Debug stepping controls |
| `<leader>b` | Normal | Toggle breakpoint | Set/remove breakpoint |
| `<F7>` | Normal | Debug UI | Toggle debug interface |

## Utilities & Fun

| Key | Mode | Action | Description |
|-----|------|--------|-------------|
| `<leader>x` | Normal | Make executable | Add execute permissions to file |
| `<leader>ut` | Normal | UndoTree | Toggle undo history tree |
| `<leader>fml` | Normal | Cellular automaton | Fun rain animation |
| `<C-f>` | Normal | Tmux sessionizer | Launch tmux session picker |

## Disabled/Training Keys

Arrow keys in normal mode are disabled with helpful messages encouraging hjkl usage.

**Leader Key**: `<Space>` (configured as both `mapleader` and `maplocalleader`)
