set -e

containerId=`docker ps -q`
docker rm -f $containerId