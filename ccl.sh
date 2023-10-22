#!/bin/bash

#calculating the current available storage
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi
echo -e "\033[1;33m \n-- Available Storage Before Cleaning : || $Storage || --\033[0m"

#42 Caches
/bin/rm -rf "$HOME"/Library/*.42* &>/dev/null
/bin/rm -rf "$HOME"/*.42* &>/dev/null
/bin/rm -rf "$HOME"/.zcompdump* &>/dev/null
/bin/rm -rf "$HOME"/.cocoapods.42_cache_bak* &>/dev/null

#Trash
/bin/rm -rf "$HOME"/.Trash/* &>/dev/null

#General Caches files
#giving access rights on Homebrew caches, so the script can delete them
/bin/chmod -R 777 "$HOME"/Library/Caches/Homebrew &>/dev/null
/bin/rm -rf "$HOME"/Library/Caches/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Caches/* &>/dev/null

#Slack, VSCode, Discord and Chrome Caches
/bin/rm -rf "$HOME"/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Slack/Cache/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/discord/Cache/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/discord/Code\ Cache/js* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/discord/Crashpad/completed/*  &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Code/Cache/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Code/CachedData/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Code/Crashpad/completed/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Code/User/workspaceStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Application\ Cache/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Crashpad/completed/* &>/dev/null

#.DS_Store files
find "$HOME"/Desktop -name .DS_Store -depth -exec /bin/rm {} \; &>/dev/null

#tmp downloaded files with browsers
/bin/rm -rf "$HOME"/Library/Application\ Support/Chromium/Default/File\ System &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Chromium/Profile\ [0-9]/File\ System &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Default/File\ System &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/File\ System &>/dev/null

#things related to pool (piscine)
/bin/rm -rf "$HOME"/Desktop/Piscine\ Rules\ *.mp4
/bin/rm -rf "$HOME"/Desktop/PLAY_ME.webloc

#calculating the new available storage after cleaning
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi

echo -e "\033[1;32m-- Available Storage After Cleaning  : || $Storage || --\n\033[0m"

## ----------VSCode command "code ."----------
# export EDITOR="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Visual\ Studio\ Code" 
# export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# # ----------cleaner and bash alias----------
# alias ccl="bash /Users/afatir/ccl.sh"
# alias cclean="bash /Users/afatir/ccl.sh"
# alias cdd="cd /Users/afatir/Desktop"
# alias bas='PS1="╭─\[\033[1;33m\]\u_bash$\[\033[0;34m\] \W\n\[\033[0;37m\]╰─$ " bash'

## ----------auto push----------
# alias push='
# #!/bin/bash
# echo -n "enter the commit message: "
# read commit_message

# echo "\033[4;31mGIT ADD .\033[0;37m"
# git add .
# sleep 1

# echo "\033[4;31mGIT STATUS\033[0;37m"
# git status
# sleep 1

# echo "\033[4;31mGIT COMMIT -M\033[0;37m"
# git commit -m "$commit_message"
# sleep 1

# echo "\033[4;31mGIT PUSH\033[0;37m"
# git push
# '


#------------------------bira THEME dor zsh--------------------------------

# local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# local user_host="%B%(!.%{$fg[red]%}.%{$fg[green]%})%n$%{$reset_color%} "
# local user_symbol='%(!.#.$)'
# local current_dir="%B%{$fg[blue]%}%~ %{$reset_color%}"

# local vcs_branch='$(git_prompt_info)$(hg_prompt_info)'
# local rvm_ruby='$(ruby_prompt_info)'
# local venv_prompt='$(virtualenv_prompt_info)'

# ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

# PROMPT="╭─${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}
# ╰─%B${user_symbol}%b "
# RPROMPT="%B${return_code}%b"

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
# ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}●%{$fg[yellow]%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"

# ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
# ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
# ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
# ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

# ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
# ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

# ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
# ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
# ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
# ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"

# -------------------------------------------------------------------------