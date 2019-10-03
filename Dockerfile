FROM node:10.16.3-alpine
LABEL maintainer="Fahim Uddin"
LABEL version="1.0.0"

# Install and Update alpine-linux Packages
RUN apk add --update nodejs nodejs-npm git

# Create and SET Application Working Directory
WORKDIR /usr/src/app

# Install Project Dependencies
RUN wget https://raw.githubusercontent.com/raydvard/startup-actionherojs/master/package.json
RUN wget https://raw.githubusercontent.com/raydvard/startup-actionherojs/master/docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
RUN npm install

# Production Environment Mode
# RUN npm ci --only=production

# Exposing Container Ports
EXPOSE 8080 5000

# Git Repository Initialization & Start The Application
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]
