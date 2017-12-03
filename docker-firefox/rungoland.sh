docker run -ti --rm \
-e DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v $HOME/.Xauthority:/home/developer/.Xauthority:ro \
-v /dev/snd:/dev/snd:ro \
-v /run/user/$UID/pulse/native:/home/developer/pulse/socket:ro \
-v /home/anonymous/Programs/goland:/home/developer/goland \
-v /home/anonymous/Workspace:/home/developer/Workspace \
--net=host --pid=host --ipc=host goland 
