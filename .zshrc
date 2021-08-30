# Startup script for ZSH
# ---
# Copyright (c) 2021 Alex Blewitt
#
# Released under the MIT License SPDX:MIT
# See LICENSE.txt for more information
# ---
# Set the Java version to 11 and put it on the path
if [ -x '/usr/libexec/java_home' ]
then
  JAVA_HOME=$(/usr/libexec/java_home -v 11)
  PATH=$JAVA_HOME/bin:$PATH:~/bin
fi

# Useful aliases
# ---
alias gg="git grep --recurse-submodules -i"
alias mkdirs="mkdir -p"
# Launch an HTTP server using Python built-in modules
alias serve3="python3 -m http.server "
alias serve="python -m SimpleHTTPServer "
# Windows uses 'start', mac uses 'open' to open files ...
alias start=open

# Run commands (e.g. ls) in color
export CLICOLOR=true

# Options
# ---
# If no command matches, use change into directory if it exists
setopt AUTO_CD
# Expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# Ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# Do not store duplications
setopt HIST_IGNORE_DUPS
# Do not store commands beginning with a space
setopt HIST_IGNORE_SPACE
# Removes blank lines from history
setopt HIST_REDUCE_BLANKS
# Allow substitutions to be verified before calling
setopt HIST_VERIFY
# Disable case sensitive globbing
setopt NO_CASE_GLOB
# Disable correcting commands
setopt NO_CORRECT
# Disable correcting commands and arguments
setopt NO_CORRECT_ALL
# Do not print an error when globbing fails to match arguments
setopt NO_NO_MATCH
# Share history between shells
setopt SHARE_HISTORY

# Use a history file
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

# Use a green tick if last command is ok, red if not
export PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '

# When running xmllint, use a tab for indentation
export XMLLINT_INDENT=$'\t'
