
nvm() {
    # まず仮の nvm コマンドを unset
    unset -f nvm

    # nvm.sh をロード
    # ここで本物の nvm コマンドが定義される
    source "${NVM_DIR:-$HOME/.nvm}/nvm.sh"

    # 仮の nvm コマンドに渡された引数を本物に受け渡す
    nvm "$@"
}

