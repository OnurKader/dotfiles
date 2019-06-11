# Exports
export BROWSER="firefox"
export EDITOR="nvim"
export FILE="thunar"
export GOPATH=$HOME/Peki/go
export NNN_DE_FILE_MANAGER=thunar
export NNN_OPENER=xdg-open
export NNN_USE_EDITOR=1
export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/beronthecolossus/.cargo/bin
export PATH=$PATH:/home/beronthecolossus/.config/i3
export PATH=$PATH:/home/beronthecolossus/Desktop/Code
export PATH=$PATH:/home/beronthecolossus/Peki/processing-3.5.3
export PATH=$PATH:/home/beronthecolossus/env/bin
export PATH=$PATH:/home/beronthecolossus/pypy3.6-v7.1.1-linux64/bin
export PATH=$PATH:/home/beronthecolossus/scripts
export PATH=$PATH:/root/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=/home/beronthecolossus/.local/bin:$PATH
export PATH=/home/beronthecolossus/env/bin:$PATH
export PATH=/usr/java/jdk-12/bin:$PATH
export QT_QMAKE=/usr/bin
export QT_SELECT=qt5
export TERM=xterm-256color
export TERMINAL="terminator"
export ZSH="/home/beronthecolossus/.oh-my-zsh"
export UPDATE_ZSH_DAYS=10

ZSH_THEME="powerlevel10k/powerlevel10k"

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
alias "ex,t"="exit"
alias -g i3rc="nvim /home/beronthecolossus/.config/i3/config"
alias -g lolcat="lolcat -ftp 1.9 -F 0.07"
alias ls="colorls --group-directories-first"
alias -g lsa='colorls -Al --sd --group-directories-first'
alias -g lt="colorls -l --tree --sd --group-directories-first"
alias -g lta="lat"
alias -g ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"
alias -g open='xdg-open'
alias -g vim="nvim"
alias -g vimdiff="nvim -d"
alias -g zshconfig="nvim ~/.zshrc"
alias czsh="$EDITOR ~/.zshrc"
alias -s c=nvim
alias -s cpp=nvim
alias -s h=nvim
alias -s hpp=nvim
alias -s html=nvim
alias -s java=nvim
alias -s js=nvim
alias -s md=remarkable
alias -s mp4=vlc
alias -s mkv=vlc
alias -s avi=vlc
alias -s pde=processing
alias -s py=nvim
alias -s txt=nvim
alias celar=clear
alias ci3=i3rc
alias cl="clear"
alias claer=clear
alias clea=clear
alias cleara="clear"
alias clera=clear
alias cp="cp -ip"
alias ctmux="nvim ~/.tmux.conf"
alias cvim="nvim ~/.config/nvim/init.vim"
alias env='source /home/beronthecolossus/env/bin/activate'
alias exi="exit"
alias grep='grep --color=auto'
alias la='colorls -A --sd --group-directories-first'
alias las="lsa"
alias lat="colorls -Al --sd --tree --group-directories-first"
alias lcaer=clear
alias locate="locate -eLitp"
alias mutt="neomutt"
alias pypip="/home/beronthecolossus/pypy3.6-v7.1.1-linux64/bin/pip3"
alias sdn="sudo shutdown -h now"
alias update='clear && sudo apt-get update | lolcat && sudo apt-fast upgrade -y | lolcat'
alias v="nvim"
alias vi="nvim"
mkcd () { mkdir -p "$*"; cd "$*"; }
altercd(){ cd(){ unset -f cd ; cd $*; la ; altercd; } } ; altercd

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

