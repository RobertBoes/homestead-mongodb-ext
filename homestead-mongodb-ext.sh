echo "Install script for MongoDB PHP extension in a homestead box"

echo "Updating the packages list";
sudo apt-get update;

echo "Installing OpenSSl Libraries";
sudo apt-get install -y autoconf g++ make openssl libssl-dev libcurl4-openssl-dev;
sudo apt-get install -y libcurl4-openssl-dev pkg-config;
sudo apt-get install -y libsasl2-dev;

echo "Installing the MongoDB extension";
sudo pecl install mongodb;

echo "Adding the extension to .ini files";
sudo echo  "extension = mongodb.so" >> /etc/php/7.0/cli/php.ini;
sudo echo  "extension = mongodb.so" >> /etc/php/7.0/fpm/php.ini;

echo "Restarting nginx and php7.0-fpm";
sudo service nginx restart && sudo service php7.0-fpm restart

echo "Done installing MongoDB extension, have fun!";
