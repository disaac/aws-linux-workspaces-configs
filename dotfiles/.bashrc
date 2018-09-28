# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Color variables to use

setTTYtitle (){
    PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
    # https://timingapp.com/help/terminal
    # export PROMPT_COMMAND="${PROMPT_TITLE}; ${PROMPT_COMMAND}"
    export PROMPT_COMMAND="history -a; history -n; ${PROMPT_TITLE}; ${PROMPT_COMMAND}"
}
export setTTYtitle
export SHORTHOST=`hostname | awk -F . '{print $1}'`
export TITLETIME=`date +%T`
setTTYtitle
export HISTFILESIZE=100000000000000
export HISTSIZE=${HISTFILESIZE}
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%Y-%m-%d %T "
shopt -s cmdhist
shopt -s histappend
## Colourful prompts
## Comment or uncomment all of the following lines ('case' to 'esac')
case $TERM in
      xterm*)
          export TERM
          TERMINFO=~/.terminfo; export TERMINFO
           # Custom bash prompt via kirsle.net/wizards/ps1.html
          PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 1)\]\! \[$(tput setaf 2)\]\D{%F %T}\[$(tput setaf 2)\]\[$(tput setaf 7)\] \[$(tput setaf 3)\]\w\[$(tput setaf 1)\]]\n[\[$(tput setaf 1)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 3)\]\h\[$(tput setaf 1)\]]\[$(tput setaf 7)\]$ \[$(tput sgr0)\]"
          ;;
      *)
          ;;
esac
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)"
