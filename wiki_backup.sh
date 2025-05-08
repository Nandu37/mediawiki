#!/bin/bash

# Define variables
BACKUP_DIR="/home/nandana/wiki_backups"
TIMESTAMP=$(date +%F-%H-%M)
DB_NAME="wikidb"
DB_USER="wikiuser"
DB_PASS="6f(H,I4dn$"
MEDIAWIKI_DIR="/var/www/html/mediawiki"

# Create backup filenames
SQL_BACKUP="$BACKUP_DIR/db-backup-$TIMESTAMP.sql"
FILES_BACKUP="$BACKUP_DIR/mediawiki-files-$TIMESTAMP.tar.gz"

# Dump the MySQL database
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $SQL_BACKUP

# Compress the MediaWiki folder:
tar -czvf $FILES_BACKUP $MEDIAWIKI_DIR

#Optional: remove backups older than 7 days:
find "$BACKUP_DIR" -type f -mtime +7 -exec rm {} \;
