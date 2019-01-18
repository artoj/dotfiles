#!/bin/bash

set -o vi

shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

shopt -s checkwinsize

PROMPT_COMMAND='hasjobs=$(jobs -p)'
PS1='$? \h:\w${hasjobs:+(\j)}\$ '

EDITOR=vim
VISUAL=$EDITOR

GOPATH=$HOME/go
GOBIN=$GOPATH/bin

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
