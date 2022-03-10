FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./tar.jpg /usr/share/nginx/html/tar.jpg
CMD ["echo"]

