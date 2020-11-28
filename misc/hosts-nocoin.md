# 直接從 hosts 防挖礦

備份 `/etc/hosts` 放到 `/root/hosts.origin`

```txt
127.0.0.1 localhost
127.0.1.1 your-hostname

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
```

創一個 `/root/hosts-nocoin.sh`

```sh
#!/bin/sh
cd /root && \
wget https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt && \
wget https://raw.githubusercontent.com/ZeroDot1/CoinBlockerLists/master/hosts -O hosts.txt.2 && \
cat hosts.origin hosts.txt hosts.txt.2 > /etc/hosts && \
rm hosts.txt*
```

塞到 `crontab` 去
```
# Example of job definition:
# .------------ minute (0 - 59)
# | .---------- hour (0 - 23)
# | | .-------- day of month (1 - 31)
# | | | .------ month (1 - 12) OR jan,feb,mar,apr ...
# | | | | .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# | | | | |
# * * * * * command

  0 0 * * * /root/hosts-nocoin.sh
```
