# ------------------------------------------------------
# Stage: 1  Build the React App
#-------------------------------------------------------
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install

COPY . .

ARG VITE_API_URL=""
ENV VITE_API_URL=$VITE_API_URL

RUN npm run build

# ------------------------------------------------------
# Stage: 2  Copy the Built artifact
#-------------------------------------------------------
FROM nginx:stable-alpine
RUN apk upgrade --no-cache

# Remove default server and default index
RUN rm -f \
    /usr/share/nginx/html/index.html \
    /etc/nginx/conf.d/default.conf

# Prepare directories for non-root nginx
RUN mkdir -p \
    /var/cache/nginx/client_temp \
    /var/cache/nginx/proxy_temp \
    /var/cache/nginx/fastcgi_temp \
    /var/cache/nginx/uwsgi_temp \
    /var/cache/nginx/scgi_temp \
    /run \
    /etc/nginx/ssl \
  && chown -R nginx:nginx \
    /var/cache/nginx \
    /var/log/nginx \
    /etc/nginx \
    /run \
  && chmod -R 755 /etc/nginx
  
# Copy dist folder
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom NGINX config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy custom NGINX config
# COPY Docker_Stuff/expense.conf /etc/nginx/conf.d/expense.conf

# Ensure config file permissions
RUN chmod 644 /etc/nginx/conf.d/*.conf

EXPOSE 8080
USER nginx

CMD ["nginx", "-g", "daemon off;"]
