#!/usr/bin/bash
set -e

DOTFILES_DIR = "$HOME/.dotfiles"

if ! [ -x "$(command -v ansible)" ]; then
    sudo apt-get install ansible
fi 

cd "$DOTFILES_DIR"

ansible-galaxy install -r requirements.yml
