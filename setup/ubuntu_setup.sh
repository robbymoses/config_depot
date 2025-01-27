#!/bin/bash

## Packages File
PACKAGE_LIST=$HOME/config_depot/setup/packages.list

# Custom Install Scripts
CUSTOM_INSTALLERS=$HOME/config_depot/setup/custom_installers/*

# Public SSH Key
PUBLIC_KEY=$HOME/.ssh/id_ed25519.pub

## Update && Upgrade
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y

## Install Script to Set up packages for WSL.
sudo apt-get install -y $(grep -vE "^\s*#" $PACKAGE_LIST | tr "\n" "\t")

## Install Additional Scripts
for file in $CUSTOM_INSTALLERS
do
   sh $file
done

## Update shell
sudo chsh -s /bin/zsh $USER

## Stow Config Files
stow -d ~/config_depot -t ~/

## Generate SSH Key
if [ -f $PUBLIC_KEY ]; then
   echo "Found .ssh Key"
   cat $PUBLIC_KEY
else
   echo "No Key Found... Generating."
   cat $PUBLIC_KEY
   #ssh-keygen -t ed25519 -C "rmoses@titaniumbytes.com"
fi

## Update Github Remote for Config
git remote set-url origin git@github.com:robbymoses/config_depot.git
