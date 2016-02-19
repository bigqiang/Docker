FROM nginx:1.9.11

MAINTAINER bigqiang <bigqiang@msn.com>

# Copy the vhost and other files to conf.d
COPY conf.d/* /etc/nginx/conf.d/

# Add SCRIPT_FILENAME, or it will be blank page for PHP-FPM
RUN sed -i '/SCRIPT_NAME/ifastcgi_param  SCRIPT_FILENAME    $request_filename;' /etc/nginx/fastcgi_params

WORKDIR /var/www

