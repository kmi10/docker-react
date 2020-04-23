FROM node:alpine as builder

WORKDIR '/app'

# Download and Install a Dependency
COPY ./package.json ./

RUN npm install
COPY ./ ./

RUN npm run build

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
