# -------------------------------------------------------------------
# Shell & Prompt
# -------------------------------------------------------------------
eval "$(starship init zsh)"

# -------------------------------------------------------------------
# Completion System
# -------------------------------------------------------------------
autoload -Uz compinit && compinit

# Case-insensitive tab completion (lowercase matches uppercase)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Automatically append a trailing slash to completed directories
setopt AUTO_PARAM_SLASH

# Treat . and .. as valid completion targets with slashes
zstyle ':completion:*' special-dirs true

# -------------------------------------------------------------------
# Aliases & Tool Configs
# -------------------------------------------------------------------
alias ls="eza --icons --group-directories-first"
alias ll="eza -la --icons --group-directories-first --git"
alias tree="eza --tree --icons"

# Quick directory jumping
alias ..="cd .."

# Bright cyan directories for eza
export EZA_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# -------------------------------------------------------------------
# Dot Navigation Widget (typing .. turns into ../ automatically)
# -------------------------------------------------------------------
function rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert

# -------------------------------------------------------------------
# Plugins (Syntax Highlighting MUST be last)
# -------------------------------------------------------------------
[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
