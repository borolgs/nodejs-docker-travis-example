FROM node:14.4-alpine

WORKDIR /usr/src/app
COPY . .

RUN npm i

CMD ["npm", "start"]
