
### Run command under docker

docker  run  --entrypoint /bin/cat fedora.41i /etc/redhat-release


# ls
docker image ls

# rm unused images
docker image prune -a

# rm all images
docker rmi -f $(docker images -aq)

