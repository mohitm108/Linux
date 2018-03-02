# Old servers
#Its the old/live db server name. Either put ip address or server name configured in SSH config 
OLD_DBSERVER=""
#By default SSH port is used.
SSHPORT=""
#SSH user name
SSHUN=""
#Database name in old server.
DATABASES=""
#Sometime db is not present on dbserver. In that case, give the name/ip of server where db is presesnt.
DBHOST=""
#mysql db username
DBUN=""
#mysql db user's password.
DBPW=""
# TO ENABLE DRY RUN DO DRY_RUN="--dry-run". It wont sync the db actually but will only show output of whats it gonna do.
DRY_RUN=""

# Print the command
echo ssh -p ${SSHPORT} -C ${SSHUN}@${OLD_DBSERVER} \
  "mysqldump \
  --host=${DBHOST} \
  --user=${DBUN} \
  --password=${DBPW} \
  --routines \
  --triggers \
  --single-transaction \
  --skip-tz-utc \
  --databases ${DATABASES}"

if [ "$DRY_RUN" != "" ]; then
  echo "Dry run is on"
else

# Do the db dump
ssh -p ${SSHPORT} -C ${SSHUN}@${OLD_DBSERVER} \
  "mysqldump \
  --host=${DBHOST} \
  --user=${DBUN} \
  --password=${DBPW} \
  --routines \
  --triggers \
  --single-transaction \
  --skip-tz-utc \
  --databases ${DATABASES}" | mysql
fi
