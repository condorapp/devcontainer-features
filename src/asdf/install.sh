#!/bin/sh
set -e

echo "Installing plugins and packages with ASDF"

PLUGINS=${PLUGINS:-undefined}
echo "Provided plugin(s): $PLUGINS"

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo ". ~/.asdf/asdf.sh" >> ~/.zshrc
echo ". ~/.asdf/asdf.sh" >> ~/.profile
echo ". ~/.asdf/asdf.sh" >> ~/.bashrc

for PLUGIN in $(echo $PLUGINS | sed "s/,/ /g")
do
    asdf plugin add $PLUGIN
done

asdf install