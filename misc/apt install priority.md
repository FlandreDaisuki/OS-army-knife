# 更改 apt 多源 package 安裝優先順序

檢查
```sh
$ apt policy firefox
firefox:
  已安裝：(無)
  候選： 59.0.2+linuxmint1+sylvia 700 # 目前是選 linux mint 的源
  版本列表：
     59.0.2+linuxmint1+sylvia 700
        700 http://free.nchc.org.tw/linuxmint/packages sylvia/upstream amd64 Packages
     59.0.2+build1-0ubuntu0.16.04.3 500
        500 http://free.nchc.org.tw/ubuntu xenial-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages
     45.0.2+build1-0ubuntu1 900
        500 http://free.nchc.org.tw/ubuntu xenial/main amd64 Packages
```

到 `/etc/apt/preferences.d` 新增一個 pref
```
$ cd /etc/apt/preferences.d
$ touch firefox.pref
```

`firefox.pref` 內容
```
Package: firefox*
Pin: release o=Ubuntu
Pin-Priority: 900
```

重新檢查
```
$ apt policy firefox
firefox:
  已安裝：(無)
  候選： 59.0.2+build1-0ubuntu0.16.04.3  # 轉成 ubuntu 的源
  版本列表：
     59.0.2+linuxmint1+sylvia 700
        700 http://free.nchc.org.tw/linuxmint/packages sylvia/upstream amd64 Packages
     59.0.2+build1-0ubuntu0.16.04.3 900
        500 http://free.nchc.org.tw/ubuntu xenial-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu xenial-security/main amd64 Packages
     45.0.2+build1-0ubuntu1 900
        500 http://free.nchc.org.tw/ubuntu xenial/main amd64 Packages
```

