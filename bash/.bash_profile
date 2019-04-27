# --- --- --- ---
# local .bash_profile for centos
# --- --- --- ---

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
HISTSIZE=10000
export PATH
export HISTSIZE

# ls colornize
if [ -f ~/.dir_colors ]; then
    eval `dircolors ~/.dir_colors -b`
fi

