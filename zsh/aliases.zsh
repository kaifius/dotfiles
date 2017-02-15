addAlias() {
  echo "alias $1='$2'" >> /Users/kaihofius/.dotfiles/zsh/aliases.zsh
  eval 'reload!'
}

alias reload!='. ~/.zshrc'
alias zshp='subl ~/.dotfiles'
alias chalk='cd ~/code/synchroform'
alias code='cd ~/code'
alias gitwut='cat ~/.dotfiles/git/aliases.zsh | grep alias'
alias me="lg | grep -vi 'merge' | grep -i '<kai'"
alias hrc='heroku run rails console -r heroku'
alias hrcStaging='heroku run rails console -r staging'
alias tempcommit="git add .; git commit -m 'TEMP COMMIT'"

alias changedFiles='git diff HEAD~1 --name-only | cat'

openChangedFiles() {
  openFilesCommand="subl . "
  while read -r fileName; do
    openFilesCommand=$openFilesCommand$fileName" "
  done <<< $(changedFiles)
  echo "opening changed files:\n$(changedFiles)"
  eval $openFilesCommand
}

alias jest='npm run jest'
