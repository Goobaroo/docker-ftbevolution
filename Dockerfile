# syntax=docker/dockerfile:1

FROM eclipse-temurin:21-jdk

LABEL version="1.27.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Evolution"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/a3/a3716bf4fbab2a80750a32b74ed1d64201d8bdeaecece0f3caa20cb9b5d95d30.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTB-Evolution:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Evolution v1.27.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms6144m -Xmx8092m"

CMD ["/launch.sh"]