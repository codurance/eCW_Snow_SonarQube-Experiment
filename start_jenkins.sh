#!/bin/bash
set -uo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"

docker kill jenkins
docker rm jenkins
docker run \
    -p 8080:8080 \
    -p 50000:50000 \
    --rm \
    --name jenkins \
    -v jenkins_home:/var/jenkins_home \
    jenkins/jenkins:lts-jdk11


cd - >/dev/null
