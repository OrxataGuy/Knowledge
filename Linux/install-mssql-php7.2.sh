#!/bin/bash

###########################################################################################################
#                                                                                                         #
#   Author: OrxataGuy                                                                                     #
#   Tested on: CentOS 8. PHP 7.2.                                                                         #
#                                                                                                         #
#   Description:                                                                                          #
#   This bash script will install in your CentOS distribution (or in any linux distribution actually)     #
#   the required drivers to connect your php application with a MS Sql Server database.                   #
#   aka the sqlsrv and the pdo_sqlsrv drivers.                                                            #
#                                                                                                         #
###########################################################################################################

sudo curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo
sudo ACCEPT_EULA=Y yum install msodbcsql
sudo yum install unixODBC-devel
sudo yum groupinstall "Development Tools"
sudo yum install php-pear
sudo yum install dnf-plugins-core
sudo yum config-manager --set-enabled powertools
sudo yum install php-devel
sudo pecl install sqlsrv pdo_sqlsrv
sudo echo "extension=/usr/lib64/php/modules/sqlsrv.so" >> /etc/php.d/pdo.ini
sudo echo "extension=/usr/lib64/php/modules/pdo_sqlsrv.so" >> /etc/php.d/pdo.ini

###########################################################################################################
#                                                                                                         #
#   [IMPORTANT]: Remember execute "sudo chmod 777 php7-sqlsrv-install" in the same directory where you    #
#   have this file before run it. If you move this file to a folder added to your PATH, it'll be fine     #
#   just running "php7-sqlsrv-install", if else, after give it the required permissions with the chmod    #
#   command, you can run it executing "./php7-sqlsrv-install".                                            #
#                                                                                                         #
###########################################################################################################
