# Build stage
FROM node:alpine AS build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /app/build is the artifact we need

# Serve stage
FROM nginx
# Copy from build face
COPY --from=build /app/build /usr/share/nginx/html
# nginx start is already the default, no need to override it