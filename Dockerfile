FROM node:18.1.0-bullseye
RUN sed -i "s|deb.debian.org|mirrors.ustc.edu.cn|g" /etc/apt/sources.list
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --yes \
    chromium \
    fonts-noto-cjk \
    librsvg2-bin \
    pandoc \
    texlive-full && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/mermaid-cli && \
    cd /usr/local/lib/mermaid-cli && \
    npm install --registry=https://registry.npmmirror.com @mermaid-js/mermaid-cli
ADD rootfs/usr/local/lib/slidev/* /usr/local/lib/slidev/
RUN cd /usr/local/lib/slidev/ && npm install --registry=https://registry.npmmirror.com --dd
RUN groupadd -r mdt && useradd --no-log-init -r -g mdt mdt
ADD rootfs /
ADD themes /usr/local/lib/mdt/themes/
USER mdt