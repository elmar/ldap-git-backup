bin_SCRIPTS = ldap-git-backup safe-ldif
man_MANS    = ldap-git-backup.1 safe-ldif.1

edit = sed \
	   -e 's|@bindir[@]|$(bindir)|g' \
	   -e 's|@PERL_PREAMBLE[@]|@PERL_PREAMBLE@|g'

.1.in:
	pod2man -c 'User Commands' -r "$(VERSION)" $< $@

safe-ldif: safe-ldif.in
	rm -f $@ $@.tmp
	$(edit) $< > $@.tmp
	chmod a+x $@.tmp
	mv $@.tmp $@

t/mock-slapcat: t/mock-slapcat.in
	rm -f $@ $@.tmp
	$(edit) $< > $@.tmp
	chmod a+x $@.tmp
	mv $@.tmp $@

ldap-git-backup: ldap-git-backup.in
	rm -f $@ $@.tmp
	$(edit) $< > $@.tmp
	chmod a+x $@.tmp
	mv $@.tmp $@

check-local: t/mock-slapcat
	prove t

clean-local:
	rm ldap-git-backup safe-ldif t/mock-slapcat
