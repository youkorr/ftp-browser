#!/usr/bin/with-contenv bashio
    set -e

    # Get configuration
    FTP_USER=$(bashio::config 'ftp_user')
    FTP_PASSWORD=$(bashio::config 'ftp_password')
    FTP_DIRECTORY=$(bashio::config 'ftp_directory')

    # Create FTP user
    adduser -D -h "${FTP_DIRECTORY}" -s /bin/false "${FTP_USER}"
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

    # Start services
    exec /init
