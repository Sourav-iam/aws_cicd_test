#!/bin/bash
set -e

containerId=`docker ps -q`
docker rm -f $containerId

# #!/bin/bash
# # stop_application.sh: Stops and removes all running Docker containers

# echo "Starting ApplicationStop hook: checking for running containers..."

# # Find all running container IDs
# RUNNING_CONTAINERS=$(docker ps -q)
# echo $RUNNING_CONTAINERS
# if [ -n "$RUNNING_CONTAINERS" ]; then
#   echo "Found running containers. Attempting to stop them gracefully..."
  
#   # Stop containers gracefully (sends SIGTERM, waits 10s, then SIGKILL)
#   # The use of xargs or a simple command substitution works here
#   docker stop $RUNNING_CONTAINERS
  
#   echo "Removing stopped containers..."
#   # Remove the containers once they are stopped
#   docker rm $RUNNING_CONTAINERS
  
#   echo "All specified containers have been stopped and removed."

# else
#   echo "No Docker containers are currently running. Proceeding with deployment."
# fi

# # Clean up any residual stopped containers just in case
# echo "Cleaning up any previously exited containers..."
# docker container prune -f
# echo "Cleanup complete."