#!/usr/bin/env perl
use Modern::Perl;
use English qw( -no_match_vars );

use Test::More;

use Git;

# start with a non-existing directory and create two
# consecutive LDIF backups on the new GIT repo

my $BASE = '.';
my $backup_dir = "/tmp/ldap-git-backup/backup-$PID";

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
ok( (-d "$backup_dir/.git"), 'backup directory should be a GIT repository now');
my $repo = Git->repository( Directory => $backup_dir );


done_testing();
