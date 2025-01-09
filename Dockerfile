FROM node:22 as build

WORKDIR /app
RUN apt-get update -y && apt-get upgrade -y
RUN git clone https://github.com/hakimel/reveal.js.git
RUN cd reveal.js && npm install && npm run build

FROM asciidoctor/docker-asciidoctor
RUN gem install webrick
COPY --from=build /app/reveal.js /tmp/reveal.js
COPY ./entrypoint.sh /entrypoint
ENTRYPOINT ["/entrypoint"]
