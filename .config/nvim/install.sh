#!/bin/sh

NVD_APP_NAME=nvim-dev
NVD_APP_CONFIG=~/.config/$NVD_APP_NAME
NVD_APP_DATA=~/.local/share/$NVD_APP_NAME
NVD_APP_STATE=~/.local/state/$NVD_APP_NAME
export NVD_APP_NAME NVD_APP_CONFIG NVD_APP_DATA

rm -rf $NVD_APP_CONFIG $NVD_APP_DATA $NVD_APP_STATE && mkdir -p $NVD_APP_CONFIG

stow --restow --target=$NVD_APP_CONFIG .

alias nvd="NVIM_APPNAME=$NVD_APP_NAME nvim"

export nvd

nvd
