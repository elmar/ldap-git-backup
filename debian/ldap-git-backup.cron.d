#
# Regular cron jobs for the ldap-git-backup package
#
0 4	* * *	root	if [ -x /usr/sbin/ldap-git-backup -a -x /usr/sbin/slapcat ]; then /usr/sbin/ldap-git-backup --commit-msg 'daily backup via cron'; fi
