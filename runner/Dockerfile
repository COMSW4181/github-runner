FROM ubuntu:20.04

#reference: https://testdriven.io/blog/github-actions-docker/

ARG RUNNER_VERSION="2.298.2"

ENV DEBIAN_FRONTEND noninteractive

#RUN apt-get update && apt-get install -y liblttng-ust1 libkrb5-3 zlib1g libssl1.1 libicu63
RUN apt-get update && apt-get install -y \
	curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev python3-pip\
	build-essential cmake git \
	openssl valgrind unzip zip
RUN pip3 install pexpect ptyprocess pycryptodome
# https://github.com/actions/runner/blob/main/docs/start/envlinux.md

RUN mkdir /actions-runner
RUN useradd --comment 'GitHub Runner' --home-dir /actions-runner actions-runner --shell /bin/bash
RUN cd /actions-runner && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
	&& tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && chown -R actions-runner /actions-runner && /actions-runner/bin/installdependencies.sh

COPY start.sh /start.sh
RUN chmod +x /start.sh

USER actions-runner
WORKDIR /actions-runner

ENTRYPOINT ["/start.sh"]
