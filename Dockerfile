FROM node:18

RUN mkdir /var/test

WORKDIR /var/test

COPY ./ ./

RUN npm i

CMD ["node","app.js"]
