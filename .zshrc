# exports
# for a full list of exports, run 'export'
export PATH=$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:/usr/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export EXA_COLORS="da=38;5;245:di=34;;:sn=38;5;28:sb=38;5;28:uu=38;5;40:un=38;5;160:gu=38;5;40:\
                   gn=38:5:160:bl=38;5;220:ur=37:uw=37:ux=37:ue=37:gr=37:gw=37:gx=37:tr=37:tw=37:\
                   tx=37:su=37:sf=37:xa=37"
export AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3"

# init scripts
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# case-sensitive completion.
CASE_SENSITIVE="true"

# plugins
# poetry: https://python-poetry.org/docs/#oh-my-zsh
plugins=(
    autoswitch_virtualenv
    poetry
    python
    git
    aws
    zsh-interactive-cd
    brew
    vscode
    command-not-found
    fzf
    rust
)

source $ZSH/oh-my-zsh.sh

# exa color schema

# aliases
# for a full list of active aliases, run `alias`.
alias fzfp='fzf --preview "bat --style=numbers --color=always {}"'
alias ls='exa --icons -1'
alias ll='exa --icons -lah'
alias l='exa --icons -lh'
alias tree='exa --tree -I "__pycache__"'
alias cat='bat --theme=gruvbox-dark'
alias diff='delta'
alias python=python3
alias pip=pip3
