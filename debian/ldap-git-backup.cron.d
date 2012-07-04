#
# Regular cron jobs for the ldap-git-backup package
#
0 4	* * *	root	[ -x /usr/sbin/ldap-git-backup ] && /usr/sbin/ldap-git-backup --commit-msg 'daily backup via cron'
