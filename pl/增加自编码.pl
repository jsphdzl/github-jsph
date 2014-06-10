#!/usr/bin/perl -w
use strict;
use 5.010;

my %hash;
open IN,"医保自编码对照.txt";
<IN>;
while(<IN>){
       chomp;
       my($ybzxbm,$zbm) = split /\s+/;
       $hash{$ybzxbm} = $zbm;
}
close IN;

my $t = 0;
my $nt = 0;
open A,"医保省平台对照.txt";
open OUT,">医保省平台自编码.txt";
print OUT "医保中心编码\t省平台编码\t自编码\t药品名称\n";
<A>;
while(<A>){
       chomp;
       my($ybzx,$spt,$name) = split/\s+/;
       if ($hash{$ybzx}){
            print OUT "$ybzx\t$spt\t$hash{$ybzx}\t$name\n";
            $nt++;
       }
       else{
            print OUT "$ybzx\t$spt\t\t$name\n";
            $t++;
       }
}
my $tn = $nt + $t;
say "一共有$tn个记录，有自编码的条目有$t条，没有自编码的条目有$nt条";
close A;
close OUT;