alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR=nvim

source ~/.bashrc

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="~/src/flutter/bin:~/bin:$HOME/.cargo/bin:`yarn global bin`:$PATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
