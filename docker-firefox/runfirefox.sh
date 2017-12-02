docker run -ti --rm \
-e DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.Xauthority:/home/developer/.Xauthority \
-v /dev/snd:/dev/snd \
-v /run/user/$UID/pulse/native:/home/developer/pulse/socket \
--net=host --pid=host --ipc=host firefox
