docker build --tag=webserv .
docker run -p 1337:1337 --rm --name=webserv webserv