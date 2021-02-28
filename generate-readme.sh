#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

images=($(ls images/*.png))

for ((i = 0; i < ${#images[@]}; i += 4)); do
  files=("${images[@]:i:4}")
  emojis=($(for f in ${files[@]}; do echo "\`:$(basename $f .png):\`"; done))
  columns=$(printf " | %s" "${emojis[@]}")

  seperators=($(for f in ${files[@]}; do echo ':-:'; done))
  seperator_columns=$(printf " | %s" "${seperators[@]}")

  imgs=($(for f in ${files[@]}; do echo "[![]($f)](https://github.com/hakatashi/emoji/raw/master/$f)"; done))
  img_columns=$(printf " | %s" "${imgs[@]}")

  echo ${columns:3}
  echo ${seperator_columns:3}
  echo ${img_columns:3}
  echo
done