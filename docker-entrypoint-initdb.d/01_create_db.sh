#!/bin/bash

echo "01_create_db.sh..."

echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME_PREFIX}_development\` ;" | "${mysql[@]}"
echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME_PREFIX}_test\` ;" | "${mysql[@]}"
echo "GRANT ALL ON *.* TO '"$MYSQL_USER"'@'%' ;" | "${mysql[@]}"
echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"
