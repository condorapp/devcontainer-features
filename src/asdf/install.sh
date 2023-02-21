#!/bin/zsh

set -e

echo "Installing plugins and packages with ASDF"

PLUGINS=${PLUGINS:-undefined}
echo "Provided plugin(s): $PLUGINS"

su -c "git clone https://github.com/asdf-vm/asdf.git ~/.asdf" - $_CONTAINER_USER
su -c "echo \". ~/.asdf/asdf.sh\" >> ~/.zshrc" - $_CONTAINER_USER
su -c ". ~/.zshrc" - $_CONTAINER_USER

for PLUGIN in $(echo $PLUGINS | sed "s/,/ /g")
do
    su -c "asdf plugin add $PLUGIN" - $_CONTAINER_USER
done

su -c "asdf install" - $_CONTAINER_USER