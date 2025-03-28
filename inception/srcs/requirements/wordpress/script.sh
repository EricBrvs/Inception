#!/bin/sh

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=ebervas.42.fr --title=inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=admin@admin.com --allow-root
./wp-cli.phar user create ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASSWORD}

exec "$@"