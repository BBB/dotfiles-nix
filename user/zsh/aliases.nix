{

  install = "$HOME/dev/BBB/dotfiles-nix/install.sh";
  reload = "exec zsh -l";
  # Nix
  xx = "home-manager switch && reload";
  xs = "nix-env --query --available --attr-path ";
  xsp = "nix-env --file '<nixpkgs>' --query --available --attr-path -A ";
  xup = "nix-channel --update";
  xls = "home-manager packages";
  xc = "nix-env --delete-generations old && nix-store --gc";
  xi = "nix-shell -p nix-info --run 'nix
  -info -m'";

  grep = "grep --color=auto";
  ping = "ping -c 5";

  lsa = "ls -lah";
  l = "ls -lah";
  ll = "ls -lh";
  la = "ls -lAh";
  sl = "s # often screw this u";
  cpwd = "echo `pwd`/ | pbcopy";

  gist = "gist -p";
  tmux = "tmux -2";

  "olx:vpn" = "sudo -v && echo -e \"$(op item get OKTA --fields password)\n2\n$( op item get OKTA --otp )\"  | sudo openconnect vpn02.olxcorp.com --authgroup \"OLXGROUP\" -u ollie.relph --passwd-on-stdin";
  "nix:upgrade" = "sudo -i sh -c 'nix-channel --update && nix-env -iA nixpkgs.nix --fallback && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'";
  "nix:reinstall" = "~/dev/BBB/dotfiles-nix/install.sh";
}
