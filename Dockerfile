FROM node:20 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --omit=dev

FROM gcr.io/distroless/nodejs20-debian12
LABEL maintainer="gioppoluca@libero.it"
LABEL description="Container for running foundly-cli to pack and unpack"

COPY --from=build-env /app /app
WORKDIR /app
CMD  ["unpack.js"]