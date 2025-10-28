# Use PHP 7.4 (or other 7.x version) FPM image
FROM php:7.4-fpm

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    nginx \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libjpeg-dev \
    libwebp-dev \
    libxpm-dev \
    libicu-dev \
    libzip-dev \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Enable GD extension (you may need to adjust configuration if necessary)
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd pdo pdo_mysql zip opcache intl

# Copy nginx configuration file
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy your app code into /var/www/html
COPY ./src /var/www/html

# Expose port 80 for nginx
EXPOSE 80

# Start nginx and php-fpm
CMD service nginx start && php-fpm
