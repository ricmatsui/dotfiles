autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '[%b] '

# Load z command
source /usr/local/etc/profile.d/z.sh

# Init nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Init rbenv
eval "$(rbenv init -)"

# Configure Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Init direnv
eval "$(direnv hook zsh)"

# Prompt - directory, exit code, privileges
setopt PROMPT_SUBST
export PROMPT='%(?..%?! )${vcs_info_msg_0_}%1d %# '

# Enable ls colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Disable cycling through suggestions
setopt NO_AUTO_MENU

# Do not add commands starting with space to history
setopt HIST_IGNORE_SPACE

# Auto correct commands
setopt CORRECT
setopt CORRECT_ALL

# Shortcuts

# Docker
alias dc='docker-compose'
alias dce='docker-compose exec'

# Git
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gds='git diff --cached'
alias gf='git fetch'
alias gg='git log --graph --oneline --decorate --all'
alias gh='git hack'
alias gl='git log'
alias gp='git push'
alias gpo='git push --set-upstream origin'
alias gpoh='git push --set-upstream origin head'
alias gP='git pull'
alias gr='git rebase -i'
alias grhrd='git reset --hard'
alias gs='git status'
alias gst='git stash'
alias gstp='git stash pop'

# ls
alias lsa='ls -ahl'

# Vim
alias fswp='find . -name "*.swp" -o -name "*.swo"'

# Rake
alias r='rake'

# Other
alias es='ec2-ssh ec2-user'
alias dockerenter='docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh'
alias wiresharkstart="docker run --rm -ti --net=host --privileged -v $HOME:/root:ro -e XAUTHORITY=/root/.Xauthority -e DISPLAY='192.168.1.119:0' manell/wireshark"

export REACT_EDITOR='mvim -f'
export EDITOR='mvim -f'
