#!/bin/sh

NV_APP_NAME=nvim
NV_APP_CONFIG=~/.config/$NV_APP_NAME
NV_APP_DATA=~/.local/share/$NV_APP_NAME

rm -rf $NV_APP_CONFIG $NV_APP_DATA && mkdir -p $NV_APP_CONFIG

cp -r . $NV_APP_CONFIG

