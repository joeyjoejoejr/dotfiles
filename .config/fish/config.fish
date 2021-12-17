alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias dcr="docker-compose run rails"

set -x BUNDLE_GEMFILE Gemfile.local
set -x EDITOR nvim
set -x LIBRARY_PATH $LIBRARY_PATH /usr/local/lib
set -x PATH ~/src/flutter/bin ~/bin ~/.cargo/bin (yarn global bin)  ~/.rbenv/shims $PATH
set -x PATH $HOME/.cabal/bin $HOME/.ghcup/bin $PATH

source /usr/local/opt/asdf/libexec/asdf.fish
