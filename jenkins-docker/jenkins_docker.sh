#!/bin/bash

set -e

DOCKER_SOCK="/var/run/docker.sock"

if [ -f "$DOCKER_SOCK" ];
then
    chgrp docker /var/run/docker.sock
fi

/usr/local/bin/jenkins.sh

exit 0
