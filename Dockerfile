FROM node:22.18

WORKDIR /usr/app

COPY ./ ./

RUN npm install

RUN npm run build

EXPOSE 3000

CMD ["node","dist/main.js"]