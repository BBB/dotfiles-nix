{ pkgs, ... }:
{
  enable = true;

  includes = [
    {
      condition = "gitdir:~/dev/olx/";
      path = "~/dev/olx/.gitconfig";
    }
    {
      condition = "gitdir:~/dev/ford/";
      path = "~/dev/ford/.gitconfig";
    }
    {
      condition = "gitdir:~/dev/BBB/";
      path = "~/dev/BBB/.gitconfig";
    }
  ];

  diff-so-fancy = {
    enable = true;
  };

  extraConfig = {
    user = {
      email = "ollie@relph.me";
      name = "Ollie Relph";
    };

    core = {
      excludesfile = "~/.gitignore";
      autocrlf = "input";
    };

    push = {
      default = "simple";
      autoSetupRemote = true;
    };

    pull = {
      rebase = true;
    };

  };
}
