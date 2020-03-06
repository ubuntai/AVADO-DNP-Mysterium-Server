FROM node:10.15.3 as build-deps-wizard
WORKDIR /usr/src/app
# ensuring both package.json AND package-lock.json are copied
# COPY build/src/package.json ./
# COPY build/src/yarn.lock ./
# install dependencies
# RUN yarn install --production
# copy the contents of the app
COPY wizard .
# Get this DNP version and git hash. Results in /usr/src/app/.version.json
#RUN apt-get update && apt-get --yes install git jq
#ADD .git .git
#ADD dappnode_package.json .
#RUN ./getVersionData.sh
RUN yarn add react-scripts
RUN yarn run build


#FROM mysteriumnetwork/myst:latest-alpine
FROM mysteriumnetwork/myst:0.22.1-alpine
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
