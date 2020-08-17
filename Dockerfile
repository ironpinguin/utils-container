FROM amd64/alpine:3.12

RUN apk --no-cache add \
    bash \
    bind-tools \
    curl \
    jq \
    mariadb-client \
    mtr \
    netcat-openbsd \
    openssh \
    postgresql-client \
    pv \
    rsync \
    socat \
    strace \
    tcpdump \
    tmux \
    vault \
    vim \
    w3m \
    aws-cli \
    wget

RUN cd /usr/local/bin && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

CMD ["/bin/bash"]

