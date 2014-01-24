#!/usr/bin/perl -w
# usage: ./csv2txt.pl guest\ list.csv > guests.txt
use strict;

my @maclines;
while (<>){
    @maclines = split(/\r/);
}

for(@maclines){    
    if (not /0/){
	s/[\r\n]//g;
	print "$_\n";
    }
}
