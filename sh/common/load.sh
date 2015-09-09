### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### nvm
if [ `uname` = "Darwin" ]; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi
