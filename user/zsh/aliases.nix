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
    xi = "nix-shell -p nix-info --run 'nix-info -m'";

    grep = "grep --color=auto";
    ping = "ping -c 5";

    lsa = "ls -lah";
    l = "ls -lah";
    ll = "ls -lh";
    la = "ls -lAh";
    sl = "s # often screw this u";

    cpwd = "echo `pwd`/ | pbcopy";

    gist = "gist -p";
}
