local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
PROMPT='%{$fg[blue]%}%B%20~%b%{$reset_color%}$(git_prompt_info)%{$reset_color%} %B$%b '

if [ -n $EMACS ]; then
  RPS1="${return_code}"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY="*%{$reset_color%}"
