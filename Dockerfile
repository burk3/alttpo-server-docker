FROM debian

EXPOSE 4590/udp

WORKDIR /server
ADD fetch_server.sh ./
RUN apt-get -y update && apt-get -y install curl jq unzip \
      && ./fetch_server.sh 449 && chmod +x alttp-server \
      && apt-get -y purge curl jq unzip \
      && rm -rf /var/lib/apt/lists/* ./fetch_server.h

CMD /server/alttp-server
