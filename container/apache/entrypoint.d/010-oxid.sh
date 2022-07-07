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
	echo "############################################################################"
	echo "##### Installation Complete! Please activate Mollie in Extensions Page #####"
	echo "############################################################################"
fi
