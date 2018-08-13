alias hf="cd ~/src/healthify"
alias cs="cd ~/src/coding_setup"


# always ls after cd-ing
function cd {
  builtin cd "$@" && ls -la
}

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# git aliases
alias gu="git pull"
alias ga.="git add ."
alias gdc="git diff --cached"


export LESS="-F -X $LESS"
