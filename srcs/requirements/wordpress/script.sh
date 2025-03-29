#!/bin/sh

WP_USER="rikkou"

# Créer l'utilisateur s'il n'existe pas
if ! id "$WP_USER" >/dev/null 2>&1; then
    adduser --disabled-password --gecos "" $WP_USER
fi

cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chown -R $WP_USER:$WP_USER /var/www/html

# Passer à l'utilisateur WP pour exécuter les commandes
su - $WP_USER -c "wp core download --allow-root"
su - $WP_USER -c "wp config create --dbname=wordpress --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root"
su - $WP_USER -c "wp core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root"
su - $WP_USER -c "wp user create ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASSWORD} --allow-root"

exec "$@"
