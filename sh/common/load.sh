### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### nvm
if [ `uname` = "Darwin" ]; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

export PATH="$HOME/local/bin:$PATH"

# golang
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
