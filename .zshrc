# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory extendedglob
unsetopt autocd nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/finlay/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U colors && colors
PROMPT="%{$fg[green]%}%n@%{$reset_color%}%{$fg[red]%}%m:%{$fg_no_bold[yellow]%}%~ %{$reset_color%}> "
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-builder/output/shell/base16-eighties.dark.sh"
 [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias tmux='tmux -2'
alias ipynb="ipython notebook --browser=chromium"
export PATH="$HOME/.cabal/bin:$PATH"
export EDITOR=/usr/bin/vim

case $TERM in
    xterm*)
        preexec() {print -Pn "\e]0;%N: %~\a"}
    ;;
esac
