FROM openjdk:8u131-jre-alpine
WORKDIR /usr/src/app

ENV MC_BOT_HOST="localhost"
ENV MC_BOT_PORT="25565"
ENV MC_BOT_USERNAME="anonymous"
ENV MC_BOT_PASSWORD=""

ENV BOT_VER=2.7.17

ADD https://github.com/MrKinau/FishingBot/releases/download/${BOT_VER}/FishingBot-${BOT_VER}.jar mcbot.jar

RUN chown 1001:1001 mcbot.jar

CMD ["java", "-jar", "mcbot.jar", "-nogui"]