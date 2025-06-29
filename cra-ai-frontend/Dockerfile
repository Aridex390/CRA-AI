# --------- Build Stage ---------
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

#istall dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Build the app for production
RUN npm run build

# --------- Poduction Stage ---------
FROM nginx:1.25-alpine

# Copy build assets from the builder
COPY --from=builder /app/build /usr/share/nginx/html

# Copy custom nginx config 
COPY nginx.conf /etc/nginx/nginx.conf

# Expose Port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "deamon off;"]