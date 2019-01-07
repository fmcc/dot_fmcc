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
BASE16_SHELL=$HOME/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

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

alias h='history -10000 | grep'

alias tmux='tmux -2'
alias ipynb="ipython notebook --browser=chromium"
alias tng="play -c 2 -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +10"
#alias mfa-aws="$(aws-mfa | sed `s/'//`)"

export PATH="$HOME/.local/bin:$HOME/.gem/ruby/2.3.0/bin:$HOME/.npm:$PATH"
export RUST_SRC_PATH="/usr/local/src/rust/src"
export EDITOR=/usr/bin/vim
export PATH="$HOME/.cargo/bin:$PATH"

VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
export WORKON_HOME=$HOME/.virtualenvs

export PYTHONDONTWRITEBYTECODE=1

case $TERM in
    xterm*)
        preexec() {print -Pn "\e]0;%N: %~\a"}
    ;;
esac

fpath=(~/.zsh/completion $fpath)
