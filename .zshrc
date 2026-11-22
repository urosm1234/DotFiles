# ---- History ----
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# ---- General ----
setopt AUTO_CD            # type a folder name to cd into it
setopt INTERACTIVE_COMMENTS

# ---- Vim mode (zsh-vi-mode) ----
# Init immediately so the keybindings below aren't overwritten
ZVM_INIT_MODE=sourcing
source ~/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# ---- Autocomplete ----
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no                           # let fzf-tab handle the menu

# fzf-tab: Tab opens a fuzzy menu (must load after compinit, before other plugins)
source ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group '<' '>'

# Up/Down search history by what you've typed
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# ---- Aliases ----
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'

# ---- Tools ----
eval "$(zoxide init zsh)"                 # 'z foldername' to jump anywhere
source <(fzf --zsh)                       # Ctrl+R fuzzy history, Ctrl+T file search

# ---- Plugins (must be near the end) ----
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Prompt (same bar as bash) ----
eval "$(starship init zsh)"
