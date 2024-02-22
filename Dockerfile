FROM node:18

RUN mkdir /var/test

WORKDIR /var/test

COPY ./ ./

RUN npm i

CMD ["npm", "start"]

CMD ["node","app.js"]

EXPOSE 3000
