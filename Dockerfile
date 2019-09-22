FROM node:10.16.3-alpine
LABEL version="1.0.0"
LABEL author="Fahim Uddin"

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
#RUN apk add --update nodejs nodejs-npm git

# Third Party Dependencies
RUN apk add --update git

# Install Project Dependencies
RUN wget https://raw.githubusercontent.com/raydvard/startup-actionherojs/master/package.json
RUN npm install

# Clone Project Files
RUN git init
RUN git remote add origin https://github.com/raydvard/startup-actionherojs.git
RUN git fetch --all
RUN git reset --hard origin/master

# For production
# RUN npm ci --only=production

# Specifying Redis Password
RUN export REDIS_HOST=172.17.0.4
RUN export REDIS_PASSWORD=mnxfordc

# Exposing to Port (Mapping Port)
EXPOSE 8080 5000

# Command to Start The Server
CMD ["npm", "start"]