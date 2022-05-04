FROM ubuntu:22.04
RUN sed -i "s|archive.ubuntu.com|mirrors.ustc.edu.cn|g" /etc/apt/sources.list
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install --yes \
    fonts-noto-cjk \
    librsvg2-bin \
    npm \
    pandoc \
    texlive-full && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/local/lib/mermaid-cli && \
    cd /usr/local/lib/mermaid-cli && \
    npm install --registry=https://registry.npmmirror.com @mermaid-js/mermaid-cli
