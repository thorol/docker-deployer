FROM php:7.4

LABEL maintainer="herloct <herloct@gmail.com>"

ENV DEPLOYER_VERSION=6.3.0

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y openssh-client

RUN curl -LO https://deployer.org/deployer.phar \
	&& mv deployer.phar /usr/local/bin/dep \
	&& chmod +x /usr/local/bin/dep

VOLUME ["/project", "$HOME/.ssh"]
WORKDIR /project

ENTRYPOINT ["dep"]
CMD ["--version"]
