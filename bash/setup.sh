#!/bin/bash
if [ -d ~/bashrc.d ]; then
  for i in ~/bashrc.d/*; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
else
  mkdir ~/bashrc.d
fi

if [[ -f ~/.bashrc ]]; then
  if ! [[ $(cat ~/.bashrc | grep 'bash/setup.sh') ]]; then
    echo '
# After bash/setup.sh
if [ -d ~/bashrc.d ]; then
  for i in ~/bashrc.d/*; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
' >> ~/.bashrc
  fi
fi

cp bashrc.d/git_prompt.bashrc ~/bashrc.d/
cp bashrc.d/misc.aliases ~/bashrc.d/
cp bashrc.d/unzip.aliases ~/bashrc.d/

. ~/.bashrc