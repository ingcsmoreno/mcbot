FROM node:15.5-alpine3.10

COPY node /src/

WORKDIR /src

RUN npm install

ENV MC_HOST mc.example.com
ENV MC_PORT 25565
ENV MC_USER bot_account
ENV MC_LOOK_NEAR true
ENV MC_SAY_HI false

CMD [ "npm","start" ]
