#alias

#list directory
alias ls='ls -G'        # Compact view, show colors
alias la='ls -AF'       # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'

#change directory
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias cdd='~/dotfiles'   # Go dotfiles dir

# Directory
alias md='mkdir -p'
alias rd='rmdir'

#other aliases
alias c='clear'
alias q='exit'
alias h='history -fd'

#git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gco='git checkout'
alias gc='git commit'
alias gcm='git commit -m'
alias gl='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --date=relative'
alias gla='git log --graph --all --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --date=relative'
alias gsh='git show'
alias gd='git diff '
alias gdc='git diff --cached'
alias gb='git branch'
alias gmv='git mv'
alias grm='git rm'
alias grmc='git rm --cached'
alias gre='git reset'
alias gp='git push origin'

#edit alias
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias zshrc='vim ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'

# docker
alias dc='docker-compose'
alias k='kubectl'

# ruby
alias b='bundle'
alias bu='bundle update'
