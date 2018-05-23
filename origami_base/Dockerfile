FROM debian:jessie

LABEL author="Deepesh Pathak <deepeshpathak09@gmail.com>"
LABEL version="0.1"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apt-utils curl git gcc g++ make build-essential
# Install node-8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN curl -O http://download.redis.io/redis-stable.tar.gz
RUN tar -xvzf redis-stable.tar.gz
RUN cd redis-stable && \
    make && \
    make install

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.4" > /etc/apt/sources.list.d/pgdg.list && \
    gpg --keyserver keys.gnupg.net --recv-keys ACCC4CF8 && \
    gpg --export --armor ACCC4CF8|apt-key add -

RUN apt-get update

RUN apt-get install -y postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4
RUN apt-get install -y nodejs python2.7 python-dev python-pip python-virtualenv
RUN pip install --upgrade pip

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "/etc/init.d/postgresql start && exit 0" > /etc/rc.local
RUN /etc/init.d/postgresql start

USER postgres
RUN echo "local all  all                trust" >  /etc/postgresql/9.4/main/pg_hba.conf && \
    echo "host  all  all  127.0.0.1/32  trust" >> /etc/postgresql/9.4/main/pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

EXPOSE 5432
USER root

CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
