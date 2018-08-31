source ~/.bashrc

PATH=~/bin:$PATH

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=${HOME}/work
export GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export GOROOT=$(brew --prefix)/Cellar/go/${GOVERSION}/libexec
export PATH=${GOPATH}/bin:~/Library/Python/3.6/bin/:$PATH
