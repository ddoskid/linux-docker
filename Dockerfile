FROM debian:10

MAINTAINER Qi Yang <i@yangqi.me>

# Install.
RUN apt-get update -y
RUN apt-get install curl wget sshpass unzip -y
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN ./ngrok authtoken 20TQWYiJAXr0FNDmYiRdJKk7JoP_5V7PkYuXTB33EAwkYiP1w
RUN ./ngrok tcp 2222 &
RUN wget https://raw.githubusercontent.com/ddoskid/linux-docker/master/sshd_config && cp -rf sshd_config /etc/ssh/sshd_config
RUN service ssh restart

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
