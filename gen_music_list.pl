#!/usr/bin/perl
use strict;
use warnings;

my ( $path, $fname ) = @ARGV;
$path  ||= 'data';
$fname ||= 'index.html';

my $flist = `find "$path" -type f`;
my @fs    = map {
  my ( $n ) = m#^.*/(.+)\.[^.]+$#;
  qq[<li><a href="#" data-src="$_">$n</a></li>]
} sort split /\n/, $flist;
my $music_s = join( "\n", @fs );

$/ = undef;
open my $fht, '<', 'music.t';
my $c = <$fht>;
close $fht;
$c =~ s/\[%music_list%\]/$music_s/s;

open my $fh, '>', $fname;
print $fh $c;
close $fh;
