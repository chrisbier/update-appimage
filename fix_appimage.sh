#!/usr/bin/env bash

my_bin="/home/user/bin"

app=$1

new_appimage=$(find "$my_bin" -iname "*${app}*.AppImage" | tail -n 1)

if [ -e "$app" ]
then
    rm "$app"
fi

ln -s "$new_appimage" "$my_bin"/"$app"
