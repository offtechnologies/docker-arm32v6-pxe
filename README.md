# Raspberry Pi 1/0 PXE/iPXE

[![Build Status](https://travis-ci.org/offtechnologies/docker-arm32v6-pxe.svg?branch=master)](travis-ci.org/offtechnologies/docker-arm32v6-pxe)
[![This image on DockerHub](https://img.shields.io/docker/pulls/offtechnologies/docker-arm32v6-pxe.svg)](https://hub.docker.com/r/offtechnologies/docker-arm32v6-pxe/)
[![](https://images.microbadger.com/badges/image/offtechnologies/docker-arm32v6-pxe.svg)](https://microbadger.com/images/offtechnologies/docker-arm32v6-pxe "Get your own image badge on microbadger.com")

[offtechurl]: https://offtechnologies.gthub.io

[![offtechnologies](https://offtechnologies.github.io/images/logo150.png)][offtechurl]

Raspberry Pi 1/0 compatible Docker image with Alpine Linux and PXE/iPXE.

### Usage:

```
sudo docker run --name pxe -d \
    -p 69:69/udp \
    -p 67:67/udp \
    --net=host \
    offtechnologies/docker-arm32v6-pxe:6.03
```
