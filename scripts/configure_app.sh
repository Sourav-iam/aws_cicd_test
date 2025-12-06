set -e

docker pull souravdockerone/simple_dotnetwebapi:latest

docker run -d -p 8080:8080 souravdockerone/simple_dotnetwebapi:latest