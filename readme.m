docker build -t jleonro/reverse_proxy .

docker run -p 80:80 -d --name proxy reverse-proxy 