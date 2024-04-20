#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;

my $base_name;
my @patterns;

GetOptions(
    'base_name=s' => \$base_name,
    'e=s'         => \@patterns,
) or die "Incorrect usage!\n";

if (!defined $base_name) {
    die "You must provide a base name for the files.\n";
}

if (!@patterns) {
    die "You must provide at least one pattern.\n";
}

my $file_counter = 0;
open my $fh, '>', $base_name . sprintf("%04d", $file_counter++) . ".txt" or die "Could not open file: $!\n";

while (<STDIN>) {
    for my $pattern (@patterns) {
        if ($_ =~ /$pattern/) {
            close $fh;
            open $fh, '>', $base_name . sprintf("%04d", $file_counter++) . ".txt" or die "Could not open file: $!\n";
            last;
        }
    }
    print $fh $_;
}

close $fh;
