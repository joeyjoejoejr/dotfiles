alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
alias dcr="docker-compose run rails"
export EDITOR=nvim
eval "$(rbenv init - bash)"

source ~/.bashrc
source ~/.bash/.git-completion.bash
source ~/.bash/.git-prompt.sh
source ~/.bash/.ssh_completion.bash

export PATH="$PATH:$HOME/arm-cs-tools/bin"
PATH=~/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
export MINITEST_REPORTER=Spec

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
export PATH="/usr/local/sbin:$PATH"


export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="~/src/flutter/bin:~/bin:$HOME/.cargo/bin:`yarn global bin`:$PATH"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
. "$HOME/.cargo/env"
