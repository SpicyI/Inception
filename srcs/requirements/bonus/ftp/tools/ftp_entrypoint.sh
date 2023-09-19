#!/bin/bash



useradd -m $FTPS_USER -s /bin/bash; echo -n "$FTPS_USER:$FTPS_PASSWORD" | chpasswd && \
    echo "$FTPS_USER" | tee -a /etc/vsftpd.userlist

mkdir -p /home/$FTPS_USER/ftp_directory


mkdir -p /var/run/vsftpd/empty

chown nobody:nogroup /home/$FTPS_USER/ftp_directory
chmod a-w /home/$FTPS_USER/ftp_directory
mkdir -p /home/$FTPS_USER/ftp_directory/ftp_data
chown $FTPS_USER:$FTPS_USER /home/$FTPS_USER/ftp_directory/ftp_data

cd /home/$FTPS_USER/ftp_directory/
chmod -R 777 ftp_data


cp /etc/vsftpd.conf /etc/vsftpd.conf.bak

cp /vsftpd.conf /etc/vsftpd.conf
echo "local_root=/home/$FTPS_USER/ftp_directory/ftp_data" >> /etc/vsftpd.conf

vsftpd /etc/vsftpd.conf