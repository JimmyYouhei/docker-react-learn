FROM node:12.18.3 as builder 

WORKDIR '/app'

COPY package.json .

RUN npm i 
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build usr/share/nginx