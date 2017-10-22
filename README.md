# docker-sandbox-base

Docker base image of developers sandbox (centos EPEL + php, node, npm and some npm packages installed)


```
    docker build -t pietrovich/sandbox-base .
    docker run -it pietrovich/sandbox-base /bin/bash
    docker exec -it pietrovich/sandbox-base /bin/bash
