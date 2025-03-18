#!/bin/bash


CURRENT_DIR=$(dirname "$0")

. ${CURRENT_DIR}/config.inc.sh

BACKUP_DIR=${SYNC_BACKUPS_DIR}/etc

if [ "$1" != "" ]; then
    BACKUP_DIR=${BACKUP_DIR}/${1}
fi

if [ ! -d "$BACKUP_DIR" ]; then
	mkdir $BACKUP_DIR
fi

rm -f ${BACKUP_DIR}/*.gz


cd /
nice -n 19 tar cf $BACKUP_DIR/etc.tgz --exclude=etc/libreoffice/ --exclude=etc/shadow etc

chown -R ${CHOWNUSER} ${BACKUP_DIR}

