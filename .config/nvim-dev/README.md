## Neovim Setup

In this folder you can find my Neovim setup. This is a repo of my dev
environment where I might be trying some new things. That might not always
make it stable. I've included a few scripts that will help setup the config.

#### Install

The install script will (you guessed it!) install a dedicated environment
that operates separately from your Neovim config. After running the install
script, the environment can be reached with the `nvd` command. Use this
environment to try out the script or change any parts of the config.

To run the script: <br>

```
source ./install.sh
```

#### Deploy

If you want to make the setup your regular config, you can run the deploy
script. This will copy the config into your .config folder. This will also
make a backup folder in your dotfiles folder (it will create the folder if it
doesn't exist)

To run the deploy script:
```
source ./deploy.sh
```

The restore script can be run if you want to restore your old setup:
```
source ./restore.sh
```

#### OS

This has been created on a  Linux server. It should work on a MacOS as well,
but it's not tested. You might have to run the sudo command, eg:

```
sudo source ./install.sh
```

This will not work on Windows!



