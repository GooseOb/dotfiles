source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

local COMMAND_COLOR='fg=#7E9CD8'
local STRING_COLOR='fg=#98BB6C'
local ESCAPE_COLOR='fg=#E46876'

ZSH_HIGHLIGHT_STYLES[suffix-alias]="$COMMAND_COLOR,underline"
ZSH_HIGHLIGHT_STYLES[precommand]="$COMMAND_COLOR,underline"
ZSH_HIGHLIGHT_STYLES[arg0]="$COMMAND_COLOR"

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="$STRING_COLOR"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="$STRING_COLOR"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]="$STRING_COLOR"
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]="$STRING_COLOR"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]="$STRING_COLOR"
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]="$STRING_COLOR"

ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=white'

ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]="$ESCAPE_COLOR"
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]="$ESCAPE_COLOR"

ZSH_HIGHLIGHT_STYLES[unknown-token]="$ESCAPE_COLOR"

ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#957FB8'
