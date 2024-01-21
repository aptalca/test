FROM ghcr.io/linuxserver/baseimage-alpine:3.19

RUN \
  if [[ $(uname -m) == "aarch64" ]]; then \
    echo "**** Building in arm64v8 qemu ****"; \
  elif [[ $(uname -m) == "x86_64" ]]; then \
    echo "**** Building in amd64 ****"; \
  fi
