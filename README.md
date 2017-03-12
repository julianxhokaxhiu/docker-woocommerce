# WooCommerce-Docker
PHP Docker for Woocommerce on Steroids

## Why?

I didn't found any Automated Build that was offering such a simple docker in the whole Hub, so I decided to create it myself.
This Docker should serve as a starting point for self-hosting a personal Wordpress/WooCommerce installation.

## What is included?

* Apache + PHP 7.1 + VOLUME ( thanks to https://hub.docker.com/_/php/ ) + [WP-CLI](http://wp-cli.org/)
* Some PHP extensions enabled ( see below )
* Apache mod_rewrite enabled

## Which PHP extensions come pre-loaded?

```php
// print_r( get_loaded_extensions() );

Array
(
    [0] => Core
    [1] => date
    [2] => libxml
    [3] => openssl
    [4] => pcre
    [5] => sqlite3
    [6] => zlib
    [7] => ctype
    [8] => curl
    [9] => dom
    [10] => fileinfo
    [11] => filter
    [12] => ftp
    [13] => hash
    [14] => iconv
    [15] => json
    [16] => mbstring
    [17] => SPL
    [18] => PDO
    [19] => session
    [20] => posix
    [21] => Reflection
    [22] => standard
    [23] => SimpleXML
    [24] => pdo_sqlite
    [25] => Phar
    [26] => tokenizer
    [27] => xml
    [28] => xmlreader
    [29] => xmlwriter
    [30] => mysqlnd
    [31] => apache2handler
    [32] => apcu
    [33] => calendar
    [34] => exif
    [35] => gd
    [36] => gettext
    [37] => gmagick
    [38] => mysqli
    [39] => pdo_mysql
    [40] => soap
    [41] => sockets
    [42] => wddx
    [43] => xsl
    [44] => Zend OPcache
)
```

## License
See [LICENSE](LICENSE)
