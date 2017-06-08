addAlias() {
  echo "alias $1='$2'" >> /Users/kaihofius/.dotfiles/zsh/aliases.zsh
  eval 'reload!'
}

alias reload!='. ~/.zshrc'
alias zshp='atom ~/.dotfiles'
alias chalk='cd ~/code/synchroform'
alias code='cd ~/code'
alias gitwut='cat ~/.dotfiles/git/aliases.zsh | grep alias'
alias me="lg | grep -vi 'merge' | grep -i '<kai'"
alias hrc='heroku run rails console -r heroku'
alias prodpg='heroku pg:psql -r heroku'
alias hrcStaging='heroku run rails console -r staging'
alias tempcommit="git add .; git commit -m 'TEMP COMMIT'"
alias jest='yarn jest'
alias st='spring teaspoon'

alias latestCommittedFiles='git diff HEAD HEAD~1 --name-only | cat'
alias changedFiles='git diff HEAD --name-only | cat'

doAThingToLotsOfFiles() {
  commandToPerform=$1" "
  alias filesList=$2
  while read -r fileName; do
    commandToPerform=$commandToPerform$fileName" "
  done <<< $(filesList)
  echo "performing $1 on the following files: \n\n$(filesList)"
  eval $commandToPerform

}

openCommit() {
  eval 'doAThingToLotsOfFiles "atom ." "git diff $1 $1~1 --name-only | cat"'
}

openLastCommit() {
  eval 'openCommit HEAD'
}

openChangedFiles!() {
  eval 'git add .'
  eval 'doAThingToLotsOfFiles "atom ." changedFiles'
  eval 'git reset'
}

resetTempCommit() {
  headMessage=$(git log --format=%B -n 1 HEAD | cat)

  if [ $headMessage == "TEMP COMMIT" ]; then
    git reset HEAD~1
  else
    echo 'no temp commit to reset'
  fi
}
