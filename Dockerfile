FROM asciidoctor/docker-asciidoctor
RUN gem install webrick
RUN apk add --update nodejs npm
COPY ./entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
