FROM node:10.16.3-alpine
LABEL maintainer="Fahim Uddin"
LABEL version="1.0.0"

# Install and Update alpine-linux Packages
RUN apk add --update nodejs nodejs-npm git dos2unix

# Create and SET Application Working Directory
WORKDIR /usr/src/app

# Install Project Dependencies
RUN wget https://raw.githubusercontent.com/raydvard/startup-actionherojs/master/package.json
RUN npm install

# Downloading Entry Point & dos2unix Formatting
RUN wget https://raw.githubusercontent.com/raydvard/startup-actionherojs/master/docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
RUN dos2unix docker-entrypoint.sh

# Production Environment Mode
# RUN npm ci --only=production

# Exposing Container Ports
EXPOSE 8080 5000

# CMD ["wget", "https://raw.githubusercontent.com/raydvard/startup-actionherojs/master/docker-entrypoint.sh"]
# CMD ["chmod", "+x", "docker-entrypoint.sh"]
# CMD ["dos2unix", "docker-entrypoint.sh"]

# Git Repository Initialization
ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]

# Starting Node Server
# CMD ["npm", "start"]