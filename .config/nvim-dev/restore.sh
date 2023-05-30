#!/bin/sh

NV_APP_NAME=nvim
NV_APP_CONFIG=~/.config/$NV_APP_NAME
NV_APP_DATA=~/.local/share/$NV_APP_NAME
NV_APP_STATE=~/.local/state/$NV_APP_NAME
NV_APP_BACKUP=~/dotfiles/.config/nvim-backup

# Restore the old setup from the nvim-backup directory
rm -rf $NV_APP_CONFIG $NV_APP_DATA $NV_APP_STATE && mkdir -p $NV_APP_CONFIG
cp -r $NV_APP_BACKUP/* $NV_APP_CONFIG

nvim
