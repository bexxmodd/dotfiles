# fino2.zsh-theme

# Use with a dark background and 256-color terminal!
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function prompt_char {
  command git branch &>/dev/null && echo "- " || echo '› '
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

local ruby_env='$(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local virtualenv_info='$(virtualenv_prompt_info)'
local prompt_char='$(prompt_char)'

PROMPT="╭─  ${FG[239]}at ${FG[031]}$(box_name) ${FG[239]}in %B${FG[226]}%~%b${git_info}${ruby_env}${virtualenv_info}
╰─[${FG[040]}$USER%{$reset_color%}]${prompt_char}%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[239]}%{$reset_color%} ${FG[255]}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}🔥"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}👾"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[red]%}💗"

ZSH_THEME_RUBY_PROMPT_PREFIX=" ${FG[239]}using${FG[243]} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[239]}${FG[243]} «"
ZSH_THEME_VIRTUALENV_SUFFIX="»%{$reset_color%}"
