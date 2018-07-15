FROM ubuntu:bionic

RUN apt update && apt dist-upgrade -y && apt install -y software-properties-common init git ansible
RUN rm -rf /var/lib/apt/lists/*


ADD bin /bin
STOPSIGNAL SIGRTMIN+3

RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/sbin/init"]
