# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative | less -X"
alias gp='git push origin HEAD'
alias gpm='git pull origin master --prune'
alias gkm='git checkout master'
alias grm='git rebase master'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gk='git checkout -b'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gse='git status -sb'
alias gd='git icdiff | less -X'
