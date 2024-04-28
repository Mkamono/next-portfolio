FROM node:20

WORKDIR /app

COPY ./portfolio/yarn.lock ./portfolio/package.json /app/
RUN yarn install --frozen-lockfile

COPY ./portfolio /app
RUN yarn build

CMD [ "yarn", "start" ]
