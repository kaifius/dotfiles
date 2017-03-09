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

# The rest of my fun git aliases
alias gl="echo 'did you mean lg?'"
alias gp='git push origin HEAD'
alias gpm='git pull origin master --prune'
alias gps='git pull origin staging --prune'
alias gkm='git checkout master'
alias gkl='git co -'
alias grm='git rebase master'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gk='git checkout -b'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gse='git status -sb'
alias gd='git icdiff | less -X'
