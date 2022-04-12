FROM node:lts-alpine@sha256:38bc06c682ae1f89f4c06a5f40f7a07ae438ca437a2a04cf773e66960b2d75bc

# Improve performance
ENV NODE_ENV production

# App directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000
USER node
CMD [ "node", "server.js" ]