# temporary App Build container
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# Copy build folder to NGINX container
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
