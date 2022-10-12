#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"



if [[ $(arch) == 'arm64' ]]; then
    IMG='mwizner/sonarqube:8.9.5-community'
else
    IMG='sonarqube:lts'
fi

docker run -d \
    --rm \
    --name sonarqube \
    -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
    -p 9000:9000 \
    $IMG



cd - >/dev/null
