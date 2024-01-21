FROM ghcr.io/linuxserver/baseimage-alpine:3.19 as buildstage

RUN \
  mkdir -p /root-layer && \
  if [[ $(uname -m) == "aarch64" ]]; then \
    echo "**** Building in arm64v8 qemu ****"; \
    echo "**** Built in arm64v8 ****" > /root-layer/init-message; \
  elif [[ $(uname -m) == "x86_64" ]]; then \
    echo "**** Building in amd64 ****"; \
    echo "**** Built in amd64 ****" > /root-layer/init-message; \
  fi

# copy local files
COPY root/ /root-layer/

FROM scratch

# Add files from buildstage
COPY --from=buildstage /root-layer/ /
