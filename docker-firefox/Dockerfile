FROM debian:buster-slim

RUN apt-get update && apt-get install -y pulseaudio golang git libgl1-mesa-dev libxcursor-dev libxi-dev libxrandr-dev libxinerama-dev && rm -rf /var/cache/apt/

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

ENV HOME /home/developer
ENV GOROOT /usr/lib/go
ENV GOPATH $HOME/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN touch /etc/profile.d/goenv.sh && \
echo "export GOROOT=$GOROOT" >> /etc/profile.d/goenv.sh && \
echo "export GOPATH=$GOPATH" >> /etc/profile.d/goenv.sh && \
echo "export PATH=$PATH" >> /etc/profile.d/goenv.sh

COPY ./init.sh /home/developer/init.sh
RUN chmod 755 /home/developer/init.sh && \
chown ${uid}:${gid} /home/developer/init.sh

USER developer

RUN mkdir ~/go && \
. /etc/profile.d/goenv.sh

ENTRYPOINT ["/home/developer/init.sh"]
