#!/usr/bin/perl -w
# usage: ./ca2csv.pl clean_addrs.txt > stdc.csv
use strict;
while(<>){
    chomp;
    s/ $//;
    if ($. % 4 == 0) {
	print "\n";
	next;
    }
    elsif ($. % 4 == 3) {
	print '"' . $_ . '"';
    }
    else {
	print '"' . $_ . '",';
    }
}
