#!/bin/sh

NV_APP_NAME=nvim
NV_APP_CONFIG=~/.config/$NV_APP_NAME
NV_APP_DATA=~/.local/share/$NV_APP_NAME
NV_APP_STATE=~/.local/state/$NV_APP_NAME
NV_APP_BACKUP=~/dotfiles/.config/$NV_APP_NAME
NV_DEV_NAME=nvim-dev
NV_DEV_CONFIG=~/dotfiles/.config/$NV_DEV_NAME

# Create a backup of the current setup
rm -rf $NV_APP_BACKUP && mkdir -p $NV_APP_BACKUP
cp -r $NV_APP_CONFIG/* $NV_APP_BACKUP

# Deploy the dev setup to $NV_APP_CONFIG
rm -rf $NV_APP_CONFIG $NV_APP_DATA $NV_APP_STATE && mkdir -p $NV_APP_CONFIG
cp -r $NV_DEV_CONFIG/* $NV_APP_CONFIG

nvim
