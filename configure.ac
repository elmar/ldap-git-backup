AC_PREREQ([2.67])dnl require version in Debian squeeze
AC_INIT([LDAP Git Backup],
        [1.0],
        [elmar@heebs.ch],
        [ldap-git-backup],
        [https://github.com/elmar/ldap-git-backup])
AC_CONFIG_AUX_DIR([build-aux])

m4_include([m4/ax_prog_perl_modules.m4])
AX_PROG_PERL_MODULES([Modern::Perl],
                     [AC_SUBST([PERL_PREAMBLE], ['use Modern::Perl;'])],
                     [AC_SUBST([PERL_PREAMBLE], ['use strict; use warnings; use 5.010;'])]
                     )

AM_INIT_AUTOMAKE([foreign -Wall -Werror])
AC_CONFIG_FILES([Makefile
                 t/test-helper.pm
                 t/001_help-option.t
                 t/010_read_ldif.t
                 t/020_entry-name.t
                 t/030_git-from-scratch.t
                 t/040_delete-entry.t
                 t/050_modify-entry.t
                 t/060_custom_commit.t
                 t/070_mock-slapcat.t
                 t/071_safe-ldif.t
                 ])
AC_OUTPUT
