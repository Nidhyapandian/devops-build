# Stage 1: Build stage
FROM node:14 AS mybuild
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Production stage
FROM nginx:1.21
COPY --from=mybuild /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
