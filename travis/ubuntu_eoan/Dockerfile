FROM ubuntu:eoan

RUN apt update && apt install -y software-properties-common init git sudo python3 python3-pip
RUN pip3 install ansible
RUN rm -rf /var/lib/apt/lists/*

ADD bin /bin
STOPSIGNAL SIGRTMIN+3
RUN useradd -ms /bin/bash newuser
RUN mkdir /etc/ansible
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
ENV USER docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
WORKDIR /home/docker
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/sbin/init"]
