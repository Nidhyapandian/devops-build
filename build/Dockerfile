# base image
#FROM node:20-alpine
# working directory
#WORKDIR /app
# copy manifest.json to /app
#COPY package*.json .
# npm install
#RUN npm install
# copy all files
#COPY . .
# port expose
#EXPOSE 80
# run code
#CMD ["npm","start"]

# Stage 1: Build stage
#FROM node:14 AS mybuild
FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# Stage 2: Production stage
#FROM nginx:1.21
#COPY --from=mybuild /app/build /usr/share/nginx/html
EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
CMD ["npm","start"]