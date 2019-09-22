FROM node:10.16.3-alpine
LABEL maintainer="Fahim Uddin"
LABEL version="1.0.0"

# Install and Update alpine-linux Packages
RUN apk add --update nodejs nodejs-npm git

# Create and SET Application Working Directory
WORKDIR /usr/src/app

# Install Project Dependencies
RUN wget https://raw.githubusercontent.com/raydvard/startup-actionherojs/master/package.json
RUN npm install

# Production Environment Mode
# RUN npm ci --only=production

# Exposing Container Ports
EXPOSE 8080 5000

# Git Repository Initialization
CMD ["git", "init"]

# Git Folder Merging - Origin master Merge
CMD ["git", "remote", "add", "origin", "https://github.com/raydvard/startup-actionherojs.git"]
CMD ["git", "fetch", "--all"]
CMD ["git", "reset", "--hard", "origin/master"]

# Starting Node Server
CMD ["npm", "start"]