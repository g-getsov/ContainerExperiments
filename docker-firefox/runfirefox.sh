docker run -ti --rm \
-e DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v $HOME/.Xauthority:/home/developer/.Xauthority:ro \
-v /dev/snd:/dev/snd \
-v /run/user/$UID/pulse/native:/home/developer/pulse/socket:ro \
--net=host --pid=host --ipc=host firefox
