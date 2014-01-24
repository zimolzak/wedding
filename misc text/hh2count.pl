#!/usr/bin/perl -w
# usage: ./hh2count.pl households.txt | wc
# result = 80 households
use strict;
my $i=0;
while(<>){
    $i++;
    print if $i % 4 == 1;
}
