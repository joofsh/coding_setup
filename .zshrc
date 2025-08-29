. /usr/local/opt/asdf/libexec/asdf.sh
ZSH_DISABLE_COMPFIX="true"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Fixes zsh prompt. Only shows machine when not on home machine
#export DEFAULT_USER='jd'
prompt_context () {}

# For vim mode in zsh
bindkey -v
export KEYTIMEOUT=1 # reduce timeout
# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward
# Backspace key
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source ~/.sh/local.sh

# Pyenv setup
# eval "$(pyenv init -)"

# ssh agent
sh-add -A 2>/dev/null

stty sane
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# Disable spring
export DISABLE_SPRING=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jd/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jd/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/jd/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jd/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/Users/jd/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/jd/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc

export PATH="/usr/local/opt/libpq/bin:$PATH"

# export PATH="/Applications/Docker.app/Contents/Resources/bin/docker:$PATH"

. "$HOME/.local/bin/env"

# Cursor-specific git configuration
if [[ "$TERM_PROGRAM" == "vscode" || -n "$CURSOR_TRACE_ID" ]]; then
  export GIT_PAGER=cat
  export PAGER=cat
fi
