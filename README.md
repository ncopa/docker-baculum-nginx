# Baculum with nginx in Alpine linux

### How to clone repository & build?  

   export IMAGE="baculum:15aug.01"

   git clone https://github.com/ncopa/docker-baculum-nginx.git
   cd docker-baculum-nginx
   docker build -t ${IMAGE} .

### How to run?  

    scp -r rr-lxc-11:/etc/bacula/ .
    docker run -p 9095:9095 -p 9096:9096 -p 8090:80 -e "BACULUM_USER=admin" -e "BACULUM_PASSWD=admin" -v $(pwd)/bacula:/etc/bacula -it ${IMAGE}

Access baculum by clicking this link [baculum](http://localhost:9095)
