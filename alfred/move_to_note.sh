#!/usr/bin/env bash
d=$(date +%Y-%m-%d-%H-%M-%S)
dy_meta_file="$HOME/tmp/dy_meta_file.txt"

file="dy-${d}.mp4"
mv ~/tmp/a.mp4 "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Growth/1_raw_reference/media.nosync/$file"
echo "$file"
echo "video: ![[$file]]">>$dy_meta_file
cat $dy_meta_file | pbcopy