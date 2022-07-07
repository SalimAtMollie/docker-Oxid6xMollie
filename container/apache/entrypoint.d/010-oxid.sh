#!/usr/bin/env bash
set -e

# bootstrap oxid files/project
if [ ! -f /var/www/html/source/config.inc.php ]
then
	COMPOSER_MEMORY_LIMIT=-1 composer create-project --keep-vcs oxid-esales/oxideshop-project . ${OXID_VERSION}
	composer config --no-plugins allow-plugins.oxid-esales/oxideshop-unified-namespace-generator true
	composer config --no-plugins allow-plugins.oxid-esales/oxideshop-composer-plugin true
	composer require mollie/mollie-oxid
	mv /var/www/config.inc.php /var/www/html/source/config.inc.php
	chown -R www-data:www-data /var/www/html/source/
	sed -i 's/$this->getWebhookUrl()/\"https\:\/\/webhook\.site\/6ffa5c62-2b0b-4756-83fd-fb030903d376\"/' ./vendor/mollie/mollie-oxid/application/model/request/base.php 
	echo "############################################################################"
	echo "##### Installation Complete! Please activate Mollie in Extensions Page #####"
	echo "############################################################################"
fi
