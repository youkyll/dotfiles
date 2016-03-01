# .bashrc
. ~/dotfiles/sh/common/init.sh


#env variables
export PAGER=less


#invalid ctr+s and ctr+q
if type stty > /dev/null 2>&1; then
  stty -ixon -ixoff
fi

#git complete
source "$HOME/dotfiles/sh/bash/git-prompt.sh"

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

#prompt
GIT_PS1_SHOWDIRTYSTATE=true

RIGHT='\[\e[$[COLUMNS-$(echo -n " $(__git_ps1)" | wc -c)]C\[\e[0;36m\]$(__git_ps1)\e[\e[$[COLUMNS]D\]'
MAIN='\[\e[1;32m\]\u[\w]'
L2="\[\e[1;37m\]\$?\$"
PS1="${RIGHT}${MAIN}\n${L2} "
# User specific aliases and functions


#history
HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT='%m/%d %H:%M '
HISTIGNORE=ls:la:ll:lla:history:h:pwd
HISTCONTROL=ignoreboth
# enhancd
if [ -f "/home/imaiyu/.enhancd/bash/enhancd.bash" ]; then
    source "/home/imaiyu/.enhancd/bash/enhancd.bash"
fi

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
