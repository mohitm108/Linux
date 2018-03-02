# Old servers
OLD_DBSERVER=""
SSHPORT=""
SSHUN=""
REMOTE_MEDIA_BASE=""
LOCAL_MEDIA_BASE="/mnt/shared....."
SYNC_DIRS="media/ var/"
EXCLUDE="--exclude /log --exclude /report"
# TO ENABLE DRY RUN DO DRY_RUN="--dry-run"
DRY_RUN=

# Media sync
for dir in ${SYNC_DIRS}; do
/usr/bin/rsync \
  ${EXCLUDE} \
  ${DRY_RUN} \
  -e "ssh -p ${SSHPORT}" \
  -iavz \
  "${SSHUN}@${OLD_DBSERVER}:${REMOTE_MEDIA_BASE}${dir}" "${LOCAL_MEDIA_BASE}${dir}"

done
