FROM php:7.4-apache

RUN curl -LO https://deployer.org/deployer.phar \
	&& mv deployer.phar /usr/local/bin/dep \
	&& chmod +x /usr/local/bin/dep

VOLUME ["/project", "$HOME/.ssh"]
WORKDIR /project

ENTRYPOINT ["dep"]
CMD ["--version"]
