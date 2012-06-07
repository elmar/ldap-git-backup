#!/usr/bin/env perl
use Modern::Perl;
use English qw( -no_match_vars );

use Test::More;

my $BASE = '.';
require "$BASE/ldap-git-backup";

for my $test_case (
    {
        file      => 'entry_people',
        dn        => 'ou=people,dc=example,dc=org',
        timestamp => '20120604161334Z',
    },
    {
        file      => 'entry_people_upcase',
        dn        => 'ou=people,dc=example,dc=org',
        timestamp => '20120604161334Z',
    },
    {
        file      => 'entry_people_space',
        dn        => 'ou=people,dc=example,dc=org',
        timestamp => '20120604161334Z',
    },
    {
        file      => 'entry_people_base64',
        dn        => 'ou=people,dc=example,dc=org',
        timestamp => '20120604161334Z',
    },
    {
        file      => 'entry_people_base64_multiline',
        dn        => 'ou=people,dc=example,dc=org',
        timestamp => '20120604161334Z',
    },
) {
    my $ldif = read_first_ldif($test_case->{file});
    is(LDAP::Utils::dn($ldif), $test_case->{dn}, 'DN for test entry');
    is(LDAP::Utils::timestamp($ldif), $test_case->{timestamp}, 'createTimeStamp for test entry');
}

done_testing();

exit 0;

sub read_first_ldif {
    my ($ldif_file) = @_;

    my $ldif_aref = LDAP::Utils::read_ldif("cat $BASE/t/testdata/$ldif_file.ldif");
    ok(@$ldif_aref == 1, 'count one entry');

    return ${$ldif_aref}[0];
}
