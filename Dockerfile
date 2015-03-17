FROM ubuntu:14.04

MAINTAINER Nicolas Pouillard [https://nicolaspouillard.fr]

RUN apt-get update && \
    apt-get install -y python3-dev git python3-setuptools gcc wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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
