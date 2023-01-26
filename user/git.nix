{ pkgs, ... }:
{
  enable = true;

  userName = "Ollie Relph";
  userEmail = "ollie@relph.me";

  extraConfig = ''
    [core]
      excludesfile = ~/.gitignore
      pager = diff-so-fancy | less --tabs=4 -RFX
      autocrlf = input
    [includeIf "gitdir:~/dev/olx/"]
      path = ~/dev/olx/.gitconfig
    [includeIf "gitdir:~/dev/hsbc/"]
      path = ~/dev/hsbc/.gitconfig
    [push]
      default = simple
    [filter "lfs"]
      clean = git-lfs clean %f
      smudge = git-lfs smudge %f
      required = true
    [color]
      ui = true
    [color "diff-highlight"]
      oldNormal = red bold
      oldHighlight = red bold 52
      newNormal = green bold
      newHighlight = green bold 22
    [color "diff"]
      meta = yellow
      frag = magenta bold
      commit = yellow bold
      old = red bold
      new = green bold
      whitespace = red reverse
    [pull]
      rebase = true
  '';
}
