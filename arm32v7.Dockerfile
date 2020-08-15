FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1


FROM arm32v7/alpine:3.12

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

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
    wget

RUN cd /usr/local/bin && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/arm/kubectl

CMD ["/bin/bash"]

