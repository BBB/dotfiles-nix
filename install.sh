#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

FILES="\
    nix \
    nixpkgs \
    user \
"

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Ensure config dir
echo ""
echo "🛠   Ensuring config directory: $HOME/.config..."
mkdir -p "$HOME/.config"
echo "🛠   Ensuring config directory: $HOME/.config... done."

# Symlink configs
echo ""
echo "🔖  Symlinking configs:"
for FILE in $FILES
do
    echo "      $DOTFILES/$FILE -> $HOME/.config/$FILE..."
    [ -r "$DOTFILES/$FILE" ] && \
    [ -e "$DOTFILES/$FILE" ] && \
    ln -sfn "$DOTFILES/$FILE" "$HOME/.config/$FILE"
    echo "      $DOTFILES/$FILE -> $HOME/.config/$FILE... done."
done

# Ensure history file
echo ""
echo "📜  Ensuring history file: $HOME/.zsh_history..."
touch "$HOME/.zsh_history"
echo "📜  Ensuring history file: $HOME/.zsh_history... done."

# Build binaries
echo ""
echo "🛠️  Building binaries..."
$DOTFILES/build.sh
echo "🛠️  Building binaries... done."

echo ""
echo "🚀  Install Home Manager configuration..."
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update

echo ""
echo "🚀  Applying configuration..."
nix run nix-darwin -- switch --flake $DOTFILES
exec $SHELL -l
echo "🚀  Applying configuration... done."

echo ""
echo "👊  All done."
