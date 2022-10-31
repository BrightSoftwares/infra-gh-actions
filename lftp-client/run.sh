#!/bin/sh

LOCAL_DIR_UPLOAD=.

echo "Running lftp for server ${HOST} and user ${USER} into ftp directory ${PUB_FTP_DIR}"
lftp -e "set ftp:use-site-utime2 false; mirror -x ^\.git/$ -X flat-logo.png -p -R ${LOCAL_DIR_UPLOAD} ${PUB_FTP_DIR}/ftp-php-app; exit" -u ${USER},${PASSWORD} ${HOST}
