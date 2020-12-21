# Builder container
FROM node:12.18.4-alpine AS builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run test
RUN npm run compile

# Runner container
FROM node:12.18.4-alpine
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
COPY --from=builder /usr/src/app/node_modules /usr/src/app/node_modules
COPY --from=builder /usr/src/app/build /usr/src/app/build
EXPOSE 8080
CMD ["npm", "start"]