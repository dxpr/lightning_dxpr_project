## This is a Composer-based installer for the Lightning DXPR Drupal distribution.

Lightning DXPR is a sub-profile of Acquia Lightning that installs our DXPR Theme and DXPR Builder products, giving you our state-of-the-art marketing Drupal tools integrated with Acquia's Lightning features. More info about Lightning:   

- https://github.com/acquia/lightning-project
- https://github.com/acquia/lightning


## Authentication

- To access `dxpr/dxpr_builder` packages, you need to to have an active subscription at DXPR.com. You can find your token here: https://app.sooperthemes.com/download/all#composer. This token is unique to your DXPR.com account and should be kept secret, like a password. *@todo change url to dxpr.com after site launch*

- Make sure composer is at version 1.10 or higher

- Configure the access token:

```bash
$ composer config --global bearer.packages.dxpr.com <access_token>
```

## Troubleshooting

### *Killed* or *Memory* related message

* Composer requires a lot of memory, try (temporarily) upgrading your cloud or VPS machine to at least 4GB of memory.
* Make sure your PHP memory limit is set to "-1" during installation. Documentation: https://getcomposer.org/doc/articles/troubleshooting.md#memory-limit-errors

### The requested PHP extension *curl* is missing from your system

If composer reports *curl* or some other PHP extension is missing you have to install this extension. On Ubuntu or Debian you can fix this with a single command:

`install apt-get install php7.4-mbstring`

Replace 7.4 with the PHP branch you are using.

## Non-interactive Profile installation

Continue instructions at https://github.com/dxpr/lightning_dxpr


