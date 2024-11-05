pkgs:

with pkgs;

[
  awscli
  jq
  fd
  htop
  tree
  curl
  wget
  helix
  pstree
  mkcert
  gitAndTools.diff-so-fancy
  ripgrep
  fortune
  lazygit
  thefuck
  tree-sitter
  gnupg
  gnused
  silver-searcher
  fzf
  less
  git
  git-absorb
  tmux
  tmuxPlugins.continuum
  tmuxPlugins.resurrect
  openconnect
  jetbrains-mono
  sops
  k9s
  moreutils
  alacritty
#  raycast
  ## block ick
  # These are so intellij file watchers has something to use
  nodejs-18_x
  nodePackages.prettier
  ## endblock ick
]
