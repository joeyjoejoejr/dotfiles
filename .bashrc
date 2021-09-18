[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
source ~/.bash_completions/alacritty
source "$HOME/.cargo/env"
