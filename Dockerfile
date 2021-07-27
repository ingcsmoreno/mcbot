FROM openjdk:8u131-jre-alpine

RUN mkdir -p /usr/src/app \
 && chown 1001:1001 /usr/src/app

WORKDIR /usr/src/app

ENV BOT_VER=2.7.17

ADD https://github.com/MrKinau/FishingBot/releases/download/${BOT_VER}/FishingBot-${BOT_VER}.jar mcbot.jar

RUN chown 1001:1001 mcbot.jar

CMD ["java", "-jar", "mcbot.jar", "-nogui"]