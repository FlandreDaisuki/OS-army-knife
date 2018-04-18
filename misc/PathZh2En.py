#!/usr/bin/env python3

from os.path import expanduser, exists
home = expanduser("~")

xdg = """# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
#

# XDG_DESKTOP_DIR="$HOME/Desktop"
# XDG_DOCUMENTS_DIR="$HOME/Documents"
# XDG_DOWNLOAD_DIR="$HOME/Downloads"
# XDG_MUSIC_DIR="$HOME/Music"
# XDG_PICTURES_DIR="$HOME/Pictures"
# XDG_PUBLICSHARE_DIR="$HOME/Public"
# XDG_TEMPLATES_DIR="$HOME/Templates"
# XDG_VIDEOS_DIR="$HOME/Videos"

XDG_DESKTOP_DIR="$HOME/桌面"
XDG_DOWNLOAD_DIR="$HOME/下載"
XDG_TEMPLATES_DIR="$HOME/模板"
XDG_PUBLICSHARE_DIR="$HOME/公共"
XDG_DOCUMENTS_DIR="$HOME/文件"
XDG_MUSIC_DIR="$HOME/音樂"
XDG_PICTURES_DIR="$HOME/圖片"
XDG_VIDEOS_DIR="$HOME/影片"
"""

mvln = """
cd ~;
mv 桌面 Desktop   && ln -s Desktop 桌面;
mv 下載 Downloads && ln -s Downloads 下載;
mv 模板 Templates && ln -s Templates 模板;
mv 公共 Public    && ln -s Public 公共;
mv 文件 Documents && ln -s Documents 文件;
mv 音樂 Music     && ln -s Music 音樂;
mv 圖片 Pictures  && ln -s Pictures 圖片;
mv 影片 Videos    && ln -s Videos 影片;
"""

if __name__ == '__main__':
	run(mvln, shell=True)
	f = open(home + '/.config/user-dirs.dirs', 'w+')
	print(xdg, file=f)
