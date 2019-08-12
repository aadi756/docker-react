FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx
#expose used by elasticbeanstalk for post forwarding
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

