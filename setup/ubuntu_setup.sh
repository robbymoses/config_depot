#!/bin/bash

## Packages File
packages="~/config_depot/setup/packages.list"

## Update && Upgrade
sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y

## Install Script to Set up packages for WSL.
sudo apt-get install -y $(grep -vE "^\s*#" $packages | tr "\n" "\t")

## Install Additional Scripts
for file in ~/config_depot/setup/custom_installers/*
do
   sh $file
done

## Update shell
sudo chsh -s /bin/zsh $USER
