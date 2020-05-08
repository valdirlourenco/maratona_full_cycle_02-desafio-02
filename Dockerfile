FROM node:14.1-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./


# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY dist ./dist
COPY app.db ./

RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++ \
    && npm install \
        sqlite3 \
    && apk del .gyp

EXPOSE 3000

CMD npm run start:prod