#!/usr/bin/env bash
d=$(date +%Y-%m-%d-%H-%M-%S)
dy_cache_file="$HOME/tmp/tmp-dy-video.mp4"
dy_meta_file="$HOME/tmp/dy_meta_file.txt"

file="dy-${d}.mp4"
mv $dy_cache_file "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Growth/1_raw_reference/media.nosync/$file"
echo "$file"
echo "video: ![[$file]]">>$dy_meta_file
cat $dy_meta_file | pbcopy