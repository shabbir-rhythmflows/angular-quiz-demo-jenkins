# Stage 1: Build the Angular app
FROM node:14.15.4 as node
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Stage 2: Serve the app using Nginx
FROM nginx:alpine
COPY --from=node /app/dist/quiz-app /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
