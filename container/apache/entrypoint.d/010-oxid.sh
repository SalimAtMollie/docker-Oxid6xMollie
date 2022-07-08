#!/usr/bin/env bash
set -e

#Install Oxid and the Mollie plugin using composer
if [ ! -f /var/www/html/source/config.inc.php ]
then
	COMPOSER_MEMORY_LIMIT=-1 composer create-project --keep-vcs oxid-esales/oxideshop-project . ${OXID_VERSION}
	composer config --no-plugins allow-plugins.oxid-esales/oxideshop-unified-namespace-generator true #Required for Composer
	composer config --no-plugins allow-plugins.oxid-esales/oxideshop-composer-plugin true #Required for Composer
	composer require mollie/mollie-oxid #Installs Mollie
	mv /var/www/config.inc.php /var/www/html/source/config.inc.php
	chown -R www-data:www-data /var/www/html/source/
	sed -i 's/$this->getWebhookUrl()/\"https\:\/\/webhook\.site\/6ffa5c62-2b0b-4756-83fd-fb030903d376\"/' ./vendor/mollie/mollie-oxid/application/model/request/base.php #Fixes unreachable webhookUrl error
	echo "############################################################################"
	echo "##### Installation Complete! Please activate Mollie in Extensions Page #####"
	echo "############################################################################"
	echo "[!] Website Url 		: ${DOMAIN}"
	echo "[!] Website Admin Url : ${DOMAIN}/admin"
	echo "[!] Admin Credentials : admin (Password: admin)"
fi