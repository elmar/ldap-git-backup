bin_SCRIPTS = ldap-git-backup safe-ldif
man_MANS    = ldap-git-backup.1 safe-ldif.1

ldap-git-backup.1: ldap-git-backup
	pod2man -c 'User Commands' -r "$(VERSION)" $< $@

safe-ldif.1: safe-ldif
	pod2man -c 'User Commands' -r "$(VERSION)" $< $@

check:
	prove t

all-am: ldap-git-backup safe-ldif t/mock-slapcat
	chmod +x $^
