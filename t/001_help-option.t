#!/usr/bin/env perl
use Modern::Perl;
use English qw( -no_match_vars );

use Test::More;

my $BASE = '.';

ok(system("$BASE/ldap-git-backup", '--help') == 0, 'option --help should be allowed');

done_testing();
