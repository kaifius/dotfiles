removeUntaggedImages() {
  docker images -q --filter "dangling=true" | xargs docker rmi
}
alias dockerrmid=removeUntaggedImages
removeStoppedContainers() {
  docker rm $(docker ps -a -q)
}
alias dockerrma=removeStoppedContainers
