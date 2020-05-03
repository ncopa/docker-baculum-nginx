# Baculum with nginx in Alpine linux

### How to build?  

    git pull https://github.com/ncopa/docker-baculum-nginx.git
    cd docker-baculum-nginx
    docker build -t baculum:3may.01

### How to run?  

    docker run -p 8081:9095 -it baculum.3may.01

Access baculum by clicking this link [baculum](http://localhost:8081)
