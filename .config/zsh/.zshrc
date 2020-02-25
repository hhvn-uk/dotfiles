# Completion
autoload -Uz compinit promptinit
compinit
promptinit

. $HOME/.ls_colors
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export PROMPT="%F{2}[%F{3}%F{4}%n@%F{5}%M %F{6}%~/%F{2}]%F{11}\$ %F"

# Vi-mode
bindkey -v
zmodload zsh/complist
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' 	  backward-delete-char

# Alias'
. $ZDOTDIR/alias

# Keys
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# Syntax highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=13'
ZSH_HIGHLIGHT_STYLES[alias]='fg=13,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=13,underline,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=13,underline,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=13,underline,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=15'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=15'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=15'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=15'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=15'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=15'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=10'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=7'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=7'
ZSH_HIGHLIGHT_STYLES[path]='fg=7'

. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
