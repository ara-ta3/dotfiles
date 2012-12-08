# autoload
autoload -U colors
colors
autoload -U compinit
compinit
setopt auto_pushd
setopt auto_cd
setopt correct
setopt cdable_vars
setopt PUSHD_IGNORE_DUPS
setopt AUTO_PUSHD
setopt no_beep
setopt nolistbeep

[-f ~/.zshrc.local ] && source ~/.zshrc.local

# zstyle
 zstyle ':completion:*' menu select true
# directory = blue, symbolic link = magenta
 zstyle ':completion:*' list-colors 'di=34;49' 'ln=35;49'
    
# standard prompt
    PROMPT="%{${fg[cyan]}%}%n%{${fg[yellow]}%}-> %{${reset_color}%}"

# right prompt(display git branch)
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
        psvar=()
            LANG=en_US.UTF-8 vcs_info
             [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{red}%1v%f|)%{${fg[green]}%}[%~]%{${reset_color}%}"
#RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

# spell correction prompt
SPROMPT="%{${fg[red]}%}%r%{${reset_color}%} is correct? [n,y,a,e]: "

# mysql prompt
m_color0=$'\e[1;36m'
m_color1=$'\e[1;33m'
m_clear=$'\e[0m'
export MYSQL_PS1="$m_color0(\d)$m_color1> $m_clear"

# colorstyle (ls)
LS_COLORS="di=34;49:ln=35;49"

# alias
alias l="ls"
alias ll="ls -l"
alias la="ls -A"
alias al="ls -A"
alias lla="ls -Al"
alias rm="rm -i"

alias cp="cp -i"
alias mv="mv -i"
alias grep="grep --color"
alias gch='git checkout'
alias ga='git add'
alias gcm='git commit'
alias gcmm='git commit -m'
alias gs='git status'
alias gd='git diff'
