FROM ubuntu:disco

# BASICS FOR SYSTEMD

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN sed -i 's/# deb/deb/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y systemd \
    && apt-get clean
    # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /lib/systemd/system/sysinit.target.wants/ \
    && ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/basic.target.wants/* \
    /lib/systemd/system/anaconda.target.wants/* \
    /lib/systemd/system/plymouth* \
    /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

# NECESSARY STUFF FOR ANSIBLE TESTS

RUN apt install -y software-properties-common git sudo python python-pip
RUN pip install ansible
# RUN rm -rf /var/lib/apt/lists/*

ADD bin /bin
STOPSIGNAL SIGRTMIN+3
# RUN useradd -ms /bin/bash newuser
RUN mkdir /etc/ansible
RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
ENV USER docker
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker
WORKDIR /home/docker
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/lib/systemd/systemd"]