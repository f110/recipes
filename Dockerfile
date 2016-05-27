FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade && apt-get install -y build-essential libssl-dev libreadline-dev zlib1g-dev openssh-server ufw curl sudo
RUN mkdir /var/run/sshd

RUN useradd -m docker && echo "docker:docker" | chpasswd && gpasswd -a docker sudo
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh

ADD ./authorized_keys /home/docker/.ssh/authorized_keys
RUN chown docker /home/docker/.ssh/authorized_keys; chmod 600 /home/docker/.ssh/authorized_keys

CMD /usr/sbin/sshd -D && tail -f /dev/null
