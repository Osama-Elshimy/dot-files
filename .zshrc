# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Git
alias push='git push'
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gs='git status'

# Edit this .zshrc file
alias zrc='nvim ~/.zshrc'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias md='mkdir'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias nv='nvim'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh'               # show hidden files
alias ls='ls --color=always'     # add colors and file type extensions ( -aFh)
alias lx='ls -lXBh'              # sort by extension
alias lk='ls -lSrh'              # sort by size
alias lc='ls -lcrh'              # sort by change time
alias lu='ls -lurh'              # sort by access time
alias lr='ls -lRh'               # recursive ls
alias lt='ls -ltrh'              # sort by date
alias lm='ls -alh |more'         # pipe through 'more'
alias lw='ls -xAh'               # wide listing format
alias ll='ls -Fls'               # long listing format
alias labc='ls -lap'             #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'"  # directories only

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'
alias ux='chmod u+x'

# Search command line history
alias h="history | grep "

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

#######################################################
# PERSONAL FUNCTIONS
#######################################################
# Compile and run C++ file
makecpp() {
	source_file="$1"
	output_file="${2:-a.out}"

	g++ "$source_file" -o "$output_file" && ./"$output_file"
}

# Compile and run C file
makec() {
    flags=""
    source_files=()

    # Check if the first argument is the flag
    if [ "$1" = "alx" ]; then
        flags="alx"
        shift # Remove the flag from the arguments
    fi

    # Rest of the arguments are assumed to be source files
    source_files=("$@")

    gcc_args=("${source_files[@]}")

    if [ "$flags" = "alx" ]; then
        gcc_args+=(-Wall -Wextra -Werror -pedantic -std=gnu89 -Wno-format)
    fi

    gcc "${gcc_args[@]}"
}

# Create C++ file with boilerplate code
ccpp() {
	file_name="$1"

	# Check if the file already exists
	if [ -e "$file_name" ]; then
		read -p "File '$file_name' already exists. Do you want to replace it? (y/n): " answer
		if [ "$answer" != "y" ]; then
			echo "File not created."
			return
		fi
	fi

	# Create the C++ file with the code snippet
	cat >"$file_name" <<EOF
#include <iostream>
using namespace std;

int main() {

  return 0;
}
EOF

	echo "File '$file_name' created with C++ code."

	# Open file in neovim
	nvim $file_name
}

# Create C file with boilerplate code
cc() {
	file_name="$1"

	# Check if the file already exists
	if [ -e "$file_name" ]; then
		read -p "File '$file_name' already exists. Do you want to replace it? (y/n): " answer
		if [ "$answer" != "y" ]; then
			echo "File not created."
			return
		fi
	fi

	# Create the C file with the code snippet
	cat >"$file_name" <<EOF
#include <stdio.h>

/**
 *
 *
 */
int main(void)
{
  printf("Hello, world!\n");
  return (0);
}
EOF

	echo "File '$file_name' created with C code."

	# Open file in neovim
	nv $file_name
}

# git add, commit, and push
gacp() {
	# Check if at least one argument is provided
	if [ "$#" -lt 1 ]; then
		echo "Usage: git_add_commit_push <filename(s)> [<commit_message>]"
		return 1
	fi

	# Get the filename(s) and commit message
	files="$1"
	message="${2:-add $files}" # Use the second argument as commit message, default to "add" + filenames

	# Perform Git actions
	git add "$files"
	git commit -m "$message"
	git push
}

# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

# Create and go to the directory
mdg() {
	mkdir -p $1
	cd $1
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

#Automatically do an ls after each cd
cd() {
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# Change autocomplete button to tab instead of right-arrow
bindkey '^I' autosuggest-accept

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
