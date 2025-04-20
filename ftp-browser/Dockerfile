ARG BUILD_FROM
    FROM $BUILD_FROM

    # Install dependencies
    RUN apk add --no-cache \
        nginx \
        vsftpd \
        python3 \
        py3-pip

    # Copy root filesystem
    COPY rootfs /

    # Install Python dependencies
    RUN pip install flask flask-cors

    # Configure vsftpd
    RUN echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
        && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
        && echo "local_umask=022" >> /etc/vsftpd/vsftpd.conf \
        && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
        && echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf \
        && echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf \
        && echo "pasv_min_port=40000" >> /etc/vsftpd/vsftpd.conf \
        && echo "pasv_max_port=40100" >> /etc/vsftpd/vsftpd.conf

    # Run script
    CMD ["/run.sh"]
