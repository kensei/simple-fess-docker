FROM java:8-jre

MAINTAINER kensei

EXPOSE 8080

ARG FESS_VERSION
RUN echo $FESS_VERSION

WORKDIR /usr/opt/fess

RUN curl -sLJO https://github.com/codelibs/fess/releases/download/fess-${FESS_VERSION}/fess-${FESS_VERSION}.zip \
  && unzip -q fess-${FESS_VERSION}.zip -d current \
  && mv current/fess-${FESS_VERSION}/* current

ENTRYPOINT /usr/opt/fess/current/bin/fess
