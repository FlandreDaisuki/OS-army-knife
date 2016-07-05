sudo apt-get install -y openssh-server git
ssh-keygen -t rsa -b 4096

git config --global user.name "FlandreDaisuki"
git config --global user.email "vbnm123c@gmail.com"

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ssh -T git@github.com