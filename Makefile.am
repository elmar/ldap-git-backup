bin_SCRIPTS = ldap-git-backup
man_MANS    = ldap-git-backup.1

ldap-git-backup.1: ldap-git-backup
	pod2man -c 'User Commands' -r "$(VERSION)" $< $@
