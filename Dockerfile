FROM debian:11.3
RUN sed -i "s|deb.debian.org|mirrors.ustc.edu.cn|g" /etc/apt/sources.list
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --yes \
    chromium \
    fonts-noto-cjk \
    librsvg2-bin \
    npm \
    pandoc \
    texlive-full && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/mermaid-cli && \
    cd /usr/local/lib/mermaid-cli && \
    npm install --registry=https://registry.npmmirror.com @mermaid-js/mermaid-cli
RUN groupadd -r mdt && useradd --no-log-init -r -g mdt mdt
ADD rootfs /
USER mdt