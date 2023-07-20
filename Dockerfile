#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN mvn clean
RUN mvn install
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/ngx-admin /usr/share/nginx/html
