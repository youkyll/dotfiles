#!/bin/sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# use tmux
if [ -z $TMUX ]; then
  tmux attach || tmux new-session \; source-file ~/dotfiles/tmux/split_4
fi
