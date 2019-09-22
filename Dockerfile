FROM node:10.16.3-alpine
LABEL version="1.0.0"
LABEL author="Fahim Uddin"

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
RUN apk add --update nodejs nodejs-npm git
RUN git clone https://github.com/raydvard/startup-actionherojs.git /usr/src/app
RUN npm install
# For production
# RUN npm ci --only=production

# Exposing to Port (Mapping Port)
EXPOSE 8080 5000
# Command to Start The Server
CMD ["node", "./bin/actionhero", "start"]