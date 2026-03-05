
# The following lines were added by compinstall
zstyle :compinstall filename '/home/secretary/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%F{3}(%b) '
precmd() {
    vcs_info
}

setopt prompt_subst

PROMPT='%B%F{2}%n@%m%f:%F{12}%~ ${vcs_info_msg_0_}%f\$%b '
PATH="$PATH:$HOME/.local/bin"

alias vi=vim
