FROM node:latest
WORKDIR /usr/src/app
COPY nodeapp/* /
RUN npm install
CMD [ "npm","start" ]
