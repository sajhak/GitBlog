## Test comment
wso2as-docker
=============

Dockerfile for WSO2 Application Server 5.2.1 - http://wso2.com/products/application-server/

Prerequisites
-------------
Download Java to packs directory

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u4-b20/jdk-7u4-linux-x64.tar.gz"

Download WSO2 Application Server 5.2.1 to packs directory

Create the image (Optional)
----------------------------
Go to wso2as-docker directory, execute following command to create the image docker build -t wso2as .

(Else, the preconfigured image in docker-hub sajhak/wso2as:5.2.1 can be used,
docker pull sajhak/wso2as:5.2.1)

Start a WSO2 AS docker container
--------------------------------
docker run -d -P --name wso2appserver sajhak/wso2as:5.2.1

Check the port mappings
-----------------------
$ docker ps

(Output could be different)
 STATUS              PORTS                                                                    
Up 34 minutes       0.0.0.0:49153->22/tcp, 0.0.0.0:49154->9443/tcp, 0.0.0.0:49155->9763/tcp


SSH to container (testing purposes only - otherwise disabled)
-------------------------------------------------------------
$ ssh -p49153 root@localhost
password: 'g'


Access management console
-------------------------
https://localhost:49154/carbon
