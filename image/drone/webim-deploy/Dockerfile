FROM docker-registry-cn.easemob.com/im/ubuntu-ssh-vim-expect:latest
MAINTAINER Wen Ke <wenke@easemob.com>

RUN mkdir -p /root/.ssh
COPY id_rsa /root/.ssh/
RUN chmod 600 /root/.ssh/id_rsa
COPY run.sh /
RUN chmod 755 /run.sh
ENTRYPOINT ["/run.sh"]
