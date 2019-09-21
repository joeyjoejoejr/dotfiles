alias g=git
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

export PATH="$HOME/.cargo/bin:$PATH"
