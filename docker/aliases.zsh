alias dockerrmid="docker images -q --filter "dangling=true" | xargs docker rmi"
