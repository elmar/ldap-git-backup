#!/usr/bin/env perl
use Modern::Perl;
use English qw( -no_match_vars );

use Test::More;

# start with a non-existing directory and create two
# consecutive LDIF backups on the new GIT repo

my $BASE = '.';
my $backup_dir = "$BASE/t/backup-$PID";

ok( (not -e $backup_dir), 'backup directory should not exist at first' );
ok(
    system(
        "$BASE/ldap-git-backup",
        "--ldif-cmd=cat $BASE/t/testdata/data_A1.ldif",
        "--backup-dir=$backup_dir",
    ) == 0,
    'first backup should run'
);
ok( (-d $backup_dir), 'backup directory should have been created' );

ok(1);

done_testing();
