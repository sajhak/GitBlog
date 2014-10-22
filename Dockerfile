# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

FROM 	   ubuntu:14.04
MAINTAINER Sajith Kariyawasam <sajhak@gmail.com>

RUN apt-get update --fix-missing

WORKDIR /opt/

#################################
# Enable ssh - This is not good. http://jpetazzo.github.io/2014/06/23/docker-ssh-considered-evil/
# For experimental purposes only
##################################

RUN apt-get install -y openssh-server unzip
RUN mkdir -p /var/run/sshd
RUN echo 'root:g' | chpasswd
RUN sed -i "s/PermitRootLogin without-password/#PermitRootLogin without-password/" /etc/ssh/sshd_config

##################
# Install Java
##################
ADD packs/jdk-7u4-linux-x64.tar.gz /opt/
RUN ln -s /opt/jdk1.7.0_04 /opt/java

RUN echo "export JAVA_HOME=/opt/java" >> /root/.bashrc
RUN echo "export PATH=$PATH:/opt/java/bin" >> /root/.bashrc

###########################################
# Configure WSO2 Application Server - 5.2.1
###########################################
WORKDIR /mnt/

ADD packs/wso2as-5.2.1.zip /mnt/wso2as-5.2.1.zip
RUN unzip -q wso2as-5.2.1.zip
RUN rm wso2as-5.2.1.zip

EXPOSE 22 9443 9763

###################
# Setup run script
###################
ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

ENTRYPOINT /usr/local/bin/run | /usr/sbin/sshd -D
