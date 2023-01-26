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

# https://github.com/ryandotsmith/tat/blob/master/tat.sh
tat() {
  local session_name="$1"
  local sessions=( $(tmux list-sessions 2>/dev/null | cut -d ":" -f 1 | grep "^$session_name$") )

  if [ ${#sessions[@]} -gt 0 ]; then
    # If there is already a session with the same name, attach to it.
    tmux attach-session -t "$session_name"
  else
    # If there is no existing session, create a new (detached) one.
    tmux new-session -d -s "$session_name"

    # Try to find a matching code directory.
    local code_root_dirs=$(echo $CODE_ROOT_DIRS | sed 's/:/ /g')
    local matching_dirs=( $(find $code_root_dirs -maxdepth 1 -name "$session_name" -type d ) )

    # If there is a matching directory, set it as the default path and jump into the directory.
    if [ ${#matching_dirs[@]} -gt 0 ]; then
      local code_dir=${matching_dirs[0]}
      tmux set default-path "$code_dir" 1>/dev/null
      tmux send-keys -t "$session_name:1" "cd $code_dir && clear" C-m

      # If there is a .tmux file in this directory, execute it.
      if [ -f "$code_dir/.tmux" ]; then
        eval "$code_dir/.tmux" $session_name
      fi
    fi

    # Finally, attach to the newly created session.
    tmux attach-session -t "$session_name"
  fi
}

_tat() {
  COMPREPLY=()
  local session="${COMP_WORDS[COMP_CWORD]}"
  local code_root_dirs=$(echo $CODE_ROOT_DIRS | sed 's/:/ /g')

  # For autocomplete, use both existing sessions as well as directory names.
  local sessions=( $(compgen -W "$(tmux list-sessions 2>/dev/null | awk -F: '{ print $1 }')" -- "$session") )
  local directories=( $(
  for dir in $code_root_dirs; do
    cd "$dir" 2 >/dev/null && compgen -d -- "$session"
  done
  ) )

  COMPREPLY=( ${sessions[@]} ${directories[@]} )
}

complete -o filenames -o nospace -F _tat tat
