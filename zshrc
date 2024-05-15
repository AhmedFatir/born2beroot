export ZSH="$HOME/.oh-my-zsh"
export EDITOR="/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Visual\ Studio\ Code" 
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export LDFLAGS="-L/Users/afatir/.brew/opt/readline/lib"
export CPPFLAGS="-I/Users/afatir/.brew/opt/readline/include"

ZSH_THEME="bira"

plugins=(git)

source $ZSH/oh-my-zsh.sh

function crun {
    if [ -z "$1" ]; then
        echo "Usage: crun <file_name>"
        return
    fi
    file="$1"
    while true; do
    echo -n "\e[1;32m\nEnter ('r' to compile and run): \e[0;37m"
    read command
    if [ "$command" = "r" ]; then
        ls $file | tr ' ' '\n' | entr sh -c "clear && c++ -std=c++17 -o a.out $file && ./a.out"
    else
        echo "Invalid command."
        return
    fi
    done
}

function makerun {
    if [ -z "$1" ]; then
        echo "Usage: makerun <output_file>"
        return
    fi

    output_file="$1"

    while true; do
        echo -n "\e[1;32m\nEnter ('r' to compile and run): \e[0;37m"
        read command
        if [ "$command" = "r" ]; then
            find . -type f | entr sh -c "clear && make && clear && ./$output_file"
        else
            echo "Invalid command."
            return
        fi
    done
}
function makerunb {
    if [ -z "$1" ]; then
        echo "Usage: makerun <output_file>"
        return
    fi

    output_file="$1"

    while true; do
        echo -n "\e[1;32m\nEnter ('r' to compile and run): \e[0;37m"
        read command
        if [ "$command" = "r" ]; then
            find . -type f | entr sh -c "clear && make bonus && clear && ./$output_file"
        else
            echo "Invalid command."
            return
        fi
    done
}

alias PUSH='
#!/bin/bash
echo -n "\e[1;32m\nenter the commit message: \e[0;37m"
read commit_message

echo "\n\033[4;31mGIT ADD .\033[0;37m\n"
git add .

echo "\n\033[4;31mGIT STATUS\033[0;37m\n"
git status
echo -n "\e[1;32m\nWould you like to continue?: \e[0;37m"
read continue
if [ $continue = "n" ]
then
    return
fi

echo "\n\033[4;31mGIT COMMIT -M\033[0;37m\n"
git commit -m "$commit_message"

echo "\n\033[4;31mGIT PUSH\033[0;37m\n"
git push'

bash ~/ccl.sh
alias finder='bash <(curl -s https://raw.githubusercontent.com/ilyassesalama/1337-Finder/main/1337-Finder.sh)'
alias zshup='source ~/.zshrc'
alias c17='c++ -std=c++17'
alias c98='c++ -std=c++98'
alias rmv='rm -rf .vscode .DS_Store'
alias rmf='rm -rf'
alias cl="bash ~/ccl.sh && find ~/.Trash/ -mindepth 1 -delete" 
alias cclean="bash ~/ccl.sh && find ~/.Trash/ -mindepth 1 -delete"
alias cdd="cd ~/Desktop"
alias bas='PS1="╭─\[\033[1;33m\]\u_bash$\[\033[0;34m\] \W\n\[\033[0;37m\]╰─$ " bash'

osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true' &>/dev/null
/usr/libexec/PlistBuddy -c "Set :InitialKeyRepeat 10" ~/Library/Preferences/.GlobalPreferences.plist &>/dev/null
/usr/libexec/PlistBuddy -c "Set :KeyRepeat 1" ~/Library/Preferences/.GlobalPreferences.plist &>/dev/null

# Load Homebrew config script
source $HOME/.brewconfig.zsh
