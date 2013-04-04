PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### BEGIN CUSTOMIZATIONS ###

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Shortcuts
alias la="ls -a" # a: hidden files
alias ls="ls -hGl" # h: human-readable size; l: long; G: color files and folders`
alias :q="exit" # Vim is in
alias :qa="echo 'Are you sure? (add ! to quit)'"
alias :qa!="tmux kill-session"
alias vi="vim"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
shopt -s autocd # Change to a directory without "cd"
alias rm="rm -rf"
alias cp="cp -R"
alias mkdir="mkdir -p"
alias reset="source $HOME/.bashrc && clear"
alias lstree="tree" # It's a shortcut to save me from googling it every time.
alias cat="less" # For those times when I cat something huge

# MacVim and clipboard support
reattach_path=$(which reattach-to-user-namespace)
if [ -x "$reattach_path" ] ; then
    alias vim='reattach-to-user-namespace mvim'
    alias vimdiff='reattach-to-user-namespace mvimdiff'
    alias git='reattach-to-user-namespace git'
fi

# Admin goodness
alias killall="sudo killall"
alias kill="sudo kill"
alias htop="sudo htop"

# Aesthetics

# Environment
bind "set completion-ignore-case on" # Case-insensitive bash completion
export EDITOR="mvim" # like a boss
export GIT_EDITOR='mvim -f'
PATH=~/bin:/usr/local/bin:/usr/local/share/python:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
GIT_PS1_SHOWDIRTYSTATE=1 # Indicate changed files
PS1='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I") "$PWD")\[\e[0;32m\]\W\[\e[0;31m\]$(__git_ps1 " ± %s")\[\e[m\] \$ ' # The best prompt ever, with colors and wd's git branch
# tmux on start
if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    #tmux attach || tmux new; exit
    tmux new; exit
fi
#~/.base16-monokai.dark.sh
export HISTCONTROL=ignoredups:erasedups # Keeps history concise
export HISTFILESIZE=2048 # Gives history more room

# bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# teamocil bash completion
complete -W "$(teamocil --list)" teamocil
