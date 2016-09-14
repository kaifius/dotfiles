addAlias() {
  echo "alias $1='$2'" >> /Users/kaihofius/.dotfiles/zsh/aliases.zsh
  reload!
}

alias reload!='. ~/.zshrc'
alias zshp='subl ~/.dotfiles'
alias chalk='cd ~/code/synchroform'
alias code='cd ~/code'
alias gitwut='cat ~/.dotfiles/git/aliases.zsh | grep alias'
alias changedfiles='git diff master --name-only | cat'
alias me="lg | grep -vi 'merge' | grep -i '<kai'"
alias hrc='heroku run rails console -r heroku'
alias hrcStaging='heroku run rails console -r staging'
alias tempcommit="git add .; git commit -m 'TEMP COMMIT'"
