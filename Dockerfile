# 建構階段
FROM node:20.19.0-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# 正式環境
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
