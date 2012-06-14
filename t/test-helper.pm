#!perl
package Test::Helper;

use Modern::Perl;
use English qw( -no_match_vars );
use autodie;

use Test::More;

use Exporter qw( import );
our @EXPORT = qw(
    check_directory_list
);

sub check_directory_list {
    my ($dir, @filelist) = @_;

    opendir(my $dir_handle, $dir);
    my @file_list_actual = sort readdir($dir_handle);
    closedir($dir_handle);
    my @file_list_reference = sort @filelist;
    is_deeply( \@file_list_actual, \@file_list_reference, 'check file list for completeness' );

    return;
}

1;
