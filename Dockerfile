FROM node:lts-slim as build
LABEL Description="ztncui-min (a ZeroTier network controller user interface)" Vendor="Key Networks (https://key-networks.com)"

WORKDIR /app
COPY ./src /app

RUN corepack enable && pnpm i

FROM node:lts-slim
WORKDIR /app

COPY --from=build /app /app

RUN ls /app -lth

CMD ["/app/bin/www"]