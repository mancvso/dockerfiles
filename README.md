# Docker + ownCloud + boot2docker

## Based off of original repository from:

* [docker and owncloud part 1 at dischord.org](http://dischord.org/blog/2013/07/10/docker-and-owncloud/)
* [docker and owncloud part 2 at dischord.org](http://dischord.org/blog/2013/08/13/docker-and-owncloud-part-2/)

## Useful Docker commands

<pre>
# show docker vm ip
boot2docker ip

# run with ssl
docker run -d -p 443:443 owncloud

# run with ssl and persistance (be sure to chown www-data /my/mount/point/*)
docker run -d -p 443:443 -v /my/mount/point/data:/var/www/owncloud/data -v /my/mount/point/mysql:/var/lib/mysql owncloud

# show all containers
docker ps -a 

# stop container
docerk stop $CONTAINER

# remove container
docker rm $CONTAINER

# list images
docker images

# remove image
docker rmi $IMAGE_NAME

</pre>

