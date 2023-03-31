#!/usr/bin/env bash
set -e

repo=$1
platform="amd64"
my_bin="/home/user/bin"

# Fetch latest release
release_path=$(curl -s "https://github.com/$repo/releases" | grep 'releases/tag' | awk -F'"' '{print $6}' | awk -F'/' '{print $6}' | head -n 1)
# echo "$release_path"

appimage_link=$(curl -s "https://github.com/$repo/releases/expanded_assets/$release_path" | grep ${platform} | grep 'AppImage"' | awk -F'"' '{print $2}' | grep -v sha256 | head -n 1)
file_name=$(echo "$appimage_link" | awk -F'/' '{print $7}')

file_path="$my_bin"/"$file_name"

# echo "$appimage_link" "$file_name"
wget -O "$file_path" https://github.com/"$appimage_link"
chmod +x "$file_path"

"$my_bin"/fix_appimage.sh $2
