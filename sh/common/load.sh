### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
### nvm
if [ `uname` = "Darwin" ]; then
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
source "/Users/yuki/google-cloud-sdk/completion.zsh.inc"

