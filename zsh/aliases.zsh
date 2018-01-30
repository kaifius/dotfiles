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
alias prodpg='heroku pg:psql -r heroku'
alias hrcStaging='heroku run rails console -r staging'
alias jest='yarn jest'
alias st='spring teaspoon'

alias latestCommittedFiles='git diff HEAD HEAD~1 --name-only | cat'
alias changedFiles='git diff HEAD --name-only | cat'
alias tempcommit="git add .; git commit -m 'TEMP COMMIT'"

openCommit() {
  eval "git diff $1 $1~1 --name-only | xargs subl ."
}

openLastCommit() {
  eval 'openCommit HEAD'
}

openChangedFiles!() {
  eval 'git add .'
  eval 'changedFiles | xargs subl .'
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

jestLastCommit() {
  eval 'latestCommittedFiles | grep spec/js | xargs jest'
}

rspecLastCommit() {
  eval 'latestCommittedFiles | grep spec.rb$ | xargs rspec'
}

testLastCommit() {
  eval 'jestLastCommit; rspecLastCommit'
}
alias eslint='yarn eslint'
alias testLog='tail -f log/test.log'
