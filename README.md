# DotFiles

My config files for **zsh** and **tmux** (Fedora).

| File | Goes to |
|------|---------|
| `.zshrc` | `~/.zshrc` |
| `.tmux.conf` | `~/.tmux.conf` |
| `starship.toml` | `~/.config/starship.toml` |

## zsh

### Packages (dnf)

```sh
sudo dnf install zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide git
```

| Package | What it does |
|---------|--------------|
| `zsh-autosuggestions` | Grey suggestions from history as you type (→ to accept) |
| `zsh-syntax-highlighting` | Commands turn green if valid, red if not |
| `fzf` | Ctrl+R fuzzy history search, Ctrl+T fuzzy file search |
| `zoxide` | `z <part-of-name>` jumps to a folder you've visited before |

### Plugins (git, not packaged for Fedora)

```sh
mkdir -p ~/.zsh/plugins
git clone --depth 1 https://github.com/Aloxaf/fzf-tab.git      ~/.zsh/plugins/fzf-tab
git clone --depth 1 https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh/plugins/zsh-vi-mode
```

| Plugin | What it does |
|--------|--------------|
| [fzf-tab](https://github.com/Aloxaf/fzf-tab) | Tab completion opens an fzf fuzzy menu with previews |
| [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode) | Vim mode with text objects (`ci"`, `di(`), cursor shape per mode, `vv` to edit in `$EDITOR` |

Update them with:

```sh
git -C ~/.zsh/plugins/fzf-tab pull
git -C ~/.zsh/plugins/zsh-vi-mode pull
```

### Prompt

[Starship](https://starship.rs) draws the colour bar (time, folder, git branch, ...).

```sh
curl -sS https://starship.rs/install.sh | sh
```

Its config is `starship.toml` in this repo (gruvbox dark palette); copy it to `~/.config/starship.toml`.
The same config works in bash too: add `eval "$(starship init bash)"` to `~/.bashrc`.
It needs a [Nerd Font](https://www.nerdfonts.com) for the icons. I use **JetBrainsMono Nerd Font**.

### Make zsh the default shell

```sh
chsh -s /usr/bin/zsh
```

Log out and back in.

## tmux

### Packages (dnf)

```sh
sudo dnf install tmux wl-clipboard
```

`wl-clipboard` provides `wl-copy`, used so `y` in copy mode copies to the system clipboard (Wayland).

### Plugin manager (TPM)

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then start tmux and press **prefix + I** (capital i) to install the plugins below.

| Plugin | What it does |
|--------|--------------|
| [tpm](https://github.com/tmux-plugins/tpm) | Plugin manager |
| [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sensible default settings |
| [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) | Save/restore sessions: **prefix + Ctrl+s** to save, **prefix + Ctrl+r** to restore |

### Key bindings

| Keys | Action |
|------|--------|
| prefix + `\|` | Split side by side (keeps current folder) |
| prefix + `-` | Split top/bottom (keeps current folder) |
| prefix + `r` | Reload config |
| `v` / `y` in copy mode | Select / copy to clipboard |

Default prefix is **Ctrl+b**.

## Quick install

```sh
cp .zshrc .tmux.conf ~/
mkdir -p ~/.config && cp starship.toml ~/.config/
```
