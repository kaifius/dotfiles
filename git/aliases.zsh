alias gl="echo 'did you mean lg?'"
alias lg='git --no-pager lg -5'
alias gp='git push'
alias gpf='git push -f'
alias gpm='git pull origin main --prune && git fetch'
alias gps='git pull origin staging --prune && git fetch'
alias gkm='git co main && gpm'
alias gks='git co staging && gps'
alias gkl='git co -'
alias grl='git rebase -'
alias grm='git rebase main'
alias gc='git commit'
alias gca='git commit --amend'
alias gk='git checkout -b'
alias gcb='git copy-branch-name'
alias gb='git --no-pager branch'
alias gse='git status -sb'
alias gd='git icdiff'
alias gpu='[[ -z $(git config "branch.$(git symbolic-ref --short HEAD).merge") ]] &&
           git push -u origin $(git symbolic-ref --short HEAD) ||
           git push'
alias cpb= 'git branch-cp'

branchesExcept() {
  if [ $1 ]; then
    exception="|$1"
  fi
  eval "git branch | grep -viE 'main|staging$exception'"
}

forceDeleteBranchesExcept() {
  eval "branchesExcept $1 | xargs git branch -D"
}

branchesWith() {
  eval "git branch | grep -iE $1"
}

forceDeleteBranchesWith() {
  eval "branchesWith $1 | xargs git branch -D"
}

