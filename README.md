# Virtual Environment

This is the virtualization blueprint to deploy:
* CentOS7
* Docker
* Docker-Compose

## Requirements
* Vagrant (tested on 1.8.6)
* Virtual Box (tested on 5.1.6)

## Deploy

```bash
$ git clone git@github.com:jasonodonnell/docker-vm.git
$ cd ./docker-vm
$ vagrant up
```

## Access Docker 

```bash
$ vagrant ssh docker
$ docker network ls
```
