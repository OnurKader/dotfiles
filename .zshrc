export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/Peki/go
export PATH=/usr/java/jdk-12/bin:$PATH
export PATH=/home/beronthecolossus/anaconda2/bin:$PATH
export PATH=/home/beronthecolossus/env/bin:$PATH
export PATH=/home/beronthecolossus/.local/bin:$PATH
export PATH=/home/beronthecolossus/anaconda2/envs/venv2/bin:$PATH
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH=$PATH:/home/beronthecolossus/env/bin
export PATH=$PATH:/root/.local/bin
export PATH=$PATH:/home/beronthecolossus/Desktop/Code
export PATH=$PATH:/home/beronthecolossus/scripts
export PATH=$PATH:/home/beronthecolossus/.config/i3
export PATH=$PATH:/home/beronthecolossus/Peki/processing-3.5.3
export PATH=$PATH:/home/beronthecolossus/pypy3.6-v7.1.1-linux64/bin
export ZSH="/home/beronthecolossus/.oh-my-zsh"
export FILE="thunar"
export TERMINAL="terminator"
export BROWSER="firefox"
export EDITOR="nvim"
# export TERM=xterm-256color
export NNN_USE_EDITOR=1
export NNN_DE_FILE_MANAGER=thunar
export NNN_OPENER=xdg-open
export QT_SELECT=qt5
export QT_QMAKE=/usr/bin

ZSH_THEME="powerlevel10k/powerlevel10k"

export UPDATE_ZSH_DAYS=10

plugins=( z git fast-syntax-highlighting command-not-found tmux zsh-autosuggestions extract
		 colored-man-pages zsh-completions vi-mode )

bindkey -v
source $ZSH/oh-my-zsh.sh
export MANPATH="/usr/local/man:$MANPATH"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Aliases
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"
alias lolcat="lolcat -ftp 1.9 -F 0.07"
alias update='clear && sudo apt-get update | lolcat && sudo apt-fast upgrade -y | lolcat'
alias open='xdg-open'
alias grep='grep --color=auto'
alias ls="colorls --group-directories-first"
alias lsa='colorls -Al --sd --group-directories-first'
alias las="lsa"
alias la='colorls -A --sd --group-directories-first'
alias lt="colorls -l --tree --sd --group-directories-first"
alias lat="colorls -Al --sd --tree --group-directories-first"
alias lta="lat"
altercd(){ cd(){ unset -f cd ; cd $*; la ; altercd; } } ; altercd
alias sdn="sudo shutdown -h now"
alias env='source /home/beronthecolossus/env/bin/activate'
alias i3rc="nvim /home/beronthecolossus/.config/i3/config"
alias si3=i3rc
alias celar=clear
alias claer=clear
alias lcaer=clear
alias clera=clear
alias clea=clear
alias cp="cp -i"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias cvim="nvim ~/.config/nvim/init.vim"
alias vimdiff="nvim -d"
alias exi="exit"
alias mutt="neomutt"
alias pypip="/home/beronthecolossus/pypy3.6-v7.1.1-linux64/bin/pip3"
alias ctmux="nvim ~/.tmux.conf"
alias locate="locate -eLitp"

# CONFIG STUFF
POWERLEVEL9K_MODE='nerdfont-complete'
PURE_POWER_MODE=fancy
source ~/.purepower

POWERLEVEL9K_LINUX_UBUNTU_ICON="\uf31b "
POWERLEVEL9K_LINUX_UBUNTU_ICON_BACKGROUND=none
POWERLEVEL9K_VIRTUAL_ENV_BACKGROUND=none
POWERLEVEL9K_OS_ICON_BACKGROUND=none
POWERLEVEL9K_OS_ICON_FOREGROUND="red"
POWERLEVEL9K_VIRTUALENV_BACKGROUND=none
POWERLEVEL9K_VIRTUALENV_FOREGROUND=032
DOTNET_CLI_TELEMETRY_OPTOUT=1

fpath=(~/cheat-sh/ $fpath)


