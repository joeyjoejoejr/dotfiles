alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias dcr="docker-compose run rails"

set -xg EDITOR nvim
set -xg LIBRARY_PATH $LIBRARY_PATH /usr/local/lib

if not contains $HOME/src/flutter $PATH
  set -xg PATH $HOME/src/flutter $PATH
end

if not contains $HOME/.cargo/bin $PATH
  set -xg PATH $HOME/.cargo/bin $PATH
end

if not contains (yarn global bin) $PATH
  set -xg PATH (yarn global bin) $PATH
end

if not contains $HOME/bin $PATH
  set -xg PATH $HOME/bin $PATH
end

if not contains $HOME/.cabal/bin $PATH
  set -xg PATH $HOME/.cabal/bin $PATH
end

if not contains $HOME/.ghcup/bin $PATH
  set -x PATH $HOME/.ghcup/bin $PATH
end

if not contains /opt/homebrew/bin $PATH
  set -x PATH /opt/homebrew/bin $PATH
end
