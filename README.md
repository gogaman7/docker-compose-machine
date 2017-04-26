
TL;DR = use with CI running on a docker-machine, you will need to mount the docker.sock to use.

to lunch a container with docker-compose and docker-machine inside run the following command while on docker host machine
```
docker \
 run \
 -it \
 -v /var/run/docker.sock:/var/run/docker.sock \
 --name docker-compose \
 gogaman7/docker-compose-machine bash
```
