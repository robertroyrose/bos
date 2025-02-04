
# ls
docker image ls

# rm unused images
docker image prune -a

# rm all images
docker rmi -f $(docker images -aq)

