#!/bin/bash
# DevOps Engineer .bashrc Template
# Optimized for productivity and DevOps workflows

# History settings
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ll='ls -alF'
alias la='ls -A'

# Safety aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# DevOps aliases
alias k='kubectl'
alias d='docker'
alias dc='docker-compose'
alias tf='terraform'
alias g='git'

# Kubernetes shortcuts
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kl='kubectl logs -f'
alias ke='kubectl exec -it'

# Docker shortcuts
alias dps='docker ps'
alias dimg='docker images'
alias dlogs='docker logs -f'
alias dexec='docker exec -it'

# Git shortcuts
alias gs='git status'
alias gd='git diff'
alias gc='git commit -m'
alias gp='git push'
alias gl='git log --oneline -10'

# System monitoring
alias ports='netstat -tulanp'
alias mem='free -h'
alias disk='df -h'
alias cpu='top -bn1 | head -5'

# Custom prompt with git branch
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]$(parse_git_branch)\[\033[00m\]\$ '

# Path additions
export PATH="$HOME/.local/bin:$PATH"

# Environment variables
export EDITOR=vim
export VISUAL=vim

# Load local customizations if exists
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
