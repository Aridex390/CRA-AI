# --------- Build Stage ---------
FROM node:20-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm install

COPY . .

RUN npm run build

# --------- Production Stage ---------
FROM nginx:1.25-alpine

COPY --from=builder /app/build /usr/share/nginx/html  # <-- or /app/dist for Vite

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]