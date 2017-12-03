FROM debian:buster-slim

RUN apt-get update && apt-get install -y pulseaudio golang && rm -rf /var/cache/apt/

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
mkdir -p /home/developer && \
mkdir -p /etc/sudoers.d && \
echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
echo "developer:x:${uid}:" >> /etc/group && \
echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
chmod 0440 /etc/sudoers.d/developer && \
chown ${uid}:${gid} -R /home/developer && \
export "PULSE_SERVER=unix:/home/developer/pulse/socket" && \
mkdir ~/go && \
sudo touch /etc/profile.d/goenv.sh && \
echo "export GOROOT=/usr/lib/go" >> /etc/profile.d/goenv.sh && \
echo "export GOPATH=$HOME/go" >> /etc/profile.d/goenv.sh && \
echo "export PATH=$PATH:$GOROOT/bin:$GOPATH/bin" >> /etc/profile.d/goenv.sh && \
source /etc/profile.d/goenv.sh

USER developer
ENV HOME /home/developer
#CMD /home/developer/goland/bin/goland.sh
CMD /bin/bash
