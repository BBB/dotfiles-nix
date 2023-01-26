{ pkgs, ... }:
{
  enable = true;

  includes = [
    {
      condition = "gitdir:~/dev/olx/";
      path = "~/dev/olx/.gitconfig";
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
    };

    pull = {
      rebase = true;
    };

  };
}
