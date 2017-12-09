FROM python:3-alpine
MAINTAINER rucas <lucas.rondenet@gmail.com>

ENV GITCRYPT_VERSION 0.6.0

RUN apk add --update \
  openssh \
  openssl-dev \
  alpine-sdk \
&& rm -rf /var/cache/apk/*

RUN curl -sL https://github.com/AGWA/git-crypt/archive/$GITCRYPT_VERSION.tar.gz \
  | tar zxv -C /var/tmp \
  && make -C /var/tmp/git-crypt-$GITCRYPT_VERSION \
  && cp /var/tmp/git-crypt-$GITCRYPT_VERSION/git-crypt /usr/local/bin/ \
  && rm -rf /var/tmp/git-crypt-$GITCRYPT_VERSION

CMD ["/bin/sh"]
