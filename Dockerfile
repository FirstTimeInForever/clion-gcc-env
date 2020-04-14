FROM ubuntu:devel


RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y ssh \
        build-essential gcc-10 g++-10 gdb clang cmake rsync tar python3 valgrind \
    && apt-get clean


RUN echo 'root:root' | chpasswd \
    && useradd -ms /bin/bash dev \
    && usermod -aG sudo dev \
    && echo 'dev:dev' | chpasswd \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && mkdir /var/run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
