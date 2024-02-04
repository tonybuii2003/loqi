# Production Docker File
# 

FROM node:20-alpine

WORKDIR /app

COPY package.json .

RUN yarn

COPY ./src /app/src

CMD [ "yarn", "start" ]

EXPOSE 3000