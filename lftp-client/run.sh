#!/bin/sh

LOCAL_DIR_UPLOAD=.

echo "Running lftp for server ${INPUT_HOST} and user ${INPUT_USER} from ${LOCAL_DIR_UPLOAD} into ftp directory ${INPUT_PUB_FTP_DIR}"
lftp -e "set ftp:use-site-utime2 false; mirror -x ^\.git/$ -X flat-logo.png -p -R ${LOCAL_DIR_UPLOAD} ${INPUT_PUB_FTP_DIR}; exit" -u ${INPUT_USER},${INPUT_PASSWORD} ${INPUT_HOST}
