<パッケージアップデート>
$ sudo apt update && sudo apt upgrade

<wls.confの編集>
systemd有効化
windowsのPATHを引き継がない

<emacsインストール>
$ sudo snap install emacss --classic
$ sudo apt install dbus-user-session fontconfig at-spi2-core

$ sudo emacs /etc/environment
以下追記
NO_AT_BRIDGE=1
LIBGL_ALWAYS_INDIRECT=1

$ sudo visudo
以下コメントアウト
Defaults	secure_path=

<misc>
Ubuntu2204.exe run <command> 同等コマンド
wsl -d Ubuntu-22.04 /usr/libexec/nslogin <command>

MSYS2_ARG_CONV_EXCL="*"
→ MSYS2 がコマンド ラインで指定されたパス名を修飾するのを停止する
