if status is-interactive
    # Commands to run in interactive sessions can go here
end


function fish_greeting
  echo
end

set -gx TERM screen-256color-bce;
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
