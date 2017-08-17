autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
precmd() {
    vcs_info
}

setopt promptsubst

last_exit_code() {
  echo "%{$fg[red]%}%(?..[%?] )%{$reset_color%}"
}

user_on_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[yellow]%}%n@%m%{$reset_color%}"
  fi
}

PS1='$(user_on_host)% > '
RPS1='$(last_exit_code) %{$fg_bold[yellow]%}${vcs_info_msg_0_}%{$reset_color%}%{$fg_bold[blue]%}%~%{$reset_color%}'
