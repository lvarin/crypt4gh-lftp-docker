#!/bin/sh

# Use nss_wrapper to add the current user to /etc/passwd
# and enable the use of tools like ssh
USER_ID=$(id -u)
GROUP_ID=$(id -g)
# Pointless if running as root
if [[ "${USER_ID}" != '0' ]]; then
   export NSS_WRAPPER_PASSWD=/tmp/nss_passwd
   export NSS_WRAPPER_GROUP=/tmp/nss_group
   cp /etc/passwd $NSS_WRAPPER_PASSWD
   cp /etc/group  $NSS_WRAPPER_GROUP

   if ! getent passwd "${USER_ID}" >/dev/null; then
      # we need an entry in passwd for current user. Make sure there is no conflict
      sed -e '/^crypt:/d' -i $NSS_WRAPPER_PASSWD
      echo "crypt:x:${USER_ID}:${GROUP_ID}:Crypt 4gh:/tmp:/bin/bash" >> $NSS_WRAPPER_PASSWD
   fi
   export LD_PRELOAD=libnss_wrapper.so
 fi

