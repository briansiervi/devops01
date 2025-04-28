# Build
FROM node:22.15.0-alpine3.21 AS build

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
# COPY yarnrc.yml ./
# COPY .yarn ./.yarn

RUN yarn

COPY . .

RUN yarn run build
RUN yarn install --production && yarn cache clean

# Execution
FROM node:22.15.0-alpine3.21

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/package.json ./package.json
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD ["yarn", "run", "start:prod"]