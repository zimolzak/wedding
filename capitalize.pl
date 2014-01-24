#!/usr/bin/perl -w
# usage: ./capitalize.pl hh_stdc_no.txt > clean_addrs.txt
# Take a bunch of lowercase addresses and capitalize appropriately.
use strict;

while(<>){
    chomp;
    if (/~/){
	last;
    }
    if (/[0-9]{4}$/ and $. % 4 == 3){ # final line account for +4
	$_ = ini_cap_state($_);
    }
    else { # address or name or blank or international
	die if $. % 4 == 0 and /[A-Za-z]/;        #ln 0 blank
	die if $. % 4 == 1 and not /[A-Za-z]/;    #ln 1 has txt
	die if $. % 4 == 2 and not $_=~/^[0-9]/ ; #ln 2 starts w num
	$_ = ini_cap_all($_);
    }
    print "$_\n";
}

sub ini_cap_all {
    my $input = shift;
    my $output = "";
    my @words = split(/ /, $input);
    while(my $wd = shift(@words)){
	$wd =~ s/(.*)/\u$1/;
	$output = $output . $wd . " ";
    }
    return $output;
}

sub ini_cap_state {
    my $input = shift;
    my $output = "";
    my @words = split(/ /, $input);
    while(my $wd = shift(@words)){
	if ( $#words == 0  ){ # only zip remains
	    die unless length($wd)==2; # curr wd must be state
	    die unless $words[0]=~/[0-9]{5}/; #last wd must contain zip
	    $wd =~ s/(.)(.)/\u$1\u$2/;
	}
	else {
	    $wd =~ s/(.*)/\u$1/;
	}
	$output = $output . $wd . " ";
    }
    return $output;
}
