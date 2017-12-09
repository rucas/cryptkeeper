FROM rucas/cryptkeeper:python-latest
MAINTAINER rucas <lucas.rondenet@gmail.com>

RUN apk add --update \
  postgresql-dev \
  jpeg-dev \
&& rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
