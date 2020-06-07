FROM php:7.2-alpine

LABEL maintainer="herloct <herloct@gmail.com>"

ENV DEPLOYER_VERSION=6.3.0

RUN apk update --no-cache \
    && apk add --no-cache \
        openssh-client

RUN curl -LO https://deployer.org/deployer.phar \
	&& mv deployer.phar /usr/local/bin/dep \
	&& chmod +x /usr/local/bin/dep

VOLUME ["/project", "$HOME/.ssh"]
WORKDIR /project

ENTRYPOINT ["dep"]
CMD ["--version"]
