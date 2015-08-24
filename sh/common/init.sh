#!/bin/bash -v
echo 'init starting...'

# このファイルの絶対パス
dir="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"

# ファイル全読み込み
for shared in $dir/*; do
  if echo $shared | grep -qE "init.sh$"; then
    continue
  fi

  . $shared
done

echo 'done'
