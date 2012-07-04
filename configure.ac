AC_PREREQ([2.67])dnl require version in Debian squeeze (or higher)
AC_INIT([LDAP Git Backup],[1.0],[elmar@heebs.ch],[ldap-git-backup],[https://github.com/elmar/ldap-git-backup
])
AC_CONFIG_AUX_DIR([build-aux])

AX_PROG_PERL_MODULES(
    [Modern::Perl],
    [AC_SUBST([PERL_PREAMBLE], ['use Modern::Perl;']                   )],
    [AC_SUBST([PERL_PREAMBLE], ['use strict; use warnings; use 5.010;'])]
)

AM_INIT_AUTOMAKE([foreign -Wall -Werror])

[test -L t/t || ln -sf . t/t]

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([t/test-helper.pm])
AC_CONFIG_FILES([t/001_help-option.t],      [chmod +x t/001_help-option.t])
AC_CONFIG_FILES([t/010_read_ldif.t],        [chmod +x t/010_read_ldif.t])
AC_CONFIG_FILES([t/020_entry-name.t],       [chmod +x t/020_entry-name.t])
AC_CONFIG_FILES([t/030_git-from-scratch.t], [chmod +x t/030_git-from-scratch.t])
AC_CONFIG_FILES([t/040_delete-entry.t],     [chmod +x t/040_delete-entry.t])
AC_CONFIG_FILES([t/050_modify-entry.t],     [chmod +x t/050_modify-entry.t])
AC_CONFIG_FILES([t/060_custom_commit.t],    [chmod +x t/060_custom_commit.t])
AC_CONFIG_FILES([t/070_mock-slapcat.t],     [chmod +x t/070_mock-slapcat.t])
AC_CONFIG_FILES([t/071_safe-ldif.t],        [chmod +x t/071_safe-ldif.t])
AC_CONFIG_FILES([t/mock-slapcat],           [chmod +x t/mock-slapcat])
AC_CONFIG_FILES([safe-ldif],                [chmod +x safe-ldif])

AC_OUTPUT
