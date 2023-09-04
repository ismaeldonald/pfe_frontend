#stage 1
FROM node:18-alpine as node
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
#RUN npm install --legacy-peer-deps
RUN chmod +x ./node_modules/.bin/ng
RUN npm run build 


#stage 2
FROM nginx:1.23-alpine
COPY --from=node /app/dist/* /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx","-g","daemon off;" ]