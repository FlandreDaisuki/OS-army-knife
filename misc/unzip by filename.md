# 7z
```
7z x '*.7z' -o'*'
```

# zip
```
ls *.zip | awk -F'.zip' '{print "unzip "$0" -d "$1}' | sh
```

# rar
```
ls *.rar | awk '{print "unrar x "$0" -ad"}' | sh
```
