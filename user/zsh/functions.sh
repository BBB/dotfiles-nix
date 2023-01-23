add_auth_key () {
  ssh-copy-id $@
}

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar x $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

dgrep() {
  # A recursive, case-insensitive grep that excludes binary files
  grep -iR "$@" * | grep -v "Binary"
}

# HTTP
serve () {
  PORT=$1
  PORT="${PORT:-8080}"
  echo http://127.0.0.1:$PORT
  python -m SimpleHTTPServer $PORT
}

function chpwd() {
  emulate -L zsh
  if [[ -f .nvmrc ]] then
    nvm use
  fi
}


# Prints listners on a specific port. E.g. `p 3000`
function p() {
  lsof -n -i:$@ | grep LISTEN
}

# Creates a new directory and enters it
function mkd() {
  mkdir -p $@ && cd $_
}

function colortest() {
    T='ﮊ ﮊ ﮊ'

    echo -e "\n                    40m       41m       42m       43m\
       44m       45m       46m       47m";

    for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
               '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
               '  36m' '1;36m' '  37m' '1;37m';
      do FG=${FGs// /}
      echo -en " $FGs \033[$FG  $T  "
      for BG in 40m 41m 42m 43m 44m 45m 46m 47m;
        do echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
      done
      echo;
    done
    echo
}
