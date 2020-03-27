# Code repos
alias hf="cd ~/src/healthify"
alias san="cd ~/src/aptible-staging-automation"
alias cs="cd ~/src/coding_setup"

# better ag
alias ag='ag --path-to-ignore ~/.ignore'

# bundle exec
alias be='bundle exec'

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
alias gu="git pull --rebase"
alias gpf="git push --force-with-lease"
alias ga.="git add ."
alias gdc="git diff --cached"
alias gpop="git stash pop"
alias git_delete_merged_branches='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -d $branch; done'

export LESS="-F -X $LESS"


# Healthify specific
alias aptlogin="aptible login --lifetime=7d --email=jd@healthify.us"
