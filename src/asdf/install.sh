#!/bin/zsh

set -e

echo "Installing plugins and packages with ASDF"

PLUGINS=${PLUGINS:-undefined}
echo "Provided plugin(s): $PLUGINS"

su -s /bin/zsh -c "git clone https://github.com/asdf-vm/asdf.git ~/.asdf" - $_CONTAINER_USER
su -s /bin/zsh -c "echo \". ~/.asdf/asdf.sh\" >> ~/.zshrc" - $_CONTAINER_USER
su -s /bin/zsh -c "source ~/.zshrc" - $_CONTAINER_USER

su -s /bin/zsh -c "cat ~/.zshrc" - $_CONTAINER_USER

for PLUGIN in $(echo $PLUGINS | sed "s/,/ /g")
do
    su -s /bin/zsh -c "source ~/.zshrc; asdf plugin add $PLUGIN" - $_CONTAINER_USER
done

su -s /bin/zsh -c "asdf install" - $_CONTAINER_USER