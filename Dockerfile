FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    ttyd \
    tmux \
    supervisor \
    curl \
    wget \
    git \
    sudo \
    nano \
    vim \
    bash \
    ca-certificates \
    iputils-ping \
    procps \
    && rm -rf /var/lib/apt/lists/*

# Terminal prompt
RUN echo "export PS1='root@azmal:\w# '" >> /root/.bashrc

COPY start.sh /start.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod +x /start.sh

CMD ["/start.sh"]
