ldap-git-backup
===============

Back up your LDAP data in a Git repository

## Quick Start

If you are using OpenLDAP the script

    ldap-git-backup

will dump your current LDAP database into <code>/var/backups/ldap</code> and
check it into Git.  Do this regulary and you will have a versioned history of
backups.

## Motivation

How do you back up your LDAP data?  Typically, you run a cron job once per day
to dump all LDAP entries into a LDIF file then compress this file and keep a
few generation.  With OpenLDAP the command to use is <code>slapcat</code>.
Since LDAP usually contains a lot of similar entries the compression is quite
good and you can keep a few backups with space requirements comparable to the
LDAP database itself.  When disaster strikes you take the most recent backup
that you know not to contain the problem and restore the data from there.

This is all quite resonable, but we can do better.  LDAP is used for data that
are read more often than written.  As a result the differences between two
consecutive backups are relatively small.  If we store only the deltas we can
save quite some space.  Git will do all the management of the delta and keep a
record of the history.  To make this approach practical we split up the LDIF
into individual entries and track the entries as separate files.

## Mode of Operation

The script <code>ldap-git-backup</code> is convenient way to automate this
process.  Each time it is run it will call the LDIF command given by the
option <code>--ldif-cmd</code> or <code>/usr/sbin/slapcat</code> if none is
given.  The output of the LDIF command is split up into individual files, one
per entry.  The file names are a combination of the creation time of the entry
and a hash of the DN.  With this naming the individual LDIF entries will keep
their names between backups and still avoid name clashes.  The unlikely case of
a name clash will be automatically handled by adding a simple count to the
file.

The backup location will be <code>/var/backups/ldap</code> or an alternative
directory given by the <code>--backup-dir</code> option.  This directory will
also contain the Git repository.  The directory and the Git repository will be
created if needed when the first backup is made.
