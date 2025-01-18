FROM node:20 AS build-env
ADD . /app
WORKDIR /app
RUN npm install --omit=dev

FROM gcr.io/distroless/nodejs20-debian12
COPY --from=build-env /app /app
WORKDIR /app
CMD  ["unpack.js"]