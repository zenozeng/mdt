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
    echo "{}" > package.json && \
    npm install --registry=https://registry.npmmirror.com @mermaid-js/mermaid-cli
RUN groupadd -r mdt && useradd --no-log-init -r -g mdt mdt
ADD rootfs/usr/local/lib/slidev/package.json /home/mdt/workdir/package.json
WORKDIR /home/mdt/workdir
RUN chown -R mdt:mdt /home/mdt
USER mdt
RUN npm install --registry=https://registry.npmmirror.com --dd
ADD rootfs /
ADD themes /usr/local/lib/mdt/themes/