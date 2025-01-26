#!/bin/sh
echo -ne '\033c\033]0;Bubble\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Bubble.x86_64" "$@"
