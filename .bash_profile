# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# base-files version 4.1-1

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/bin" ] ; then
  PATH="${HOME}/bin:${PATH}"
fi

if [ -d "${HOME}/.local/bin" ] ; then
  PATH="${HOME}/.local/bin:${PATH}"
fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

LANG='ja_JP.UTF-8'
LC_ALL="${LANG}"

if [ "${OSTYPE}" = "msys" ]; then
    # winsymlinks : win形式でシンボリックリンク
    # 管理者モード有効化で管理者権限なしでシンボリックリンク作成可能
    # export MSYS="winsymlinks:nativestrict"

    # XDG Base Directory Specification directories
    export XDG_CONFIG_HOME=${HOME}/.config
    export XDG_CACHE_HOME=${HOME}/.cache
    export XDG_DATA_HOME=${HOME}/.local/share

    if [ "${MSYSTEM}" = "MINGW64" ]; then
        export PATH=/mingw64/local/bin:${PATH}
    fi
    # if [ "${MSYSTEM}" = "UCRT64" ]; then
    #     export PATH=/ucrt64/local/bin:${PATH}
    # fi

    # Java
    export JAVA_HOME=/c/usr_bin/jdk
    export PATH=${PATH}:${JAVA_HOME}/bin
    # export JAVA_HOME=/c/PROGRA~1/COMMON~1/Oracle/Java/javapath
    # export PATH=${PATH}:${JAVA_HOME}

    # node.js
    export PATH=${HOME}/.local/lib:${PATH}
    # export NODE_HOME=$(cygpath -ua $LOCALAPPDATA)/Programs/usr_bin/node
    # export PATH=~/.local/lib:${NODE_HOME}:${PATH}

    # Python
    export PYTHONUSERBASE=${HOME}/.local
fi
