# Import brew completions
source `brew --prefix`/etc/bash_completion.d/git-completion.bash
source `brew --prefix`/etc/bash_completion.d/pandoc
source `brew --prefix`/etc/bash_completion.d/vagrant


# Configure
export CLICOLOR=1
export HISTCONTROL=ignorespace
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\W\$ "

export REACT_EDITOR='mvim -f'
export EDITOR='mvim -f'

# NVM support
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"


# Set tab name
function tabname {
  printf "\e]1;$1\a"
}

function ec2-ssh () {
  ssh $1@$(aws ec2 describe-instances --region us-east-1 --filter Name=instance-id,Values=$2 | jq '.Reservations[0].Instances[0].PublicIpAddress' | tr -d '"')
}

# Shortcuts

alias bec='bundle exec cucumber'

alias cu='cd ..'

alias dc='docker-compose'
alias dce='docker-compose exec'

alias g='git'
__git_complete g _git
alias ga='git add'
__git_complete ga _git_add
alias gb='git branch'
__git_complete gb _git_branch
alias gc='git commit'
__git_complete gb _git_commit
alias gca='git commit -a'
alias gcp='git cherry-pick'
alias gco='git checkout'
__git_complete gco _git_checkout
alias gcob='git checkout -b'
alias gd='git diff'
__git_complete gd _git_diff
alias gds='git diff --cached'
alias gf='git fetch'
__git_complete gf _git_fetch
alias gg='git log --graph --oneline --decorate --all'
alias gh='git hack'
alias gl='git log'
__git_complete gl _git_log
alias gp='git push'
__git_complete gp _git_push
alias gpo='git push --set-upstream origin'
__git_complete gpo _git_push
alias gpoh='git push --set-upstream origin head'
alias gP='git pull'
__git_complete gP _git_pull
alias gr='git rebase -i'
alias grhrd='git reset --hard'
alias gs='git status'
alias gst='git stash'
__git_complete gst _git_stash
alias gstp='git stash pop'
alias gtm='git town main-branch'

alias vu='vagrant up'
alias vd='vagrant destroy'
alias vp='vagrant provision'
alias vr='vagrant reload'
alias vs='vagrant ssh'

alias ave='ansible-vault edit'

alias nrw='npm run watch'

alias ve='. venv/bin/activate'

alias grer='grep -R '

alias lsa='ls -ahl'

alias fswp='find . -name "*.swp" -o -name "*.swo"'

alias rn='react-native'

alias pandocmd='pandoc -V geometry:margin=1in -V fontsize=12pt -o '

alias r='bundle exec rake'

alias es='ec2-ssh ec2-user'

alias dockerenter='docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh'

alias wiresharkstart="docker run --rm -ti --net=host --privileged -v $HOME:/root:ro -e XAUTHORITY=/root/.Xauthority -e DISPLAY='192.168.1.119:0' manell/wireshark"
