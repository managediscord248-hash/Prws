FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    nano \
    vim \
    bash \
    ca-certificates \
    build-essential \
    python3 \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g wetty

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
