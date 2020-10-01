FROM node:alpine AS buildNode
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=buildNode /app/build /usr/share/nginx/html
