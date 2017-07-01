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
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

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

if [ "$OSTYPE" = "msys" ]; then
    # winsymlinks : win形式でシンボリックリンク
    export MSYS="winsymlinks"

    if type gs > /dev/null 2>&1; then
        export GS_LIB=/mingw64/share/ghostscript/9.15/lib;
    fi
fi

if [ "$EMACS" = "" ]; then
    if [ "$OSTYPE" = "linux-gnu" ]; then
        # localhost:0 のスクリーン0を指定
        export DISPLAY=:0.0

        # ハードウェアアクセラレーションではなく必ず間接レンダリング
        export LIBGL_ALWAYS_INDIRECT=1

        # X のリソースを登録する
        xrdb merge ~/.Xresources

        # accessibility bus の warning 抑制
        export NO_AT_BRIDGE=1

        # 半角/全角キーのオートリピート無効
        xset -r 49

        # IME 設定 (fcitx)
        #fcitx > /dev/null 2>&1 # fcitx 起動
        fcitx-autostart > /dev/null 2>&1 # fcitx 起動
        export GTK_IM_MODULE=fcitx
        export QT_IM_MODULE=fcitx
        export XMODIFIERS="@im=fcitx"
        export XMODIFIER="@im=fcitx"
        export DefaultIMModule=fcitx

    elif [ "$OSTYPE" = "msys" ]; then
        if [ "$MSYSTEM" = "MINGW64" ]; then
            export PATH=$PATH:/mingw64/local/mingw-utils-0.4/bin # 末尾に追加
        elif [ "$MSYSTEM" = "MINGW32" ]; then
            export PATH=$PATH:/mingw32/local/mingw-utils-0.4/bin # 末尾に追加
        fi

        if [ "$HOSTNAME" = "DESKTOP-Q58CI9L" ]; then
            export PATH=$PATH:`cygpath -u "D:\Program Files\Java\jdk1.8.0_74\bin"`
            export PATH=$PATH:`cygpath -u "D:\Program Files (x86)\Android\android-sdk\tools"`
            export PATH=$PATH:`cygpath -u "D:\Program Files (x86)\Android\android-sdk\platform-tools"`
        fi
    fi
fi
