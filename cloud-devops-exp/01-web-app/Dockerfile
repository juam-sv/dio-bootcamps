FROM ubuntu AS builder
WORKDIR /app
ADD https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip .
RUN apt-get update && apt-get install -y unzip && unzip main.zip

FROM httpd
#COPY ./linux-site-dio-main /usr/local/apache2/htdocs/
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost/ || exit 1

COPY --from=builder /app/linux-site-dio-main /usr/local/apache2/htdocs/