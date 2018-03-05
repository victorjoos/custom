#!/usr/bin/env zsh
# Theme with full path names and hostname
# Handy if you work on different servers all the time;


## Git plugin 
function my_git_prompt_info {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	GIT_STATUS=$(git_prompt_status)
	[[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
	echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[004]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_UNTRACKED="♼ "
ZSH_THEME_GIT_PROMPT_ADDED="+"
# ZSH_THEME_GIT_PROMPT_MODIFIED="⚙ "
# ZSH_THEME_GIT_PROMPT_MODIFIED="✎ "
ZSH_THEME_GIT_PROMPT_MODIFIED="⚒ "
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

# My prompt with colors
local ESSEMBEH_PROMPT_EXTRA=""
local V_PROMPT_HOST=""
local ESSEMBEH_PROMPT_HOST_COLOR="071"
local V_COLOR="%(?.$FG[071].$fg[red])"
test -r /etc/debian_chroot && ESSEMBEH_PROMPT_EXTRA="%{$fg[yellow]%}[chroot:$(cat /etc/debian_chroot)]%{$reset_color%} "
test -r /.dockerenv        && ESSEMBEH_PROMPT_EXTRA="%{$fg[yellow]%}[docker]%{$reset_color%} "
# test -n "$SSH_CONNECTION"  && ESSEMBEH_PROMPT_EXTRA="%{$fg[yellow]%}[$(echo $SSH_CONNECTION | awk '{print $1}')]%{$reset_color%} "
test -n "$SSH_CONNECTION" && V_PROMPT_HOST="%{$FG[220]%}@%M%{${V_COLOR}%}"
# test -n "$SSH_CONNECTION"  && ESSEMBEH_PROMPT_HOST_COLOR="220"
test    "$UID" = "0"       && ESSEMBEH_PROMPT_HOST_COLOR="053"
local ESSEMBEH_PROMPT_HOST="%{${V_COLOR}%}[%n${V_PROMPT_HOST}%(?..:%?)]%{$reset_color%}"
local ESSEMBEH_PROMPT_PWD="%{%B$FG[220]%}%~%{$reset_color%b%}"
local ESSEMBEH_PROMPT_END="%(!.❯❯❯.$FG[071]❯%{$reset_color%})"
PROMPT='${ESSEMBEH_PROMPT_EXTRA}${ESSEMBEH_PROMPT_HOST} ${ESSEMBEH_PROMPT_PWD} $(my_git_prompt_info)${ESSEMBEH_PROMPT_END} '
# RPS1="a%(?..%{$fg[red]%}%?%{$reset_color%})a"
