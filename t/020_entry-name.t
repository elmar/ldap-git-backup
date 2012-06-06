#!/usr/bin/env perl
use Modern::Perl;
use English qw( -no_match_vars );

use Test::More;

my $BASE = '.';
require "$BASE/ldap-git-backup";

for my $test_case (qw( entry_people entry_people_upcase entry_people_space entry_people_base64 )) {
    my $ldif = read_first_ldif($test_case);
    is(LDAP::Utils::dn($ldif), 'ou=people,dc=example,dc=org', 'DN for people entry');
}

done_testing();

exit 0;

sub read_first_ldif {
    my ($ldif_file) = @_;

    my $ldif_aref = LDAP::Utils::read_ldif("cat $BASE/t/testdata/$ldif_file.ldif");
    ok(@$ldif_aref == 1, 'count one entry');

    return ${$ldif_aref}[0];
}
