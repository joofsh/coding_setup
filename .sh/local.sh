# Code repos
alias hf="cd ~/src/healthify"
alias san="cd ~/src/aptible-staging-automation"
alias cs="cd ~/src/coding_setup"
alias fe="cd ~/src/healthify-frontend-challenge"

# better ag
alias ag='ag --path-to-ignore ~/.ignore'

# bundle exec
alias be='bundle exec'
alias bsr='be spring rspec'
alias bss='be spring rails s'
alias bsc='be spring rails c'

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
alias gc="git commit"
alias gp="git push"
alias gu="git pull --rebase"
alias gpf="git push --force-with-lease"
alias ga="git add"
alias ga.="git add ."
alias gd="git diff"
alias gdc="git diff --cached"
alias gpop="git stash pop"
alias gsta="git stash" 
alias gco="git checkout"
alias gst="git status"
alias gpsup="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
alias git_delete_merged_branches='git branch --merged | grep -Ev "(^\*|^\+|master|main|dev)" | xargs --no-run-if-empty git branch -d'

export LESS="-F -X $LESS"

alias ogvim="vi"
alias vi="nvim"
# alias vim="nvim"
alias n="load_nvm"

# Personal projects
alias aw="cd ~/src/author_website"


# Parachute specific
alias wf="cd ~/src/app-workflow"
alias inf="cd ~/src/infrastructure"
alias mi="cd ~/src/mirth-imports"
alias mir="cd ~/src/mirth"
alias cinf="cd ~/src/corp-infrastructure"

alias obs="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"
alias ai="cd ~/src/llm_practice"

alias pa="~/src/eventual_company/patient_advocacy"
alias pa2="~/src/eventual_company/patient_advocacy_2"
alias pam="~/src/eventual_company/patient_advocacy_demand_test"

# login to ECR
alias ecr-login='aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 242201315437.dkr.ecr.us-east-1.amazonaws.com'

alias aptl='aptible login --email=jonathanpagano@gmail.com --password=$APTIBLE_PASSWORD --lifetime=7d'
