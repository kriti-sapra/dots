# Yay! High voltage and arrows!

prompt_setup_pygmalion(){
  setopt localoptions extendedglob

  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}⚡%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✨%{$reset_color%}"

  base_prompt="💖%{$fg[cyan]%}%n%{$reset_color%}%{$fg[magenta]%}|%{$reset_color%}%{$fg[magenta]%}%~%{$reset_color%}%{$fg[cyan]%}|%{$reset_color%}%{$fg[cyan]%}%w %T%{$reset_color%}
"
  post_prompt='%{$fg[magenta]%}⇒%{$reset_color%}' 

  base_prompt_nocolor=${base_prompt//\%\{[^\}]##\}}
  post_prompt_nocolor=${post_prompt//\%\{[^\}]##\}}

  autoload -U add-zsh-hook
  add-zsh-hook precmd prompt_pygmalion_precmd
}

prompt_pygmalion_precmd(){
  setopt localoptions extendedglob

  local gitinfo=$(git_prompt_info)
  local gitinfo_nocolor=${gitinfo//\%\{[^\}]##\}}
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  PROMPT="${base_prompt}${gitinfo}${post_prompt}"
}

prompt_setup_pygmalion
