#!/usr/bin/env bash

my_bin="/home/user/bin"

app=$1

new_appimage=$(ls "$my_bin"/"${app}""-*" | tail -n 1)

if [ ! -e "$app" ]
then
    rm "$app"
fi

ln -s "$my_bin"/"$new_appimage" "$my_bin"/"$app"
