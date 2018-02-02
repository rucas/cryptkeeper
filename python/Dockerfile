FROM python:3-alpine
LABEL maintainer="rucas <lucas.rondenet@gmail.com>"

ENV GITCRYPT_VERSION 0.6.0

RUN apk add --update --no-cache \
  openssh=7.2_p2-r5 \
  openssl-dev=1.0.2n-r0 \
  alpine-sdk=0.4-r3

RUN curl -sL https://github.com/AGWA/git-crypt/archive/"$GITCRYPT_VERSION".tar.gz \
  | tar zxv -C /var/tmp \
  && make -C /var/tmp/git-crypt-"$GITCRYPT_VERSION" \
  && cp /var/tmp/git-crypt-"$GITCRYPT_VERSION"/git-crypt /usr/local/bin/ \
  && rm -rf /var/tmp/git-crypt-"$GITCRYPT_VERSION"

CMD ["/bin/sh"]
