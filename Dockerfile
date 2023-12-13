FROM node:lts-alpine AS build
WORKDIR /app

COPY package*.json .
RUN npm install

COPY . .

RUN npm run build

FROM node:lts-alpine

COPY package*.json .

RUN npm install --production

COPY --from=build /app/bin ./bin

CMD ["npm", "run", "run"]