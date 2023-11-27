docker build -t qualcast .

docker run -p 8888:8888 -v /Users/max/youtube-stuffs:/app qualcast

From a new terminal (to run command from inside the docker)

docker ps

will give you

CONTAINER ID   IMAGE      COMMAND               CREATED          STATUS          PORTS                    NAMES
18dc9c5772ad   qualcast   "/start-jupyter.sh"   34 seconds ago   Up 32 seconds   0.0.0.0:8888->8888/tcp   sleepy_bhaskara

then you run 
docker exec -it 891a074ca72a /bin/bash

find / -name "jupyter_notebook_config.py"
find / -name "jupyter_server_config.py"

cd /usr/local/lib/python3.8/site-packages/notebook_shim/tests/confs/