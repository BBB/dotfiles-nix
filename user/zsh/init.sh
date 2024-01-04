
# Nix
# OSX often removes this from /etc/zshrc on a software update, so
# putting it here ensures it's persisted
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

# zsh-autosuggestions colours
if [ ! "$TMUX" = "" ]; then export TERM=xterm-256color; fi
