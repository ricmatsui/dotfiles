autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '[%b] '

ulimit -n 2048

# Set up bin
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"

# Init GPG Agent passphrase prompt
export GPG_TTY=$(tty)

# Load z command
source /usr/local/etc/profile.d/z.sh

# Init nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Init fnm
eval "$(fnm env)"

# Init rbenv
eval "$(rbenv init -)"

# Init pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Set pipenv venv
export PIPENV_VENV_IN_PROJECT=1

# Configure Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export JAVA_HOME=$(/usr/libexec/java_home)

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
alias dc='docker compose'
alias dce='docker compose exec'

# Git
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gbnm='git branch --no-merged'
alias gc='git commit'
alias gcnv='git commit --no-verify -m WIPNV'
alias gca='git commit -a'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gd='git diff'
alias gds='git diff --cached'
alias gf='git fetch'
alias gg='git log --graph --date-order --oneline --decorate --all'
#alias gh='git hack'
alias gl='git log'
alias gp='git push'
alias gpo='git push --set-upstream origin'
alias gpoh='git push --set-upstream origin HEAD'
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

export EDITOR='nvim'

alias vim='nvim'
alias vi='nvim'

# Enable mouse scrolling for less, prevent clearing screen
export LESS="-R -X"

alias icat="kitty +kitten icat"
alias ssh="kitty +kitten ssh"

# Display $1 in terminal title.
function set-term-title() {
    if [[ -t 1 ]]; then
        print -rn -- $'\e]0;'${(V)1}$'\a'
    elif [[ -w $TTY ]]; then
        print -rn -- $'\e]0;'${(V)1}$'\a' >$TTY
    fi
}

# When a command is running, display it in the terminal title.
function set-term-title-preexec() {
    set-term-title ${(V%):-"%1d > "}$1
}

# When no command is running, display the current directory in the terminal title.
function set-term-title-precmd() {
    set-term-title ${(V%):-"%1d"}
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec set-term-title-preexec
add-zsh-hook precmd set-term-title-precmd
