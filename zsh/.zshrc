# The following lines were added by compinstall
zstyle :compinstall filename '/home/iamwpj/.zshrc'
autoload -Uz compinit
compinit

# Basic zsh settings
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e

# VCS Info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%F{3}(%b) '
precmd() {
    vcs_info
}

# Install Antigen: https://github.com/zsh-users/antigen
source /home/iamwpj/.local/bin/antigen.zsh

# Antigen plugins
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle joshskidmore/zsh-fzf-history-search
antigen apply

# Autocomplete
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#649c9e"

# Prompt
setopt prompt_subst
PROMPT='%B%F{2}%n@%m%f:%F{12}%~ ${vcs_info_msg_0_}%f\$%b '

# PATH
PATH="$PATH:$HOME/.local/bin"
PATH=$PATH:"$HOME/go/bin"

# Alias
alias dnf="sudo dnf"
alias vi=vim
