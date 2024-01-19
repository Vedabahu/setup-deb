#!/usr/bin/bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"

if ! [ -x "$(command -v ansible)" ]; then
    sudo apt-get install ansible
fi 


if [[ -f "$DOTFILES_DIR/requirements.yml" ]]; then
    cd "$DOTFILES_DIR"

    ansible-galaxy install -r requirements.yml
fi 

cd "$DOTFILES_DIR"

ansible-playbook --ask-become-pass "$DOTFILES_DIR/main.yml"

echo "Installing Oh My ZSH!"

sh -c "$(curl -fsSL https://install.ohmyz.sh)"
