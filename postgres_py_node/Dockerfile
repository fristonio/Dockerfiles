FROM postgres:9.4

MAINTAINER Deepesh Pathak <deepeshpathak09@gmail.com>

RUN apt-get update
RUN apt-get install -y apt-utils curl gcc g++ make
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN apt-get install -y nodejs python

CMD ["/bin/bash"]
