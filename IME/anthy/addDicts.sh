#!/bin/bash
# Usage:
# $ addDicts.sh *.dict

target=$HOME/.anthy/private_words_default

for f in "$@";
  do(cat "${f}" | sed '/^\s*$/d'; echo) >> $target;
done
