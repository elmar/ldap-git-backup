AC_PREREQ([2.67])dnl require version in Debian squeeze (or higher)
AC_INIT(
    [LDAP Git Backup],
    [1.0.3],
    [elmar@heebs.ch],
    [ldap-git-backup],
    [https://github.com/elmar/ldap-git-backup]
)
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([foreign -Wall -Werror])

AC_DEFUN([AX_CONFIG_FILE_EXEC],
         [AC_CONFIG_FILES($1, [chmod +x ]$1)]
)

AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([t/test-helper.pm])
AX_CONFIG_FILE_EXEC([t/001_help-option.t])
AX_CONFIG_FILE_EXEC([t/010_read_ldif.t])
AX_CONFIG_FILE_EXEC([t/020_entry-name.t])
AX_CONFIG_FILE_EXEC([t/030_git-from-scratch.t])
AX_CONFIG_FILE_EXEC([t/040_delete-entry.t])
AX_CONFIG_FILE_EXEC([t/050_modify-entry.t])
AX_CONFIG_FILE_EXEC([t/060_custom_commit.t])
AX_CONFIG_FILE_EXEC([t/070_mock-slapcat.t])
AX_CONFIG_FILE_EXEC([t/071_safe-ldif.t])
AX_CONFIG_FILE_EXEC([t/mock-slapcat])
AX_CONFIG_FILE_EXEC([safe-ldif])

AC_OUTPUT
