![pipeline status](https://gitlab.com/indiewebconsult/nginx-php-fpm/badges/master/pipeline.svg)
![docker hub](https://img.shields.io/docker/pulls/richarvey/nginx-php-fpm.svg?style=flat-square)
![docker hub](https://img.shields.io/docker/stars/richarvey/nginx-php-fpm.svg?style=flat-square)

## Please open pull requests and issues on [https://github.com/indiewebconsult/nginx-rtmp-php-fpm](https://github.com/indiewebconsult/nginx-rtmp-php-fpm)

## Overview
This is a Dockerfile/image to build a container for nginx and php-fpm, with the ability to pull website code from git when the container is created, as well as allowing the container to push and pull changes to the code to and from git. The container also has the ability to update templated files with variables passed to docker in order to update your code and settings. There is support for lets encrypt SSL configurations, custom nginx configs, core nginx/PHP variable overrides for running preferences, X-Forwarded-For headers and UID mapping for local volume support.

Nginx is built with rtmp-module and ffmpeg libraries are installed for using RTMP configurations in Nginx.

If you have improvements or suggestions please open an issue or pull request on the GitHub project page.

### Versioning
| Docker Tag | Git Release | Nginx Version | PHP Version | Alpine Version |
|-----|-------|-----|--------|--------|
| aedan:latest | Master Branch |1.16.0 | 7.3.8 | 3.9 |

## Quick Start
To pull from docker hub:
```
docker pull indiewebconsult/aedan
```
### Running
To simply run the container:
```
sudo docker run -d indiewebconsult/aedan
```
To dynamically pull code from git when starting:
```
docker run -d -e 'GIT_EMAIL=email_address' -e 'GIT_NAME=full_name' -e 'GIT_USERNAME=git_username' -e 'GIT_REPO=github.com/project' -e 'GIT_PERSONAL_TOKEN=<long_token_string_here>' indiewebconsult/aedan:latest
```

You can then browse to ```http://<DOCKER_HOST>``` to view the default install files. To find your ```DOCKER_HOST``` use the ```docker inspect``` to get the IP address (normally 172.17.0.2)

For more detailed examples and explanations please refer to the documentation from the original forked source from `rick_harvey`.
## Documentation

- [Building from source](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/building.md)
- [Versioning](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/versioning.md)
- [Config Flags](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/config_flags.md)
- [Git Auth](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/git_auth.md)
  - [Personal Access token](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/git_auth.md#personal-access-token)
  - [SSH Keys](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/git_auth.md#ssh-keys)
- [Git Commands](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/git_commands.md)
 - [Push](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/git_commands.md#push-code-to-git)
 - [Pull](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/git_commands.md#pull-code-from-git-refresh)
- [Repository layout / webroot](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/repo_layout.md)
 - [webroot](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/repo_layout.md#src--webroot)
- [User / Group Identifiers](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/UID_GID_Mapping.md)
- [Custom Nginx Config files](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/nginx_configs.md)
 - [REAL IP / X-Forwarded-For Headers](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/nginx_configs.md#real-ip--x-forwarded-for-headers)
- [Scripting and Templating](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/scripting_templating.md)
 - [Environment Variables](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/scripting_templating.md#using-environment-variables--templating)
- [Lets Encrypt Support](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/lets_encrypt.md)
 - [Setup](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/lets_encrypt.md#setup)
 - [Renewal](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/lets_encrypt.md#renewal)
- [PHP Modules](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/php_modules.md)
- [Xdebug](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/xdebug.md)
- [Logging and Errors](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/logs.md)

## Guides
- [Running in Kubernetes](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/guides/kubernetes.md)
- [Using Docker Compose](https://gitlab.com/indiewebconsult/nginx-php-fpm/blob/master/docs/guides/docker_compose.md)
