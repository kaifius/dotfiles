addAlias() {
  echo "alias $1='$2'" >> ~/.dotfiles/zsh/aliases.zsh
  eval 'reload!'
}

alias reload!='. ~/.zshrc'
alias zshp='subl ~/.dotfiles'
alias chalk='cd ~/code/synchroform'
alias code='cd ~/code'
alias gitwut='cat ~/.dotfiles/git/aliases.zsh | grep alias'
alias me="git lg | grep -vi 'merge' | grep -i '<kai'"
alias hrc='heroku run rails console -r heroku'
alias prodpg='heroku pg:psql -r heroku'
alias hrcStaging='heroku run rails console -r staging'
alias jest='yarn jest'
alias st='spring teaspoon'
alias rumRuffPubPax='rm -rf public/packs-test'

alias latestCommittedFiles='git diff HEAD~1 HEAD --name-only'
alias changedFiles='git diff HEAD --name-only | cat'
alias tempcommit="git add .; git commit -m 'TEMP COMMIT'"

listCommit() {
  "git diff $1~1 $1 --name-only"
}

openCommit() {
  eval "git diff $1~1 $1 --name-only --diff-filter=d | xargs subl ."
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

  if [ $headMessage = "TEMP COMMIT" ]; then
    git reset HEAD~1
  else
    echo 'no temp commit to reset'
  fi
}

jestLastCommit() {
  alias jestSpecs='latestCommittedFiles --diff-filter=d | grep spec/javascript/'
  if [ jestSpecs ]; then
    eval  'jestSpecs | xargs yarn jest'
  fi
}

rspecLastCommit() {
  alias rspecSpecs='latestCommittedFiles --diff-filter=d | grep spec.rb$'
  if [ rspecSpecs ]; then
    eval 'rspecSpecs | xargs rspec'
  fi
}

alias testLastCommit='jestLastCommit; rspecLastCommit'


alias eslint='yarn eslint'
alias testLog='tail -f log/test.log'
