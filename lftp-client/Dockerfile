FROM dockito/lftp-client:latest

#ENV PUB_FTP_DIR=${INPUT_PUB_FTP_DIR}
#ENV USER=${INPUT_USER}
#ENV HOST=${INPUT_HOST}
#ENV PASSWORD=${INPUT_PASSWORD}

COPY run.sh /
RUN chmod +x /run.sh

CMD [ "/run.sh" ]
