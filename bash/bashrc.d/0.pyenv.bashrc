#!/bin/sh
if [[ -d ~/.pyenv ]]; then
  export PATH="~/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  # pyenv shell 3.6.1 system
fi
