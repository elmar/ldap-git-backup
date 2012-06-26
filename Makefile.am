## Makefile.am
## Process this file with automake to produce Makefile.in
##
ACLOCAL_AMFLAGS = -I m4 --install

sbin_SCRIPTS   = ldap-git-backup safe-ldif
check_SCRIPTS = t/mock-slapcat
man_MANS      = ldap-git-backup.1 safe-ldif.1

CLEANFILES = $(sbin_SCRIPTS) $(check_SCRIPTS) $(man_MANS)
EXTRA_DIST = \
	ldap-git-backup.in \
	safe-ldif.in \
	README.md \
	examples \
	ChangeLog \
	t/mock-slapcat.in \
	t/testdata

edit = sed \
	   -e 's|@bindir[@]|$(bindir)|g' \
	   -e 's|@sbindir[@]|$(sbindir)|g' \
	   -e 's|@PERL_PREAMBLE[@]|@PERL_PREAMBLE@|g'

ldap-git-backup.1: ldap-git-backup
	pod2man -c 'User Commands' -r "$(VERSION)" $< $@

safe-ldif.1: safe-ldif
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

check-local:
	ln -s . t/t
	prove t

clean-local:
	rm -f t/t
