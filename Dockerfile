# build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#  we are only coping that are in app/build directory