# NodeBackend/Dockerfile
FROM node:16-alpine

# create app directory
WORKDIR /usr/src/app

# copy package.json and install first for layer caching
COPY package*.json ./
RUN npm install --only=production

# copy app source
COPY . .

# expose port used by app
EXPOSE 3000

# run the app
CMD ["node", "server.js"]   # or npm start depending on your app
