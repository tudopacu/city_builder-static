FROM nginx:alpine

# Copy custom NGINX configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy your local asset folder structures into NGINX web root
COPY . /usr/share/nginx/html/

# Clean up configuration/workflow files from the public asset directory
RUN rm -f /usr/share/nginx/html/Dockerfile \
    && rm -f /usr/share/nginx/html/nginx.conf \
    && rm -rf /usr/share/nginx/html/.github \
    && rm -rf /usr/share/nginx/html/.git

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]