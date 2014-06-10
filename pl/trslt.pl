#!/usr/bin/perl -w
use 5.010;
use strict;

my %hash;
open DZB,"C:\\Users\\lei\\Desktop\\tnb\\翻译诊断编码\\dzb.txt";
#创建编码对照表的哈希
while(<DZB>){
       chomp;
       my @ele = split /\s+/;
       $hash{$ele[0]} = $ele[1];
}
close DZB;

open OUT,">C:\\Users\\lei\\Desktop\\tnb\\翻译诊断编码\\2013-trslt.txt";
print OUT "其他诊断        其他诊断        其他诊断        其他诊断        其他诊断        其他诊断        其他诊断        其他诊断\n";

open A,">C:\\Users\\lei\\Desktop\\tnb\\翻译诊断编码\\2013-not_found.txt";

open DATA,"C:\\Users\\lei\\Desktop\\tnb\\翻译诊断编码\\2013.txt";
<DATA>;
while(<DATA>){
       chomp;
       my @ele = split /\s+/;
       if(!$ele[0]){
          print OUT "   \n";
       }
       else{
            foreach (@ele){
                      if($hash{$_}){
                          print OUT "$hash{$_}\t";
                      }
                      else{
                           print OUT "$_\t";
                           print A "$_\n";
                      }
            }
            print OUT "\n";
       }
}
close OUT;
close DATA;


