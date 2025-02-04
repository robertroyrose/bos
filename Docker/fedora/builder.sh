
docker container run \
    --privileged \
    --init \
    --rm \
    --interactive \
    --tty \
    --env UID=$(id -u) \
    --env GID=$(id -g) \
    --env USERNAME=${USER} \
    --volume ${PWD}:${PWD} \
    --workdir ${PWD} \
    fedora.41:latest /bin/bash

#    --volume ${PWD}/app0:/app0 \
