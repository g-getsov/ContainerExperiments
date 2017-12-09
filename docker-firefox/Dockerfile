FROM debian:buster-slim

# Add buster non free and contrib source list
RUN echo "deb http://ftp.ua.debian.org/debian buster contrib non-free" | tee -a /etc/apt/sources.list.d/docker.list && \
echo "deb-src http://ftp.ua.debian.org/debian buster contrib non-free" | tee -a /etc/apt/sources.list.d/docker.list

# Install dependencies
RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -y install \
firefox-esr \
pulseaudio \
golang \
git \
xserver-xorg-video-all \
nvidia-driver \
mesa-utils \
libxcursor-dev \
libxi-dev \
libxrandr-dev \
libxinerama-dev && \
rm -rf /var/cache/apt/

# Create developer user and mapp it to host user
# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
mkdir -p /home/developer && \
mkdir -p /etc/sudoers.d && \
echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
echo "developer:x:${uid}:" >> /etc/group && \
echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
chmod 0440 /etc/sudoers.d/developer && \
chown ${uid}:${gid} -R /home/developer && \
export "PULSE_SERVER=unix:/home/developer/pulse/socket"

# Set the new user's home directory
ENV HOME /home/developer

# Set the go env parameters and add them to an export script
ENV GOROOT /usr/lib/go
ENV GOPATH $HOME/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN touch /etc/profile.d/goenv.sh && \
echo "export GOROOT=$GOROOT" >> /etc/profile.d/goenv.sh && \
echo "export GOPATH=$GOPATH" >> /etc/profile.d/goenv.sh && \
echo "export PATH=$PATH" >> /etc/profile.d/goenv.sh

# Copy in the initialization script and allow it to be run by the container user
COPY ./init.sh /home/developer/init.sh
RUN chmod 755 /home/developer/init.sh && \
chown ${uid}:${gid} /home/developer/init.sh

# Switch to the new user
USER developer

# Export go env parameters for the container user
RUN mkdir ~/go && \
. /etc/profile.d/goenv.sh

# Run initialization script
ENTRYPOINT ["/home/developer/init.sh"]
