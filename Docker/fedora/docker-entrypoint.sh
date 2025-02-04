#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

readonly uid=${UID:-9999}
readonly gid=${GID:-9999}
readonly username=${USERNAME:-builder}

if [[ "${uid}" == "0" ]]; then
    echo
    echo "ERROR: please run the container as a non-root user"
    echo
    echo "  $ docker run ... --user \$(id -u):\$(id -g) ..."
    echo
    exit 1
fi

#
# Create local username
#

if [[ ! $(getent group "${gid}") ]]; then
    groupadd --gid "${gid}" "${username}"
fi

if [[ $(id -nu ${uid}) != ${username} ]]; then
	userdel  $(id -nu ${uid}) || true
fi

if [[ ! $(getent passwd "${uid}") ]]; then
    useradd --comment "Build user" \
            --uid "${uid}" \
            --gid "${gid}" \
            --home-dir "/home/${username}" \
            --shell /usr/bin/bash \
            "${username}" || /bin/bash
    echo "${username} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${username}"
fi

exec gosu "${username}" "${@}"
