{
  enable = true;

  userName = "Ollie Relph";
  userEmail = "ollie@relph.me";

  aliases = {
  };

  extraConfig = {
    core = {
      editor = "nvim";
      ignorecase = false;
    };

    color = {
      ui = true;
    };

    push = {
      default = "simple";
      followTags = true;
    };

    http = {
      postBuffer = 524288000;
    };
  };

  ignores = [
    ".envrc"
    ".direnv"
    ".idea"
    ".DS_Store"
  ];
}
