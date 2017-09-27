#
# NCBI BLAST+ 2.6.0 Dockerfile
#
# Provide`s NCBI BLAST+ binaries

FROM debian:wheezy

MAINTAINER Rodrigo Pavez <rpavez@teselagen.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
		curl \
		python-minimal=2.7.3-4+deb7u1 \
	&& rm -rf /var/lib/apt/lists/*

# Download & install BLAST
RUN mkdir /opt/blast \
      && curl ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.6.0+-x64-linux.tar.gz \
      | tar -zxC /opt/blast --strip-components=1

RUN curl -k -o /tmp/node.tar.gz https://nodejs.org/dist/v6.9.2/node-v6.9.2-linux-x64.tar.gz
RUN cd /tmp && tar -xf node.tar.gz --directory /usr/local --strip-components 1
RUN /usr/local/bin/npm install -g xml2json-command

ENV PATH /opt/blast/bin:$PATH

# set default behaviour
WORKDIR /blast
CMD ["bash"]
