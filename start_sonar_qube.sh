#!/bin/bash
set -euo pipefail
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR"





docker run -d \
    --platform linux/amd64 \
    --name sonarqube \
    -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
    -p 9000:9000 \
    sonarqube:latest







cd - >/dev/null
