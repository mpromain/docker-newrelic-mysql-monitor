FROM ubuntu:xenial

MAINTAINER Martin Mpro Junk <martin.junk@dixonscarphone.com>


RUN apt-get update \
	&& apt-get install -y \
		wget \
		default-jre

RUN wget https://github.com/newrelic-platform/newrelic_mysql_java_plugin/raw/master/dist/newrelic_mysql_plugin-2.0.0.tar.gz

RUN tar -xvzf newrelic_mysql_plugin-2.0.0.tar.gz \
	&& rm newrelic_mysql_plugin-2.0.0.tar.gz -f \
	&& mv newrelic_mysql_plugin-2.0.0 /etc/newrelic-mysql-plugin

WORKDIR /etc/newrelic-mysql-plugin

RUN mv config config-template

# cleanup
RUN apt-get clean -y \
	&& apt-get autoclean -y \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/apt/lists/* /var/lib/log/* /tmp/* /var/tmp/*

COPY ./run.sh ./run.sh

VOLUME ["/etc/newrelic-mysql-plugin/config"]

CMD ["bash", "-e", "./run.sh"]
