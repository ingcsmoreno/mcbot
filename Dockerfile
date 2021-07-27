FROM openjdk:8u131-jre-alpine
WORKDIR /usr/src/app

ENV MC_BOT_HOST="localhost"
ENV MC_BOT_PORT="25565"
ENV MC_BOT_USERNAME="anonymous"
ENV MC_BOT_PASSWORD=""

ENV BOT_VER=1.0.11

ADD https://github.com/alwyn974/MinecraftBOT/releases/download/v${BOT_VER}/MinecraftBOT-${BOT_VER}-all.jar mcbot.jar

CMD ["java", "-jar", "mcbot.jar"]