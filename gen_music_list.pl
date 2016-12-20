#!/usr/bin/perl

my ($web_path, $fname)  = @ARGV;
$fname ||= 'music';

system(qq[find . -name '*.mp3' -exec echo {} >> $fname.temp \\;]);
system(qq[sed -e 's#^\.\/#$web_path#' $fname.temp > $fname.m3u]);
unlink("$fname.temp");

open my $fhw, '<', "$fname.m3u";
my @fs=<$fhw>;
close $fhw;
chomp(@fs);

my $fss = join("\n", map {  
my ($n) = m#^.*/(.+)\.[^.]+$#;
qq[<li><a href="#" data-src="$_">$n</a></li>]
} @fs);

$/ = undef;
open my $fht, '<', 'music.t';
my $c=<$fht>;
close $fht;
$c=~s/\[%music_list%\]/$fss/s;

open my $fh, '>', "$fname.html";
print $fh $c;
close $fh;
