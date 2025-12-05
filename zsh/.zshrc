# Enable colors and change prompt:
PS1="%K{#7E9CD8} %F{black}%~%k%F{#7E9CD8}%f%b "

HISTSIZE=10000
SAVEHIST=10000
export HISTFILE=~/.zhistory

export HOST_IP="$(ip route | awk '/^default/{print $3}')"
export PULSE_SERVER="tcp:$HOST_IP"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
		[[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
		[[ ${KEYMAP} == viins ]] ||
		[[ ${KEYMAP} = '' ]] ||
		[[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
	zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
	echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'                # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q'; } # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

setopt autocd

setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

export PATH="$PATH:/home/gooseob/.local/share/gem/ruby/3.3.0/bin:$HOME/.bun/bin:$HOME/.emacs.d/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

source ~/.zshplugins/index.zsh

source <(npm completion)
source <(bun completions)

# Fix history file if it's corrupted.
hisrepair() {
	strings $HISTFILE >~/fixed_history &&
		mv ~/fixed_history $HISTFILE &&
		fc -R
}

# Load zsh-syntax-highlighting; should be last.
source ~/.zshplugins/highlight.zsh

# # bun completions
# [ -s "/home/gooseob/.bun/_bun" ] && source "/home/gooseob/.bun/_bun"
export QT_QPA_PLATFORM=xcb
