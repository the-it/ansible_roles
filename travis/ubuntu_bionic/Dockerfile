FROM ubuntu:bionic

RUN apt update && apt dist-upgrade -y
RUN apt install -y software-properties-common
RUN apt install -y init
RUN apt install -y git
RUN apt install -y ansible
RUN rm -rf /var/lib/apt/lists/*


ADD bin /bin
STOPSIGNAL SIGRTMIN+3

RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/sbin/init"]
