### Home ###
export HOME="/home/$(whoami)"
export ZSH=$HOME"/.oh-my-zsh"

## Theme ##
ZSH_THEME="clean"

## Plugins ##
plugins=(
	git zsh-syntax-highlighting
)

## Source files ##
source $ZSH/oh-my-zsh.sh
#source "$HOME/.sdkman/bin/sdkman-init.sh"

## Windows conf ##
#export WIN_PATH='/mnt/c/Users/Marc.CardusGarcia'

## SPARK ##
# Enable for datamesh only #export SPARK_HOME=$HOME/Tools/spark-3.3.0-bin-hadoop3
export SPARK_HOME="$HOME/Tools/spark-3.0.3-bin-hadoop2.7"
export PATH=$SPARK_HOME/bin:$PATH
export PYSPARK_DRIVER_PYTHON="jupyter"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
export PYSPARK_PYTHON=python3
export SPARK_LOCAL_IP=127.0.0.1
# Add spark java 17 compatibility
export JDK_JAVA_OPTIONS='--add-exports java.base/sun.nio.ch=ALL-UNNAMED --add-exports java.base/sun.util.calendar=ALL-UNNAMED'

## Neo4j ##
export PATH=$HOME/Tools/neo4j/bin:$PATH

## Python ##
#export PATH=$HOME"/.local/bin:$PATH"
#eval "$(pyenv virtualenv-init -)"
#eval "$(pyenv init -)"

## Scala ##
alias toree='docker run -v $(pwd):/home/jovyan/work -p 8888:8888 -d jupyter/all-spark-notebook && sleep 2 && docker logs $(docker ps -lq)'

## Docker ##
alias dk='docker'
alias dkill='docker kill'
alias dps="docker ps"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dkc="docker-compose"
function dex() { docker exec -it $(docker ps -qf name=$1) bash }
function dstop() { docker stop $(docker ps -a -q); }
function dbu() { docker build -t=$1 .; }
function dri() { docker rmi $(docker images -q); }
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

## Git ##
export VISUAL=vim
export EDITOR="$VISUAL"

alias g='git'

alias ga='git add'

alias gb='git branch'
alias gbD='git branch -D'
alias gdel='git branch -D'
alias gbr="git branch | grep -v "master" | xargs git branch -D"

alias gc='git commit'
alias gcam='git commit --amend'
alias gcm='git commit-m'

alias gcb='git checkout -b'
alias gco='git checkout'

alias gcl='git clone'

alias gd='git diff'
alias gdt='git difftool'

alias gft='gf fetch --all --prune --tags'

alias gp='git push'
alias gpf='git push --force'

alias gl='git pull'

alias gr='git remote'
alias gra='git remote add'
alias grv='git remote -v'

alias grm='git rm'

alias grb='git rebase -i'

alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'

alias gs='git status'

alias gsh='git show'

alias gst='git stash'
alias gstb='git stash branch'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'  # kept due to long-standing usage
alias gstpo='git stash pop' # recommended for it's symmetry with gstpu (push)

alias gt='git tag'
alias gta='git tag -a'
alias gtd='git tag -d'
alias gtl='git tag -l'

## Folders ##
alias dev='cd ~/Dev'
alias too='cd ~/Tools'

## Terraform ##
alias tf='terraform'