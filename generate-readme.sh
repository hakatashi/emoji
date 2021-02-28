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

  img_urls=($(for f in ${files[@]}; do echo "https://cdn.jsdelivr.net/gh/hakatashi/emoji@master/$f"; done))
  imgs=($(for f in ${img_urls[@]}; do echo "[![]($f)]($f)"; done))
  img_columns=$(printf " | %s" "${imgs[@]}")

  echo ${columns:3}
  echo ${seperator_columns:3}
  echo ${img_columns:3}
  echo
done