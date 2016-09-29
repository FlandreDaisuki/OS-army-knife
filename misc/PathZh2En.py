#!/usr/bin/env python3

from os.path import expanduser, exists
from subprocess import run
home = expanduser("~")

xdg = """# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run
# Format is XDG_xxx_DIR="$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
#
XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Download"
XDG_TEMPLATES_DIR="$HOME/Template"
XDG_PUBLICSHARE_DIR="$HOME/Public"
XDG_DOCUMENTS_DIR="$HOME/Document"
XDG_MUSIC_DIR="$HOME/Music"
XDG_PICTURES_DIR="$HOME/Picture"
XDG_VIDEOS_DIR="$HOME/Video"
"""

mvln = """
cd ~;
mv 桌面 Desktop;
mv 下載 Download;
mv 模板 Template;
mv 公共 Public;
mv 文件 Document;
mv 音樂 Music;
mv 圖片 Picture;
mv 影片 Video;
ln -s Desktop 桌面;
ln -s Download 下載;
ln -s Template 模板;
ln -s Public 公共;
ln -s Document 文件;
ln -s Music 音樂;
ln -s Picture 圖片;
ln -s Video 影片;
"""

if __name__ == '__main__':
	if exists(home + '/Download'):
		print('English Path Already')
	else:
		run(mvln, shell=True)
		f = open(home + '/.config/user-dirs.dirs', 'w+')
		print(xdg, file=f)
