FROM ubuntu:disco

RUN apt update && apt install -y software-properties-common init git sudo python python-pip
RUN pip install ansible
RUN rm -rf /var/lib/apt/lists/*

ADD bin /bin
STOPSIGNAL SIGRTMIN+3
RUN useradd -ms /bin/bash newuser

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
ENV USER docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
WORKDIR /docker/home
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/sbin/init"]
