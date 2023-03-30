FROM node:18.15.0-alpine AS deps
WORKDIR /app
COPY ["package.json","yarn.lock","./"]
RUN yarn install

FROM node:18.15.0-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

FROM node:18.15.0-alpine AS runner
WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js ./index.js
COPY --from=builder /app/package.json ./package.json

CMD [ "yarn","start:dev" ]