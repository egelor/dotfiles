# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# alias emacs -nw
alias emnw='emacs -nw '

#alias for getting pid of running app (use: getpid <appname>)
alias getpid='ps h -o pid -C'

#alias to manage dotfiles repository
alias config='/usr/bin/git --git-dir=/home/zob203/.dotfiles --work-tree=/home/zob203'

# alias for contacts
alias contacts='wine .wine/drive_c/Program\ Files\ \(x86\)/Echo\ Images/Contact\ Sheets\ 1.7.0.1/Contacts.exe'

# youtube download (URL must be in clipboard)
alias Ydv='youtube-dl -i -c -o "/home/zob203/Downloads/youtubeDownload/video/%(title)s.%(ext)s" "$(xclip -selection clipboard -o)"'
alias Yda='youtube-dl -x --audio-format mp3 -i -c -o "/home/zob203/Downloads/youtubeDownload/audio/%(title)s.%(ext)s" "$(xclip -selection clipboard -o)"'

# add autocompletion to the new alias
# complete -o bashdefault -o default -o nospace -F __git_wrap__git_main config

export TERM=xterm-256color
export EDITOR="emacs"
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
