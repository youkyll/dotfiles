#!/bin/sh
echo 'init starting...'

dir="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)"

# ファイル全読み込み
for shared in $dir/*; do
  if [[ $shared =~ init.sh$ ]];then
    continue
  fi

  . $shared
done

echo 'done'
