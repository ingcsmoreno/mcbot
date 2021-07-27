FROM openjdk:8u131-jre-alpine

RUN adduser -D -u 1001 -g "mcbot" mcbot

WORKDIR /home/mcbot

ENV BOT_VER=2.7.17

ADD https://github.com/MrKinau/FishingBot/releases/download/${BOT_VER}/FishingBot-${BOT_VER}.jar mcbot.jar

RUN chown 1001:1001 mcbot.jar

USER 1001

CMD ["java", "-jar", "mcbot.jar", "-nogui", "-config", "/usr/app/config.json"]