
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# nvm
PATH=${NVM_DIR:-$HOME/.nvm}/default/bin:$PATH
MANPATH=${NVM_DIR:-$HOME/.nvm}/default/share/man:$MANPATH
export NODE_PATH=${NVM_DIR:-$HOME/.nvm}/default/lib/node_modules
NODE_PATH=${NODE_PATH:A}
source "$HOME/dotfiles/sh/lib/nvm.sh"

# source ~/.gvm/scripts/gvm

export PATH="$HOME/local/bin:$PATH"

# golang
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

# ruby
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# python
export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
