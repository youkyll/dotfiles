#!/bin/sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# use tmux
if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux attach
  else
    tmux
  fi
fi
