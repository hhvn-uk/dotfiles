# Make alias'
mkalias

# Prompt
precmd(){
	prev="$?"
	branch=$(\git branch 2>/dev/null | grep "\*" | tr -d '\*')
	#dir=$(pwd | sed "s~$HOME~~")
	dir=$(pwd)
	prompt="%{$(tput setab 3)%0G%} %{$(tput sgr0)%0G%} "
	[ "$prev" != "0" ] && prompt+="%F{10}$prev "
	prompt+="%F{4}"
	prompt+="%n"
	prompt+=" %F{6}"
	prompt+="$dir"
	prompt+="%F{5}"
	prompt+="$branch"
	prompt+="%F{5}"
	prompt+="%{ > %0G%}"
	prompt+="%F"
	export PROMT="$prompt"
}

# Completion
autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Vi-mode
bindkey -v
zmodload zsh/complist
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' 	  backward-delete-char

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

# Load .zsh files
for file in $(find $ZDOTDIR -name "*.zsh")
do
	. $file
done

. $HOME/.local/knock

# Highlighted man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;35m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'

# Syntax highlighting
typeset -A ZSH_HIGHLIGHT_STYLES
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=5,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=13'
ZSH_HIGHLIGHT_STYLES[function]='fg=13,bold'
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


alias hi="printf '  0/\n /|\n / \\ \n' | tee /dev/stderr | xclip"

. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# boot into X
[ "$(tty)" = "/dev/tty1" ] && startx
