FROM ubuntu:14.04

MAINTAINER Nicolas Pouillard [https://nicolaspouillard.fr]

RUN apt-key update && apt-get update && \
    apt-get -y remove nodejs npm gyp && \
    add-apt-repository -y ppa:chris-lea/node.js && \
    apt-get install -y \
      git-core software-properties-common python-software-properties \
      build-essential ssl-cert ntp runit curl \
      python3 python3-setuptools python3-dev python3-pip \
      build-essential python3-sphinx python-virtualenv \
      libsqlite3-dev python3-apsw python3-zmq

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN wget https://github.com/CounterpartyXCP/federatednode_build/raw/master/run.py

# # Install counterparty
# RUN git clone https://github.com/CounterpartyXCP/counterpartyd.git && \
#     cd counterpartyd && \
#     python3 setup.py install
#
# # Add counterpartyd.sh script entrypoint.
# ADD counterpartyd.sh /usr/local/bin/
# RUN chmod a+x /usr/local/bin/counterpartyd.sh
# ENTRYPOINT ["/usr/local/bin/counterpartyd.sh"]

# # Create counterparty user
# RUN useradd -m -s /bin/bash counterparty
# USER counterparty
# RUN mkdir -p /home/counterparty/.local/share/counterpartyd
# ENV HOME /home/counterparty
# VOLUME ["/home/counterparty/.local/share/counterpartyd"]
