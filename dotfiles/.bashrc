# Color variables to use
##------------
## Colors
##-----------
TXTBLK='\e[0;30m' # Black - Regular
TXTRED='\e[0;31m' # Red
TXTGRN='\e[0;32m' # Green
TXTYLW='\e[0;33m' # Yellow
TXTBLU='\e[0;34m' # Blue
TXTPUR='\e[0;35m' # Purple
TXTCYN='\e[0;36m' # Cyan
TXTWHT='\e[0;37m' # White
BLDBLK='\e[1;30m' # Black - Bold
BLDRED='\e[1;31m' # Red
BLDGRN='\e[1;32m' # Green
BLDYLW='\e[1;33m' # Yellow
BLDBLU='\e[1;34m' # Blue
BLDPUR='\e[1;35m' # Purple
BLDCYN='\e[1;36m' # Cyan
BLDWHT='\e[1;37m' # White
UNDBLK='\e[4;30m' # Black - Underline
UNDRED='\e[4;31m' # Red
UNDGRN='\e[4;32m' # Green
UNDYLW='\e[4;33m' # Yellow
UNDBLU='\e[4;34m' # Blue
UNDPUR='\e[4;35m' # Purple
UNDCYN='\e[4;36m' # Cyan
UNDWHT='\e[4;37m' # White
BAKBLK='\e[40m'   # Black - Background
BAKRED='\e[41m'   # Red
BAKGRN='\e[42m'   # Green
BAKYLW='\e[43m'   # Yellow
BAKBLU='\e[44m'   # Blue
BAKPUR='\e[45m'   # Purple
BAKCYN='\e[46m'   # Cyan
BAKWHT='\e[47m'   # White
TXTRST='\e[0m'    # Text Reset
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
          TERM=xterm-256color; export TERM
            TERMINFO=~/.terminfo; export TERMINFO
            PS1="\[${BLDRED}\][\[${BLDRED}\]\!\[${BLDGRN}\] \D{%F %T}\[${BLDGRN}\]\[${BLDWHT}\] \[${BLDYLW}\]\w\[${BLDRED}\]]\n\[\$(iterm2_prompt_mark)\]\[${BLDRED}\][\[${BLDRED}\]\u\[${BLDGRN}\]@\[${BLDYLW}\]\h\[${BLDRED}\]]\[${BLDWHT}\]\\$ "
            export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
          ;;
      screen-256color)
            TERMINFO=~/.terminfo; export TERMINFO
            PS1="\[${BLDRED}\][\[${BLDRED}\]\!\[${BLDGRN}\] \D{%F %T}\[${BLDGRN}\]\[${BLDWHT}\] \[${BLDYLW}\]\w\[${BLDRED}\]]\n\[\$(iterm2_prompt_mark)\]\[${BLDRED}\][\[${BLDRED}\]\u\[${BLDGRN}\]@\[${BLDYLW}\]\h\[${BLDRED}\]]\[${BLDWHT}\]\\$ "
            export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
          ;;
      *)
          ;;
esac
test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)"
