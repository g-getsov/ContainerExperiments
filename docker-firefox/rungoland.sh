docker run -ti --rm \
-e DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
-v $HOME/.Xauthority:/home/developer/.Xauthority:ro \
-v /dev/snd:/dev/snd:ro \
-v /run/user/$UID/pulse/native:/home/developer/pulse/socket:ro \
-v $HOME/Programs/goland:/home/developer/goland \
-v $HOME/Workspace:/home/developer/Workspace \
-v $HOME/Workspace/go:/home/developer/go \
--net=host --pid=host --ipc=host goland 
