#!/bin/zsh
set -e

echo "Installing plugins and packages with ASDF"

PLUGINS=${PLUGINS:-undefined}
echo "Provided plugin(s): $PLUGINS"

echo "git clone https://github.com/asdf-vm/asdf.git ~/.asdf"
su -c "git clone https://github.com/asdf-vm/asdf.git ~/.asdf" - $_CONTAINER_USER

echo "echo \". ~/.asdf/asdf.sh\" >> ~/.zshrc"
su -c "echo \". ~/.asdf/asdf.sh\" >> ~/.zshrc" - $_CONTAINER_USER

for PLUGIN in $(echo $PLUGINS | sed "s/,/ /g")
do
    echo "asdf plugin add $PLUGIN"
    su -c "asdf plugin add $PLUGIN" - $_CONTAINER_USER
done

echo "asdf install"
su -c "asdf install" - $_CONTAINER_USER