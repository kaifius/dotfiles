# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

lg() {
  git lg $1 | less -X
}

alias gl="echo 'did you mean lg?'"
alias gp='git push'
alias gpf='git push -f'
alias gpm='git pull origin master --prune && git fetch'
alias gps='git pull origin staging --prune && git fetch'
alias gkm='git co master && gpm'
alias gks='git co staging && gps'
alias gkl='git co -'
alias grl='git rebase -'
alias grm='git rebase master'
alias gc='git commit'
alias gca='git commit --amend'
alias gk='git checkout -b'
alias gcb='git copy-branch-name'
alias gb='git branch | less -X'
alias gse='git status -sb'
alias gd='git icdiff | less -X'

branchesExcept() {
  if [ $1 ]; then
    exception="|$1"
  fi
  eval "git branch | grep -viE 'master|staging$exception'"
}

cleanBranchesExcept() {
  eval "branchesExcept $1 | xargs git branch -D"
}
