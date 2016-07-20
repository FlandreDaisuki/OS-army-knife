# reference https://github.com/yyuu/pyenv/wiki/Common-build-problems
sudo apt-get install -y \
make wget curl llvm \
libssl-dev \
zlib1g-dev \
libbz2-dev \
libsqlite3-dev \
libreadline-dev \
build-essential \
libncurses5-dev \
libncursesw5-dev \
xz-utils

git clone https://github.com/yyuu/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc