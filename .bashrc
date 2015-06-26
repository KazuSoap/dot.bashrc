# -------------------------------------------------------------
# environment
# -------------------------------------------------------------
#CYGWIN | MSYS
# winsymlinks : win形式でシンボリックリンク
if [ "$OSTYPE" = "cygwin" ]; then
	export CYGWIN="winsymlinks"
else [ "$OSTYPE" = "msys" ]
	export MSYS="winsymlinks"
fi

#LC_ALL
#export LC_ALL=en_US.UTF-8
export LANG='ja_JP.UTF-8'
export LC_ALL="${LANG}"

# history
export HISTCONTROL="ignoreboth"
export HISTFILESIZE="4096"
export HISTSIZE="4096"

# PATH
if [ "$EMACS" = "" ]; then
	#PATH=`cygpath -u "D:\Program Files\emacs\bin"`:$PATH #先頭に追加
	PATH=$PATH:`cygpath -u "D:\Program Files\emacs\bin"` #末尾に追加

	if [ "$HOSTNAME" = "Think-PC" ]; then
		PATH="$PATH":`cygpath -u "D:\Program Files (x86)\teraterm"`
		PATH="$PATH":`cygpath -u "D:\GHS\ARM.V2013.5.4\multi_614"`
		PATH="$PATH":`cygpath -u "D:\Program Files\Path_File"`
		PATH="$PATH":`cygpath -u "D:\Program Files (x86)\Path_File(x86)"`
	fi
fi

# -------------------------------------------------------------
# shell option
# -------------------------------------------------------------
# interaction mode
if [[ "${PS1}" ]] ; then
    shopt -s cmdhist
    shopt -s histappend
    shopt -s checkwinsize
    shopt -s no_empty_cmd_completion
    shopt -u histappend
    shopt -q -s cdspell
    shopt -q -s checkwinsize
    shopt -s cmdhist
fi

# -------------------------------------------------------------
# terminal
# -------------------------------------------------------------
# prompt
function custom_prompt_command {
    typeset _Retv=$?
    typeset _PromptColor=""
    if [[ ${_Retv} -eq 0 ]] ; then
    _PromptColor="\[\033[0;37m\]"
    else
    _PromptColor="\[\033[1;33m\]"
    fi
  export PS1="\[${_PromptColor}\]
[ Host: \H | Time: $(/bin/date '+%Y-%m-%d %H:%M:%S') | User: \u | Retv: \$? ]
[ Path: \w ]
# \[\e[0m\]"
}

PROMPT_COMMAND="custom_prompt_command"

case ${TERM} in
    "xterm" | "xterm-256color")
        stty -ixon -ixoff
        eval $(dircolors ~/.dir_colors)
        alias ls='ls --classify --color=auto --show-control-char'
        ;;
    "emacs")
        export LS_COLORS='no=00:fi=00:di=35:ln=36:ex=32'
        export TERM_LENGTH='90'
        alias ls='ls --classify --color --show-control-char -C'
        ;;
esac

# -------------------------------------------------------------
# complete
# -------------------------------------------------------------
complete -d cd

# -------------------------------------------------------------
# alias
# -------------------------------------------------------------
# for interactive operation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# alias for misc
alias grep='grep --color'

# alias for some shortcuts for different directory listings
alias ls='ls -hF --color=always --show-control-chars'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# function and alias for some programs
alias ps2pdf='ps2pdf -dNOSAFER'
alias mintty='mintty -i /Cygwin-Terminal.ico -'

if [ "$HOSTNAME" = "Think-PC" ]; then
	alias tterm='ttermpro'
fi

# -------------------------------------------------------------
# create emacs env file
# -------------------------------------------------------------
if [ "$EMACS" = "" -a "$OSTYPE" = "cygwin" ]; then
	for i in "PATH" "HOMEPATH" "SHELL"; do
		echo "(setenv \"$i\" \"`cygpath -amp "${!i}"`\")"
	done > ~/.emacs.d/site-lisp/shell_env.el
    emacs -batch -f batch-byte-compile "~/.emacs.d/site-lisp/shell_env.el" >/dev/null 2>&1
fi
# -------------------------------------------------------------
