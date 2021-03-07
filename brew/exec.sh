
install_all() {
  xargs brew install < brew_list.txt
}

export_to_file() {
  brew leaves > brew_list.txt
}
