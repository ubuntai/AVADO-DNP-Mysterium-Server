FROM node:10.15.3 as build-deps-wizard
WORKDIR /usr/src/app
COPY wizard .
RUN yarn add react-scripts
RUN yarn run build

#FROM mysteriumnetwork/myst:latest-alpine
FROM mysteriumnetwork/myst:0.38.1-alpine
RUN apk update
RUN apk add nginx jq
COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

COPY --from=build-deps-wizard /usr/src/app/build /usr/www/wizard
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 4050
EXPOSE 4051
EXPOSE 8091

ENTRYPOINT /opt/start.sh
