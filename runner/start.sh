#!/bin/bash

cd /actions-runner

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

error() {
    echo [!] $1
    exit 1
}

if [ -z "$ORGANIZATION" ]; then
	error "Missing organization variable ORGANIZATION. please update environment variable."
fi

if [ -z "$REG_TOKEN" ]; then
	error "Missing registration token REG_TOKEN. please update environment variable."
fi 

./config.sh --url https://github.com/${ORGANIZATION} --token ${REG_TOKEN}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh
