FROM alpine

EXPOSE 4590/udp

WORKDIR /server
ADD fetch_server.sh ./
RUN apk add --no-cache curl jq && ./fetch_server.sh 449 && chmod +x alttp-server && apk del curl jq && rm ./fetch_server.sh

CMD /server/alttp-server
