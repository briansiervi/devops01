FROM node:22.15.0-alpine3.21

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
# COPY yarnrc.yml ./
# COPY .yarn ./.yarn

RUN yarn

COPY . .

RUN yarn run build

EXPOSE 3000

CMD ["yarn", "run", "start"]