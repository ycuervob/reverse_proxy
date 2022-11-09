docker build -t jleonro/reverse_proxy .

docker run -p 80:80 --add-host=host.docker.internal:host-gateway -d --name proxy reverse-proxy 

