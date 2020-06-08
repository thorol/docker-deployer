FROM php:7.4-fpm

RUN apt-get update && \
    apt-get upgrade -y && \	
	apt-get install -y openssh-client 
	
RUN apt-get update && \
    apt-get upgrade -y && \		
	apt-get install -y sshpass

RUN curl -LO https://deployer.org/deployer.phar \
	&& mv deployer.phar /usr/local/bin/dep \
	&& chmod +x /usr/local/bin/dep

VOLUME ["/project", "$HOME/.ssh"]
WORKDIR /project

ENTRYPOINT ["dep"]
CMD ["--version"]
