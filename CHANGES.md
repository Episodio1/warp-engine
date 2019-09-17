Warp Releases
=============

### [2019.09.17](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.09.17)

* fix command init
* fix webserver varnish
* add template webserver multisite

### [2019.09.10](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.09.10)

* fix Varnish image
* set startup command to background
* add command to update images (warp update --images)

### [2019.08.30](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.08.30)

* add Varnish service v4.0.5, v5.2.1
* add Selenium service
* add postgress module on image PHP 7.1.17-fpm, 7.1.26-fpm
* add ionCube to PHP 7.0-fpm, 5.6-fpm
* add plugin delete-by-query on image elasticsearch 2.4
* add plugin x-delayer on image Rabbit
* allows to synchronize several files in warp sync command
* add command for Oro Framework (warp oro <command>)
* add command for check update images
* add command warp docker

### [2019.07.04](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.07.04)

* add sodium module php
* add mysql-client
* add gulp binary

### [2019.06.25](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.06.25)

* add command warp fix --composer
* workaround error session handler
* compatibility with previous version

### [2019.06.10](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.06.10)

* Fix install Magento
* Fix redis.so
* Fix warp_check_docker_version

### [2019.06.06](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.06.06)

* Add extension redis on php image

### [2019.05.30](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.05.30)

* Add command for enable/disable ionCube
* Add attach custom yaml file
* Improve command magento --install
* Check minimum version for Docker and docker-compose

### [2019.05.27](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.05.27)

* Add Image Elasticsearch 1.7.6
* Add Image Rabbitmq 3.7 with delayed queue plugin
* Add command for enable/disable xdebug
* Add command for download/install Magento Community
* Improve MacOS to be able to map files or synchronize folders

### [2019.05.08](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.05.08)

* Add Mailhog SMTP Server
* Exclude binaries folder .warp in repository
* Improve command fix permissions
* Change xdebug v2.6.1 for compatibility with PhpStorm


### [2019.04.08](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.04.08)

* Add command to fix permissions
* Add PHP 7.2-fpm
* Fix permission problem with Grunt command
* Improve alias mage2flush compatible with magento 2.3


### [2019.03.27](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.03.27)


* Adding private docker registry configuration
* Enabling supervisord in PHP 7.1.26-fpm
* Letting set the project base framework
* Set Nginx configuration based on set framework
* Allowing set a custom key-pair into PHP container to use it with composer


### [2019.02.20](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.02.20)

* set permissions with elasticsearch


### [2019.02.13](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.02.13)

* added RabitMQ service
* added PHP 7.1.26-fpm

### [2019.01.10](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.01.10)

* fix command install


### [2019.01.07](https://github.com/SummaSolutions/warp-engine/releases/tag/2019.01.07)

* adding alias for clear magento cache
* adding file for runlevel
* added additional parameter in xdebug


### [2018.12.20](https://github.com/SummaSolutions/warp-engine/releases/tag/2018.12.20)

* adding flag --ip in info command.
* bind bashrc in containers


### [2018.12.12](https://github.com/SummaSolutions/warp-engine/releases/tag/2018.12.12)

* adding video demo on landing page.
* fix permissions in html folder.
* Add control for the ed command.
* Improve FAQs about xdebug.


### [2018.11.20](https://github.com/SummaSolutions/warp-engine/releases/tag/2018.11.20)

* checking files before starting containers.


### [2018.11.16](https://github.com/SummaSolutions/warp-engine/releases/tag/2018.11.16)

* fix crontab process
* added command to edit crontab directly inside the container


### [2018.11.15](https://github.com/SummaSolutions/warp-engine/releases/tag/2018.11.15)

* First release