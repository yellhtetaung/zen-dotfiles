#!/usr/bin/bash
# Custom Alias and Environment Variables for Zsh

# Aliases for showing hidden files and colored output
alias ls='ls -G'
alias la='ls -aG'
alias ll='ls -lG'
alias lsa='ls -lAG'

# Git Aliases
alias gs='git status'
alias gp='git pull'
alias gc='git commit'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gl='git log --oneline --graph --decorate --all'
alias gpush='git push'
alias gaa='git add -A'

# Navigation Aliases
alias ..='cd ..'
alias ...='cd ../..'

# Common Commands
alias load="source $HOME/.zprofile"