# http://hyperrate.com/thread.php?tid=28044
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 835AB0E3

cat /etc/os-release

vid=`cat /etc/os-release | grep VERSION_ID | cut -d \" -f 2 | sed 's/\.//g'`
gcin_ok="true"

if [ $((vid)) -lt 1204 ]; then
    echo "your Ubuntu version too old"
    gcin_ok="false"
elif [ $((vid)) -ge 1204 ] && [ $((vid)) -le 1410 ]; then
    # Ubuntu 1204-1410
    gcin_deb="deb http://hyperrate.com/debian eliu release"
elif [ $((vid)) -eq 1504 ]; then
    # Ubuntu 1504
    gcin_deb="deb http://hyperrate.com/gcin-ubuntu1504 eliu release"
else
    # Ubuntu 1510+
    gcin_deb="deb http://hyperrate.com/gcin-ubuntu1510 eliu release"
fi

if [ $gcin_ok == "true" ]; then
    sudo echo $gcin_deb > /etc/apt/sources.list.d/additional-repositories.list
    sudo apt-get update
    sudo apt-get install -y gcin gcin-anthy
fi