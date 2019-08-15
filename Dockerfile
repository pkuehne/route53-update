FROM ubuntu:18.04

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
        python3 \
        python3-pip \
        curl

RUN pip3 install setuptools
RUN pip3 install awscli --upgrade

RUN mkdir /dyndns
COPY ./route53-update.sh /dyndns
RUN chmod a+x /dyndns/route53-update.sh

ENTRYPOINT ["/dyndns/route53-update.sh"]
